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
using Microsoft.Ajax.Utilities;

namespace AslHMS.Controllers.Api
{


    public class ApiCabinBedController : ApiController
    {


        IFormatProvider dateformat = new System.Globalization.CultureInfo("fr-FR", true);
        TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
        public DateTime td;

        AslHMSApiContext db = new AslHMSApiContext();

        //Get Ip ADDRESS,Time & user PC Name
        public string strHostName;
        public IPHostEntry ipHostInfo;
        public IPAddress ipAddress;

        public ApiCabinBedController()
        {

            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];

            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
        }

        [System.Web.Http.Route("apiCabinBed/PatientYID")]
        [System.Web.Http.HttpGet]
        public IEnumerable<string> GetPatinetYearID(string query, string query2,string query3)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(query2);
                Int64 year = Convert.ToInt64(query3);
                List<string> result = new List<string>();
                var tags = from p in db.HMS_IpdDbSet
                           where p.COMPID == compid && p.PATIENTYY == year
                           select new { p.PATIENTYYID };
                string date = td.ToString("yyyy-MM-dd");

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

        [System.Web.Http.Route("api/DynamicPatinetYearId")]
        [System.Web.Http.HttpGet]
        public IEnumerable<string> Dynamicautocomplete(string changedText, string changedText2, string changedText3)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(changedText2);
                Int64 yearID = Convert.ToInt64(changedText);
                Int64 year = Convert.ToInt64(changedText3);
                String name = "";



                List<string> rt = new List<string>();

                var tags = from p in db.HMS_IpdDbSet
                           where p.COMPID == compid && p.PATIENTYY == year
                           select new { p.PATIENTYYID };
                string date = td.ToString("yyyy-MM-dd");

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
                    (from n in db.HMS_IpdDbSet where n.COMPID == compid && n.PATIENTYY == year && n.PATIENTYYID == yearID select n).ToList()
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

