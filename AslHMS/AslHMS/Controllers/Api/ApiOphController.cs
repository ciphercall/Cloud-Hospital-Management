using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using AslHMS.Models;
using AslHMS.Models.DTO;
using AslHMS.Models.HMS;

namespace AslHMS.Controllers.Api
{
    public class ApiOphController : ApiController
    {
        
        IFormatProvider dateformat = new System.Globalization.CultureInfo("fr-FR", true);
        TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
        public DateTime td;

        AslHMSApiContext db = new AslHMSApiContext();

        //Get Ip ADDRESS,Time & user PC Name
        public string strHostName;
        public IPHostEntry ipHostInfo;
        public IPAddress ipAddress;

        public ApiOphController()
        {
           
            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];
            //td = DateTime.Now;
            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
        }


        [System.Web.Http.Route("api/ApiOph/GetData")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OpHeadDTO> Get(string Compid, string HeadCName, string HeadCID, string InUserID, string InsLtude)
        {

            //Get Ip ADDRESS,Time & user PC Name
            string strHostName = System.Net.Dns.GetHostName();
            IPHostEntry ipHostInfo = Dns.Resolve(Dns.GetHostName());
            IPAddress ipAddress = ipHostInfo.AddressList[0];

            Int64 InsUserID = Convert.ToInt64(InUserID);
            Int64 compid = Convert.ToInt64(Compid);

            Int64 headcid = Convert.ToInt64(HeadCID);


            var ache_kina_data = (from n in db.HMS_OPHMST where n.COMPID == compid && n.OPHCID==headcid select n).ToList();
            if (ache_kina_data.Count == 0)
            {
                var max_opheadcid =
                  (from n in db.HMS_OPHMST where n.COMPID == compid select n.OPHCID).Max();
                if (max_opheadcid == null)
                {
                    OphMaster obj = new OphMaster
                    {
                        COMPID = compid,
                       
                        OPHCID = Convert.ToInt64(Convert.ToString(compid)+"01"),
                        OPHCNM = HeadCName,
                       

                        USERPC = strHostName,
                        INSIPNO = ipAddress.ToString(),

                        INSTIME = Convert.ToDateTime(td),

                        INSUSERID = InsUserID,
                        INSLTUDE = InsLtude


                    };

                    db.HMS_OPHMST.Add(obj);
                    db.SaveChanges();

                    yield return new OpHeadDTO
                    {

                        COMPID = compid,
                        OpHeadCID = obj.OPHCID,
                        OpHeadCName = HeadCName,
                        OpHeadID=0
                       

                    };
                }
                else
                {

                    OphMaster obj = new OphMaster
                    {
                        COMPID = compid,
                        OPHCID = max_opheadcid+1,
                        OPHCNM = HeadCName,
                       

                        USERPC = strHostName,
                        INSIPNO = ipAddress.ToString(),
                        INSTIME = Convert.ToDateTime(td),

                        INSUSERID = InsUserID,
                        INSLTUDE = InsLtude


                    };

                    db.HMS_OPHMST.Add(obj);
                    db.SaveChanges();

                    yield return new OpHeadDTO
                    {

                        COMPID = compid,
                        OpHeadCID = obj.OPHCID,
                        OpHeadCName = HeadCName,
                        OpHeadID = 0

                    };
                }












            }
            else
            {


                var ff = (from n in db.HMS_OPHEAD where n.COMPID == compid && n.OPHCID == headcid select n).ToList();
                    if (ff.Count == 0)
                    {

                        yield return new OpHeadDTO
                        {
                            COMPID = compid,
                            OpHeadCID = headcid,
                            OpHeadCName = HeadCName,
                            OpHeadID = 0


                        };

                    }
                    else
                    {

                        var oph_data = (from t1 in db.HMS_OPHEAD
                                       
                                        where t1.COMPID == compid && t1.OPHCID == headcid
                                        select new
                                        {
                                            Id = t1.ID,

                                            compid = t1.COMPID,
                                          headCID=t1.OPHCID,
                                          headid=t1.OPHID,
                                          headname=t1.OPHNM,
                                          rate=t1.OPHRT,
                                          remarks=t1.REMARKS
                                        


                                        });

                        foreach (var item in oph_data)
                        {

                            yield return new OpHeadDTO
                            {
                                ID = item.Id,
                               COMPID = item.compid,
                               OpHeadCID = item.headCID,
                               OpHeadID = item.headid,
                               OpHeadName = item.headname,
                               Rate = item.rate,
                                Remarks = item.remarks

                            };
                        }
                    }
               




            }


        }

        [System.Web.Http.Route("api/grid/OphChild")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage AddChildData(OpHeadDTO model)
        {


            var check_data = (from n in db.HMS_OPHEAD
                              where n.COMPID == model.COMPID && n.OPHCID == model.OpHeadCID
                                  && n.OPHNM == model.OpHeadName 
                              select n).ToList();
            if (check_data.Count == 0)
            {
                Int64 maxHeadID = Convert.ToInt64((from n in db.HMS_OPHEAD
                                                    where n.COMPID == model.COMPID && n.OPHCID == model.OpHeadCID
                                                        
                                                    select n.OPHID).Max());

                if (maxHeadID == 0)
                {
                    OpHead childData = new OpHead();

                    childData.COMPID = model.COMPID;
                    childData.OPHCID = model.OpHeadCID;

                    childData.OPHNM = model.OpHeadName;
                    childData.OPHID = Convert.ToInt64(Convert.ToString(model.OpHeadCID)+"001");
                    childData.OPHRT = model.Rate;
                    childData.REMARKS = model.Remarks;
                   



                    childData.USERPC = strHostName;
                    childData.INSIPNO = ipAddress.ToString();
                    childData.INSTIME = Convert.ToDateTime(td);
                    childData.INSUSERID = model.INSUSERID;
                    childData.INSLTUDE = model.INSLTUDE;

                    db.HMS_OPHEAD.Add(childData);

                    db.SaveChanges();

                    model.ID = childData.ID;
                    model.COMPID = model.COMPID;
                    model.OpHeadCID = model.OpHeadCID;
                    model.OpHeadID = childData.OPHID;

                    model.OpHeadName = model.OpHeadName;

                    model.Rate = model.Rate;
                    model.Remarks = model.Remarks;

               


                    //Insert_OpdLogData(model);






                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                    return response;
                }
                else
                {
                    OpHead childData = new OpHead();

                    childData.COMPID = model.COMPID;
                    childData.OPHCID = model.OpHeadCID;

                    childData.OPHNM = model.OpHeadName;
                    childData.OPHID = maxHeadID + 1;
                    childData.OPHRT = model.Rate;
                    childData.REMARKS = model.Remarks;




                    childData.USERPC = strHostName;
                    childData.INSIPNO = ipAddress.ToString();
                    childData.INSTIME = Convert.ToDateTime(td);
                    childData.INSUSERID = model.INSUSERID;
                    childData.INSLTUDE = model.INSLTUDE;

                    db.HMS_OPHEAD.Add(childData);

                    db.SaveChanges();

                    model.ID = childData.ID;
                    model.COMPID = model.COMPID;
                    model.OpHeadCID = model.OpHeadCID;
                    model.OpHeadID = childData.OPHID;

                    model.OpHeadName = model.OpHeadName;

                    model.Rate = model.Rate;
                    model.Remarks = model.Remarks;




                    //Insert_OpdLogData(model);






                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                    return response;
                }
             
            }
            else
            {
                model.OpHeadID = 0;
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                return response;
            }

         
        }

        [Route("api/HeadCName")]
        [HttpGet]
        public IEnumerable<OpHeadDTO> GetCatList(string query, string query2)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(query2);
                return String.IsNullOrEmpty(query) ? db.HMS_OPHMST.AsEnumerable().Select(b => new OpHeadDTO { }).ToList() :
                db.HMS_OPHMST.Where(p => p.OPHCNM.StartsWith(query) && p.COMPID == compid).Select(
                          x =>
                          new
                          {
                              headcname = x.OPHCNM,
                              headcid = x.OPHCID,
                             
                          })
                .AsEnumerable().Select(a => new OpHeadDTO
                {
                    OpHeadCName = a.headcname,
                    OpHeadCID = Convert.ToInt64(a.headcid),
                  
                }).ToList();
            }
        }

