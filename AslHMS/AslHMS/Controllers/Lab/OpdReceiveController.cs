using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AslHMS.Models;
using AslHMS.Models.DTO;
using AslHMS.Models.HMS;

namespace AslHMS.Controllers.HM
{
    public class OpdReceiveController : AppController
    {
        AslHMSApiContext db = new AslHMSApiContext();

        IFormatProvider dateformat = new System.Globalization.CultureInfo("fr-FR", true);
        TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
        public DateTime td;

        //Get Ip ADDRESS,Time & user PC Name
        public string strHostName;
        public IPHostEntry ipHostInfo;
        public IPAddress ipAddress;
        public OpdReceiveController()
        {

            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];
            //td = DateTime.Now;
            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
        }

        public ASL_LOG aslLog = new ASL_LOG();
        public void Insert_OpdReceiveLogData(OpdReceiveDTO model)
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
            aslLog.LOGDATA = Convert.ToString("Transaction Date: " + model.TransactionDate + ",\nTransaction Month: " + model.TransMonthYear +
                ",\nTransaction NO: " + model.TransNo + ",\nPatient Id: " + model.PatientID + ",\nPatient Due Amount: " + model.PatientDueAmount + ",\nDiscount(Lab): " + model.DiscountHos +
                ",\nNet Amount: " + model.NetAmount + ",\nReceive AMount: " + model.ReceiveAmount + ",\nDue: " + model.DueAmount +
                ",\nRemarks: " + model.Remarks);
            aslLog.TABLEID = "HMS_OPDRCV";
            aslLog.USERPC = model.USERPC;