        [System.Web.Http.Route("api/PatientName")]
        [System.Web.Http.HttpGet]
        public List<string> patientname(string changedText, string changedText2)
        {
            Int64 compid = Convert.ToInt64(changedText2);
            Int64 patientyearid = Convert.ToInt64(changedText);
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



        [System.Web.Http.Route("api/ApiCabinBed/GetData")]
        [System.Web.Http.HttpGet]
        public IEnumerable<CabinBedDTO> Get(string Compid, string Patientyearid, string InUserID, string InsLtude)
        {

            //Get Ip ADDRESS,Time & user PC Name


            Int64 InsUserID = Convert.ToInt64(InUserID);
            Int64 compid = Convert.ToInt64(Compid);
            Int64 patinetyid = Convert.ToInt64(Patientyearid);


            var ache_kina_data = (from n in db.HMS_IcbDbSet where n.COMPID == compid && n.PATIENTYYID == patinetyid select n).ToList();
            if (ache_kina_data.Count == 0)
            {

                var searchEFDT =
                    (from n in db.HMS_IpdDbSet where n.COMPID == compid && n.PATIENTYYID == patinetyid select n).ToList();
                string efdt = "", eftm = "";
                foreach (var ipd in searchEFDT)
                {
                    DateTime ab = Convert.ToDateTime(ipd.ADMITDT);
                    efdt = ab.ToString("dd-MMM-yyyy");
                    eftm = ipd.ADMITTM;
                }

                yield return new CabinBedDTO
                {

                    COMPID = compid,

                    PatientYearID = patinetyid,
                    EFDT = efdt,
                    EFTM = eftm,

                    CabinID = 0

                };








            }
            else
            {
                var icb_data = (from t1 in db.HMS_IcbDbSet
                                join t2 in db.HMS_HEADIO on t1.CBID equals t2.HEADID

                                where t1.COMPID == compid && t1.PATIENTYYID == patinetyid
                                select new
                                {
                                    Id = t1.ID,

                                    compid = t1.COMPID,
                                    patintyear = t1.PATIENTYY,
                                    Patientid = t1.PATIENTID,
                                    Patientyid = t1.PATIENTYYID,
                                    cabintp = t1.CBTP,
                                    cabinid = t1.CBID,
                                    cabinhead = t2.HEADNM,
                                    efdt = t1.EFDT,
                                    eftm = t1.EFTM,
                                    etdt = t1.ETDT,
                                    ettm = t1.ETTM,
                                    thour = t1.TOTHOUR,
                                    tdays = t1.TOTDAYS,

                                    remarks = t1.REMARKS


                                });

                foreach (var item in icb_data)
                {
                    DateTime abcd = Convert.ToDateTime(item.efdt);
                    string conv_efdt = abcd.ToString("dd-MMM-yyyy");

                    DateTime abcd2 = Convert.ToDateTime(item.etdt);
                    string conv_etdt = abcd2.ToString("dd-MMM-yyyy");

                    yield return new CabinBedDTO
                    {
                        ID = item.Id,
                        COMPID = item.compid,
                        PatientYear = item.patintyear,
                        PatientId = item.Patientid,
                        PatientYearID = item.Patientyid,

                        CabinType = item.cabintp,
                        CabinID = item.cabinid,
                        CabinHead = item.cabinhead,
                        EFDT = conv_efdt,
                        EFTM = item.eftm,
                        ETDT = conv_etdt,
                        ETTM = item.ettm,
                        TotalHours = item.thour,
                        TotalDays = item.tdays,
                        Remarks = item.remarks


                    };
                }





            }


        }



        [System.Web.Http.Route("api/DaysCalculate")]
        [System.Web.Http.HttpGet]
        public List<string> DaysCalculation(string changedText, string changedText2, string EFTM, string ETTM)
        {
            DateTime startDate = new DateTime();
            DateTime endDate = new DateTime();


            var fromdate = changedText + ' ' + EFTM;
            var todate = changedText2 + ' ' + ETTM;

            DateTime fdt = DateTime.Parse(fromdate);
            DateTime tdt = DateTime.Parse(todate);

            TimeSpan result = tdt - fdt;

            //startDate = Convert.ToDateTime(changedText);
            //endDate = Convert.ToDateTime(changedText2);
            string days = result.Days.ToString();
            string hours = result.TotalHours.ToString();
            List<string> data = new List<string>();
            data.Add(days);
            data.Add(hours);
            return data;
        }


        [System.Web.Http.Route("api/grid/IcbChild")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage AddChildData(CabinBedDTO model)
        {
            DateTime efdt = Convert.ToDateTime(model.EFDT);

            var check_data = (from n in db.HMS_IcbDbSet
                              where n.COMPID == model.COMPID && n.PATIENTYYID == model.PatientYearID
                                  && n.CBTP == model.CabinType && n.EFDT == efdt
                              select n).ToList();
            //    var patientyearid = (from n in db.HMS_OPDMST
            //                         where n.COMPID == model.CompanyID && n.TRANSDT == Tdate && n.PATIENTID == model.PatientID
            //                         select n).ToList();
            //    Int64 patientyid = 0;
            //    foreach (var opdMaster in patientyearid)
            //    {
            //        patientyid = Convert.ToInt64(opdMaster.PATIENTYYID);
            //    }

            if (check_data.Count == 0)
            {

                var findPatientID =
                    (from n in db.HMS_IpdDbSet
                     where n.COMPID == model.COMPID && n.PATIENTYYID == model.PatientYearID
                     select n).ToList();
                string Patientid = "";
                foreach (var opdMaster in findPatientID)
                {
                    Patientid = opdMaster.PATIENTID;

                }

                Icb childData = new Icb();

                childData.COMPID = model.COMPID;
                childData.PATIENTYY = model.PatientYear;

                childData.PATIENTID = Patientid;
                childData.PATIENTYYID = model.PatientYearID;
                childData.BILLID = Convert.ToInt64(Convert.ToString(childData.COMPID) + "103");
                childData.CBTP = model.CabinType;
                childData.CBID = Convert.ToInt64(model.CabinHead);
                childData.EFDT = efdt;
                childData.EFTM = model.EFTM;
                childData.ETDT = Convert.ToDateTime(model.ETDT);
                childData.ETTM = model.ETTM;
                childData.TOTHOUR = model.TotalHours;
                childData.TOTDAYS = model.TotalDays;
                childData.REMARKS = model.Remarks;


                childData.USERPC = strHostName;
                childData.INSIPNO = ipAddress.ToString();
                childData.INSTIME = Convert.ToDateTime(td);
                childData.INSUSERID = model.INSUSERID;
                childData.INSLTUDE = model.INSLTUDE;

                db.HMS_IcbDbSet.Add(childData);

                db.SaveChanges();

                model.ID = childData.ID;
                model.COMPID = model.COMPID;
                model.PatientYear = model.PatientYear;

                model.PatientId = Patientid;
                model.PatientYearID = model.PatientYearID;
                model.CabinType = model.CabinType;
                model.CabinID = Convert.ToInt64(model.CabinHead);
                model.EFDT = model.EFDT;
                model.EFTM = model.EFTM;
                model.ETDT = model.ETDT;
                model.ETTM = model.ETTM;
                model.TotalHours = model.TotalHours;
                model.TotalDays = model.TotalDays;
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
                model.CabinID = 0;
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                return response;
            }


        }


        [System.Web.Http.Route("api/ApiCabinBed/SaveData")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage SaveData(CabinBedDTO model)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
            DateTime efdt = Convert.ToDateTime(model.EFDT);
            var duplicate_data_test =
                    (from n in db.HMS_IcbDbSet
                     where n.COMPID == model.COMPID && n.PATIENTYYID == model.PatientYearID
                         && n.CBTP == model.CabinType && n.EFDT == efdt
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

                    var data_find = (from n in db.HMS_IcbDbSet where n.ID == model.ID select n).ToList();
                    foreach (var item in data_find)
                    {
                        item.ID = model.ID;
                        item.COMPID = model.COMPID;
                        item.PATIENTYYID = model.PatientYearID;
                        item.PATIENTYY = model.PatientYear;
                        item.PATIENTID = item.PATIENTID;
                        item.BILLID = item.BILLID;
                        item.CBID = Convert.ToInt64(model.CabinHead);
                        item.EFDT = efdt;
                        item.EFTM = model.EFTM;
                        item.ETDT = Convert.ToDateTime(model.ETDT);
                        item.ETTM = model.ETTM;
                        item.TOTDAYS = model.TotalDays;
                        item.TOTHOUR = model.TotalHours;
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
                    model.CabinID = 0;
                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                    return response;
                }

            }

            return null;

        }


        [System.Web.Http.Route("apiCabinBed/tomorrowCalculation")]
        [System.Web.Http.HttpGet]
        public List<string> tomorrow(string changedText, string changedText2)
        {
            DateTime today = Convert.ToDateTime(changedText);

            string currentTime = DateTime.Now.ToString("HH:mm");
            DateTime tomorrow = today.AddDays(1);
            //DateTime yesterday = DateTime.Now.AddDays(-1);
            string dd = tomorrow.ToString("dd-MMM-yyyy");


            //hours and days calculation starts....
            DateTime startDate = new DateTime();
            DateTime endDate = new DateTime();


            var fromdate = changedText + ' ' + currentTime;
            var todate = dd + ' ' + currentTime;

            DateTime fdt = DateTime.Parse(fromdate);
            DateTime tdt = DateTime.Parse(todate);

            TimeSpan result = tdt - fdt;

            //startDate = Convert.ToDateTime(changedText);
            //endDate = Convert.ToDateTime(changedText2);
            string days = result.Days.ToString();
            string hours = result.TotalHours.ToString();


            //hours and days calculation Ends............
          



          
         
            List<string> data = new List<string>();
            data.Add(dd);
            data.Add(currentTime);
            data.Add(days);
            data.Add(hours);
            
            return data;
        }
    }
}
