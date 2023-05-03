using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using AslHMS.Controllers.HMS;
using AslHMS.Models;
using AslHMS.Models.DTO;
using AslHMS.Models.HMS;

namespace AslHMS.Controllers.Api
{
    public class ApiSaleSaleReturnUseController : ApiController
    {
        AslHMSApiContext db = new AslHMSApiContext();

        //Datetime formet
        IFormatProvider dateformat = new System.Globalization.CultureInfo("fr-FR", true);
        TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
        public DateTime td;

        //Get Ip ADDRESS,Time & user PC Name
        public string strHostName;
        public IPHostEntry ipHostInfo;
        public IPAddress ipAddress;

        public ApiSaleSaleReturnUseController()
        {
            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];
            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
        }


        //Grid level data
        [System.Web.Http.Route("api/ApiSaleSaleReturnUseController/GetItemList")]
        [System.Web.Http.HttpGet]
        public IEnumerable<PharmacyDTO> GetItemList(string cid, string tType, string myear, string memoNo)
        {
            Int64 compid = Convert.ToInt64(cid);
            string transType = Convert.ToString(tType);
            string monthYear = Convert.ToString(myear);
            Int64 transNo = Convert.ToInt64(memoNo);

            var findGridData = (from mediCare in db.HmsMediCareDbSet
                                join pharmacy in db.HmsPharmacyDbSet on mediCare.COMPID equals pharmacy.COMPID
                                where mediCare.COMPID == compid && mediCare.MEDIID == pharmacy.MEDIID &&
                                pharmacy.TRANSTP == transType && pharmacy.TRANSMY == monthYear && pharmacy.TRANSNO == transNo
                                select new
                                {
                                    pharmacy.ID,
                                    pharmacy.COMPID,
                                    pharmacy.TRANSTP,
                                    pharmacy.TRANSDT,
                                    pharmacy.TRANSMY,
                                    pharmacy.TRANSNO,

                                    pharmacy.ITEMSL,
                                    pharmacy.MEDIID,
                                    mediCare.MEDINM,
                                    pharmacy.QTY,
                                    pharmacy.RATE,
                                    pharmacy.AMOUNT,

                                    pharmacy.INSIPNO,
                                    pharmacy.INSLTUDE,
                                    pharmacy.INSTIME,
                                    pharmacy.INSUSERID,
                                }).OrderBy(e => e.ID).ToList();

            if (findGridData.Count == 0)
            {
                yield return new PharmacyDTO
                {
                    count = 1, //no data found
                };
            }
            else
            {
                foreach (var s in findGridData)
                {
                    yield return new PharmacyDTO
                    {
                        ID = s.ID,
                        COMPID = Convert.ToInt64(s.COMPID),
                        TRANSTP = Convert.ToString(s.TRANSTP),
                        TRANSMY = s.TRANSMY,
                        TRANSNO = Convert.ToInt64(s.TRANSNO),

                        ITEMSL = Convert.ToInt64(s.ITEMSL),
                        MEDIID = Convert.ToInt64(s.MEDIID),
                        MEDINM = s.MEDINM,
                        QTY = Convert.ToDecimal(s.QTY),
                        RATE = Convert.ToDecimal(s.RATE),
                        AMOUNT = Convert.ToDecimal(s.AMOUNT),

                        INSUSERID = s.INSUSERID,
                        INSLTUDE = s.INSLTUDE,
                        INSTIME = s.INSTIME,
                        INSIPNO = s.INSIPNO,
                    };
                }
            }
        }







