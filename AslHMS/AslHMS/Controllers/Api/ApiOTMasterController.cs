using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mime;
using System.Web.Http;
using System.Web.WebPages.Html;
using AslHMS.Models;
using AslHMS.Models.DTO;
using AslHMS.Models.HMS;

namespace AslHMS.Controllers.Api
{
    public class ApiOTMasterController : ApiController
    {

        IFormatProvider dateformat = new System.Globalization.CultureInfo("fr-FR", true);
        TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
        public DateTime td;

        AslHMSApiContext db = new AslHMSApiContext();

        //Get Ip ADDRESS,Time & user PC Name
        public string strHostName;
        public IPHostEntry ipHostInfo;
        public IPAddress ipAddress;

        public ApiOTMasterController()
        {

            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];
            //td = DateTime.Now;
            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
        }

        [System.Web.Http.Route("api/apiOTMaster/PatientYID")]
        [System.Web.Http.HttpGet]
        public IEnumerable<string> GetPatinetYearID(string query, string query2, Int64 Year, string Type)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(query2);
                List<string> result = new List<string>();
                if (Type == "INDOOR")
                {
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
                }
                else if (Type == "OUTDOOR")
                {
                    var tags = from p in db.HMS_OPDMST
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
                }

                IEnumerable<string> en = result;


