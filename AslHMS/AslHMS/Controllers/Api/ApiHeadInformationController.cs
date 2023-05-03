using System.Data.Entity.Infrastructure;
using AslHMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using AslHMS.Models.DTO;
using AslHMS.Models.HMS;
using Microsoft.Ajax.Utilities;

namespace AslHMS.Controllers.Api
{
    public class ApiHeadInformationController : ApiController
    {

        IFormatProvider dateformat = new System.Globalization.CultureInfo("fr-FR", true);
        TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
        public DateTime td;

        //Get Ip ADDRESS,Time & user PC Name
        public string strHostName;
        public IPHostEntry ipHostInfo;
        public IPAddress ipAddress;

         public ApiHeadInformationController()
        {

            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];

            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
        }

         AslHMSApiContext db = new AslHMSApiContext();

         [System.Web.Http.Route("api/ApiHeadInfo/GetData")]
         [System.Web.Http.HttpGet]
         public IEnumerable<HeadInfo> Get(string Compid)
         {

             Int64 compid = Convert.ToInt64(Compid);
          

             var ache_kina_data = (from n in db.HMS_HEADIO where n.COMPID == compid select n).ToList();
             if (ache_kina_data.Count == 0)
             {
                 


                 yield return new HeadInfo
                 {

                   HeadId = 0


                 };

             }
             else
             {




                 var headiodto = (from t1 in db.HMS_HEADIO
                                 //join t2 in db.HMS_TEST on t1.TVACID equals t2.TESTID
                                 where t1.COMPID == compid 
                                 select new
                                 {
                                     Id = t1.ID,
                                     compid = t1.COMPID,
                                     headtype = t1.HEADTP,
                                     headid = t1.HEADID,
                                     headname = t1.HEADNM,
                                     rate = t1.RATE,
                                     headfor=t1.HEADFOR,
                                     remarks=t1.REMARKS



                                 });
                 string type = "";
                 foreach (var item in headiodto)
                 {
                     if (item.headtype == "IPD")
                     {
                         type = "INDOOR";
                     }
                     else if(item.headtype=="OPD")
                     {
                         type = "OUTDOOR";
                     }
                     else
                     {
                         type = "CABIN/BED";
                     }
                     yield return new HeadInfo
                     {
                         ID= item.Id,
                         COMPID = item.compid,
                         HeadType =type,
                         HeadId = item.headid,
                         HeadName = item.headname,
                         Rate = item.rate,
                         HeadFor = item.headfor,
                         Remarks = item.remarks
                     };
                 }




             }
         }




