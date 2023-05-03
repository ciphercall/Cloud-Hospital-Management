using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Tracing;
using AslHMS.Controllers.HMS;
using AslHMS.Models;
using AslHMS.Models.DTO;
using AslHMS.Models.HMS;

namespace AslHMS.Controllers.Api
{
    public class ApiMediCareController : ApiController
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

        public ApiMediCareController()
        {
            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];
            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
        }





        [System.Web.Http.Route("api/ApiMediCareController/GetMediCareData")]
        [System.Web.Http.HttpGet]
        public IEnumerable<MediCareDTO> GetMediCareData(string Compid, string MCatid)
        {
            Int64 compid = Convert.ToInt64(Compid);
            Int64 MedicalCategoryId = Convert.ToInt64(MCatid);
            var find_GridData = (from mediCare in db.HmsMediCareDbSet
                                 join pharma in db.HmsPharmaDbSet on mediCare.COMPID equals pharma.COMPID
                                 //join ghead in db.RxGheadDbSet on mediCare.COMPID equals ghead.COMPID
                                 where mediCare.COMPID == compid && mediCare.MCATID == MedicalCategoryId &&
                                 mediCare.PHARMAID == pharma.PHARMAID //&& mediCare.GHEADID==ghead.GHEADID
                                 select new
                                 {
                                     mediCare.ID,
                                     mediCare.COMPID,
                                     mediCare.MCATID,
                                     mediCare.MEDIID,
                                     mediCare.MEDINM,
                                     mediCare.PHARMAID,
                                     mediCare.GENERICID,
                                     mediCare.DOSAGEFID,
                                     pharma.PHARMANM,
                                     mediCare.UNIT,
                                     mediCare.BUYRT,
                                     mediCare.SALRT,
                                     mediCare.STKMIN,

                                     mediCare.INSIPNO,
                                     mediCare.INSLTUDE,
                                     mediCare.INSTIME,
                                     mediCare.INSUSERID,
                                 }).OrderBy(e => e.ID).ToList();

            if (find_GridData.Count == 0)
            {
                yield return new MediCareDTO
                {
                    count = 1, //no data found
                };
            }
            else
            {
                foreach (var s in find_GridData)
                {
                    String genricName = "",dosageName="";
                    var findGenericName = (from m in db.HmsGendosDbSet where m.COMPID == compid && m.GDTP == "GENERIC" && m.GDID == s.GENERICID  select new { m.GDNM }).ToList();
                    if (findGenericName.Count != 0)
                    {
                        foreach (var x in findGenericName)
                        {
                            genricName = x.GDNM;
                        }
                    }


                    var findDosageName = (from m in db.HmsGendosDbSet where m.COMPID == compid && m.GDTP == "DOSAGE" && m.GDID == s.DOSAGEFID select new { m.GDNM }).ToList();
                    if (findDosageName.Count != 0)
                    {
                        foreach (var x in findDosageName)
                        {
                            dosageName = x.GDNM;
                        }
                    }


                    yield return new MediCareDTO
                    {
                        ID = s.ID,
                        COMPID = Convert.ToInt64(s.COMPID),
                        MCATID = Convert.ToInt64(s.MCATID),
                        MEDIID = Convert.ToInt64(s.MEDIID),
                        MEDINM = s.MEDINM,
                        GENERICID = Convert.ToInt64(s.GENERICID),
                        GENERINM = genricName,
                        DOSAGEFID = Convert.ToInt64(s.DOSAGEFID),
                        DOSAGEFNM = dosageName,
                        PHARMAID = Convert.ToInt64(s.PHARMAID),
                        PHARMANM = s.PHARMANM,
                        UNIT = s.UNIT,
                        BUYRT = Convert.ToDecimal(s.BUYRT),
                        SALRT = Convert.ToDecimal(s.SALRT),
                        STKMIN = Convert.ToDecimal(s.STKMIN),
                        INSUSERID = s.INSUSERID,
                        INSLTUDE = s.INSLTUDE,
                        INSTIME = s.INSTIME,
                        INSIPNO = s.INSIPNO,
                    };
                }
            }
        }









        [Route("api/ApiMediCareController/grid/addData")]
        [HttpPost]
        public HttpResponseMessage AddData(MediCareDTO model)
        {
            MediCare mediCare = new MediCare();

            var check_data = (from n in db.HmsMediCareDbSet
                              where n.COMPID == model.COMPID && n.MCATID == model.MCATID && n.MEDINM == model.MEDINM
                                  && n.PHARMAID == model.PHARMAID && n.DOSAGEFID == model.DOSAGEFID && n.GENERICID == model.GENERICID
                              select n).ToList();
            if (check_data.Count == 0)
            {
                var find_data = (from n in db.HmsMediCareDbSet where n.COMPID == model.COMPID && n.MCATID == model.MCATID select n).ToList();
                if (find_data.Count == 0)
                {
                    mediCare.MEDIID = Convert.ToInt64(Convert.ToString(model.MCATID) + "00001"); // MEDIID NUMBER(10), --1010100001
                }
                else
                {
                    Int64 find_Max_MEDIID = Convert.ToInt64((from n in db.HmsMediCareDbSet where n.COMPID == model.COMPID && n.MCATID == model.MCATID select n.MEDIID).Max());
                    mediCare.MEDIID = find_Max_MEDIID + 1;
                }

                mediCare.COMPID = model.COMPID;
                mediCare.MCATID = Convert.ToInt64(model.MCATID);
                mediCare.MEDINM = model.MEDINM;
                mediCare.PHARMAID = model.PHARMAID;
                mediCare.GENERICID = model.GENERICID;
                mediCare.DOSAGEFID = model.DOSAGEFID;
                mediCare.UNIT = model.UNIT;
                mediCare.BUYRT = model.BUYRT;
                mediCare.SALRT = model.SALRT;
                mediCare.STKMIN = model.STKMIN;

                mediCare.USERPC = strHostName;
                mediCare.INSIPNO = ipAddress.ToString();
                mediCare.INSTIME = Convert.ToDateTime(td);
                mediCare.INSUSERID = model.INSUSERID;
                mediCare.INSLTUDE = Convert.ToString(model.INSLTUDE);

                db.HmsMediCareDbSet.Add(mediCare);
                db.SaveChanges();

                model.ID = mediCare.ID;
                model.COMPID = mediCare.COMPID;
                model.MCATID = Convert.ToInt64(mediCare.MCATID);
                model.MEDIID = Convert.ToInt64(mediCare.MEDIID);
                model.MEDINM = mediCare.MEDINM;
                model.PHARMAID = Convert.ToInt64(mediCare.PHARMAID);
                model.GENERICID = Convert.ToInt64(mediCare.GENERICID);
                model.DOSAGEFID = Convert.ToInt64(mediCare.DOSAGEFID);
                model.UNIT = mediCare.UNIT;
                model.BUYRT = Convert.ToDecimal(mediCare.BUYRT);
                model.SALRT = Convert.ToDecimal(mediCare.SALRT);
                model.STKMIN = Convert.ToDecimal(mediCare.STKMIN);
                model.USERPC = mediCare.USERPC;
                model.INSIPNO = mediCare.INSIPNO;
                model.INSTIME = mediCare.INSTIME;
                model.INSUSERID = mediCare.INSUSERID;
                model.INSLTUDE = Convert.ToString(mediCare.INSLTUDE);

                //Log data save from gheadMst Tabel
                MediController mediController = new MediController();
                mediController.Insert_MediCare_LogData(model);

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











        [Route("api/ApiMediCareController/grid/UpdateData")]
        [HttpPost]
        public HttpResponseMessage UpdateData(MediCareDTO model)
        {
            var check_data = (from n in db.HmsMediCareDbSet
                              where n.COMPID == model.COMPID && n.MCATID == model.MCATID && n.MEDINM == model.MEDINM
                                  && n.PHARMAID == model.PHARMAID && n.DOSAGEFID == model.DOSAGEFID && n.GENERICID == model.GENERICID
                              select n).ToList();
            if (check_data.Count == 0)
            {
                var data_find = (from n in db.HmsMediCareDbSet where n.ID == model.ID && n.COMPID == model.COMPID && n.MCATID == model.MCATID && n.MEDIID == model.MEDIID select n).ToList();

                foreach (var item in data_find)
                {
                    item.ID = model.ID;
                    item.COMPID = model.COMPID;
                    item.MCATID = Convert.ToInt64(model.MCATID);
                    item.MEDIID = Convert.ToInt64(model.MEDIID);
                    item.MEDINM = model.MEDINM;
                    item.PHARMAID = model.PHARMAID;
                    item.DOSAGEFID = model.DOSAGEFID;
                    item.GENERICID = model.GENERICID;
                    item.UNIT = model.UNIT;
                    item.BUYRT = Convert.ToInt64(model.BUYRT);
                    item.SALRT = Convert.ToInt64(model.SALRT);
                    item.STKMIN = Convert.ToInt64(model.STKMIN);
                    item.USERPC = strHostName;
                    item.UPDIPNO = ipAddress.ToString();
                    item.UPDLTUDE = Convert.ToString(model.INSLTUDE);
                    item.UPDTIME = Convert.ToDateTime(td);
                    item.UPDUSERID = Convert.ToInt16(model.INSUSERID);

                }
                db.SaveChanges();

                //Log data save from gheadMst Tabel
                MediController mediController = new MediController();
                mediController.update_MediCare_LogData(model);

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









        [Route("api/ApiMediCareController/grid/DeleteData")]
        [HttpPost]
        // DELETE api/<controller>/5
        public HttpResponseMessage DeleteData(MediCareDTO model)
        {
            MediCare deleteModel = new MediCare();
            deleteModel.ID = model.ID;
            deleteModel.COMPID = model.COMPID;
            deleteModel.MCATID = Convert.ToInt64(model.MCATID);
            deleteModel.MEDIID = Convert.ToInt64(model.MEDIID);

            deleteModel = db.HmsMediCareDbSet.Find(deleteModel.ID, deleteModel.COMPID, deleteModel.MCATID, deleteModel.MEDIID);
            db.HmsMediCareDbSet.Remove(deleteModel);
            db.SaveChanges();

            //Log data save from GheadMst Tabel
            MediController mediController = new MediController();
            mediController.Delete_mediCare_LogData(model);
            mediController.Delete_mediCare_LogDelete(model);


            MediCareDTO mediCareObj = new MediCareDTO();
            return Request.CreateResponse(HttpStatusCode.OK, mediCareObj);
        }


    }
}