                return en;



            }
        }

        [System.Web.Http.Route("api/apiOTMaster/DynamicPatinetYearId")]
        [System.Web.Http.HttpGet]
        public IEnumerable<string> DynamicPatientYid(string changedText, string changedText2, Int64 year, string type)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(changedText2);
                Int64 yearID = Convert.ToInt64(changedText);
                String name = "";



                List<string> rt = new List<string>();
                if (type == "INDOOR")
                {
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
                }
                else if (type == "OUTDOOR")
                {
                    var tags = from p in db.HMS_OPDMST
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

                Int64 finddata = 0;
                if (type == "INDOOR")
                {
                    finddata =
                  (from n in db.HMS_IpdDbSet where n.COMPID == compid && n.PATIENTYYID == yearID select n).ToList()
                      .Count();
                }
                else if (type == "OUTDOOR")
                {
                    finddata =
                  (from n in db.HMS_OPDMST where n.COMPID == compid && n.PATIENTYYID == yearID select n).ToList()
                      .Count();
                }


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

        [System.Web.Http.Route("api/OTMaster/PatientName")]
        [System.Web.Http.HttpGet]
        public List<string> patientname(string changedText, string changedText2, string type)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(changedText2);
                Int64 patientyearid = Convert.ToInt64(changedText);
                if (type == "INDOOR")
                {
                    var findpatientname =
                   (from n in db.HMS_IpdDbSet where n.COMPID == compid && n.PATIENTYYID == patientyearid select n).ToList();
                    string patientname = "";
                    foreach (var opdMaster in findpatientname)
                    {
                        patientname = opdMaster.PATIENTNM;
                    }
                    List<string> pp = new List<string>();
                    pp.Add(patientname);
                    return pp;
                }
                else if (type == "OUTDOOR")
                {
                    var findpatientname =
                   (from n in db.HMS_OPDMST where n.COMPID == compid && n.PATIENTYYID == patientyearid select n).ToList();
                    string patientname = "";
                    foreach (var opdMaster in findpatientname)
                    {
                        patientname = opdMaster.PATIENTNM;
                    }
                    List<string> pp = new List<string>();
                    pp.Add(patientname);
                    return pp;
                }
                else
                {
                    return null;
                }

            }

        }



        [System.Web.Http.Route("api/apiOTMaster/OpHeadName")]
        [System.Web.Http.HttpGet]
        public List<SelectListItem> GetOpHeadName(string query, string query2)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(query2);
                List<SelectListItem> result = new List<SelectListItem>();

                var tags = from p in db.HMS_OPHEAD
                           where p.COMPID == compid
                           select new { p.OPHID, p.OPHNM };



                foreach (var tag in tags)
                {
                    if (tag.OPHNM.ToString().StartsWith(query) == true)
                    {
                        result.Add(new SelectListItem { Text = tag.OPHNM, Value = tag.OPHID.ToString() });
                    }

                }


                return result;



            }
        }

        [System.Web.Http.Route("api/OTMaster/DynamicOpHeadName")]
        [System.Web.Http.HttpGet]
        public List<SelectListItem> DynamicOpHeadName(string changedText, string changedText2)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(changedText2);

                String name = "";



                List<string> rt = new List<string>();

                var tags = from p in db.HMS_OPHEAD
                           where p.COMPID == compid
                           select new { p.OPHID, p.OPHNM };



                foreach (var tag in tags)
                {
                    if (tag.OPHNM.ToString().StartsWith(changedText) == true)
                    {
                        rt.Add(tag.OPHNM.ToString());
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


                var finddata =
                    (from n in db.HMS_OPHEAD where n.COMPID == compid && n.OPHNM == name select n).ToList();


                List<SelectListItem> result = new List<SelectListItem>();
                if (finddata.Count > 0)
                {
                    foreach (var VARIABLE in finddata)
                    {
                        result.Add(new SelectListItem { Text = name, Value = Convert.ToString(VARIABLE.OPHID) });
                    }
                }
                else
                {
                    result.Add(new SelectListItem { Text = name, Value = "0" });
                }



                return result;


            }

        }


        [System.Web.Http.Route("api/ApiOTMaster/GetData")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OTMasterDTO> Get(string Compid, string Transdt, Int64 TransYear, Int64 TransNo, string PatientType, Int64 patientyear,
            string patientyearId, Int64 opheadid, string timefrom, string timeto, string remarks, string InUserID, string InsLtude)
        {

            //Get Ip ADDRESS,Time & user PC Name


            Int64 InsUserID = Convert.ToInt64(InUserID);
            Int64 compid = Convert.ToInt64(Compid);
            Int64 patinetyid = Convert.ToInt64(patientyearId);



            var ache_kina_data = (from n in db.HmsOTMaster where n.COMPID == compid && n.TRANSNO == TransNo select n).ToList();
            if (ache_kina_data.Count == 0)
            {
                string patientid = "";
                if (PatientType == "INDOOR")
                {
                   var searchPaitenid = 
                       (from n in db.HMS_IpdDbSet
                        where n.COMPID == compid && n.PATIENTYYID == patinetyid
                        select  n).ToList();
                    foreach (var VARIABLE in searchPaitenid)
                    {
                        patientid = VARIABLE.PATIENTID;
                    }

                }
                else if (PatientType == "OUTDOOR")
                {
                    var searchPaitenid =
                      (from n in db.HMS_OPDMST
                       where n.COMPID == compid && n.PATIENTYYID == patinetyid
                       select n).ToList();
                    foreach (var VARIABLE in searchPaitenid)
                    {
                        patientid = VARIABLE.PATIENTID;
                    }
                }
                OTMaster obj = new OTMaster
                {
                    COMPID = compid,
                    TRANSDT = Convert.ToDateTime(Transdt),
                    TRANSYY = TransYear,
                    TRANSNO = TransNo,
                    PATIENTTP = PatientType,
                    PATIENTYY = patientyear,
                    PATIENTYYID = patinetyid,
                    PATIENTID = patientid,
                    OPHID = opheadid,
                    OPTMFR = timefrom,
                    OPTMTO = timeto,
                    REMARKS = remarks,

                    USERPC = strHostName,
                    INSIPNO = ipAddress.ToString(),

                    INSTIME = Convert.ToDateTime(td),

                    INSUSERID = InsUserID,
                    INSLTUDE = InsLtude
                };

                db.HmsOTMaster.Add(obj);
                db.SaveChanges();

                yield return new OTMasterDTO
                {

                    OPHID = opheadid




                };








            }
            else
            {
                var OT_data = (from t1 in db.HmsOTDbSet
                                     join t2 in db.HMS_REFER on t1.OTPID  equals t2.REFERID

                               where t1.COMPID == compid && t1.TRANSNO == TransNo
                                     select new
                                     {
                                         Id = t1.ID,

                                         compid = t1.COMPID,
                                         transdt=t1.TRANSDT,
                                         transno=t1.TRANSNO,
                                         patintyear = t1.PATIENTYY,
                                         Patientid = t1.PATIENTID,
                                         Patientyid = t1.PATIENTYYID,
                                       patienttype=t1.PATIENTTP,
                                       ophid=t1.OPHID,
                                       otptype=t1.OTPTP,
                                       otpid=t1.OTPID,
                                       otpname=t2.REFERNM,
                                       
                                         amount = t1.OTPAMT,


                                         remarks = t1.REMARKS


                                     });

                foreach (var item in OT_data)
                {
                    //DateTime abcd = Convert.ToDateTime(item.transdt);
                    //string conv_tdt = abcd.ToString("dd-MMM-yyyy");

                  
                    yield return new OTMasterDTO
                    {
                        ID = item.Id,
                        COMPID = item.compid,
                        PatientYear = item.patintyear,
                        PatientId = item.Patientid,
                        PatientyearId = item.Patientyid,
                        PatientType = item.patienttype,
                       OPHID = item.ophid,
                       OTPID = item.otpid,
                       OTPName = item.otpname,
                       OTPTP = item.otptype,
                      
                      

                        OTPAMT = item.amount,
                        REMARKS = item.remarks


                    };
                }





            }


        }



        [System.Web.Http.Route("api/grid/OTChild")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage AddChildData(OTMasterDTO model)
        {

            DateTime transddt = Convert.ToDateTime(model.TransactionDate);
            var check_data = (from n in db.HmsOTDbSet
                              where n.COMPID == model.COMPID && n.TRANSDT ==transddt && n.TRANSNO==model.TransNo
                                  && n.PATIENTTP == model.PatientType && n.PATIENTYYID==model.PatientyearId
                                  && n.OPHID == model.OPHID && n.OTPTP == model.OTPTP && (n.OTPID==model.OTPID && model.OTPID!=0 && model.OTPID!=null) && n.OTPAMT==model.OTPAMT
                              select n).ToList();

            var find_patientid = (from n in db.HmsOTMaster
                where n.COMPID == model.COMPID && n.TRANSDT == transddt && n.TRANSNO == model.TransNo
                      && n.PATIENTTP == model.PatientType && n.PATIENTYYID == model.PatientyearId
                      && n.OPHID == model.OPHID
                select n).ToList();
            string patientid = "";
            foreach (var otMaster in find_patientid)
            {
                patientid = otMaster.PATIENTID;
            }

            if (check_data.Count == 0)
            {
               

                  OT childData = new OT();

                    childData.COMPID = model.COMPID;
                    childData.TRANSDT = transddt;

                    childData.TRANSYY = model.TransYear;
                    childData.TRANSNO = model.TransNo;
                    childData.PATIENTTP = model.PatientType;
                    childData.PATIENTYY = model.PatientYear;


                    childData.PATIENTYYID = model.PatientyearId;
                    childData.PATIENTID =patientid;
                if (childData.OTPTP == "SURGEON")
                {
                    childData.BILLID = Convert.ToInt64(Convert.ToString(childData.COMPID) + "105");
                }
                else if (childData.OTPTP == "ANESTHESIOLOGIST")
                {
                    childData.BILLID = Convert.ToInt64(Convert.ToString(childData.COMPID) + "106");
                }
                else if (childData.OTPTP == "ASSISTANT")
                {
                    childData.BILLID = Convert.ToInt64(Convert.ToString(childData.COMPID) + "107");
                }
                else if (childData.OTPTP == "OTCHARGE")
                {
                    childData.BILLID = Convert.ToInt64(Convert.ToString(childData.COMPID) + "108");
                }

                    childData.OPHID = model.OPHID;
                    childData.OTPTP = model.OTPTP;

                    childData.OTPID = model.OTPID;
                    childData.OTPAMT = model.OTPAMT;
                    childData.REMARKS = model.REMARKS;
                  



                    childData.USERPC = strHostName;
                    childData.INSIPNO = ipAddress.ToString();
                    childData.INSTIME = Convert.ToDateTime(td);
                    childData.INSUSERID = model.INSUSERID;
                    childData.INSLTUDE = model.INSLTUDE;

                    db.HmsOTDbSet.Add(childData);

                    db.SaveChanges();

                    model.ID = childData.ID;
                    model.COMPID = model.COMPID;
                 



                    //Insert_OpdLogData(model);






                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                    return response;
              
           

            }
            else
            {
                model.OTPID = 0;
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                return response;
            }


        }

        [System.Web.Http.Route("apiOTMaster/SaveData")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage SaveData(OTMasterDTO model)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

            var duplicate_data_test =
                    (from n in db.HmsOTDbSet where n.COMPID == model.COMPID && n.TRANSNO == model.TransNo && n.OTPTP==model.OTPTP && n.OTPID==model.OTPID select n).ToList();
            Int64 id = 0;
            if (duplicate_data_test.Count > 0)
            {
                foreach (var x in duplicate_data_test)
                {
                    id = x.ID;
                }
                if (id == model.ID)
                {

                    var data_find = (from n in db.HmsOTDbSet where n.ID == model.ID select n).ToList();
                    foreach (var item in data_find)
                    {
                        item.COMPID = item.COMPID;
                        item.TRANSDT = item.TRANSDT;

                        item.TRANSYY = item.TRANSYY;
                        item.TRANSNO = item.TRANSNO;
                        item.PATIENTTP = item.PATIENTTP;
                        item.PATIENTYY = item.PATIENTYY;


                        item.PATIENTYYID = item.PATIENTYYID;
                        item.PATIENTID = item.PATIENTID;
                        if (model.OTPTP == "SURGEON")
                        {
                            item.BILLID = Convert.ToInt64(Convert.ToString(item.COMPID) + "105");
                        }
                        else if (model.OTPTP == "ANESTHESIOLOGIST")
                        {
                            item.BILLID = Convert.ToInt64(Convert.ToString(item.COMPID) + "106");
                        }
                        else if (model.OTPTP == "ASSISTANT")
                        {
                            item.BILLID = Convert.ToInt64(Convert.ToString(item.COMPID) + "107");
                        }
                        else if (model.OTPTP == "OTCHARGE")
                        {
                            item.BILLID = Convert.ToInt64(Convert.ToString(item.COMPID) + "108");
                        }

                        item.OPHID = item.OPHID;
                        item.OTPTP = model.OTPTP;

                        item.OTPID = model.OTPID;
                        item.OTPAMT = model.OTPAMT;
                        item.REMARKS = model.REMARKS;




                        item.USERPC = strHostName;
                        item.INSIPNO = ipAddress.ToString();
                        item.INSTIME = Convert.ToDateTime(td);
                        item.INSUSERID = item.INSUSERID;
                        item.INSLTUDE = item.INSLTUDE;

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
                    model.OTPID = 0;
                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                    return response;
                }

            }

            return null;

        }


        [System.Web.Http.Route("apiOTMaster/DeleteData")]
        [System.Web.Http.HttpPost]
        // DELETE api/<controller>/5
        public HttpResponseMessage DeleteData(OTMasterDTO model)
        {

            System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AslHMSApiContext"].ToString());
            string query = string.Format("DELETE FROM HMS_OT WHERE ID='{0}'", model.ID);
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
            OT testObj = new OT();






            return Request.CreateResponse(HttpStatusCode.OK, testObj);
        }

        //Update part....................
        [System.Web.Http.Route("api/apiOTMaster/SerialNo")]
        [System.Web.Http.HttpGet]
        public IEnumerable<string> GetSerialNo(string query, Int64 Compid, Int64 Year, DateTime Date)
        {
            using (var db = new AslHMSApiContext())
            {
              
                List<string> result = new List<string>();
               
                    var tags = from p in db.HmsOTMaster
                               where p.COMPID == Compid && p.TRANSDT==Date && p.TRANSYY==Year
                               select new { p.TRANSNO };
                   
                    foreach (var tag in tags)
                    {
                        if (tag.TRANSNO.ToString().StartsWith(query) == true)
                        {
                            result.Add(tag.TRANSNO.ToString());
                        }

                    }
              
                   

                IEnumerable<string> en = result;


                return en;



            }
            
        }

        [System.Web.Http.Route("api/OTMaster/DynamicSerial")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OTMasterDTO> DynamicTransNo(string changedText, string changedText2,string changedText3,string changedText4)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(changedText2);
                DateTime date = Convert.ToDateTime(changedText3);
                Int64 year = Convert.ToInt64(changedText4);

                String name = "";



                List<string> rt = new List<string>();

                var tags = from p in db.HmsOTMaster
                           where p.COMPID == compid && p.TRANSDT==date && p.TRANSYY==year
                           select new { p.TRANSNO };



                foreach (var tag in tags)
                {
                    if (tag.TRANSNO.ToString().StartsWith(changedText) == true)
                    {
                        rt.Add(tag.TRANSNO.ToString());
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

                Int64 transno = Convert.ToInt64(name);
                var finddata =
                    (from n in db.HmsOTMaster where n.COMPID == compid && n.TRANSNO == transno select n).ToList();
                if (finddata.Count > 0)
                {
                    foreach (var item in finddata)
                    {
                        string patinetname = "",ophead="";
                        if (item.PATIENTTP == "INDOOR")
                        {
                            var patinetname_find =
                                (from n in db.HMS_IpdDbSet
                                    where n.COMPID == item.COMPID && n.PATIENTID == item.PATIENTID
                                    select n).ToList();
                            foreach (var x in patinetname_find)
                            {
                                patinetname = x.PATIENTNM;
                            }
                            

                        }
                        else if (item.PATIENTTP == "OUTDOOR")
                        {
                            var patinetname_find =
                                 (from n in db.HMS_OPDMST
                                  where n.COMPID == item.COMPID && n.PATIENTID == item.PATIENTID
                                  select n).ToList();
                            foreach (var x in patinetname_find)
                            {
                                patinetname = x.PATIENTNM;
                            }
                        }
                        var opheadname_find =
                                (from n in db.HMS_OPHEAD where n.COMPID == item.COMPID && n.OPHID == item.OPHID select n)
                                    .ToList();
                        foreach (var y in opheadname_find)
                        {
                            ophead = y.OPHNM;
                        }
                        yield return new OTMasterDTO
                        {
                            ID = item.ID,
                            COMPID = item.COMPID,
                            TransNo = transno,
                            PatientYear = item.PATIENTYY,
                            PatientId = item.PATIENTID,
                            PatientyearId = item.PATIENTYYID,
                            PatientType = item.PATIENTTP,
                            PatientName = patinetname,
                            OpHeadName = ophead,
                            OPHID = item.OPHID,
                            OPTMTO = item.OPTMTO,
                            OPTMFR = item.OPTMFR,
                            REMARKS = item.REMARKS

                        };
                    }
                }
                else
                {
                    yield return new OTMasterDTO
                    {
                     
                        TransNo = transno,
                        PatientYear = 0,
                        PatientId = "",
                        PatientyearId = 0,
                        PatientType = "",
                        OPHID = 0,
                        OPTMTO = "",
                        OPTMFR = "",
                        REMARKS = ""

                    };
                }




            }

        }

        [System.Web.Http.Route("api/ApiOTMaster/GetData2")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OTMasterDTO> Get2(string Compid, string Transdt, Int64 TransYear, Int64 TransNo, string PatientType, Int64 patientyear,
            string patientyearId, Int64 opheadid, string timefrom, string timeto, string remarks, string InUserID, string InsLtude)
        {

            //Get Ip ADDRESS,Time & user PC Name


            Int64 InsUserID = Convert.ToInt64(InUserID);
            Int64 compid = Convert.ToInt64(Compid);
            Int64 patinetyid = Convert.ToInt64(patientyearId);



            var ache_kina_data = (from n in db.HmsOTMaster where n.COMPID == compid && n.TRANSNO == TransNo select n).ToList();
            if (ache_kina_data.Count == 0)
            {
              



            }
            else
            {
                //OTMaster obj=new OTMaster();
                foreach (var otMaster in ache_kina_data)
                {

                    otMaster.ID = otMaster.ID;
                    otMaster.COMPID = otMaster.COMPID;
                    otMaster.TRANSDT = otMaster.TRANSDT;
                    otMaster.TRANSYY = otMaster.TRANSYY;
                    otMaster.TRANSNO = otMaster.TRANSNO;

                    otMaster.PATIENTTP = otMaster.PATIENTTP;
                    otMaster.PATIENTYY = otMaster.PATIENTYY;
                    otMaster.PATIENTYYID = otMaster.PATIENTYYID;
                    otMaster.PATIENTID = otMaster.PATIENTID;
                    otMaster.OPHID = otMaster.OPHID;
                    otMaster.OPTMFR = timefrom;
                    otMaster.OPTMTO = timeto;
                    otMaster.REMARKS = remarks;
                    //db.Entry(obj).State = EntityState.Modified;

                    

                }
                db.SaveChanges();

                var OT_data = (from t1 in db.HmsOTDbSet
                               join t2 in db.HMS_REFER on t1.OTPID equals t2.REFERID

                               where t1.COMPID == compid && t1.TRANSNO == TransNo
                               select new
                               {
                                   Id = t1.ID,

                                   compid = t1.COMPID,
                                   transdt = t1.TRANSDT,
                                   transno = t1.TRANSNO,
                                   patintyear = t1.PATIENTYY,
                                   Patientid = t1.PATIENTID,
                                   Patientyid = t1.PATIENTYYID,
                                   patienttype = t1.PATIENTTP,
                                   ophid = t1.OPHID,
                                   otptype = t1.OTPTP,
                                   otpid = t1.OTPID,
                                   otpname = t2.REFERNM,

                                   amount = t1.OTPAMT,


                                   remarks = t1.REMARKS


                               });

                if (OT_data.Count() > 0)
                {
                    foreach (var item in OT_data)
                    {
                        //DateTime abcd = Convert.ToDateTime(item.transdt);
                        //string conv_tdt = abcd.ToString("dd-MMM-yyyy");


                        yield return new OTMasterDTO
                        {
                            ID = item.Id,
                            COMPID = item.compid,
                            PatientYear = item.patintyear,
                            PatientId = item.Patientid,
                            PatientyearId = item.Patientyid,
                            PatientType = item.patienttype,
                            OPHID = item.ophid,
                            OTPID = item.otpid,
                            OTPName = item.otpname,
                            OTPTP = item.otptype,



                            OTPAMT = item.amount,
                            REMARKS = item.remarks


                        };
                    }
                }
                else
                {
                    yield return new OTMasterDTO
                    {
                        
                        OPHID = 0,
                        


                    };
                }

                





            }


        }


        [System.Web.Http.Route("apiOTMaster/SaveData2")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage SaveData2(OTMasterDTO model)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

            var duplicate_data_test =
                    (from n in db.HmsOTDbSet where n.COMPID == model.COMPID && n.TRANSNO == model.TransNo && n.OTPTP == model.OTPTP && n.OTPID == model.OTPID select n).ToList();
            Int64 id = 0;
            if (duplicate_data_test.Count > 0)
            {
                foreach (var x in duplicate_data_test)
                {
                    id = x.ID;
                }
                if (id == model.ID)
                {

                    var data_find = (from n in db.HmsOTDbSet where n.ID == model.ID select n).ToList();
                    foreach (var item in data_find)
                    {
                        item.COMPID = item.COMPID;
                        item.TRANSDT = item.TRANSDT;

                        item.TRANSYY = item.TRANSYY;
                        item.TRANSNO = item.TRANSNO;
                        item.PATIENTTP = item.PATIENTTP;
                        item.PATIENTYY = item.PATIENTYY;


                        item.PATIENTYYID = item.PATIENTYYID;
                        item.PATIENTID = item.PATIENTID;
                        if (model.OTPTP == "SURGEON")
                        {
                            item.BILLID = Convert.ToInt64(Convert.ToString(item.COMPID) + "105");
                        }
                        else if (model.OTPTP == "ANESTHESIOLOGIST")
                        {
                            item.BILLID = Convert.ToInt64(Convert.ToString(item.COMPID) + "106");
                        }
                        else if (model.OTPTP == "ASSISTANT")
                        {
                            item.BILLID = Convert.ToInt64(Convert.ToString(item.COMPID) + "107");
                        }
                        else if (model.OTPTP == "OTCHARGE")
                        {
                            item.BILLID = Convert.ToInt64(Convert.ToString(item.COMPID) + "108");
                        }

                        item.OPHID = item.OPHID;
                        item.OTPTP = model.OTPTP;

                        item.OTPID = model.OTPID;
                        item.OTPAMT = model.OTPAMT;
                        item.REMARKS = model.REMARKS;




                        item.USERPC = strHostName;
                        item.INSIPNO = ipAddress.ToString();
                        item.INSTIME = Convert.ToDateTime(td);
                        item.INSUSERID = item.INSUSERID;
                        item.INSLTUDE = item.INSLTUDE;

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
                    model.OTPID = 0;
                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                    return response;
                }

            }

            return null;

        }

        [System.Web.Http.Route("api/grid/OTChild2")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage AddChildData2(OTMasterDTO model)
        {

           
            var check_data = (from n in db.HmsOTDbSet
                              where n.COMPID == model.COMPID && n.TRANSNO == model.TransNo
                                  && n.PATIENTTP == model.PatientType && n.PATIENTYYID == model.PatientyearId
                                  && n.OPHID == model.OPHID && n.OTPTP == model.OTPTP && (n.OTPID == model.OTPID && model.OTPID != 0 && model.OTPID != null) && n.OTPAMT == model.OTPAMT
                              select n).ToList();

            var find_date =
                (from n in db.HmsOTMaster where n.COMPID == model.COMPID && n.TRANSNO == model.TransNo select n).ToList();
            DateTime transddt = Convert.ToDateTime("2016-02-01");//just initial
            foreach (var ot in find_date)
            {
                transddt = Convert.ToDateTime(ot.TRANSDT);
            }

            var find_patientid = (from n in db.HmsOTMaster
                                  where n.COMPID == model.COMPID && n.TRANSNO == model.TransNo
                                        && n.PATIENTTP == model.PatientType && n.PATIENTYYID == model.PatientyearId
                                        && n.OPHID == model.OPHID
                                  select n).ToList();
            string patientid = "";
            foreach (var otMaster in find_patientid)
            {
                patientid = otMaster.PATIENTID;
            }

            if (check_data.Count == 0)
            {


                OT childData = new OT();

                childData.COMPID = model.COMPID;
                childData.TRANSDT = transddt;

                childData.TRANSYY = model.TransYear;
                childData.TRANSNO = model.TransNo;
                childData.PATIENTTP = model.PatientType;
                childData.PATIENTYY = model.PatientYear;


                childData.PATIENTYYID = model.PatientyearId;
                childData.PATIENTID = patientid;
                if (childData.OTPTP == "SURGEON")
                {
                    childData.BILLID = Convert.ToInt64(Convert.ToString(childData.COMPID) + "105");
                }
                else if (childData.OTPTP == "ANESTHESIOLOGIST")
                {
                    childData.BILLID = Convert.ToInt64(Convert.ToString(childData.COMPID) + "106");
                }
                else if (childData.OTPTP == "ASSISTANT")
                {
                    childData.BILLID = Convert.ToInt64(Convert.ToString(childData.COMPID) + "107");
                }
                else if (childData.OTPTP == "OTCHARGE")
                {
                    childData.BILLID = Convert.ToInt64(Convert.ToString(childData.COMPID) + "108");
                }

                childData.OPHID = model.OPHID;
                childData.OTPTP = model.OTPTP;

                childData.OTPID = model.OTPID;
                childData.OTPAMT = model.OTPAMT;
                childData.REMARKS = model.REMARKS;




                childData.USERPC = strHostName;
                childData.INSIPNO = ipAddress.ToString();
                childData.INSTIME = Convert.ToDateTime(td);
                childData.INSUSERID = model.INSUSERID;
                childData.INSLTUDE = model.INSLTUDE;

                db.HmsOTDbSet.Add(childData);

                db.SaveChanges();

                model.ID = childData.ID;
                model.COMPID = model.COMPID;




                //Insert_OpdLogData(model);






                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                return response;



            }
            else
            {
                model.OTPID = 0;
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                return response;
            }


        }




    }
}