        [Route("api/ApiSaleSaleReturnUseController/grid/addData")]
        [HttpPost]
        public HttpResponseMessage AddData(PharmacyDTO model)
        {
            Pharmacy pharmacy = new Pharmacy();

            //two or more then user access unique MemoNO - (Logic)
            var checkMemoNo = (from n in db.HmsPharmacyDbSet
                               where n.COMPID == model.COMPID && n.TRANSTP == model.TRANSTP && n.TRANSMY == model.TRANSMY && n.TRANSNO == model.TRANSNO && n.INSUSERID == model.INSUSERID
                               select new { n.TRANSNO }).ToList();
            if (checkMemoNo.Count == 0)
            {
                string memoNo = "", currentMonth = "", getYear = "";

                string date = Convert.ToString(model.TRANSDT);
                DateTime MyDateTime = DateTime.Parse(date);
                currentMonth = MyDateTime.ToString("MM");
                getYear = MyDateTime.ToString("yy");

                var findTransNo = (from m in db.HmsPharmacyDbSet
                                   where m.COMPID == model.COMPID && m.TRANSTP == model.TRANSTP && m.TRANSMY == model.TRANSMY
                                   select m).ToList();

                if (findTransNo.Count == 0)
                {
                    memoNo = getYear + currentMonth + "0001";
                }
                else
                {
                    Int64 max_TransNO = Convert.ToInt64((from m in db.HmsPharmacyDbSet where m.COMPID == model.COMPID && m.TRANSTP == model.TRANSTP && m.TRANSMY == model.TRANSMY select m.TRANSNO).Max());
                    Int64 R = Convert.ToInt64(getYear + currentMonth + "9999");
                    if (max_TransNO <= R)
                    {
                        memoNo = Convert.ToString(max_TransNO + 1);
                    }
                    else
                    {
                        memoNo = "0";
                    }
                }
                model.TRANSNO = Convert.ToInt64(memoNo);
            }




            var checkData = (from n in db.HmsPharmacyDbSet
                             where n.COMPID == model.COMPID && n.TRANSTP == model.TRANSTP && n.TRANSMY == model.TRANSMY
                                 && n.TRANSNO == model.TRANSNO && n.MEDIID == model.MEDIID
                             select n).ToList();

            if (checkData.Count == 0)
            {
                pharmacy.COMPID = model.COMPID;
                pharmacy.TRANSTP = model.TRANSTP;
                pharmacy.TRANSDT = Convert.ToDateTime(model.TRANSDT);
                pharmacy.TRANSMY = model.TRANSMY;
                pharmacy.TRANSNO = model.TRANSNO;
                if (model.TRANSTP == "SALE")
                {
                    pharmacy.DEPTFR = model.DEPT_FR_TO;
                }
                else if (model.TRANSTP == "IRTS")
                {
                    pharmacy.DEPTTO = model.DEPT_FR_TO;
                }
                else if (model.TRANSTP == "IUSE")
                {
                    pharmacy.DEPTFR = model.DEPT_FR_TO;
                }

                pharmacy.PATIENTTP = model.PATIENTTP;
                pharmacy.PATIENTYY = model.PATIENTYY;
                pharmacy.PATIENTYYID = model.PATIENTYYID;
                pharmacy.PATIENTID = model.PATIENTID;

                try
                {
                    Int64 maxItemSl = Convert.ToInt64((from n in db.HmsPharmacyDbSet
                                                       where n.COMPID == model.COMPID && n.TRANSTP == model.TRANSTP && n.TRANSMY == model.TRANSMY
                                                           && n.TRANSNO == model.TRANSNO
                                                       select n.ITEMSL).Max());
                    pharmacy.ITEMSL = maxItemSl + 1;
                }
                catch
                {
                    pharmacy.ITEMSL = Convert.ToInt64("1");
                }

                pharmacy.MEDIID = model.MEDIID;
                pharmacy.QTY = model.QTY;
                pharmacy.RATE = model.RATE;
                pharmacy.AMOUNT = model.AMOUNT;

                pharmacy.USERPC = strHostName;
                pharmacy.INSIPNO = ipAddress.ToString();
                pharmacy.INSTIME = Convert.ToDateTime(td);
                pharmacy.INSUSERID = model.INSUSERID;
                pharmacy.INSLTUDE = Convert.ToString(model.INSLTUDE);

                db.HmsPharmacyDbSet.Add(pharmacy);
                db.SaveChanges();

                //Log data save from Pharmacy Tabel
                SaleSaleReturnUseController controller = new SaleSaleReturnUseController();
                controller.Insert_Pharmacy_LogData(model);

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);
                return response;
            }
            else
            {
                model.MEDIID = 0;
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);
                return response;
            }
        }











        [Route("api/ApiSaleSaleReturnUseController/grid/addData_UpdatePage")]
        [HttpPost]
        public HttpResponseMessage AddData_UpdatePage(PharmacyDTO model)
        {
            Pharmacy pharmacy = new Pharmacy();
            var checkData = (from n in db.HmsPharmacyDbSet
                             where n.COMPID == model.COMPID && n.TRANSTP == model.TRANSTP && n.TRANSMY == model.TRANSMY
                                 && n.TRANSNO == model.TRANSNO && n.MEDIID == model.MEDIID
                             select n).ToList();

            if (checkData.Count == 0)
            {
                pharmacy.COMPID = model.COMPID;
                pharmacy.TRANSTP = model.TRANSTP;
                pharmacy.TRANSDT = Convert.ToDateTime(model.TRANSDT);
                pharmacy.TRANSMY = model.TRANSMY;
                pharmacy.TRANSNO = model.TRANSNO;
                if (model.TRANSTP == "SALE")
                {
                    pharmacy.DEPTFR = model.DEPT_FR_TO;
                }
                else if (model.TRANSTP == "IRTS")
                {
                    pharmacy.DEPTTO = model.DEPT_FR_TO;
                }
                else if (model.TRANSTP == "IUSE")
                {
                    pharmacy.DEPTFR = model.DEPT_FR_TO;
                }

                pharmacy.PATIENTTP = model.PATIENTTP;
                pharmacy.PATIENTYY = model.PATIENTYY;
                pharmacy.PATIENTYYID = model.PATIENTYYID;
                pharmacy.PATIENTID = model.PATIENTID;

                try
                {
                    Int64 maxItemSl = Convert.ToInt64((from n in db.HmsPharmacyDbSet
                                                       where n.COMPID == model.COMPID && n.TRANSTP == model.TRANSTP && n.TRANSMY == model.TRANSMY
                                                           && n.TRANSNO == model.TRANSNO
                                                       select n.ITEMSL).Max());
                    pharmacy.ITEMSL = maxItemSl + 1;
                }
                catch
                {
                    pharmacy.ITEMSL = Convert.ToInt64("1");
                }

                pharmacy.MEDIID = model.MEDIID;
                pharmacy.QTY = model.QTY;
                pharmacy.RATE = model.RATE;
                pharmacy.AMOUNT = model.AMOUNT;

                pharmacy.USERPC = strHostName;
                pharmacy.INSIPNO = ipAddress.ToString();
                pharmacy.INSTIME = Convert.ToDateTime(td);
                pharmacy.INSUSERID = model.INSUSERID;
                pharmacy.INSLTUDE = Convert.ToString(model.INSLTUDE);

                db.HmsPharmacyDbSet.Add(pharmacy);
                db.SaveChanges();

                //Log data save from Pharmacy Tabel
                SaleSaleReturnUseController controller = new SaleSaleReturnUseController();
                controller.Insert_Pharmacy_LogData(model);

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);
                return response;
            }
            else
            {
                model.MEDIID = 0;
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);
                return response;
            }
        }









        [Route("api/ApiSaleSaleReturnUseController/grid/UpdateData")]
        [HttpPost]
        public HttpResponseMessage UpdateData(PharmacyDTO model)
        {
            var check_data = (from n in db.HmsPharmacyDbSet
                              where n.ID == model.ID && n.COMPID == model.COMPID && n.TRANSTP == model.TRANSTP && n.TRANSMY == model.TRANSMY
                                  && n.TRANSNO == model.TRANSNO && n.ITEMSL == model.ITEMSL
                              select n).ToList();
            if (check_data.Count == 1)
            {
                foreach (var item in check_data)
                {
                    item.QTY = model.QTY;
                    item.RATE = model.RATE;
                    item.AMOUNT = model.AMOUNT;

                    item.USERPC = strHostName;
                    item.UPDIPNO = ipAddress.ToString();
                    item.UPDLTUDE = Convert.ToString(model.INSLTUDE);
                    item.UPDTIME = Convert.ToDateTime(td);
                    item.UPDUSERID = Convert.ToInt16(model.INSUSERID);

                }
                db.SaveChanges();

                //Log data save from Pharmacy Tabel
                SaleSaleReturnUseController controller = new SaleSaleReturnUseController();
                controller.update_Pharmacy_LogData(model);

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);
                return response;
            }
            else
            {
                model.MEDIID = 0;
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);
                return response;
            }
        }












        [Route("api/ApiSaleSaleReturnUseController/grid/DeleteData")]
        [HttpPost]
        // DELETE api/<controller>/5
        public HttpResponseMessage DeleteData(PharmacyDTO model)
        {
            Pharmacy deleteModel = new Pharmacy();
            deleteModel.ID = model.ID;
            deleteModel.COMPID = model.COMPID;
            deleteModel.TRANSTP = Convert.ToString(model.TRANSTP);
            deleteModel.TRANSMY = Convert.ToString(model.TRANSMY);
            deleteModel.TRANSNO = model.TRANSNO;
            deleteModel.ITEMSL = model.ITEMSL;

            deleteModel = db.HmsPharmacyDbSet.Find(deleteModel.ID, deleteModel.COMPID, deleteModel.TRANSTP, deleteModel.TRANSMY, deleteModel.TRANSNO, deleteModel.ITEMSL);
            db.HmsPharmacyDbSet.Remove(deleteModel);
            db.SaveChanges();

            //Log data save from Pharmacy Tabel
            SaleSaleReturnUseController controller = new SaleSaleReturnUseController();
            controller.Delete_Pharmacy_LogData(model);
            controller.Delete_Pharmacys_LogDelete(model);

            //Update Page if Master data exists
            var findPharmacyDataNull = (from n in db.HmsPharmacyDbSet
                                        where n.COMPID == model.COMPID && n.TRANSTP == model.TRANSTP && n.TRANSMY == model.TRANSMY
                                            && n.TRANSNO == model.TRANSNO
                                        select n).ToList();
            var findPharmacyMasterInfo = (from n in db.HmsPharmMstDbSet
                                          where n.COMPID == model.COMPID && n.TRANSTP == model.TRANSTP && n.TRANSMY == model.TRANSMY
                                              && n.TRANSNO == model.TRANSNO
                                          select n).ToList();
            if (findPharmacyDataNull.Count == 0 && findPharmacyMasterInfo.Count == 1)
            {
                foreach (var a in findPharmacyMasterInfo)
                {
                    db.HmsPharmMstDbSet.Remove(a);
                    db.SaveChanges();
                    //Log data delete from Pharmacy-Master(Cart-Payment Info) Tabel
                    controller.Delete_PharmacyMaster_LogData(model);
                    controller.Delete_PharmacyMaster_LogDelete(model);
                }
            }
            PharmacyDTO obj = new PharmacyDTO();
            return Request.CreateResponse(HttpStatusCode.OK, obj);
        }
    }
}
