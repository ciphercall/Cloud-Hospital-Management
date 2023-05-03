using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using AslHMS.Models;
using AslHMS.Models.DTO;

namespace AslHMS.Controllers.Api
{
    public class ApiOpdReceiveController : ApiController
    {

        IFormatProvider dateformat = new System.Globalization.CultureInfo("fr-FR", true);
        TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
        public DateTime td;

        AslHMSApiContext db = new AslHMSApiContext();

        //Get Ip ADDRESS,Time & user PC Name
        public string strHostName;
        public IPHostEntry ipHostInfo;
        public IPAddress ipAddress;

        public ApiOpdReceiveController()
        {
           
            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];
            //td = DateTime.Now;
            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
        }


        [System.Web.Http.Route("api/TransNo")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OpdReceiveDTO> GetTransNo(string query, string query2,string query3)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(query2);
                DateTime Tdate = Convert.ToDateTime(query3);

                //return String.IsNullOrEmpty(query) ? db.HMS_OPDRCV.AsEnumerable().Select(b => new OpdReceiveDTO { }).ToList() :
                //db.HMS_OPDRCV.Where(p => p.TRANSNO.ToString().StartsWith(query) && p.COMPID == compid).Select(
                //          x =>
                //          new
                //          {
                //             transno=x.TRANSNO,
                //              patientid = x.PATIENTID,
                //              date=x.TRANSDT,
                //              month=x.TRANSMY,
                //              patientdueamount=x.DUEAMTP,
                //              discountlab=x.DISCHOS,
                //              netamount=x.NETAMT,
                //              receiveamount=x.RCVAMT,
                //              dueamount=x.DUEAMT,
                //              remarks=x.REMARKS

                             

                //          })
                //.AsEnumerable().Select(a => new OpdReceiveDTO
                //{
                //   TransNo = a.transno,
                //    PatientID = a.patientid,
                //    TransactionDate = a.date,
                //    TransMonthYear = a.month,
                //    PatientDueAmount = a.patientdueamount,
                //    DiscountHos = a.discountlab,
                //    NetAmount = a.netamount,
                //    ReceiveAmount = a.receiveamount,
                //    DueAmount = a.dueamount,
                //    Remarks = a.remarks

                   

                //}).ToList();
                var tags = from p in db.HMS_OPDRCV join t2 in db.HMS_OPDMST on p.PATIENTYYID equals t2.PATIENTYYID
                           where p.COMPID == compid && p.TRANSDT == Tdate
                           select new { p.PATIENTYYID,t2.PATIENTNM, p.TRANSNO, p.TRANSDT,p.TRANSMY,p.DUEAMTP,p.DISCHOS,p.NETAMT,p.RCVAMT,p.DUEAMT,p.REMARKS };

                string date = td.ToString("yyyy-MM-dd");

                string currentyear = date.Substring(2, 2);
                foreach (var tag in tags)
                {
                    if ((tag.PATIENTYYID.ToString().StartsWith(query) == true) && (tag.PATIENTYYID.ToString().StartsWith(currentyear) == true))
                    {
                        DateTime dd = Convert.ToDateTime(tag.TRANSDT);
                        string aa = dd.ToString("dd-MMM-yyyy");

                        yield return new OpdReceiveDTO
                        {
                            TransNo = tag.TRANSNO,
                            PatientYearID = Convert.ToInt64(tag.PATIENTYYID),
                           TransactionDate = aa,
                           TransMonthYear = tag.TRANSMY,
                           PatientDueAmount = tag.DUEAMTP,
                           DiscountHos = tag.DISCHOS,
                           NetAmount = tag.NETAMT,
                           ReceiveAmount = tag.RCVAMT,
                            DueAmount = Convert.ToDecimal(tag.DUEAMT),
                            Remarks = tag.REMARKS,
                            PatientName = tag.PATIENTNM

                        };
                    }

                }
            }
        }

        [System.Web.Http.Route("api/OpdReceive/Dynamicdata")]
        [System.Web.Http.HttpGet]
        public IEnumerable<OpdReceiveDTO> autocompleteForOpdRCV(string changedText, string changedText2, string changedText3)
        {
            using (var db = new AslHMSApiContext())
            {
                Int64 compid = Convert.ToInt64(changedText2);
                DateTime Tdate = Convert.ToDateTime(changedText3);

                String name = "";

                List<string> rt = new List<string>();

                var tags = from p in db.HMS_OPDRCV
                           where p.COMPID == compid && p.TRANSDT == Tdate
                           select new { p.TRANSNO };
               
          
                    string date = td.ToString("yyyy-MM-dd");

                    string currentyear = date.Substring(0, 4);


                    //string currentyear = Convert.ToString(td).Substring(8, 2);
                    foreach (var tag in tags)
                    {
                        if ((tag.TRANSNO.ToString().StartsWith(changedText) == true) &&
                            (tag.TRANSNO.ToString().StartsWith(currentyear) == true))
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

               
              
                    Int64 transno = Convert.ToInt64(name);
                    var findid = (from n in db.HMS_OPDRCV where n.TRANSNO == transno && n.COMPID == compid && n.TRANSDT == Tdate select n).ToList();


                    if (findid.Count != 0)
                    {


                        var returndata = (from t1 in db.HMS_OPDRCV
                            join t2 in db.HMS_OPDMST on t1.PATIENTYYID equals t2.PATIENTYYID


                                          where t1.COMPID == compid && t1.TRANSNO == transno && t1.TRANSDT == Tdate
                                          select new
                                          {
                                              transdt=t1.TRANSDT,
                                              transNo=t1.TRANSNO,
                                             patientyid=t1.PATIENTYYID,
                                             transmy=t1.TRANSMY,
                                             patinetdue=t1.DUEAMTP,
                                             discounthos=t1.DISCHOS,
                                             netamount=t1.NETAMT,
                                             receiveamount=t1.RCVAMT,
                                             dueamount=t1.DUEAMT,
                                             remarks=t1.REMARKS,
                                             patientname=t2.PATIENTNM


                                          });
                        foreach (var item in returndata)
                        {
                            DateTime dd = Convert.ToDateTime(item.transdt);
                            string aa = dd.ToString("dd-MMM-yyyy");
                            yield return new OpdReceiveDTO
                            {
                                TransNo = item.transNo,
                                PatientYearID = Convert.ToInt64(item.patientyid),
                           TransactionDate = aa,
                                TransMonthYear = item.transmy,
                                PatientDueAmount = item.patinetdue,
                                DiscountHos = item.discounthos,
                                NetAmount = item.netamount,
                                ReceiveAmount = item.receiveamount,
                                DueAmount = Convert.ToDecimal(item.dueamount),
                                Remarks = item.remarks,
                                PatientName = item.patientname
                              
                            };
                        }

                    }
                    else
                    {

                        yield return new OpdReceiveDTO
                        {

                            TransNo = transno,
                            PatientYearID = 0,
                            TransactionDate = "",
                            TransMonthYear = "",
                            PatientDueAmount =0,
                            DiscountHos = 0,
                            NetAmount = 0,
                            ReceiveAmount = 0,
                            DueAmount =0,
                            Remarks = "",
                            PatientName = ""


                        };
                    }
        




            }

        }






    }
}
