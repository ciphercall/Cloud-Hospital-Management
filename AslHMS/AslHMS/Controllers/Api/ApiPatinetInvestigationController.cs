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
    public class ApiPatinetInvestigationController : ApiController
    {
          
        IFormatProvider dateformat = new System.Globalization.CultureInfo("fr-FR", true);
        TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
        public DateTime td;

        AslHMSApiContext db = new AslHMSApiContext();

        //Get Ip ADDRESS,Time & user PC Name
        public string strHostName;
        public IPHostEntry ipHostInfo;
        public IPAddress ipAddress;

        public ApiPatinetInvestigationController()
        {
           
            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];
          
            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
        }

        [System.Web.Http.Route("api/ApiPatientInvestigation/GetData")]
        [System.Web.Http.HttpGet]
        public IEnumerable<PatientInvestigationDTO> Get(string Compid, string Patientyearid, string InUserID, string InsLtude)
        {

         


            Int64 InsUserID = Convert.ToInt64(InUserID);
            Int64 compid = Convert.ToInt64(Compid);
            Int64 patinetyid = Convert.ToInt64(Patientyearid);



            var ache_kina_data = (from n in db.HmsPInvestinDbSet where n.COMPID == compid && n.PATIENTYYID == patinetyid select n).ToList();
            if (ache_kina_data.Count == 0)
            {



                yield return new PatientInvestigationDTO
                {

                    COMPID = compid,

                    PatientYearId = patinetyid,


                    TransSerial = 0

                };








            }
            else
            {
                var pInvestigation_data = (from t1 in db.HmsPInvestinDbSet
                                     join t2 in db.HMS_TEST on t1.INVESTNID equals t2.TESTID
                                     join t3 in db.HMS_REFER on t1.SERVICEID equals t3.REFERID
                                     where t1.COMPID == compid && t1.PATIENTYYID == patinetyid
                                     select new
                                     {
                                         Id = t1.ID,

                                         compid = t1.COMPID,
                                         patintyear = t1.PATIENTYY,
                                         Patientid = t1.PATIENTID,
                                         Patientyid = t1.PATIENTYYID,
                                         transdt = t1.TRANSDT,
                                         transsl = t1.TRANSSL,
                                         investigationName = t2.TESTNM,
                                         investigationId = t1.INVESTNID,
                                         serviceid=t1.SERVICEID,
                                         servicename=t3.REFERNM,
                                         amount = t1.AMOUNT,


                                         remarks = t1.REMARKS


                                     });

                foreach (var item in pInvestigation_data)
                {
                    DateTime abcd = Convert.ToDateTime(item.transdt);
                    string conv_tdt = abcd.ToString("dd-MMM-yyyy");

                 

                    yield return new PatientInvestigationDTO
                    {
                        ID = item.Id,
                        COMPID = item.compid,
                        PatientYear = item.patintyear,
                        PatientId = item.Patientid,
                        PatientYearId = item.Patientyid,
                        TransactionDate = conv_tdt,
                        TransSerial = item.transsl,
                        InvestigationId = item.investigationId,
                        InvestigationName = item.investigationName,
                        Amount = item.amount,
                        ServiceId = item.serviceid,
                        ServiceName = item.servicename,
                        Remarks = item.remarks


                    };
                }





            }


        }


        [System.Web.Http.Route("api/apiPatinetInvestigation/Investigation")]
        [System.Web.Http.HttpGet]
        public IEnumerable<PatientInvestigationDTO> GetInvestigationName(string query, string query2)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(query2);
                return String.IsNullOrEmpty(query) ? db.HMS_TEST.AsEnumerable().Select(b => new PatientInvestigationDTO { }).ToList() :
                db.HMS_TEST.Where(p => p.TESTNM.StartsWith(query) && p.COMPID == compid).Select(
                          x =>
                          new
                          {
                              testname = x.TESTNM,
                              testid = x.TESTID


                          })
                .AsEnumerable().Select(a => new PatientInvestigationDTO
                {
                    InvestigationId = a.testid,
                    InvestigationName = a.testname

                }).ToList();
            }
        }

        [System.Web.Http.Route("apiPInvestigation/DynamicInvestigation")]
        [System.Web.Http.HttpGet]
        public IEnumerable<PatientInvestigationDTO> Dynamicautocomplete(string changedText, string changedText2)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(changedText2);

                String name = "";

                var rt = db.HMS_TEST.Where(n => n.TESTNM.StartsWith(changedText) && n.COMPID == compid).Select(n => new
                {
                    headname = n.TESTNM

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



                var findid = (from n in db.HMS_TEST where n.TESTNM == name && n.COMPID == compid select n).ToList();
                if (findid.Count != 0)
                {
                    return db.HMS_TEST.Where(p => p.TESTNM == name && p.COMPID == compid).Select(
                        x =>
                            new
                            {
                                refername = x.TESTNM,
                                referid = x.TESTID,



                            })
                        .AsEnumerable().Select(a => new PatientInvestigationDTO
                        {

                            InvestigationId = a.referid,
                            InvestigationName = a.refername



                        }).ToList();
                }
                else
                {
                    return db.HMS_TEST.AsEnumerable().Select(a => new PatientInvestigationDTO
                    {
                        InvestigationName = name,
                        InvestigationId = 0

                    }).ToList();
                }



            }

        }


        [System.Web.Http.Route("apiPatientInvestigation/grid/Child")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage AddChildData(PatientInvestigationDTO model)
        {
            //DateTime efdt = Convert.ToDateTime(model.EFDT);

            var check_data = (from n in db.HmsPInvestinDbSet
                              where n.COMPID == model.COMPID && n.PATIENTYYID == model.PatientYearId

                              select n).ToList();


            if (check_data.Count == 0)
            {

                var findPatientID =
                    (from n in db.HMS_IpdDbSet
                     where n.COMPID == model.COMPID && n.PATIENTYYID == model.PatientYearId
                     select n).ToList();
                string Patientid = "";
                foreach (var opdMaster in findPatientID)
                {
                    Patientid = opdMaster.PATIENTID;

                }

                var find_ipdid =
                    (from n in db.HMS_TEST where n.COMPID == model.COMPID && n.TESTID == model.InvestigationId select n)
                        .ToList();
                Int64 billid = 0;
                foreach (var test in find_ipdid)
                {
                    billid = test.IPDID;
                }

                PInvestigation childData = new PInvestigation();

                childData.COMPID = model.COMPID;
                childData.PATIENTYY = model.PatientYear;
                childData.PATIENTTP ="INDOOR";
                childData.PATIENTID = Patientid;
                childData.PATIENTYYID = model.PatientYearId;
                childData.TRANSDT = Convert.ToDateTime(model.TransactionDate);
                childData.TRANSSL = Convert.ToInt64(Convert.ToString(model.PatientYearId) + "01");

                childData.BILLID = billid;
                childData.SERVICEID = model.ServiceId;
                childData.INVESTNID = model.InvestigationId;

                childData.AMOUNT = model.Amount;

                childData.REMARKS = model.Remarks;


                childData.USERPC = strHostName;
                childData.INSIPNO = ipAddress.ToString();
                childData.INSTIME = Convert.ToDateTime(td);
                childData.INSUSERID = model.INSUSERID;
                childData.INSLTUDE = model.INSLTUDE;

                db.HmsPInvestinDbSet.Add(childData);

                db.SaveChanges();

                model.ID = childData.ID;
                model.COMPID = model.COMPID;
                model.PatientYear = model.PatientYear;
                model.PatientType = "INDOOR";
                model.PatientId = Patientid;
                model.PatientYearId = model.PatientYearId;
                model.TransactionDate = model.TransactionDate;
                model.TransSerial = childData.TRANSSL;
                model.Amount = model.Amount;
                model.ServiceId = model.ServiceId;
                model.ServiceName = model.ServiceName;
                model.InvestigationId = model.InvestigationId;
                model.InvestigationName = model.InvestigationName;

                model.Remarks = model.Remarks;


                model.USERPC = strHostName;
                model.INSIPNO = ipAddress.ToString();
                model.INSTIME = Convert.ToDateTime(td);
                model.INSUSERID = model.INSUSERID;
                model.INSLTUDE = model.INSLTUDE;

                //Insert_OpdLogData(model);






                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);
                //response.Headers.Location = new Uri(Url.Link("api/ApiFilterItemController", new { gid = model.FILTERGID }));

                return response;



            }
            else
            {

                var findPatientID =
                    (from n in db.HMS_IpdDbSet
                     where n.COMPID == model.COMPID && n.PATIENTYYID == model.PatientYearId
                     select n).ToList();
                string Patientid = "";
                foreach (var opdMaster in findPatientID)
                {
                    Patientid = opdMaster.PATIENTID;

                }
                Int64 findMaxTranssl = Convert.ToInt64((from n in db.HmsPInvestinDbSet
                                                        where n.COMPID == model.COMPID && n.PATIENTYYID == model.PatientYearId
                                                        select n.TRANSSL).Max());

                var find_ipdid =
                    (from n in db.HMS_TEST where n.COMPID == model.COMPID && n.TESTID == model.InvestigationId select n)
                        .ToList();
                Int64 billid = 0;
                foreach (var test in find_ipdid)
                {
                    billid = test.IPDID;
                }

                PInvestigation childData = new PInvestigation();

                childData.COMPID = model.COMPID;
                childData.PATIENTYY = model.PatientYear;
                childData.PATIENTTP = "INDOOR";
                childData.PATIENTID = Patientid;
                childData.PATIENTYYID = model.PatientYearId;
                childData.BILLID = billid;
                childData.TRANSDT = Convert.ToDateTime(model.TransactionDate);
                childData.TRANSSL = findMaxTranssl + 1;


                childData.SERVICEID = model.ServiceId;
                childData.INVESTNID = model.InvestigationId;
                childData.AMOUNT = model.Amount;

                childData.REMARKS = model.Remarks;


                childData.USERPC = strHostName;
                childData.INSIPNO = ipAddress.ToString();
                childData.INSTIME = Convert.ToDateTime(td);
                childData.INSUSERID = model.INSUSERID;
                childData.INSLTUDE = model.INSLTUDE;

                db.HmsPInvestinDbSet.Add(childData);

                db.SaveChanges();

                model.ID = childData.ID;
                model.COMPID = model.COMPID;
                model.PatientYear = model.PatientYear;
                model.PatientType = "INDOOR";
                model.PatientId = Patientid;
                model.PatientYearId = model.PatientYearId;
                model.TransactionDate = model.TransactionDate;
                model.TransSerial = childData.TRANSSL;
                model.Amount = model.Amount;
                model.ServiceId = model.ServiceId;
                model.ServiceName = model.ServiceName;
                model.InvestigationId = model.InvestigationId;
                model.InvestigationName = model.InvestigationName;

                model.Remarks = model.Remarks;


                model.USERPC = strHostName;
                model.INSIPNO = ipAddress.ToString();
                model.INSTIME = Convert.ToDateTime(td);
                model.INSUSERID = model.INSUSERID;
                model.INSLTUDE = model.INSLTUDE;

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                return response;
            }


        }

        [System.Web.Http.Route("api/ApiPatientInvestigation/SaveData")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage SaveData(PatientInvestigationDTO model)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
            DateTime tdate = Convert.ToDateTime(model.TransactionDate);
            var duplicate_data_test =
                    (from n in db.HmsPInvestinDbSet
                     where n.COMPID == model.COMPID && n.PATIENTYYID == model.PatientYearId
                          && n.TRANSSL == model.TransSerial
                     select n).ToList();
            Int64 id = 0;
            if (duplicate_data_test.Count > 0)
            {
                foreach (var x in duplicate_data_test)
                {
                    id = x.ID;
                }
                if (id == model.ID)
                {

                    var data_find = (from n in db.HmsPInvestinDbSet where n.ID == model.ID select n).ToList();
                    foreach (var item in data_find)
                    {

                        var find_ipdid =
                            (from n in db.HMS_TEST where n.COMPID == model.COMPID && n.TESTID == model.InvestigationId select n)
                                .ToList();
                        Int64 billid = 0;
                        foreach (var test in find_ipdid)
                        {
                            billid = test.IPDID;
                        }

                        item.ID = model.ID;
                        item.COMPID = model.COMPID;
                        item.PATIENTYYID = model.PatientYearId;
                        item.PATIENTYY = model.PatientYear;
                        item.PATIENTID = model.PatientId;
                        item.PATIENTTP ="INDOOR";
                        item.BILLID = billid;
                        item.TRANSSL = item.TRANSSL;
                        item.TRANSDT = tdate;
                        if (model.InvestigationId == null)
                        {
                            item.INVESTNID = item.INVESTNID;
                        }
                        else
                        {
                            item.INVESTNID = model.InvestigationId;
                        }
                        if (model.ServiceId == null)
                        {
                            item.SERVICEID = item.SERVICEID;
                        }
                        else
                        {
                            item.SERVICEID = model.ServiceId;
                        }
                      
                        item.AMOUNT = model.Amount;

                        item.REMARKS = model.Remarks;

                        item.USERPC = item.USERPC;
                        item.INSIPNO = item.INSIPNO;
                        item.INSLTUDE = item.INSLTUDE;
                        item.INSTIME = item.INSTIME;
                        item.INSUSERID = item.INSUSERID;


                        model.TransSerial = item.TRANSSL;
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
                    model.TransSerial = 0;
                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                    return response;
                }

            }

            return null;

        }

        [Route("api/apiPatineInvestigation/DeleteData")]
        [HttpPost]
        // DELETE api/<controller>/5
        public HttpResponseMessage DeleteData(PatientInvestigationDTO model)
        {

            System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AslHMSApiContext"].ToString());
            string query = string.Format("DELETE FROM HMS_PINVESTN WHERE ID='{0}'", model.ID);
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
            PInvestigation testObj = new PInvestigation();






            return Request.CreateResponse(HttpStatusCode.OK, testObj);
        }


    }
}
