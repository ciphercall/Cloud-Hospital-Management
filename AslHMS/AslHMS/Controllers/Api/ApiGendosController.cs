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
    public class ApiGendosController : ApiController
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

        public ApiGendosController()
        {
            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];
            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
        }




        [System.Web.Http.Route("api/ApiGendosController/GetGendosData")]
        [System.Web.Http.HttpGet]
        public IEnumerable<GendosDTO> GetCategoryData(string Compid, string GendosType)
        {
            Int64 compid = Convert.ToInt64(Compid);
            var find_GridData = (from t1 in db.HmsGendosDbSet
                                 where t1.COMPID == compid && t1.GDTP == GendosType
                                 select new
                                 {
                                     t1.ID,
                                     t1.COMPID,
                                     t1.GDID,
                                     t1.GDTP,
                                     t1.GDNM,
                                     t1.REMARKS,

                                     t1.INSIPNO,
                                     t1.INSLTUDE,
                                     t1.INSTIME,
                                     t1.INSUSERID,
                                 }).ToList();

            if (find_GridData.Count == 0)
            {
                yield return new GendosDTO
                {
                    count = 1, //no data found
                };
            }
            else
            {
                foreach (var s in find_GridData)
                {
                    yield return new GendosDTO
                    {
                        ID = s.ID,
                        COMPID = Convert.ToInt64(s.COMPID),
                        GDID = s.GDID,
                        GDTP = s.GDTP,
                        GDNM = s.GDNM,
                        REMARKS = s.REMARKS,
                        INSUSERID = s.INSUSERID,
                        INSLTUDE = s.INSLTUDE,
                        INSTIME = s.INSTIME,
                        INSIPNO = s.INSIPNO,
                    };
                }
            }
        }









        [Route("api/ApiGendosController/grid/addData")]
        [HttpPost]
        public HttpResponseMessage AddData(GendosDTO model)
        {
            Gendos gendos = new Gendos();

            var check_data =
                (from n in db.HmsGendosDbSet where n.COMPID == model.COMPID && n.GDNM == model.GDNM && n.GDTP==model.GDTP select n)
                    .ToList();
            if (check_data.Count == 0)
            {
                var find_data = (from n in db.HmsGendosDbSet where n.COMPID == model.COMPID && n.GDTP==model.GDTP select n.GDID).ToList();
                if (find_data.Count == 0)
                {
                    if (model.GDTP == "GENERIC")
                    {
                        gendos.GDID = Convert.ToInt64(Convert.ToString(model.COMPID) + "100001"); // GDID NUMBER(8), --101100001 (GENERIC)
                    }
                    else if (model.GDTP == "DOSAGE")
                    {
                        gendos.GDID = Convert.ToInt64(Convert.ToString(model.COMPID) + "200001"); // GDID NUMBER(8), --101200001(DOSAGE)
                    }                   
                }
                else
                {
                    Int64 find_Max_GDID = Convert.ToInt64((from n in db.HmsGendosDbSet where n.COMPID == model.COMPID && n.GDTP == model.GDTP select n.GDID).Max());
                    gendos.GDID = find_Max_GDID + 1;
                }

                gendos.COMPID = model.COMPID;
                gendos.GDTP = model.GDTP;
                gendos.GDNM = model.GDNM;
                gendos.REMARKS = model.REMARKS;

                gendos.USERPC = strHostName;
                gendos.INSIPNO = ipAddress.ToString();
                gendos.INSTIME = Convert.ToDateTime(td);
                gendos.INSUSERID = model.INSUSERID;
                gendos.INSLTUDE = Convert.ToString(model.INSLTUDE);

                db.HmsGendosDbSet.Add(gendos);
                db.SaveChanges();

                model.ID = gendos.ID;
                model.COMPID = gendos.COMPID;
                model.GDID = Convert.ToInt64(gendos.GDID);
                model.GDTP = gendos.GDTP;
                model.GDNM = gendos.GDNM;
                model.REMARKS = gendos.REMARKS;
                model.USERPC = gendos.USERPC;
                model.INSIPNO = gendos.INSIPNO;
                model.INSTIME = gendos.INSTIME;
                model.INSUSERID = gendos.INSUSERID;
                model.INSLTUDE = Convert.ToString(gendos.INSLTUDE);

                //Log data save in Test Tabel
                GendosController gendosController = new GendosController();
                gendosController.Insert_Gendos_LogData(model);

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);
                return response;
            }
            else
            {
                model.GDID = 0;
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);
                return response;
            }
        }





        [Route("api/ApiGendosController/grid/UpdateData")]
        [HttpPost]
        public HttpResponseMessage UpdateData(GendosDTO model)
        {
            var check_data = (from n in db.HmsGendosDbSet
                              where n.COMPID == model.COMPID && n.GDTP == model.GDTP && n.GDNM == model.GDNM  
                              select n).ToList();
            if (check_data.Count == 0)
            {
                var data_find =
                    (from n in db.HmsGendosDbSet
                     where n.ID == model.ID && n.COMPID == model.COMPID && n.GDID == model.GDID
                     select n).ToList();

                foreach (var item in data_find)
                {
                    item.ID = model.ID;
                    item.COMPID = model.COMPID;
                    item.GDID = Convert.ToInt64(model.GDID);
                    item.GDTP =model.GDTP;
                    item.GDNM = model.GDNM;
                    item.REMARKS = model.REMARKS;

                    item.USERPC = strHostName;
                    item.UPDIPNO = ipAddress.ToString();
                    item.UPDLTUDE = Convert.ToString(model.INSLTUDE);
                    item.UPDTIME = Convert.ToDateTime(td);
                    item.UPDUSERID = Convert.ToInt16(model.INSUSERID);

                }
                db.SaveChanges();

                //Log data save in Test Tabel
                GendosController gendosController = new GendosController();
                gendosController.update_Gendos_LogData(model);

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);
                return response;
            }
            else
            {
                model.GDID = 0;
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);
                return response;
            }
        }










        [Route("api/ApiGendosController/grid/DeleteData")]
        [HttpPost]
        // DELETE api/<controller>/5
        public HttpResponseMessage DeleteData(GendosDTO model)
        {
            Gendos deleteModel = new Gendos();
            deleteModel.ID = model.ID;
            deleteModel.COMPID = model.COMPID;
            deleteModel.GDID = Convert.ToInt64(model.GDID);

            deleteModel = db.HmsGendosDbSet.Find(deleteModel.ID, deleteModel.COMPID, deleteModel.GDID);
            db.HmsGendosDbSet.Remove(deleteModel);
            db.SaveChanges();

            //Log data save from Pharma Table
            GendosController gendosController = new GendosController();
            gendosController.Delete_gendos_LogData(model);
            gendosController.Delete_gendos_LogDelete(model);

            GendosDTO gendosObj = new GendosDTO();
            return Request.CreateResponse(HttpStatusCode.OK, gendosObj);
        }

    }
}
