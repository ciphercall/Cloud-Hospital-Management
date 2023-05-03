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
    public class ApiPharmaController : ApiController
    {
        private AslHMSApiContext db = new AslHMSApiContext();

        //Datetime formet
        private IFormatProvider dateformat = new System.Globalization.CultureInfo("fr-FR", true);
        private TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
        public DateTime td;

        //Get Ip ADDRESS,Time & user PC Name
        public string strHostName;
        public IPHostEntry ipHostInfo;
        public IPAddress ipAddress;

        public ApiPharmaController()
        {
            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];
            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
        }


        [System.Web.Http.Route("api/ApiPharmaController/GetPharma")]
        [System.Web.Http.HttpGet]
        public IEnumerable<PharmaDTO> GetCategoryData(string Compid)
        {
            Int64 compid = Convert.ToInt64(Compid);
            var find_GridData = (from t1 in db.HmsPharmaDbSet
                where t1.COMPID == compid
                select new
                {
                    t1.ID,
                    t1.COMPID,
                    t1.PHARMAID,
                    t1.PHARMAGID,
                    t1.PHARMANM,
                    t1.ADDRESS,
                    t1.CONTACT,
                    t1.STATUS,

                    t1.INSIPNO,
                    t1.INSLTUDE,
                    t1.INSTIME,
                    t1.INSUSERID,
                }).ToList();

            if (find_GridData.Count == 0)
            {
                yield return new PharmaDTO
                {
                    count = 1, //no data found
                };
            }
            else
            {
                foreach (var s in find_GridData)
                {
                    string status = "";
                    if (s.STATUS == "A")
                    {
                        status = "Active";
                    }
                    else
                    {
                        status = "Inactive";
                    }
                    yield return new PharmaDTO
                    {
                        ID = s.ID,
                        COMPID = Convert.ToInt64(s.COMPID),
                        PHARMAID = s.PHARMAID,
                        PHARMAGID = s.PHARMAGID,
                        PHARMANM = s.PHARMANM,
                        ADDRESS = s.ADDRESS,
                        CONTACT = s.CONTACT,
                        STATUS = status, //s.STATUS,
                        INSUSERID = s.INSUSERID,
                        INSLTUDE = s.INSLTUDE,
                        INSTIME = s.INSTIME,
                        INSIPNO = s.INSIPNO,
                    };
                }
            }
        }











        [Route("api/ApiPharmaController/grid/addData")]
        [HttpPost]
        public HttpResponseMessage AddData(PharmaDTO model)
        {
            Pharma pharma = new Pharma();

            var check_data =
                (from n in db.HmsPharmaDbSet where n.COMPID == model.COMPID && n.PHARMANM == model.PHARMANM select n)
                    .ToList();
            if (check_data.Count == 0)
            {
                var find_data = (from n in db.HmsPharmaDbSet where n.COMPID == model.COMPID select n.PHARMAID).ToList();
                if (find_data.Count == 0)
                {
                    pharma.PHARMAID = Convert.ToInt64(Convert.ToString(model.COMPID) + "203010100001"); //PHARMAID    NUMBER(15),--101203010100001, 101203010100002
                }
                else
                {
                    Int64 find_Max_PharmaID =
                        Convert.ToInt64(
                            (from n in db.HmsPharmaDbSet where n.COMPID == model.COMPID select n.PHARMAID).Max());
                    pharma.PHARMAID = find_Max_PharmaID + 1;
                }

                pharma.COMPID = model.COMPID;
                pharma.PHARMAGID = Convert.ToInt64(Convert.ToString(model.COMPID) + "203010100000");  //PHARMAGID   NUMBER(15), -- '101(Compid) + 203010100000'
                pharma.PHARMANM = model.PHARMANM;
                pharma.ADDRESS = model.ADDRESS;
                pharma.CONTACT = model.CONTACT;
                pharma.STATUS = model.STATUS;
                pharma.USERPC = strHostName;
                pharma.INSIPNO = ipAddress.ToString();
                pharma.INSTIME = Convert.ToDateTime(td);
                pharma.INSUSERID = model.INSUSERID;
                pharma.INSLTUDE = Convert.ToString(model.INSLTUDE);

                db.HmsPharmaDbSet.Add(pharma);
                db.SaveChanges();

                model.ID = pharma.ID;
                model.COMPID = pharma.COMPID;
                model.PHARMAID = Convert.ToInt64(pharma.PHARMAID);
                model.PHARMAGID = Convert.ToInt64(pharma.PHARMAGID);
                model.PHARMANM = pharma.PHARMANM;
                model.ADDRESS = pharma.ADDRESS;
                model.CONTACT = pharma.CONTACT;
                model.STATUS = pharma.STATUS;
                model.USERPC = pharma.USERPC;
                model.INSIPNO = pharma.INSIPNO;
                model.INSTIME = pharma.INSTIME;
                model.INSUSERID = pharma.INSUSERID;
                model.INSLTUDE = Convert.ToString(pharma.INSLTUDE);

                //Log data save in Test Tabel
                PharmaController pharmaController = new PharmaController();
                pharmaController.Insert_Pharma_LogData(model);

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);
                return response;
            }
            else
            {
                model.PHARMAID = 0;
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);
                return response;
            }
        }










        [Route("api/ApiPharmaController/grid/UpdateData")]
        [HttpPost]
        public HttpResponseMessage UpdateData(PharmaDTO model)
        {
            string status = model.STATUS;
            if (status == "Active")
            {
                model.STATUS = "A";
            }
            else if (status == "Inactive")
            {
                model.STATUS = "I";
            }

            var check_data = (from n in db.HmsPharmaDbSet
                where n.COMPID == model.COMPID && n.PHARMANM == model.PHARMANM && n.ADDRESS == model.ADDRESS && n.CONTACT == model.CONTACT && model.STATUS == n.STATUS
                select n).ToList();
            if (check_data.Count == 0)
            {
                var data_find =
                    (from n in db.HmsPharmaDbSet
                        where n.ID == model.ID && n.COMPID == model.COMPID && n.PHARMAID == model.PHARMAID
                        select n).ToList();

                foreach (var item in data_find)
                {
                    item.ID = model.ID;
                    item.COMPID = model.COMPID;
                    item.PHARMAID = Convert.ToInt64(model.PHARMAID);
                    item.PHARMAGID = Convert.ToInt64(model.PHARMAGID);
                    item.PHARMANM = model.PHARMANM;
                    item.ADDRESS = model.ADDRESS;
                    item.CONTACT = model.CONTACT;
                    item.STATUS = model.STATUS;

                    item.USERPC = strHostName;
                    item.UPDIPNO = ipAddress.ToString();
                    item.UPDLTUDE = Convert.ToString(model.INSLTUDE);
                    item.UPDTIME = Convert.ToDateTime(td);
                    item.UPDUSERID = Convert.ToInt16(model.INSUSERID);

                }
                db.SaveChanges();

                //Log data save in Test Tabel
                PharmaController pharmaController = new PharmaController();
                pharmaController.update_Pharma_LogData(model);

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);
                return response;
            }
            else
            {
                model.PHARMAID = 0;
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);
                return response;
            }
        }










        [Route("api/ApiPharmaController/grid/DeleteData")]
        [HttpPost]
        // DELETE api/<controller>/5
        public HttpResponseMessage DeleteData(PharmaDTO model)
        {
            Pharma deleteModel = new Pharma();
            deleteModel.ID = model.ID;
            deleteModel.COMPID = model.COMPID;
            deleteModel.PHARMAID = Convert.ToInt64(model.PHARMAID);

            deleteModel = db.HmsPharmaDbSet.Find(deleteModel.ID, deleteModel.COMPID, deleteModel.PHARMAID);
            db.HmsPharmaDbSet.Remove(deleteModel);
            db.SaveChanges();

            //Log data save from Pharma Table
            PharmaController pharmaController = new PharmaController();
            pharmaController.Delete_pharma_LogData(model);
            pharmaController.Delete_pharma_LogDelete(model);

            PharmaDTO pharmaObj = new PharmaDTO();
            return Request.CreateResponse(HttpStatusCode.OK, pharmaObj);
        }
    }
}