        [System.Web.Http.Route("api/DynamicHeadCName")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OpHeadDTO> Dynamicautocomplete(string changedText, string changedText2)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(changedText2);
                String name = "";

                var rt = db.HMS_OPHMST.Where(n => n.OPHCNM.StartsWith(changedText) && n.COMPID == compid).Select(n => new
                {
                    headname = n.OPHCNM

                }).ToList();


                int lenChangedtxt = changedText.Length;

                Int64 cont = rt.Count();
                Int64 k = 0;
                string status = "";
                if (changedText != "" && cont != 0)
                {
                    while (status != "no")
                    {
                        k = 0;
                        foreach (var n in rt)
                        {
                            string ss = Convert.ToString(n.headname);
                            string subss = "";
                            if (ss.Length >= lenChangedtxt)
                            {
                                subss = ss.Substring(0, lenChangedtxt);
                                subss = subss.ToUpper();
                            }
                            else
                            {
                                subss = "";
                            }


                            if (subss == changedText.ToUpper())
                            {
                                k++;
                            }
                            if (k == cont)
                            {
                                status = "yes";
                                lenChangedtxt++;
                                if (ss.Length > lenChangedtxt - 1)
                                {
                                    changedText = changedText + ss[lenChangedtxt - 1];
                                }

                            }
                            else
                            {
                                status = "no";
                                //lenChangedtxt--;
                            }

                        }

                    }
                    if (lenChangedtxt == 1)
                    {
                        name = changedText.Substring(0, lenChangedtxt);
                    }

                    else
                    {
                        name = changedText.Substring(0, lenChangedtxt - 1);
                    }



                }
                else
                {
                    name = changedText;
                }



                var findid = (from n in db.HMS_OPHMST where n.OPHCNM == name && n.COMPID == compid select n).ToList();
                if (findid.Count != 0)
                {
                    return db.HMS_OPHMST.Where(p => p.OPHCNM == name && p.COMPID == compid).Select(
                        x =>
                            new
                            {
                                headcname = x.OPHCNM,
                                headcid = x.OPHCID
                              

                            })
                        .AsEnumerable().Select(a => new OpHeadDTO
                        {

                            OpHeadCName = a.headcname,
                            OpHeadCID = Convert.ToInt64(a.headcid)
                          

                        }).ToList();
                }
                else
                {
                    return db.HMS_OPHMST.AsEnumerable().Select(a => new OpHeadDTO
                    {
                        OpHeadCName = name,
                        OpHeadCID = 0

                    }).ToList();
                }



            }

        }

        [System.Web.Http.Route("api/Apioph/SaveData")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage SaveData(OpHeadDTO model)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

            var duplicate_data_test =
                    (from n in db.HMS_OPHEAD where n.COMPID == model.COMPID && n.OPHCID == model.OpHeadCID select n).ToList();
            Int64 id = 0;
            if (duplicate_data_test.Count > 0)
            {
                foreach (var x in duplicate_data_test)
                {
                    id = x.ID;
                }
                if (id == model.ID)
                {

                    var data_find = (from n in db.HMS_OPHEAD where n.ID == model.ID select n).ToList();
                    foreach (var item in data_find)
                    {
                        item.ID = model.ID;
                        item.COMPID = model.COMPID;
                        item.OPHCID = model.OpHeadCID;
                        item.OPHID = item.OPHID;
                        item.OPHNM = model.OpHeadName;
                        item.OPHRT = model.Rate;
                       
                        item.REMARKS = model.Remarks;

                        item.USERPC = item.USERPC;
                        item.INSIPNO = item.INSIPNO;
                        item.INSLTUDE = item.INSLTUDE;
                        item.INSTIME = item.INSTIME;
                        item.INSUSERID = item.INSUSERID;

                        item.UPDIPNO = ipAddress.ToString();
                        item.UPDLTUDE = model.UPDLTUDE;
                        item.UPDTIME = Convert.ToDateTime(td);
                        item.UPDUSERID = model.UPDUSERID;

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
                    model.OpHeadID = 0;
                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                    return response;
                }

            }

            return null;

        }

        [System.Web.Http.Route("api/ApiOph/DeleteData")]
        [System.Web.Http.HttpPost]
        // DELETE api/<controller>/5
        public HttpResponseMessage DeleteData(OpHeadDTO model)
        {

            System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AslHMSApiContext"].ToString());
            string query = string.Format("DELETE FROM HMS_OPHEAD WHERE ID='{0}'", model.ID);
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
            OpHead testObj = new OpHead();






            return Request.CreateResponse(HttpStatusCode.OK, testObj);
        }


    }
}
