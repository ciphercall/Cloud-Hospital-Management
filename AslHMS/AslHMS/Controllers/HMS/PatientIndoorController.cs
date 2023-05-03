using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AslHMS.Models;
using AslHMS.Models.DTO;
using AslHMS.Models.HMS;

namespace AslHMS.Controllers.HMS
{
    public class PatientIndoorController : AppController
    {
        AslHMSApiContext db = new AslHMSApiContext();


        IFormatProvider dateformat = new System.Globalization.CultureInfo("fr-FR", true);
        TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
        public DateTime td;
        public string strHostName;
        public IPHostEntry ipHostInfo;
        public IPAddress ipAddress;

        public PatientIndoorController()
        {

            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];

            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
        }

        // GET: /PatientIndoor/
        public ActionResult Index()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(PatientIndoorDTO model, string command)
        {
            if (command == "Submit")
            {
                var patientidsearch =
                    (from n in db.HMS_IpdDbSet where n.COMPID == model.COMPID && n.PATIENTID == model.PatientID select n)
                        .ToList();
                var patientyearidsearch =
                    (from n in db.HMS_IpdDbSet
                        where n.COMPID == model.COMPID && n.PATIENTYYID == model.PatientYearID
                        select n).ToList();
                Ipd obj=new Ipd();

                if (patientidsearch.Count == 0)
                {
                    if (patientyearidsearch.Count == 0)
                    {
                        obj.COMPID = model.COMPID;
                        obj.TRANSDT = model.TransactionDT;
                        obj.PATIENTNM = model.PatientName;
                        obj.PATIENTID = model.PatientID;
                        obj.PATIENTYYID = model.PatientYearID;
                        obj.PATIENTYY = Convert.ToInt64("20" + Convert.ToString(model.PatientYearID).Substring(0, 2));
                        obj.GUARDIANNM = model.GurdianName;
                        obj.AGE = model.Age;
                        obj.GENDER = model.gender;
                        obj.DOB = model.DateOfBirth;
                        obj.MSTATUS = model.MaritalStatus;
                        obj.RELIGION = model.Religion;
                        obj.OCCUPATION = model.Occupation;
                        obj.TELNO = model.TelephoneNo;
                        obj.MOBNO = model.MobileNo;
                        obj.ADDRPRE = model.PresentAddress;
                        obj.ADDRPER = model.PermanentAddress;
                        obj.ADMITDT = model.AdmitDate;
                        obj.ADMITTM = model.AdmitTime;
                        obj.DOCTORID = model.DoctorID;
                        obj.REFERID = model.ReferID;
                        obj.REMARKS = model.Remarks;
                        obj.PCNTR = model.Percentage;

                        obj.USERPC = strHostName;
                        obj.INSIPNO = ipAddress.ToString();
                        obj.INSLTUDE = model.INSLTUDE;
                        obj.INSUSERID = model.INSUSERID;
                        obj.INSTIME = Convert.ToDateTime(td);

                        db.HMS_IpdDbSet.Add(obj);
                        db.SaveChanges();

                        return RedirectToAction("Index");
                    }
                   
                }
            }
            return View("Index");
        }
	}
}