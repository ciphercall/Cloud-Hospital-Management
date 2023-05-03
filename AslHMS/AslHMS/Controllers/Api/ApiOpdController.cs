using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using AslHMS.Models;
using AslHMS.Models.DTO;
using AslHMS.Models.HMS;

namespace AslHMS.Controllers.Api
{
    public class ApiOpdController : ApiController
    {
        IFormatProvider dateformat = new System.Globalization.CultureInfo("fr-FR", true);
        TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
        public DateTime td;

        AslHMSApiContext db = new AslHMSApiContext();

        //Get Ip ADDRESS,Time & user PC Name
        public string strHostName;
        public IPHostEntry ipHostInfo;
        public IPAddress ipAddress;

        public ApiOpdController()
        {
           
            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];
            //td = DateTime.Now;
            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
        }

        [System.Web.Http.Route("api/TestNameList")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OpdDTO> GetTestNameList(string query, string query2, string query3)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(query2);
                Int64 catid = Convert.ToInt64(query3);
                if (catid == 0)
                {
                    return String.IsNullOrEmpty(query) ? db.HMS_TEST.AsEnumerable().Select(b => new OpdDTO { }).ToList() :
               db.HMS_TEST.Where(p => p.TESTNM.StartsWith(query) && p.COMPID == compid).Select(
                         x =>
                         new
                         {
                             testname = x.TESTNM,
                             testid = x.TESTID,
                             rate = x.RATE,
                             pcntd = x.PCNTD,
                             tCatid = x.TCATID
                         })
               .AsEnumerable().Select(a => new OpdDTO
               {
                   TestName = a.testname,
                   TestID = Convert.ToInt64(a.testid),
                   TestCategoryId = a.tCatid,
                   TestCategoryName = "",
                   Amount = a.rate,
                   Pcntd = a.pcntd

               }).ToList();
                }
                else
                {


                    return (from t1 in db.HMS_TEST
                            join t2 in db.HMS_TESTMST on t1.TCATID equals t2.TCATID
                            where t1.COMPID == compid && t2.COMPID == compid && t1.TCATID == catid && t1.TESTNM.StartsWith(query)
                            select new
                            {
                                testname = t1.TESTNM,
                                testid = t1.TESTID,
                                categoryname = t2.TCATNM,
                                rate = t1.RATE,
                                pcntd = t1.PCNTD


                            })
                           .AsEnumerable().Select(a => new OpdDTO
                           {

                               TestName = a.testname,
                               TestID = Convert.ToInt64(a.testid),
                               TestCategoryName = a.categoryname,
                               Amount = a.rate,
                               Pcntd = a.pcntd


                           }).ToList();
                }
            }
        }

        [System.Web.Http.Route("api/DynamicTestName")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OpdDTO> Dynamicautocomplete(string changedText, string changedText2, string changedText3)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(changedText2);
                Int64 catid = Convert.ToInt64(changedText3);

                String name = "";
                var rt = db.HMS_TEST.Where(n => n.TESTNM.StartsWith(changedText) && n.COMPID == compid).Select(n => new
                {
                    headname = ""

                }).ToList();//This for using initialization, I had no way at that time

                if (catid == 0)
                {
                    rt = db.HMS_TEST.Where(n => n.TESTNM.StartsWith(changedText) && n.COMPID == compid).Select(n => new
                   {
                       headname = n.TESTNM

                   }).ToList();
                }
                else
                {
                    rt = db.HMS_TEST.Where(n => n.TESTNM.StartsWith(changedText) && n.COMPID == compid && n.TCATID == catid).Select(n => new
                   {
                       headname = n.TESTNM

                   }).ToList();
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

                var findid = (from n in db.HMS_TEST where n.TESTNM == name && n.COMPID == compid && n.TCATID == catid select n).ToList();
                if (catid == 0)
                {
                    findid = (from n in db.HMS_TEST where n.TESTNM == name && n.COMPID == compid select n).ToList();
                }
                else
                {
                    findid = (from n in db.HMS_TEST where n.TESTNM == name && n.COMPID == compid && n.TCATID == catid select n).ToList();
                }

                if (findid.Count != 0)
                {
                    Int64 TCatid = Convert.ToInt64(findid[0].TCATID);


                    return (from t1 in db.HMS_TEST
                            join t2 in db.HMS_TESTMST on t1.TCATID equals t2.TCATID
                            where t1.COMPID == compid && t2.COMPID == compid && t1.TCATID == TCatid && t1.TESTNM == name
                            select new
                            {
                                testname = t1.TESTNM,
                                testid = t1.TESTID,
                                categoryname = t2.TCATNM,
                                rate = t1.RATE,
                                pcntd = t1.PCNTD


                            })
                   .AsEnumerable().Select(a => new OpdDTO
                   {

                       TestName = a.testname,
                       TestID = Convert.ToInt64(a.testid),
                       TestCategoryName = a.categoryname,

                       TestCategoryId = TCatid,
                       Amount = a.rate,
                       Pcntd = a.pcntd


                   }).ToList();


                }
                else
                {
                    return db.HMS_TEST.AsEnumerable().Select(a => new OpdDTO
                    {
                        TestName = name,
                        TestID = 0


                    }).ToList();
                }



            }

        }

        [System.Web.Http.Route("api/ApiOpd/GetData")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OpdDTO> Get(string Compid, string TransactionDate, string PatientName, string RfPercentage, string PatientId, string InUserID, string InsLtude)
        {

            //Get Ip ADDRESS,Time & user PC Name
            string strHostName = System.Net.Dns.GetHostName();
            IPHostEntry ipHostInfo = Dns.Resolve(Dns.GetHostName());
            IPAddress ipAddress = ipHostInfo.AddressList[0];

            Int64 InsUserID = Convert.ToInt64(InUserID);
            Int64 compid = Convert.ToInt64(Compid);

            DateTime fdate = DateTime.Parse(TransactionDate);
            string ffdt = fdate.ToString("ddMMyy");

            string ddd = fdate.ToString("dd-MMM-yyyy");
            string getYear = ddd.Substring(9, 2);
            string getMonth = ddd.Substring(3, 3);
            string Month = getMonth + "-" + getYear;//Dec-15 (Example)


            string patientyear = ddd.Substring(7, 4);


            string year = ffdt.Substring(4, 2);

            decimal Rfpercentage = Convert.ToDecimal(RfPercentage);
            Int64 max_patientYearID = 0;
            string transno = "";
            Int64 patientyid = Convert.ToInt64(PatientId);
            var ache_kina_data = (from n in db.HMS_OPDMST where n.COMPID == compid && n.TRANSDT == fdate && n.PATIENTYYID == patientyid select n).ToList();
            if (ache_kina_data.Count == 0)
            {
                var max_patientID =
                  (from n in db.HMS_OPDMST where n.COMPID == compid && n.TRANSDT == fdate select n.PATIENTID).Max();
                max_patientYearID =
                    Convert.ToInt64((from n in db.HMS_OPDMST where n.COMPID == compid select n.PATIENTYYID).Max());
             
                if (max_patientYearID == 0)
                {
                   
                    max_patientYearID = Convert.ToInt64(year + "200001");
                    transno = year + ffdt.Substring(2, 2) + "0001";
                }
                else
                {
                    Int64 max_transno = Convert.ToInt64((from n in db.HMS_OPDMST where n.COMPID == compid select n.TRANSNO).Max());
                    if (max_patientYearID.ToString().Substring(0, 2) == year)
                    {
                        max_patientYearID = max_patientYearID + 1;
                        transno = Convert.ToString(max_transno + 1);
                    }
                    else
                    {
                        max_patientYearID = Convert.ToInt64(year + "200001");
                        transno = year + ffdt.Substring(2, 2) + "0001";
                    }
                   
                }
                if (max_patientID == null)
                {
                    OpdMaster obj = new OpdMaster
                    {
                        COMPID = compid,
                        TRANSDT = fdate,

                        TRANSMY = Month,
                        TRANSNO = transno,
                        PATIENTYY = Convert.ToInt64(patientyear),
                        PATIENTID = ffdt + "-" + "001",

                        PATIENTYYID = max_patientYearID,
                        PATIENTNM = PatientName,
                        RFPCNT = Rfpercentage,

                        USERPC = strHostName,
                        INSIPNO = ipAddress.ToString(),

                        INSTIME = Convert.ToDateTime(td),

                        INSUSERID = InsUserID,
                        INSLTUDE = InsLtude


                    };

                    db.HMS_OPDMST.Add(obj);
                    db.SaveChanges();
                    yield return new OpdDTO
                    {

                        COMPID = compid,
                        TransactionDate = Convert.ToString(fdate),
                        PatientID = ffdt + "-" + "001",
                        PatientYearID = max_patientYearID,
                        PatientName = PatientName,
                        RfPercentage = Rfpercentage,
                        TestSerial = 0

                    };
                }
                else
                {
                    Int64 abc = Convert.ToInt64(max_patientID.Substring(7, 3)) + 1;
                    string xxx = Convert.ToString(abc);
                    string patienid = "";
                    if (xxx.Length == 1)
                    {
                        patienid = max_patientID.Substring(0, 7) + "00" + xxx;
                    }
                    else if (xxx.Length == 2)
                    {
                        patienid = max_patientID.Substring(0, 7) + "0" + xxx;
                    }
                    else if (xxx.Length == 3)
                    {
                        patienid = max_patientID.Substring(0, 7) + xxx;
                    }
                     max_patientYearID =Convert.ToInt64((from n in db.HMS_OPDMST where n.COMPID == compid select n.PATIENTYYID).Max());

                     if (max_patientYearID == 0)
                     {
                         max_patientYearID = Convert.ToInt64(year + "00001");
                         transno = year + ffdt.Substring(2, 2) + "0001";
                     }
                     else
                     {
                         Int64 max_transno = Convert.ToInt64((from n in db.HMS_OPDMST where n.COMPID == compid select n.TRANSNO).Max());
                         if (max_patientYearID.ToString().Substring(0, 2) == year)
                         {
                             max_patientYearID = max_patientYearID + 1;
                             transno = Convert.ToString(max_transno + 1);
                         }
                         else
                         {
                             max_patientYearID = Convert.ToInt64(year + "200001");
                             transno = year + ffdt.Substring(2, 2) + "0001";
                         }
                     }
                    OpdMaster obj = new OpdMaster
                    {
                        COMPID = compid,
                        TRANSDT = fdate,
                        TRANSMY = Month,
                        TRANSNO = transno,
                        PATIENTYY = Convert.ToInt64(patientyear),
                        PATIENTID = patienid,
                        PATIENTYYID = max_patientYearID,
                        PATIENTNM = PatientName,
                        RFPCNT = Rfpercentage,

                         USERPC = strHostName,
                        INSIPNO = ipAddress.ToString(),
                        INSTIME = Convert.ToDateTime(td),

                        INSUSERID = InsUserID,
                        INSLTUDE = InsLtude


                    };

                    db.HMS_OPDMST.Add(obj);
                    db.SaveChanges();

                    yield return new OpdDTO
                    {

                        COMPID = compid,
                        TransactionDate = Convert.ToString(fdate),
                        PatientID = patienid,
                        PatientYearID = max_patientYearID,
                        PatientName = PatientName,
                        RfPercentage = Rfpercentage,
                        TestSerial = 0

                    };
                }












            }
            else
            {
                if (PatientId == null)
                {
                    var max_patientID =
                   (from n in db.HMS_OPDMST where n.COMPID == compid && n.TRANSDT == fdate select n.PATIENTID).Max();
                    Int64 abc = Convert.ToInt64(max_patientID.Substring(7, 3)) + 1;
                    string xxx = Convert.ToString(abc);
                    string patienid = "";
                    if (xxx.Length == 1)
                    {
                        patienid = max_patientID.Substring(0, 7) + "00" + xxx;
                    }
                    else if (xxx.Length == 2)
                    {
                        patienid = max_patientID.Substring(0, 7) + "0" + xxx;
                    }
                    else if (xxx.Length == 3)
                    {
                        patienid = max_patientID.Substring(0, 7) + xxx;
                    }
                    max_patientYearID =Convert.ToInt64(
                (from n in db.HMS_OPDMST where n.COMPID == compid select n.PATIENTYYID).Max());
                    if (max_patientYearID == 0)
                    {
                        max_patientYearID = Convert.ToInt64(year + "200001");
                        transno = year + ffdt.Substring(2, 2) + "0001";
                    }
                    else
                    {
                        Int64 max_transno = Convert.ToInt64((from n in db.HMS_OPDMST where n.COMPID == compid select n.TRANSNO).Max());
                        if (max_patientYearID.ToString().Substring(0, 2) == year)
                        {
                            max_patientYearID = max_patientYearID + 1;
                            transno = Convert.ToString(max_transno + 1);
                        }
                        else
                        {
                            max_patientYearID = Convert.ToInt64(year + "200001");
                            transno = year + ffdt.Substring(2, 2) + "0001";
                        }
                    }
                    OpdMaster obj = new OpdMaster
                    {
                        COMPID = compid,
                        TRANSDT = fdate,
                        TRANSMY = Month,
                        TRANSNO = transno,
                        PATIENTYY = Convert.ToInt64(patientyear),
                        PATIENTID = patienid,
                        PATIENTNM = PatientName,
                        PATIENTYYID = max_patientYearID,
                        RFPCNT = Rfpercentage,


                         USERPC = strHostName,
                        INSIPNO = ipAddress.ToString(),
                        INSTIME = Convert.ToDateTime(td),

                        INSUSERID = InsUserID,
                        INSLTUDE = InsLtude

                    };

                    db.HMS_OPDMST.Add(obj);
                    db.SaveChanges();

                    yield return new OpdDTO
                    {

                        COMPID = compid,
                        TransactionDate = Convert.ToString(fdate),
                        PatientID = patienid,
                        PatientYearID = Convert.ToInt64(max_patientYearID+1),
                        PatientName = PatientName,
                        RfPercentage = Rfpercentage,
                        TestSerial = 0

                    };
                }
                else
                {
                    //Int64 patientyid = Convert.ToInt64(PatientId);
                    var ff = (from n in db.HMS_OPD where n.COMPID == compid && n.TRANSDT == fdate && n.PATIENTYYID == patientyid select n).ToList();
                    if (ff.Count == 0)
                    {

                        yield return new OpdDTO
                        {

                            COMPID = compid,
                            TransactionDate = Convert.ToString(fdate),
                            PatientYearID = patientyid,
                          
                            PatientName = PatientName,
                            RfPercentage = Rfpercentage,
                            TestSerial = 0


                        };

                    }
                    else
                    {
                        
                      
                        var opd_data = (from t1 in db.HMS_OPD
                                        join t2 in db.HMS_OPDMST on t1.PATIENTYYID equals t2.PATIENTYYID
                                        join t3 in db.HMS_HEADIO on t1.BILLID equals t3.HEADID
                                        join t4 in db.HMS_TEST on t1.TESTID equals t4.TESTID into ps from t4 in ps.DefaultIfEmpty()
                                        where t1.COMPID == compid && t1.TRANSDT == fdate && t1.PATIENTYYID == patientyid &&
                                        (t1.TESTID == t4.TESTID || t1.TESTID == null)
                                        select new
                                        {
                                            Id = t1.ID,

                                            compid = t1.COMPID,
                                            Transdate = t1.TRANSDT,
                                            Patientid = t1.PATIENTID,
                                            Patientyid=t1.PATIENTYYID,
                                            referid = t1.REFERID,
                                            billid=t1.BILLID,
                                            billname = t3.HEADNM,
                                            testsl = t1.TESTSL,
                                            tcatid = t1.TCATID,
                                          
                                            testid = t1.TESTID,
                                            testname = t4.TESTNM,
                                            amount = t1.AMOUNT,
                                            pcntr = t1.PCNTR,
                                            pcntd = t1.PCNTD,
                                            discr = t1.DISCR,
                                            remarks = t1.REMARKS


                                        });

                        foreach (var item in opd_data)
                        {
                            string testnm = "";
                            if (item.testid == null)
                            {
                                testnm = "";
                            }
                            else
                            {
                                testnm = item.testname;
                            }
                            yield return new OpdDTO
                            {
                                ID = item.Id,
                                COMPID = item.compid,
                                PatientName = PatientName,
                                TransactionDate = Convert.ToString( item.Transdate),
                               
                                PatientID = item.Patientid,
                                PatientYearID = Convert.ToInt64(item.Patientyid),
                                ReferID = item.referid,
                                TestSerial = item.testsl,
                                BillId = item.billid,
                                Billname = item.billname,
                                TestCategoryId = item.tcatid,
                                //TestCategoryName = item.tCatname,
                                TestID = item.testid,
                                TestName =testnm,
                                Amount = item.amount,
                                Pcntd = item.pcntd,
                                Pcntr = item.pcntr,
                                Discr = item.discr,
                                Remarks = item.remarks

                            };
                        }
                    }
                }




            }


        }


        [System.Web.Http.Route("api/PatientNameList")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OpdDTO> GetPatientNameList(string query, string query2)
        {
            using (var db = new AslHMSApiContext())
            {
              
               

                //return String.IsNullOrEmpty(query) ? db.HMS_OPDMST.AsEnumerable().Select(b => new OpdDTO { }).ToList() :
                //db.HMS_OPDMST.Where(p => p.PATIENTID.StartsWith(query) && p.COMPID == compid).Select(
                //          x =>
                //          new
                //          {
                //              patientname = x.PATIENTNM,
                //              patientid = x.PATIENTID,

                //              dueamount = x.DUEAMT

                //          })
                //.AsEnumerable().Select(a => new OpdDTO
                //{
                //    PatientName = a.patientname,
                //    PatientID = a.patientid,

                //    DueAmount = Convert.ToDecimal(a.dueamount)

                //}).ToList();

                Int64 compid = Convert.ToInt64(query2);
                var tags = from p in db.HMS_OPDMST
                           where p.COMPID == compid
                           select new { p.PATIENTYYID, p.PATIENTNM, p.DUEAMT };
                
                string date = td.ToString("yyyy-MM-dd");

                string currentyear = date.Substring(2, 2);
                foreach (var tag in tags)
                {
                    if ((tag.PATIENTYYID.ToString().StartsWith(query) == true) && (tag.PATIENTYYID.ToString().StartsWith(currentyear) == true))
                    {

                      
                        yield return new OpdDTO
                        {

                            PatientYearID = Convert.ToInt64(tag.PATIENTYYID),
                            PatientName = tag.PATIENTNM,
                           DueAmount = Convert.ToDecimal(tag.DUEAMT)

                        };
                    }

                }
            }
        }

        [System.Web.Http.Route("api/DynamicPatientName")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OpdDTO> DynamicAutocomplete(string changedText, string changedText2)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(changedText2);
                //DateTime TDate = Convert.ToDateTime(changedText3);

                String name = "";

                //var rt = db.HMS_OPDMST.Where(n => n.PATIENTID.StartsWith(changedText) && n.COMPID == compid).Select(n => new
                //{
                //    headname = n.PATIENTID

                //}).ToList();
                List<string> rt = new List<string>();
                var tags = from p in db.HMS_OPDMST
                           where p.COMPID == compid
                           select new { p.PATIENTYYID };
                string date = td.ToString("yyyy-MM-dd");

                string currentyear = date.Substring(2, 2);


                //string currentyear = Convert.ToString(td).Substring(8, 2);
                foreach (var tag in tags)
                {
                    if ((tag.PATIENTYYID.ToString().StartsWith(changedText) == true) &&
                        (tag.PATIENTYYID.ToString().StartsWith(currentyear) == true))
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


                Int64 yearid = Convert.ToInt64(name);

              
                var findid =
                       (from n in db.HMS_OPDMST where n.PATIENTYYID == yearid && n.COMPID == compid select n).ToList();
                if (findid.Count != 0)
                {
                    var returndata = (from t1 in db.HMS_OPDMST
                                      //join t2 in db.HMS_OPD on t1.COMPID equals t2.COMPID
                                      where t1.COMPID == compid && t1.PATIENTYYID == yearid
                                      select new
                                      {

                                          patientyid = t1.PATIENTYYID,
                                          patientname = t1.PATIENTNM,
                                      dueamount=t1.DUEAMT


                                      });
                    foreach (var item in returndata)
                    {
                      
                        yield return new OpdDTO
                        {

                            PatientYearID = Convert.ToInt64(item.patientyid),
                            PatientName = item.patientname,

                            DueAmount = Convert.ToInt64(item.dueamount)
                        };
                    }

                  

                }
                else
                {

                    yield return new OpdDTO
                    {

                        PatientYearID = yearid,
                        PatientName = "",
                         DueAmount=0

                    };
                }



            }

        }


        [System.Web.Http.Route("api/CatNameList")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OpdDTO> GetCatNameList(string query, string query2)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(query2);


                return String.IsNullOrEmpty(query) ? db.HMS_TESTMST.AsEnumerable().Select(b => new OpdDTO { }).ToList() :
                db.HMS_TESTMST.Where(p => p.TCATNM.StartsWith(query) && p.COMPID == compid).Select(
                          x =>
                          new
                          {
                              catname = x.TCATNM,
                              catid = x.TCATID,



                          })
                .AsEnumerable().Select(a => new OpdDTO
                {
                    TestCategoryId = a.catid,
                    TestCategoryName = a.catname,



                }).ToList();
            }
        }


        [System.Web.Http.Route("api/DynamicCatName")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OpdDTO> DynamicCatcomplete(string changedText, string changedText2)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(changedText2);

                String name = "";

                var rt = db.HMS_TESTMST.Where(n => n.TCATNM.StartsWith(changedText) && n.COMPID == compid).Select(n => new
                {
                    headname = n.TCATNM

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



                var findid = (from n in db.HMS_TESTMST where n.TCATNM == name && n.COMPID == compid select n).ToList();
                if (findid.Count != 0)
                {
                    return db.HMS_TESTMST.Where(p => p.TCATNM == name && p.COMPID == compid).Select(
                        x =>
                            new
                            {
                                catname = x.TCATNM,
                                catid = x.TCATID,



                            })
                        .AsEnumerable().Select(a => new OpdDTO
                        {

                            TestCategoryName = a.catname,
                            TestCategoryId = a.catid,




                        }).ToList();
                }
                else
                {
                    return db.HMS_TESTMST.AsEnumerable().Select(a => new OpdDTO
                    {
                        TestCategoryName = name,
                        TestCategoryId = 0


                    }).ToList();
                }



            }

        }

        public ASL_LOG aslLog = new ASL_LOG();
        public void Insert_OpdLogData(OpdDTO model)
        {
            TimeZoneInfo timeZoneInfo;
            timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
            DateTime PrintDate = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
            var date = Convert.ToString(PrintDate.ToString("dd-MMM-yyyy"));
            var time = Convert.ToString(PrintDate.ToString("hh:mm:ss tt"));

            Int64 maxSerialNo = Convert.ToInt64((from n in db.AslLogDbSet where n.COMPID == model.COMPID && n.USERID == model.INSUSERID select n.LOGSLNO).Max());
            if (maxSerialNo == 0)
            {
                aslLog.LOGSLNO = Convert.ToInt64("1");
            }
            else
            {
                aslLog.LOGSLNO = maxSerialNo + 1;
            }

            aslLog.COMPID = Convert.ToInt64(model.COMPID);
            aslLog.USERID = Convert.ToInt64(model.INSUSERID);
            aslLog.LOGTYPE = "Insert";
            aslLog.LOGSLNO = aslLog.LOGSLNO;
            aslLog.LOGDATE = Convert.ToDateTime(date);
            aslLog.LOGTIME = Convert.ToString(time);
            aslLog.LOGIPNO = model.INSIPNO;
            aslLog.LOGLTUDE = model.INSLTUDE;
            aslLog.LOGDATA = Convert.ToString("Patient ID: " + model.PatientID + ",\nPatient Name: " + model.PatientName + ",\nTransaction Date: " + model.TransactionDate +
               ",\nRefer Name: " + model.Refername +
                ",\nTest Serial: " + model.TestSerial + ",\nCategory Name: " + model.TestCategoryName + ",\nTest Name: " + model.TestName + ",\nAmount :" + model.Amount +
                ",\nPcntd: " + model.Pcntd + ",\nPcntr: " + model.Pcntr + ",\nDiscr: " + model.Discr + ",\nRemarks: " + model.Remarks);
            aslLog.TABLEID = "HMS_OPD";
            aslLog.USERPC = model.USERPC;

            db.AslLogDbSet.Add(aslLog);
           
        }




        [System.Web.Http.Route("api/grid/OpdChild")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage AddChildData(OpdDTO model)
        {
            //var compid = Convert.ToInt64(System.Web.HttpContext.Current.Session["loggedCompID"].ToString());
            //model.COMPID = compid;

            DateTime Tdate = Convert.ToDateTime(model.TransactionDate);

            var check_data = (from n in db.HMS_OPD
                              where n.COMPID == model.COMPID && n.TRANSDT == Tdate
                                  && n.PATIENTYYID == model.PatientYearID && n.TCATID == model.TestCategoryId && n.TESTID == model.TestID
                              select n).ToList();
            var patient_id = (from n in db.HMS_OPDMST
                                 where n.COMPID == model.COMPID && n.TRANSDT == Tdate && n.PATIENTYYID == model.PatientYearID
                select n).ToList();
            string patientid = "";
            foreach (var opdMaster in patient_id)
            {
                patientid =opdMaster.PATIENTID;
            }

            if (check_data.Count == 0)
            {
                Int64 max_testSl = Convert.ToInt64((from n in db.HMS_OPD
                                                    where n.COMPID == model.COMPID && n.TRANSDT == Tdate
                                                          && n.PATIENTYYID == model.PatientYearID
                                                    select n.TESTSL).Max());
                string transno = "",transmy="";
                Int64 patientyear = 0;
                var findsome_data =
                    (from n in db.HMS_OPDMST where n.COMPID == model.COMPID && n.PATIENTYYID == model.PatientYearID select n)
                        .ToList();
                foreach (var opdmst in findsome_data)
                {
                    transno = opdmst.TRANSNO;
                    patientyear = opdmst.PATIENTYY;
                    transmy = opdmst.TRANSMY;
                }

                Opd childData = new Opd();
                childData.COMPID = model.COMPID;
                childData.TRANSDT = Tdate;

                childData.PATIENTID = Convert.ToString(patientid);
                childData.PATIENTYYID = model.PatientYearID;
                childData.BILLID = model.BillId;
                childData.TCATID = model.TestCategoryId;
                childData.TESTID = model.TestID;
                childData.AMOUNT = model.Amount;
                childData.PCNTD = model.Pcntd;
                childData.PCNTR = model.Pcntr;
                childData.DISCR = model.Discr;
                childData.TESTSL = max_testSl + 1;

                childData.TRANSNO = transno;
                childData.TRANSMY = transmy;
                childData.PATIENTYY = patientyear;
                       
                       
                childData.USERPC = strHostName;
                childData.INSIPNO = ipAddress.ToString();
                childData.INSTIME = Convert.ToDateTime(td);
                childData.INSUSERID = model.INSUSERID;
                childData.INSLTUDE = model.INSLTUDE;

                db.HMS_OPD.Add(childData);

               

                model.ID = childData.ID;
                model.COMPID = model.COMPID;
                model.TransactionDate = model.TransactionDate;
                model.PatientYearID = model.PatientYearID;
              
                model.TestSerial = childData.TESTSL;
              
                model.TestCategoryId = model.TestCategoryId;
                model.TestID = model.TestID;

                model.Amount = model.Amount;


                model.Pcntd = model.Pcntd;
                model.Pcntr = model.Pcntr;
                model.Discr = model.Discr;


                Insert_OpdLogData(model);


                db.SaveChanges();



                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);
                //response.Headers.Location = new Uri(Url.Link("api/ApiFilterItemController", new { gid = model.FILTERGID }));

                return response;
            }
            else
            {
                model.TestCategoryId = 0;
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                return response;
            }


        }



        [System.Web.Http.Route("api/ApiOpd/DeleteData")]
        [System.Web.Http.HttpPost]
        // DELETE api/<controller>/5
        public HttpResponseMessage DeleteData(OpdDTO model)
        {

            System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AslHMSApiContext"].ToString());
            string query = string.Format("DELETE FROM HMS_OPD WHERE ID='{0}'", model.ID);
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
            Opd testObj = new Opd();






            return Request.CreateResponse(HttpStatusCode.OK, testObj);
        }


        [System.Web.Http.Route("api/OpdReferNameList")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OpdDTO> GetReferNameList(string query, string query2)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(query2);


                return String.IsNullOrEmpty(query) ? db.HMS_REFER.AsEnumerable().Select(b => new OpdDTO { }).ToList() :
                db.HMS_REFER.Where(p => p.REFERNM.StartsWith(query) && p.COMPID == compid).Select(
                          x =>
                          new
                          {
                              refername = x.REFERNM,
                              referid = x.REFERID,



                          })
                .AsEnumerable().Select(a => new OpdDTO
                {
                    ReferID = a.referid,
                    Refername = a.refername,



                }).ToList();
            }
        }
        [System.Web.Http.Route("api/DynamicRefName")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OpdDTO> DynamicRefcomplete(string changedText, string changedText2)
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
                        .AsEnumerable().Select(a => new OpdDTO
                        {

                            Refername = a.refername,
                            ReferID = a.referid,




                        }).ToList();
                }
                else
                {
                    return db.HMS_REFER.AsEnumerable().Select(a => new OpdDTO
                    {
                        Refername = name,
                        ReferID = 0


                    }).ToList();
                }



            }

        }


        [System.Web.Http.Route("api/ApiOpd/Save2ndPart")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OpdDTO> Get(string Compid, string TransactionDate, string PatientId, string Gender,
           string Age, string Address, string MObileNo,string DoctorID, string ReferID, string DvDate, string Dvtm, string TotalAmount, string DiscountRefer,
            string DiscountHos, string Discountnet, string NetAmount, string ReceiveAmount, string DueAmount, string DueHID)
        {

            Int64 compid = Convert.ToInt64(Compid);

            DateTime fdate = DateTime.Parse(TransactionDate);
            Int64 duehid = 0;
            if (DueHID != "")
            {
                 duehid = Convert.ToInt64(DueHID);
            }
            else
            {
                 duehid = 0;
            }
           
          
            if (Age == null || Age=="")
            {
                Age = "0";
            }

            Int64 patientyid = Convert.ToInt64(PatientId);
            var ache_kina_data = (from n in db.HMS_OPDMST where n.COMPID == compid && n.TRANSDT == fdate && n.PATIENTYYID == patientyid select n).ToList();
            if (ache_kina_data.Count == 0)
            {
                //yield return new OpdDTO
                //{

                //    CompanyID = compid,
                //    TransactionDate = fdate,

                //    TestSerial = 0

                //};


            }
            else
            {
                foreach (var item in ache_kina_data)
                {
                    item.ID = item.ID;
                    item.COMPID = item.COMPID;
                    item.TRANSDT = item.TRANSDT;
                    item.PATIENTID = item.PATIENTID;
                    item.PATIENTYYID = item.PATIENTYYID;
                    item.USERPC = item.USERPC;
                    item.INSUSERID = item.INSUSERID;
                    item.INSIPNO = item.INSIPNO;
                    item.INSLTUDE = item.INSLTUDE;
                    item.INSTIME = item.INSTIME;

                    item.GENDER = Gender;
                    item.AGE = Age;
                    item.ADDRESS = Address;
                    item.MOBNO = MObileNo;
                    item.DOCTORID = Convert.ToInt64(DoctorID);
                    item.REFERID = Convert.ToInt64(ReferID);
                    if (DvDate == null)
                    {
                        item.DVDT = null;
                    }
                    else
                    {
                        item.DVDT = Convert.ToDateTime(DvDate);
                    }

                    item.DVTM = Dvtm;
                    item.TOTAMT = Convert.ToDecimal(TotalAmount);
                    item.DISCREF = Convert.ToDecimal(DiscountRefer);
                    item.DISCHOS = Convert.ToDecimal(DiscountHos);
                    item.DISCNET = Convert.ToDecimal(Discountnet);
                    item.NETAMT = Convert.ToDecimal(NetAmount);
                    item.RCVAMT = Convert.ToDecimal(ReceiveAmount);
                    item.DUEAMT = Convert.ToDecimal(DueAmount);
                    item.DUEHID = duehid;
                    db.SaveChanges();
                }



            }


            return null;





        }


        //..............Update...................

        [System.Web.Http.Route("api/OpdUpdate/PatientYId")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OpdDTO> GetPatientId(string query, string query2)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(query2);
                var tags = from p in db.HMS_OPDMST
                           where p.COMPID == compid
                           select new { p.PATIENTYYID, p.PATIENTNM, p.TRANSDT, p.RFPCNT,p.PATIENTID };
                //var returndata = (from t1 in db.HMS_OPDMST

                //                  where t1.COMPID == compid && t1.PATIENTID.StartsWith(query)
                //                  select new
                //                  {

                //                      patientid = t1.PATIENTID,
                //                      patientname = t1.PATIENTNM,
                //                      transdt = t1.TRANSDT,
                //                      rf = t1.RFPCNT
                                    

                //                  });
                string date = td.ToString("yyyy-MM-dd");

                string currentyear = date.Substring(2, 2);
                foreach (var tag in tags)
                {
                    if ((tag.PATIENTYYID.ToString().StartsWith(query) == true) && (tag.PATIENTYYID.ToString().StartsWith(currentyear) == true))
                    {
                        
                        DateTime dd = Convert.ToDateTime(tag.TRANSDT);
                        string aa = dd.ToString("dd-MMM-yyyy");
                        yield return new OpdDTO
                        {

                            PatientYearID = Convert.ToInt64(tag.PATIENTYYID),
                            PatientName = tag.PATIENTNM,
                            PatientID = tag.PATIENTID,
                            TransactionDate = aa,
                            RfPercentage = tag.RFPCNT
                           
                        };
                    }

                }
                //foreach (var item in returndata)
                //{
                //    DateTime dd = Convert.ToDateTime(item.transdt);
                //    string aa = dd.ToString("dd-MMM-yyyy");
                //    string doctorname = "", refername = "";
                  
                //    yield return new OpdDTO
                //    {

                //        PatientID = item.patientid,
                //        PatientName = item.patientname,
                //        RfPercentage = item.rf,
                //        TDateBrother = aa
                     

                //    };
                //}







            }
        }

        [System.Web.Http.Route("api/Opd/DynamicPatientName")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OpdDTO> autocompleteForOpd(string changedText, string changedText2)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(changedText2);
                //DateTime TDate = Convert.ToDateTime(changedText3);

                String name = "";

                //var rt = db.HMS_OPDMST.Where(n => n.PATIENTID.StartsWith(changedText) && n.COMPID == compid).Select(n => new
                //{
                //    headname = n.PATIENTID

                //}).ToList();
                List<string> rt = new List<string>();
               var tags = from p in db.HMS_OPDMST
                       where p.COMPID == compid
                       select new { p.PATIENTYYID };
                string date = td.ToString("yyyy-MM-dd");

                string currentyear = date.Substring(2, 2);


                //string currentyear = Convert.ToString(td).Substring(8, 2);
                foreach (var tag in tags)
                {
                    if ((tag.PATIENTYYID.ToString().StartsWith(changedText) == true) &&
                        (tag.PATIENTYYID.ToString().StartsWith(currentyear) == true))
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

                Int64 yearid = Convert.ToInt64(name);

                //var findid = (from n in db.HMS_OPDMST where n.PATIENTID == name && n.COMPID == compid select n).ToList();
                var findid =
                       (from n in db.HMS_OPDMST where n.PATIENTYYID == yearid && n.COMPID == compid select n).ToList();
                if (findid.Count != 0)
                {
                    var returndata = (from t1 in db.HMS_OPDMST
                                      //join t2 in db.HMS_OPD on t1.COMPID equals t2.COMPID
                                      where t1.COMPID == compid && t1.PATIENTYYID == yearid
                                      select new
                                      {

                                          patientyid = t1.PATIENTYYID,
                                          patientname = t1.PATIENTNM,
                                          transdt = t1.TRANSDT,
                                          rf = t1.RFPCNT,
                                          patientid=t1.PATIENTID


                                      });
                    foreach (var item in returndata)
                    {
                        DateTime dd = Convert.ToDateTime(item.transdt);
                        string aa = dd.ToString("dd-MMM-yyyy");
                        yield return new OpdDTO
                        {

                            PatientYearID = Convert.ToInt64(item.patientyid),
                            PatientName = item.patientname,

                            TransactionDate = aa,
                           RfPercentage = item.rf,
                           PatientID = item.patientid
                        };
                    }

                    //var returndata = (from t1 in db.HMS_OPDMST
                    //                  //join t2 in db.HMS_OPD on t1.COMPID equals t2.COMPID
                    //                  where t1.COMPID == compid && t1.PATIENTID == name
                    //                  select new
                    //                  {

                    //                      patientid = t1.PATIENTID,
                    //                      patientname = t1.PATIENTNM,
                    //                      transdt = t1.TRANSDT,
                    //                      rf = t1.RFPCNT


                    //                  });
                    //foreach (var item in returndata)
                    //{
                    //    DateTime dd = Convert.ToDateTime(item.transdt);
                    //    string aa = dd.ToString("dd-MMM-yyyy");
                    //    yield return new OpdDTO
                    //    {

                    //        PatientID = item.patientid,
                    //        PatientName = item.patientname,

                    //        TDateBrother = aa,
                    //        RfPercentage = item.rf
                    //    };
                    //}

                }
                else
                {

                    yield return new OpdDTO
                    {

                        PatientYearID = yearid,
                        PatientName = ""


                    };
                }



            }

        }


        [System.Web.Http.Route("api/ApiOpd/GetData2")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OpdDTO> Get2(string Compid, string TransactionDate, string PatientName, string RfPercentage, string PatienId, string InUserID, string InsLtude)
        {

            //Get Ip ADDRESS,Time & user PC Name
            string strHostName = System.Net.Dns.GetHostName();
            IPHostEntry ipHostInfo = Dns.Resolve(Dns.GetHostName());
            IPAddress ipAddress = ipHostInfo.AddressList[0];

            Int64 InsUserID = Convert.ToInt64(InUserID);
            Int64 compid = Convert.ToInt64(Compid);

            DateTime fdate = DateTime.Parse(TransactionDate);
            string ffdt = fdate.ToString("ddMMyy");

            decimal Rfpercentage = Convert.ToDecimal(RfPercentage);

            
               
              
                    var ff = (from n in db.HMS_OPD where n.COMPID == compid && n.PATIENTID == PatienId select n).ToList();
                    if (ff.Count == 0)
                    {

                        yield return new OpdDTO
                        {

                            COMPID = compid,
                            TransactionDate = Convert.ToString(fdate),
                            PatientID = PatienId,
                            PatientName = PatientName,
                            RfPercentage = Rfpercentage,
                            TestSerial = 0


                        };

                    }
                    else
                    {

                        var opd_data = (from t1 in db.HMS_OPD
                                        join t2 in db.HMS_OPDMST on t1.PATIENTID equals t2.PATIENTID
                                        join t3 in db.HMS_TEST on t1.TESTID equals t3.TESTID
                                        join t4 in db.HMS_TESTMST on t1.TCATID equals t4.TCATID
                                        where t1.COMPID == compid && t1.COMPID == t2.COMPID && t1.PATIENTID == PatienId
                                        select new
                                        {
                                            Id = t1.ID,

                                            compid = t1.COMPID,
                                            Transdate = t1.TRANSDT,
                                            Patientid = t1.PATIENTID,
                                            referid = t1.REFERID,
                                            testsl = t1.TESTSL,
                                            tcatid = t1.TCATID,
                                            tCatname = t4.TCATNM,
                                            testid = t1.TESTID,
                                            testname = t3.TESTNM,
                                            amount = t1.AMOUNT,
                                            pcntr = t1.PCNTR,
                                            pcntd = t1.PCNTD,
                                            discr = t1.DISCR,
                                            remarks = t1.REMARKS


                                        });

                        foreach (var item in opd_data)
                        {

                            yield return new OpdDTO
                            {
                                ID = item.Id,
                                COMPID = item.compid,
                                PatientName = PatientName,
                                TransactionDate = Convert.ToString(item.Transdate),
                                PatientID = item.Patientid,
                                ReferID = item.referid,
                                TestSerial = item.testsl,
                                TestCategoryId = item.tcatid,
                                TestCategoryName = item.tCatname,
                                TestID = item.testid,
                                TestName = item.testname,
                                Amount = item.amount,
                                Pcntd = item.pcntd,
                                Pcntr = item.pcntr,
                                Discr = item.discr,
                                Remarks = item.remarks

                            };
                        }
                    }
                




           


        }

        [System.Web.Http.Route("api/Opd2ndPartdata_fetch")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OpdDTO> Opd2ndPartdata_fetch(string changedText, string changedText2)
        {
            using (var db = new AslHMSApiContext())
            {

                Int64 compid = Convert.ToInt64(changedText2);


                var find_data =
                    (from n in db.HMS_OPDMST where n.COMPID == compid && n.PATIENTID == changedText select n).ToList();
                
                foreach (var opdMaster in find_data)
                {
                    string date = "";
                    if(opdMaster.DVDT!=null)
                    {
                        DateTime dd = Convert.ToDateTime(opdMaster.DVDT);
                         date = dd.ToString("dd-MMM-yyyy");
                    }
                    else
                    {
                        DateTime dd = Convert.ToDateTime(td);
                         date = dd.ToString("dd-MMM-yyyy");
                    }
                   
                    string doctorname = "", refername = "";
                    var finddoctorname =
                        (from n in db.HMS_REFER where n.COMPID == compid && n.REFERID == opdMaster.DOCTORID select n)
                            .ToList();
                    foreach (var refer in finddoctorname)
                    {
                        doctorname = refer.REFERNM;
                    }
                    var findrefername =
                       (from n in db.HMS_REFER where n.COMPID == compid && n.REFERID == opdMaster.REFERID select n)
                           .ToList();
                    foreach (var refer in findrefername)
                    {
                        refername = refer.REFERNM;
                    }
                    yield return new OpdDTO
                    {


                        Gender = opdMaster.GENDER,
                        Age =opdMaster.AGE,
                        Address = opdMaster.ADDRESS,
                        MObileNo = opdMaster.MOBNO,
                        DoctorID =opdMaster.DOCTORID,
                        DoctorName = doctorname,
                        ReferID = opdMaster.REFERID,
                        Refername = refername,
                        TDateBrother = date


                    };
                }
                   // return (from t1 in db.HMS_OPDMST

                   //         where t1.COMPID == compid && t1.PATIENTID == changedText 
                   //         select new
                   //         {
                   //             gender = t1.GENDER,
                   //             age = t1.AGE,
                   //             address = t1.ADDRESS,
                   //             mobileno = t1.MOBNO,
                   //             doctorid = t1.DOCTORID,
                   //             referid=t1.REFERID,
                   //             deliverydt=t1.DVDT



                   //         })
                   //.AsEnumerable().Select(a => new OpdDTO
                   //{

                   //    Gender = a.gender,
                   //    Age = a.age,
                   //    Address = a.address,
                   //    MObileNo = a.mobileno,
                   //    DoctorID = a.doctorid,
                   //    ReferID = a.referid,
                   //    DvDate = a.deliverydt


                   //}).ToList();


               



            }

        }

        [System.Web.Http.Route("apiOpd/focus_check")]
        [System.Web.Http.HttpGet]
        public List<string> check(Int64 Compid, Int64 BillID)
        {
            var search = (from n in db.HMS_HEADIO where n.COMPID == Compid && n.HEADID == BillID select n).ToList();
            List<string>datapass=new List<string>();
            foreach (var headIo in search)
            {
                if (headIo.HEADFOR == "PATHOLOGY")
                {
                    datapass.Add("Pathology");
                    return datapass;
                }
                else if (headIo.HEADFOR == "GENERAL")
                {
                    datapass.Add("General");
                    datapass.Add(Convert.ToString(headIo.RATE));
                    return datapass;
                }

            }
            return null;
        }

    }


}