            db.AslLogDbSet.Add(aslLog);
        }
        // GET: /OpdReceive/
        [AcceptVerbs("GET")]
        [ActionName("Index")]
        public ActionResult Index()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public JsonResult DateChanged_getMonth(DateTime changedtxt)//with Trans No Generation
        {
            Int64 comid = Convert.ToInt64(System.Web.HttpContext.Current.Session["loggedCompID"]);

            string converttoString = Convert.ToString(changedtxt.ToString("dd-MMM-yyyy"));
            string getYear = converttoString.Substring(9, 2);
            string getMonth = converttoString.Substring(3, 3);
            string Month = getMonth + "-" + getYear;


            string converttoString1 = Convert.ToString(changedtxt.ToString("dd-MM-yyyy"));
            string getyear = converttoString1.Substring(6, 4);
            string getmonth = converttoString1.Substring(3, 2);
            string halftransno = getyear + getmonth;

            var query = from n in db.HMS_OPDRCV where n.COMPID == comid select new { n.TRANSNO };

            Int64 maxvalue = 0, Trans = 0;

            //var nquery = select MAX(TRANSNO) from GL_STRANS where TRANSNO like ('201501%');

            //maxvalue = Convert.ToInt64((from n in db.GlStransDbSet where n.TRANSNO.Contains(halftransno) select n.TRANSNO).Max());
            List<SelectListItem> Transno = new List<SelectListItem>();

            foreach (var x in query)
            {

                string temp = Convert.ToString(x.TRANSNO);
                string substring = temp.Substring(0, 6);
                if (substring == halftransno)
                {
                    Transno.Add(new SelectListItem { Text = x.TRANSNO.ToString(), Value = x.TRANSNO.ToString() });

                }

            }
            string transno = "";
            if (Transno.Count == 0)
            {

                transno = halftransno + "0001";
            }
            else
            {
                maxvalue = Transno.Max(t => Convert.ToInt64(t.Text));
                Int64 temp = maxvalue + 1;
                transno = Convert.ToString(temp);

            }

            var result = new { month = Month, TransNo = transno };
            return Json(result, JsonRequestBehavior.AllowGet);

        }

        [AcceptVerbs("POST")]
        [ActionName("Index")]
        public ActionResult IndexPost(OpdReceiveDTO model)
        {
            if (model.TransMonthYear != null && model.TransNo != null && model.PatientYearID != 0)
            {
                Int64 patientyear=0;
                string patientid = "";
                var findpid =
                    (from n in db.HMS_OPDMST where n.COMPID == model.COMPID && n.PATIENTYYID == model.PatientYearID select n)
                        .ToList();
                foreach (var opdMaster in findpid)
                {
                    patientid = opdMaster.PATIENTID;
                    patientyear = Convert.ToInt64(opdMaster.PATIENTYY);
                }
                OpdReceive obj = new OpdReceive();
                obj.COMPID = model.COMPID;
                obj.TRANSDT = Convert.ToDateTime(model.TransactionDate);
                obj.TRANSMY = model.TransMonthYear;
                obj.TRANSNO = model.TransNo;
                obj.PATIENTID = patientid;
                obj.PATIENTYY = patientyear;
                obj.PATIENTYYID = model.PatientYearID;
                obj.DUEAMTP = model.PatientDueAmount;
                obj.DISCHOS = model.DiscountHos;
                obj.NETAMT = model.NetAmount;
                obj.RCVAMT = model.ReceiveAmount;

                if (model.DueAmount == null)
                {
                    obj.DUEAMT = 0;
                }
                else
                {
                    obj.DUEAMT = model.DueAmount;
                }

                obj.REMARKS = model.Remarks;

                obj.USERPC = strHostName;
                obj.INSIPNO = ipAddress.ToString();
                obj.INSTIME = Convert.ToDateTime(td);

                obj.INSUSERID = Convert.ToInt64(System.Web.HttpContext.Current.Session["loggedUserID"]);
                obj.INSLTUDE = model.INSLTUDE;

                model.INSUSERID = obj.INSUSERID;
                model.INSTIME = obj.INSTIME;
                model.INSIPNO = obj.INSIPNO;
                model.USERPC = obj.USERPC;

                db.HMS_OPDRCV.Add(obj);
                Insert_OpdReceiveLogData(model);
                db.SaveChanges();


            }
            return RedirectToAction("Index");
        }


        //----------------------------Update start-------------------------

        [AcceptVerbs("GET")]
        [ActionName("Update")]
        public ActionResult Update()
        {
            return View();
        }

        public void Update_OpdReceiveLogData(OpdReceiveDTO model)
        {
            TimeZoneInfo timeZoneInfo;
            timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
            DateTime PrintDate = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
            var date = Convert.ToString(PrintDate.ToString("dd-MMM-yyyy"));
            var time = Convert.ToString(PrintDate.ToString("hh:mm:ss tt"));

            Int64 maxSerialNo = Convert.ToInt64((from n in db.AslLogDbSet where n.COMPID == model.COMPID && n.USERID == model.UPDUSERID select n.LOGSLNO).Max());
            if (maxSerialNo == 0)
            {
                aslLog.LOGSLNO = Convert.ToInt64("1");
            }
            else
            {
                aslLog.LOGSLNO = maxSerialNo + 1;
            }

            aslLog.COMPID = Convert.ToInt64(model.COMPID);
            aslLog.USERID = Convert.ToInt64(model.UPDUSERID);
            aslLog.LOGTYPE = "Update";
            aslLog.LOGSLNO = aslLog.LOGSLNO;
            aslLog.LOGDATE = Convert.ToDateTime(date);
            aslLog.LOGTIME = Convert.ToString(time);
            aslLog.LOGIPNO = model.UPDIPNO;
            aslLog.LOGLTUDE = model.UPDLTUDE;
            aslLog.LOGDATA = Convert.ToString("Transaction Date: " + model.TransactionDate + ",\nTransaction Month: " + model.TransMonthYear +
                ",\nTransaction NO: " + model.TransNo + ",\nPatient Id: " + model.PatientID + ",\nPatient Due Amount: " + model.PatientDueAmount + ",\nDiscount(Lab): " + model.DiscountHos +
                ",\nNet Amount: " + model.NetAmount + ",\nReceive AMount: " + model.ReceiveAmount + ",\nDue: " + model.DueAmount +
                ",\nRemarks: " + model.Remarks);
            aslLog.TABLEID = "HMS_OPDRCV";
            aslLog.USERPC = model.USERPC;

            db.AslLogDbSet.Add(aslLog);
        }




         [AcceptVerbs("POST")]
        [ActionName("Update")]
        public ActionResult UpdatePost(OpdReceiveDTO model)
         {

             var find_transnodata =
                 (from n in db.HMS_OPDRCV where n.COMPID == model.COMPID && n.TRANSNO == model.TransNo select n).ToList();
                //OpdReceive obj = new OpdReceive();
             foreach (var opdReceive in find_transnodata)
             {
                 opdReceive.COMPID = model.COMPID;
                 opdReceive.TRANSDT = opdReceive.TRANSDT;
                 opdReceive.TRANSMY = opdReceive.TRANSMY;
                 opdReceive.TRANSNO = opdReceive.TRANSNO;
                 opdReceive.PATIENTID = opdReceive.PATIENTID;
                 opdReceive.PATIENTYY = opdReceive.PATIENTYY;
                 opdReceive.PATIENTYYID = opdReceive.PATIENTYYID;
                 opdReceive.DUEAMTP = model.PatientDueAmount;
                 opdReceive.DISCHOS = model.DiscountHos;
                 opdReceive.NETAMT = model.NetAmount;
                 opdReceive.RCVAMT = model.ReceiveAmount;

                 if (model.DueAmount == null)
                 {
                     opdReceive.DUEAMT = 0;
                 }
                 else
                 {
                     opdReceive.DUEAMT = model.DueAmount;
                 }

                 opdReceive.REMARKS = model.Remarks;

                 opdReceive.USERPC = strHostName;
                 opdReceive.INSIPNO = opdReceive.INSIPNO;
                 opdReceive.INSTIME = opdReceive.INSTIME;

                 opdReceive.INSUSERID = opdReceive.INSUSERID;
                 opdReceive.INSLTUDE = opdReceive.INSLTUDE;

                
                 opdReceive.UPDIPNO = ipAddress.ToString();
                 opdReceive.UPDTIME = Convert.ToDateTime(td);

                 opdReceive.UPDUSERID = Convert.ToInt64(System.Web.HttpContext.Current.Session["loggedUserID"]);
                 opdReceive.UPDLTUDE = model.INSLTUDE;

                 model.UPDUSERID = opdReceive.UPDUSERID;
                 model.UPDTIME = opdReceive.UPDTIME;
                 model.UPDIPNO = opdReceive.UPDIPNO;
                 model.USERPC = opdReceive.USERPC;
                 model.UPDLTUDE = opdReceive.UPDLTUDE;
               
                 Update_OpdReceiveLogData(model);
                 db.SaveChanges();
             }
                


           
            return RedirectToAction("Update");
        }



    }
}