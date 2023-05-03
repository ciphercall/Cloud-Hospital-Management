using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using AslHMS.Models.DTO;
using AslHMS.Models;
using AslHMS.Models.HMS;

namespace AslHMS.Controllers.Api
{
    public class ApiPatientConsultController : ApiController
    {
        
        IFormatProvider dateformat = new System.Globalization.CultureInfo("fr-FR", true);
        TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
        public DateTime td;

        AslHMSApiContext db = new AslHMSApiContext();

        //Get Ip ADDRESS,Time & user PC Name
        public string strHostName;
        public IPHostEntry ipHostInfo;
        public IPAddress ipAddress;

        public ApiPatientConsultController()
        {
           
            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];
          
            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
        }

        [System.Web.Http.Route("api/ApiPatientConsult/GetData")]
        [System.Web.Http.HttpGet]
        public IEnumerable<PatientConsultDTO> Get(string Compid, string Patientyearid, string InUserID, string InsLtude)
        {

            //Get Ip ADDRESS,Time & user PC Name


            Int64 InsUserID = Convert.ToInt64(InUserID);
            Int64 compid = Convert.ToInt64(Compid);
            Int64 patinetyid = Convert.ToInt64(Patientyearid);

        

            var ache_kina_data = (from n in db.HmsPConsultants where n.COMPID == compid && n.PATIENTYYID == patinetyid select n).ToList();
            if (ache_kina_data.Count == 0)
            {

              

                yield return new PatientConsultDTO
                {

                    COMPID = compid,

                    PatientYearId = patinetyid,
              

                    TransSerial = 0

                };








            }
            else
            {
                var pConsult_data = (from t1 in db.HmsPConsultants
                                join t2 in db.HMS_REFER on t1.DOCTORID equals t2.REFERID

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
                                    doctorname = t2.REFERNM,
                                    doctorid = t1.DOCTORID,
                                    amount = t1.AMOUNT,
                                   

                                    remarks = t1.REMARKS


                                });

                foreach (var item in pConsult_data)
                {
                    DateTime abcd = Convert.ToDateTime(item.transdt);
                    string conv_tdt = abcd.ToString("dd-MMM-yyyy");

                    //DateTime abcd2 = Convert.ToDateTime(item.etdt);
                    //string conv_etdt = abcd2.ToString("dd-MMM-yyyy");

                    yield return new PatientConsultDTO
                    {
                        ID = item.Id,
                        COMPID = item.compid,
                        PatientYear = item.patintyear,
                        PatientId = item.Patientid,
                        PatientYearId = item.Patientyid,
                        TransactionDate = conv_tdt,
                      TransSerial = item.transsl,
                      DoctorId = item.doctorid,
                      DoctorName = item.doctorname,
                      Amount = item.amount,
                        Remarks = item.remarks


                    };
                }





            }


        }

        [System.Web.Http.Route("apiPatinetConsult/DoctorName")]
        [System.Web.Http.HttpGet]
        public IEnumerable<PatientConsultDTO> GetDoctorName(string query, string query2)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(query2);
                return String.IsNullOrEmpty(query) ? db.HMS_REFER.AsEnumerable().Select(b => new PatientConsultDTO { }).ToList() :
                db.HMS_REFER.Where(p => p.REFERNM.StartsWith(query) && p.COMPID == compid).Select(
                          x =>
                          new
                          {
                              refername = x.REFERNM,
                              referid = x.REFERID,

                            
                          })
                .AsEnumerable().Select(a => new PatientConsultDTO
                {
                    DoctorId = a.referid,
                    DoctorName = a.refername

                }).ToList();
            }
        }

        [System.Web.Http.Route("apiPatientConsult/DynamicDoctor")]
        [System.Web.Http.HttpGet]
        public IEnumerable<PatientConsultDTO> Dynamicautocomplete(string changedText, string changedText2)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(changedText2);

                String name = "";

                var rt = db.HMS_REFER.Where(n => n.REFERNM.StartsWith(changedText) && n.COMPID == compid).Select(n => new
                {
                    headname = n.REFERNM

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



                var findid = (from n in db.HMS_REFER where n.REFERNM == name && n.COMPID == compid select n).ToList();
                if (findid.Count != 0)
                {
                    return db.HMS_REFER.Where(p => p.REFERNM == name && p.COMPID == compid).Select(
                        x =>
                            new
                            {
                                refername = x.REFERNM,
                                referid = x.REFERID,

                              

                            })
                        .AsEnumerable().Select(a => new PatientConsultDTO
                        {

                         DoctorId = a.referid,
                            DoctorName = a.refername

                        

                        }).ToList();
                }
                else
                {
                    return db.HMS_REFER.AsEnumerable().Select(a => new PatientConsultDTO
                    {
                        DoctorName = name,
                        DoctorId = 0

                    }).ToList();
                }



            }

        }


        [System.Web.Http.Route("apiPatientConsult/grid/ConChild")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage AddChildData(PatientConsultDTO model)
        {
            //DateTime efdt = Convert.ToDateTime(model.EFDT);

            var check_data = (from n in db.HmsPConsultants
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

                PConsultant childData = new PConsultant();

                childData.COMPID = model.COMPID;
                childData.PATIENTYY = model.PatientYear;
                childData.PATIENTTP = model.PatientType;
                childData.PATIENTID = Patientid;
                childData.PATIENTYYID = model.PatientYearId;
                childData.BILLID = Convert.ToInt64(Convert.ToString(childData.COMPID) + "104");
                childData.TRANSDT = Convert.ToDateTime(model.TransactionDate);
                childData.TRANSSL = Convert.ToInt64(Convert.ToString(model.PatientYearId)+"01");
                childData.DOCTORID = model.DoctorId;
                childData.AMOUNT = model.Amount;
               
                childData.REMARKS = model.Remarks;


                childData.USERPC = strHostName;
                childData.INSIPNO = ipAddress.ToString();
                childData.INSTIME = Convert.ToDateTime(td);
                childData.INSUSERID = model.INSUSERID;
                childData.INSLTUDE = model.INSLTUDE;

                db.HmsPConsultants.Add(childData);

                db.SaveChanges();

                model.ID = childData.ID;
                model.COMPID = model.COMPID;
                model.PatientYear = model.PatientYear;
                model.PatientType = model.PatientType;
                model.PatientId = Patientid;
                model.PatientYearId = model.PatientYearId;
                model.TransactionDate = model.TransactionDate;
                model.TransSerial = childData.TRANSSL;
                model.Amount = model.Amount;
                model.DoctorId = model.DoctorId;
                model.DoctorName = model.DoctorName;
               
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
                Int64 findMaxTranssl = Convert.ToInt64((from n in db.HmsPConsultants where n.COMPID==model.COMPID && n.PATIENTYYID==model.PatientYearId
                                                           select n.TRANSSL).Max());

                PConsultant childData = new PConsultant();

                childData.COMPID = model.COMPID;
                childData.PATIENTYY = model.PatientYear;
                childData.PATIENTTP = model.PatientType;
                childData.PATIENTID = Patientid;
                childData.PATIENTYYID = model.PatientYearId;
                childData.BILLID = Convert.ToInt64(Convert.ToString(childData.COMPID) + "104");
                childData.TRANSDT = Convert.ToDateTime(model.TransactionDate);
                childData.TRANSSL = findMaxTranssl+1;
                childData.DOCTORID = model.DoctorId;
                childData.AMOUNT = model.Amount;

                childData.REMARKS = model.Remarks;


                childData.USERPC = strHostName;
                childData.INSIPNO = ipAddress.ToString();
                childData.INSTIME = Convert.ToDateTime(td);
                childData.INSUSERID = model.INSUSERID;
                childData.INSLTUDE = model.INSLTUDE;

                db.HmsPConsultants.Add(childData);

                db.SaveChanges();

                model.ID = childData.ID;
                model.COMPID = model.COMPID;
                model.PatientYear = model.PatientYear;
                model.PatientType = model.PatientType;
                model.PatientId = Patientid;
                model.PatientYearId = model.PatientYearId;
                model.TransactionDate = model.TransactionDate;
                model.TransSerial = childData.TRANSSL;
                model.Amount = model.Amount;
                model.DoctorId = model.DoctorId;
                model.DoctorName = model.DoctorName;

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

        [Route("api/apiPatineConsult/DeleteData")]
        [HttpPost]
        // DELETE api/<controller>/5
        public HttpResponseMessage DeleteData(PatientConsultDTO model)
        {

            System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AslHMSApiContext"].ToString());
            string query = string.Format("DELETE FROM HMS_PCONSULT WHERE ID='{0}'", model.ID);
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
            PConsultant testObj = new PConsultant();






            return Request.CreateResponse(HttpStatusCode.OK, testObj);
        }



        [System.Web.Http.Route("api/apiPatinetConsult/PatientYID")]
        [System.Web.Http.HttpGet]
        public IEnumerable<string> GetPatinetYearID(string query, string query2,Int64 Year)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(query2);
                List<string> result = new List<string>();
                var tags = from p in db.HMS_IpdDbSet
                           where p.COMPID == compid
                           select new { p.PATIENTYYID };
                string date = Convert.ToString(Year);

                string currentyear = date.Substring(2, 2);
                foreach (var tag in tags)
                {
                    if ((tag.PATIENTYYID.ToString().StartsWith(query) == true) && (tag.PATIENTYYID.ToString().StartsWith(currentyear) == true))
                    {
                        result.Add(tag.PATIENTYYID.ToString());
                    }

                }
                IEnumerable<string> en = result;


                return en;



            }
        }

        [System.Web.Http.Route("api/apiPatinetConsult/DynamicPatinetYearId")]
        [System.Web.Http.HttpGet]
        public IEnumerable<string> DynamicPatientYid(string changedText, string changedText2,Int64 year)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(changedText2);
                Int64 yearID = Convert.ToInt64(changedText);
                String name = "";



                List<string> rt = new List<string>();

                var tags = from p in db.HMS_IpdDbSet
                           where p.COMPID == compid
                           select new { p.PATIENTYYID };
                string date = Convert.ToString(year);

                string currentyear = date.Substring(2, 2);
                //string currentyear = Convert.ToString(td).Substring(8, 2);
                foreach (var tag in tags)
                {
                    if ((tag.PATIENTYYID.ToString().StartsWith(changedText) == true) && (tag.PATIENTYYID.ToString().StartsWith(currentyear) == true))
                    {
                        rt.Add(tag.PATIENTYYID.ToString());
                    }

                }




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
                            string ss = Convert.ToString(n);
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
                                k = 0;
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

                    else if (lenChangedtxt > 1)
                    {
                        name = changedText.Substring(0, lenChangedtxt - 1);
                    }




                }
                else
                {
                    name = changedText;
                }


                Int64 finddata =
                    (from n in db.HMS_IpdDbSet where n.COMPID == compid && n.PATIENTYYID == yearID select n).ToList()
                        .Count();

                List<string> result = new List<string>();
                if (finddata == 1)
                {
                    name = Convert.ToString(yearID);
                }
                else
                {

                }
                result.Add(name);
                IEnumerable<string> en = result;
                return en;


            }

        }

        [System.Web.Http.Route("api/ApiPatientConsult/SaveData")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage SaveData(PatientConsultDTO model)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
            DateTime tdate = Convert.ToDateTime(model.TransactionDate);
            var duplicate_data_test =
                    (from n in db.HmsPConsultants
                     where n.COMPID == model.COMPID && n.PATIENTYYID == model.PatientYearId
                          && n.TRANSSL==model.TransSerial
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

                    var data_find = (from n in db.HmsPConsultants where n.ID == model.ID select n).ToList();
                    foreach (var item in data_find)
                    {
                        item.ID = model.ID;
                        item.COMPID = model.COMPID;
                        item.PATIENTYYID = model.PatientYearId;
                        item.PATIENTYY = model.PatientYear;
                        item.PATIENTID = model.PatientId;
                        item.BILLID = item.BILLID;
                        item.PATIENTTP = model.PatientType;
                        item.TRANSSL = item.TRANSSL;
                        item.TRANSDT = tdate;
                        item.DOCTORID = model.DoctorId;
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


    }
}
