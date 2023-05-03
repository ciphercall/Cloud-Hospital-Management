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
    public class ApiPatientOChargesController : ApiController
    {

        IFormatProvider dateformat = new System.Globalization.CultureInfo("fr-FR", true);
        TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
        public DateTime td;

        AslHMSApiContext db = new AslHMSApiContext();

        //Get Ip ADDRESS,Time & user PC Name
        public string strHostName;
        public IPHostEntry ipHostInfo;
        public IPAddress ipAddress;

        public ApiPatientOChargesController()
        {

            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];

            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
        }

        [System.Web.Http.Route("api/ApiPatientOCharges/GetData")]
        [System.Web.Http.HttpGet]
        public IEnumerable<PatientOChargesDTO> Get(string Compid, string Patientyearid, string InUserID, string InsLtude)
        {




            Int64 InsUserID = Convert.ToInt64(InUserID);
            Int64 compid = Convert.ToInt64(Compid);
            Int64 patinetyid = Convert.ToInt64(Patientyearid);



            var ache_kina_data = (from n in db.HmsPChargeDbSet where n.COMPID == compid && n.PATIENTYYID == patinetyid select n).ToList();
            if (ache_kina_data.Count == 0)
            {



                yield return new PatientOChargesDTO
                {

                    COMPID = compid,

                    PatientYearId = patinetyid,


                    TransSerial = 0

                };








            }
            else
            {
                var pOCharges_data = (from t1 in db.HmsPChargeDbSet
                                           join t2 in db.HMS_HEADIO on t1.CHARGEID equals t2.HEADID
                                           //join t3 in db.HMS_REFER on t1.SERVICEID equals t3.REFERID
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
                                               chargename = t2.HEADNM,
                                               chargeid = t1.CHARGEID,
                                          
                                               amount = t1.AMOUNT,


                                               remarks = t1.REMARKS


                                           });

                foreach (var item in pOCharges_data)
                {
                    DateTime abcd = Convert.ToDateTime(item.transdt);
                    string conv_tdt = abcd.ToString("dd-MMM-yyyy");



                    yield return new PatientOChargesDTO
                    {
                        ID = item.Id,
                        COMPID = item.compid,
                        PatientYear = item.patintyear,
                        PatientId = item.Patientid,
                        PatientYearId = item.Patientyid,
                        TransactionDate = conv_tdt,
                        TransSerial = item.transsl,
                        ChargeId = item.chargeid,
                        ChargeName = item.chargename,
                        Amount = item.amount,
                       
                    
                        Remarks = item.remarks


                    };
                }





            }


        }


        [System.Web.Http.Route("api/apiPatientOCharges/ChargeName")]
        [System.Web.Http.HttpGet]
        public IEnumerable<PatientOChargesDTO> GetChargeName(string query, string query2)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(query2);
                //string matchipd = Convert.ToString(compid) + "1";
                return String.IsNullOrEmpty(query) ? db.HMS_HEADIO.AsEnumerable().Select(b => new PatientOChargesDTO { }).ToList() :
                db.HMS_HEADIO.Where(p => p.HEADNM.StartsWith(query) && p.COMPID == compid).Select(
                          x =>
                          new
                          {
                             
                              headname = x.HEADNM,
                              headid = x.HEADID


                          })
                .AsEnumerable().Select(a => new PatientOChargesDTO
                {
             
                    ChargeId = a.headid,
                    ChargeName = a.headname

                }).ToList();
            }
        }

        [System.Web.Http.Route("apiPOCharges/DynamicChargeName")]
        [System.Web.Http.HttpGet]
        public IEnumerable<PatientOChargesDTO> Dynamicautocomplete(string changedText, string changedText2)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(changedText2);

                String name = "";

                var rt = db.HMS_HEADIO.Where(n => n.HEADNM.StartsWith(changedText) && n.COMPID == compid).Select(n => new
                {
                    headname = n.HEADNM
                   

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



                var findid = (from n in db.HMS_HEADIO where n.HEADNM == name && n.COMPID == compid select n).ToList();
                if (findid.Count != 0)
                {
                    return db.HMS_HEADIO.Where(p => p.HEADNM == name && p.COMPID == compid).Select(
                        x =>
                            new
                            {
                                headname = x.HEADNM,
                                headid = x.HEADID,



                            })
                        .AsEnumerable().Select(a => new PatientOChargesDTO
                        {

                            ChargeId = a.headid,
                            ChargeName = a.headname



                        }).ToList();
                }
                else
                {
                    return db.HMS_HEADIO.AsEnumerable().Select(a => new PatientOChargesDTO
                    {
                        ChargeName = name,
                        ChargeId = 0

                    }).ToList();
                }



            }

        }


        [System.Web.Http.Route("apiPatientOCharges/grid/Child")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage AddChildData(PatientOChargesDTO model)
        {
            //DateTime efdt = Convert.ToDateTime(model.EFDT);

            var check_data = (from n in db.HmsPChargeDbSet
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

                PCharges childData = new PCharges();

                childData.COMPID = model.COMPID;
                childData.PATIENTYY = model.PatientYear;
                childData.PATIENTTP = "INDOOR";
                childData.PATIENTID = Patientid;
                childData.PATIENTYYID = model.PatientYearId;
                childData.TRANSDT = Convert.ToDateTime(model.TransactionDate);
                childData.TRANSSL = Convert.ToInt64(Convert.ToString(model.PatientYearId) + "01");

                childData.CHARGEID = model.ChargeId;
                //childData.INVESTNID = model.InvestigationId;

                childData.AMOUNT = model.Amount;

                childData.REMARKS = model.Remarks;


                childData.USERPC = strHostName;
                childData.INSIPNO = ipAddress.ToString();
                childData.INSTIME = Convert.ToDateTime(td);
                childData.INSUSERID = model.INSUSERID;
                childData.INSLTUDE = model.INSLTUDE;

                db.HmsPChargeDbSet.Add(childData);

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
                model.ChargeId = model.ChargeId;
                model.ChargeName = model.ChargeName;
              

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
                Int64 findMaxTranssl = Convert.ToInt64((from n in db.HmsPChargeDbSet
                                                        where n.COMPID == model.COMPID && n.PATIENTYYID == model.PatientYearId
                                                        select n.TRANSSL).Max());

                PCharges childData = new PCharges();

                childData.COMPID = model.COMPID;
                childData.PATIENTYY = model.PatientYear;
                childData.PATIENTTP = "INDOOR";
                childData.PATIENTID = Patientid;
                childData.PATIENTYYID = model.PatientYearId;
                childData.TRANSDT = Convert.ToDateTime(model.TransactionDate);
                childData.TRANSSL = findMaxTranssl + 1;

                childData.CHARGEID = model.ChargeId;
               
                childData.AMOUNT = model.Amount;

                childData.REMARKS = model.Remarks;


                childData.USERPC = strHostName;
                childData.INSIPNO = ipAddress.ToString();
                childData.INSTIME = Convert.ToDateTime(td);
                childData.INSUSERID = model.INSUSERID;
                childData.INSLTUDE = model.INSLTUDE;

                db.HmsPChargeDbSet.Add(childData);

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
                model.ChargeId = model.ChargeId;
                model.ChargeName = model.ChargeName;
              

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

        [System.Web.Http.Route("api/ApiPatientOCharge/SaveData")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage SaveData(PatientOChargesDTO model)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
            DateTime tdate = Convert.ToDateTime(model.TransactionDate);
            var duplicate_data_test =
                    (from n in db.HmsPChargeDbSet
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

                    var data_find = (from n in db.HmsPChargeDbSet where n.ID == model.ID select n).ToList();
                    foreach (var item in data_find)
                    {
                        item.ID = model.ID;
                        item.COMPID = model.COMPID;
                        item.PATIENTYYID = model.PatientYearId;
                        item.PATIENTYY = model.PatientYear;
                        item.PATIENTID = model.PatientId;
                        item.PATIENTTP = "INDOOR";
                        item.TRANSSL = item.TRANSSL;
                        item.TRANSDT = tdate;
                        if (model.ChargeId == null)
                        {
                            item.CHARGEID = item.CHARGEID;
                        }
                        else
                        {
                            item.CHARGEID = model.ChargeId;
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

        [Route("api/apiPatineOCharges/DeleteData")]
        [HttpPost]
        // DELETE api/<controller>/5
        public HttpResponseMessage DeleteData(PatientOChargesDTO model)
        {

            System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AslHMSApiContext"].ToString());
            string query = string.Format("DELETE FROM HMS_PCHGOTC WHERE ID='{0}'", model.ID);
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
            PCharges testObj = new PCharges();






            return Request.CreateResponse(HttpStatusCode.OK, testObj);
        }


    }
}