         [System.Web.Http.Route("api/grid/HeadInformation")]
         [System.Web.Http.HttpPost]
         public HttpResponseMessage AddChildData(HeadInfo model)
         {

             var check_data = (from n in db.HMS_HEADIO where n.COMPID == model.COMPID && n.HEADTP == model.HeadType && n.HEADNM == model.HeadName && n.HEADFOR == model.HeadFor select n).ToList();
             if (check_data.Count == 0)
             {
                 Int64 maxHeadID = Convert.ToInt64((from n in db.HMS_HEADIO where n.COMPID==model.COMPID select n.HEADID).Max());
                 if (maxHeadID == 0)
                 {
                     HeadIO headio = new HeadIO();

                     headio.COMPID = model.COMPID;
                     headio.HEADTP = model.HeadType;
                     headio.HEADNM = model.HeadName;
                     if (model.HeadType == "IPD")
                     {
                         headio.HEADID = Convert.ToInt64(Convert.ToString((model.COMPID) + "101"));

                     }
                     else if (model.HeadType == "OPD")
                     {
                         headio.HEADID = Convert.ToInt64(Convert.ToString((model.COMPID) + "201"));

                     }
                     else if (model.HeadType == "ICB")
                     {
                         headio.HEADID = Convert.ToInt64(Convert.ToString((model.COMPID) + "301"));

                     }

                     headio.HEADFOR = model.HeadFor;
                     headio.RATE = model.Rate;
                     headio.REMARKS = model.Remarks;


                     headio.USERPC = strHostName;
                     headio.INSIPNO = ipAddress.ToString();
                     headio.INSLTUDE = model.INSLTUDE;
                     headio.INSTIME = Convert.ToDateTime(td);
                     headio.INSUSERID = model.INSUSERID;

                     db.HMS_HEADIO.Add(headio);


                     model.ID = headio.ID;
                     model.COMPID = model.COMPID;
                     model.HeadType = headio.HEADTP;
                     model.HeadId = headio.HEADID;
                     model.HeadName = headio.HEADNM;
                     model.HeadFor = headio.HEADFOR;
                     model.Rate = headio.RATE;
                     model.Remarks = headio.REMARKS;

                     model.USERPC = headio.USERPC;
                     model.INSIPNO = headio.INSIPNO;
                     model.INSTIME = headio.INSTIME;

                     //Insert_TestVaccumLogData(model);
                     db.SaveChanges();



                     HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);
                     //response.Headers.Location = new Uri(Url.Link("api/ApiFilterItemController", new { gid = model.FILTERGID }));

                     return response;

                 }
                 else
                 {
                     string submaxHeadID = Convert.ToString(maxHeadID).Substring(3, 1);
                     HeadIO headio = new HeadIO();

                     headio.COMPID = model.COMPID;
                     headio.HEADTP = model.HeadType;
                     headio.HEADNM = model.HeadName;

                     if (model.HeadType == "IPD")
                     {
                         if (submaxHeadID == "1")
                         {
                             headio.HEADID = maxHeadID + 1;
                         }
                         else
                         {
                             headio.HEADID = Convert.ToInt64(Convert.ToString((model.COMPID) + "101"));
                         }
                        

                     }
                     else if (model.HeadType == "OPD")
                     {
                         if (submaxHeadID == "2")
                         {
                             headio.HEADID = maxHeadID + 1;
                         }
                         else
                         {
                             headio.HEADID = Convert.ToInt64(Convert.ToString((model.COMPID) + "201"));
                         }
                       

                     }
                     else if (model.HeadType == "ICB")
                     {
                         if (submaxHeadID == "3")
                         {
                             headio.HEADID = maxHeadID + 1;
                         }
                         else
                         {
                             headio.HEADID = Convert.ToInt64(Convert.ToString((model.COMPID) + "301"));
                         }
                         

                     }
                     headio.HEADFOR = model.HeadFor;
                     headio.RATE = model.Rate;
                     headio.REMARKS = model.Remarks;


                     headio.USERPC = strHostName;
                     headio.INSIPNO = ipAddress.ToString();
                     headio.INSLTUDE = model.INSLTUDE;
                     headio.INSTIME = Convert.ToDateTime(td);
                     headio.INSUSERID = model.INSUSERID;

                     db.HMS_HEADIO.Add(headio);


                     model.ID = headio.ID;
                     model.COMPID = model.COMPID;
                     model.HeadType = headio.HEADTP;
                     model.HeadId = headio.HEADID;
                     model.HeadName = headio.HEADNM;
                     model.HeadFor = headio.HEADFOR;
                     model.Rate = headio.RATE;
                     model.Remarks = headio.REMARKS;

                     model.USERPC = headio.USERPC;
                     model.INSIPNO = headio.INSIPNO;
                     model.INSTIME = headio.INSTIME;

                     //Insert_TestVaccumLogData(model);
                     db.SaveChanges();



                     HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);
                     return response;

                 }
               
               



                

             }
             else
             {
                 model.HeadId = 0;
                 HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                 return response;
             }

             return null;
         }


         [System.Web.Http.Route("api/ApiAslHMS/SaveData")]
         [System.Web.Http.HttpPost]
         public HttpResponseMessage SaveData(HeadInfo model)
         {
             if (!ModelState.IsValid)
             {
                 return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
             }

             var duplicate_data_test =
                     (from n in db.HMS_HEADIO where n.COMPID == model.COMPID && n.HEADID == model.HeadId select n).ToList();
             Int64 id = 0;
             if (duplicate_data_test.Count > 0)
             {
                 foreach (var x in duplicate_data_test)
                 {
                     id = x.ID;
                 }
                 if (id == model.ID)
                 {

                     var data_find = (from n in db.HMS_HEADIO where n.ID == model.ID select n).ToList();
                     foreach (var item in data_find)
                     {
                         item.ID = model.ID;
                         item.COMPID = model.COMPID;
                         item.HEADID = Convert.ToInt64(model.HeadId);
                         item.HEADNM = model.HeadName;
                         item.HEADTP = model.HeadType;
                         item.HEADFOR = model.HeadFor;
                         item.RATE = model.Rate;
                         item.REMARKS = model.Remarks;

                         item.USERPC = item.USERPC;
                         item.INSIPNO = item.INSIPNO;
                         item.INSLTUDE = item.INSLTUDE;
                         item.INSTIME = item.INSTIME;
                         item.INSUSERID = item.INSUSERID;

                     }


                     //db.Entry(cartFilter).State = EntityState.Modified;

                     try
                     {
                         db.SaveChanges();
                     }
                     catch (DbUpdateConcurrencyException ex)
                     {
                         return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
                     }

                     HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                     return response;
                 }
                 else
                 {
                     model.HeadId = 0;
                     HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                     return response;
                 }

             }
             
             return null;

         }

         [System.Web.Http.Route("api/ApiHMS/DeleteData")]
         [System.Web.Http.HttpPost]
         // DELETE api/<controller>/5
         public HttpResponseMessage DeleteData(HeadInfo model)
         {

             System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AslHMSApiContext"].ToString());
             string query = string.Format("DELETE FROM HMS_HEADIO WHERE ID='{0}'", model.ID);
             System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, conn);
             conn.Open();
             cmd.ExecuteNonQuery();

             try
             {
                 db.SaveChanges();
             }
             catch (DbUpdateConcurrencyException ex)
             {
                 return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
             }
             conn.Close();
             HeadIO testObj = new HeadIO();






             return Request.CreateResponse(HttpStatusCode.OK, testObj);
         }


    }
}
