using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using AslHMS.Models;
using AslHMS.Models.DTO;
using AslHMS.Models.HMS;

namespace AslHMS.Controllers.HMS
{
    public class DeathController : AppController
    {
        private AslHMSApiContext db = new AslHMSApiContext();

        //Datetime formet
        IFormatProvider dateformat = new System.Globalization.CultureInfo("fr-FR", true);
        TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
        public DateTime td;

        //Get Ip ADDRESS,Time & user PC Name
        public string strHostName;
        public IPHostEntry ipHostInfo;
        public IPAddress ipAddress;

        public DeathController()
        {
            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];
            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);

            ViewData["HighLight_Menu_HMS_Form"] = "High Light Menu";
        }







        public ASL_LOG aslLog = new ASL_LOG();

        // SAVE ALL INFORMATION from HMS_CDEATH TO Asl_lOG Database Table.
        public void Insert_Death_LogData(DeathDTO model)
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
            aslLog.USERID = model.INSUSERID;
            aslLog.LOGTYPE = "INSERT";
            aslLog.LOGSLNO = aslLog.LOGSLNO;
            aslLog.LOGDATE = Convert.ToDateTime(date);
            aslLog.LOGTIME = Convert.ToString(time);
            aslLog.LOGIPNO = model.INSIPNO;
            aslLog.LOGLTUDE = model.INSLTUDE;
            aslLog.TABLEID = "HMS_CDEATH";

            DateTime date1 = Convert.ToDateTime(model.DEATHDT);
            string ddt = date1.ToString("dd-MMM-yyyy");
            var deathDate = ddt;

            string consult = "", doctor = "";
            var DCONSULTID = Convert.ToInt64(model.DCONSULTID);
            var DDOCTORID = Convert.ToInt64(model.DDOCTORID);
            var find_Consultinfo = (from n in db.HMS_REFER where n.COMPID == model.COMPID & n.REFERID == DCONSULTID select n).ToList();
            foreach (var x in find_Consultinfo)
            {
                consult = x.REFERNM;
            }
            var find_Doctorinfo = (from n in db.HMS_REFER where n.COMPID == model.COMPID & n.REFERID == DDOCTORID select n).ToList();
            foreach (var y in find_Doctorinfo)
            {
                doctor = y.REFERNM;
            }
            aslLog.LOGDATA = Convert.ToString("Death Certificate Entry Page. Transaction No: " + model.TRANSNO + ",\nPatient Type: " + model.PATIENTTP + ",\nPatient ID: " + model.PATIENTID + ",\nPatient Name: " + model.PatientName + ",\nDeath Date: " + deathDate + ",\nDeath Time: " + model.DEATHTM + ",\nConsult Name: " + consult + ",\nDoctor Name: " + doctor + ",\nCause A: " + model.DCAUSE_A + ",\nCause B: " + model.DCAUSE_B + ",\nCause C: " + model.DCAUSE_C + ",\nRemarks: " + model.REMARKS + ".");
            aslLog.USERPC = model.USERPC;
            db.AslLogDbSet.Add(aslLog);
        }

        // Edit ALL INFORMATION from HMS_CDEATH TO Asl_lOG Database Table.
        public void Update_Death_LogData(DeathDTO model)
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
            aslLog.USERID = model.UPDUSERID;
            aslLog.LOGTYPE = "UPDATE";
            aslLog.LOGSLNO = aslLog.LOGSLNO;
            aslLog.LOGDATE = Convert.ToDateTime(date);
            aslLog.LOGTIME = Convert.ToString(time);
            aslLog.LOGIPNO = model.UPDIPNO;
            aslLog.LOGLTUDE = model.UPDLTUDE;
            aslLog.TABLEID = "HMS_CDEATH";

            DateTime date1 = Convert.ToDateTime(model.DEATHDT);
            string ddt = date1.ToString("dd-MMM-yyyy");
            var deathDate = ddt;

            string consult = "", doctor = "";
            var DCONSULTID = Convert.ToInt64(model.DCONSULTID);
            var DDOCTORID = Convert.ToInt64(model.DDOCTORID);
            var find_Consultinfo = (from n in db.HMS_REFER where n.COMPID == model.COMPID & n.REFERID == DCONSULTID select n).ToList();
            foreach (var x in find_Consultinfo)
            {
                consult = x.REFERNM;
            }
            var find_Doctorinfo = (from n in db.HMS_REFER where n.COMPID == model.COMPID & n.REFERID == DDOCTORID select n).ToList();
            foreach (var y in find_Doctorinfo)
            {
                doctor = y.REFERNM;
            }

            aslLog.LOGDATA = Convert.ToString("Death Certificate Entry Page. Transaction No: " + model.TRANSNO + ",\nPatient Type: " + model.PATIENTTP + ",\nPatient ID: " + model.PATIENTID + ",\nPatient Name: " + model.PatientName + ",\nDeath Date: " + deathDate + ",\nDeath Time: " + model.DEATHTM + ",\nConsult Name: " + consult + ",\nDoctor Name: " + doctor + ",\nCause A: " + model.DCAUSE_A + ",\nCause B: " + model.DCAUSE_B + ",\nCause C: " + model.DCAUSE_C + ",\nRemarks: " + model.REMARKS + ".");
            aslLog.USERPC = model.USERPC;
            db.AslLogDbSet.Add(aslLog);
        }

        // Delete ALL INFORMATION from HMS_CDEATH TO Asl_lOG Database Table.
        public void Delete_Death_DELETE(DeathDTO model)
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
            aslLog.USERID = model.UPDUSERID;
            aslLog.LOGTYPE = "DELETE";
            aslLog.LOGSLNO = aslLog.LOGSLNO;
            aslLog.LOGDATE = Convert.ToDateTime(date);
            aslLog.LOGTIME = Convert.ToString(time);
            aslLog.LOGIPNO = model.UPDIPNO;
            aslLog.LOGLTUDE = model.UPDLTUDE;
            aslLog.TABLEID = "HMS_CDEATH";

            DateTime date1 = Convert.ToDateTime(model.DEATHDT);
            string ddt = date1.ToString("dd-MMM-yyyy");
            var deathDate = ddt;

            string consult = "", doctor = "";
            var DCONSULTID = Convert.ToInt64(model.DCONSULTID);
            var DDOCTORID = Convert.ToInt64(model.DDOCTORID);
            var find_Consultinfo = (from n in db.HMS_REFER where n.COMPID == model.COMPID & n.REFERID == DCONSULTID select n).ToList();
            foreach (var x in find_Consultinfo)
            {
                consult = x.REFERNM;
            }
            var find_Doctorinfo = (from n in db.HMS_REFER where n.COMPID == model.COMPID & n.REFERID == DDOCTORID select n).ToList();
            foreach (var y in find_Doctorinfo)
            {
                doctor = y.REFERNM;
            }

            aslLog.LOGDATA = Convert.ToString("Death Certificate Entry Page. Transaction No: " + model.TRANSNO + ",\nPatient Type: " + model.PATIENTTP + ",\nPatient ID: " + model.PATIENTID + ",\nPatient Name: " + model.PatientName + ",\nDeath Date: " + deathDate + ",\nDeath Time: " + model.DEATHTM + ",\nConsult Name: " + consult + ",\nDoctor Name: " + doctor + ",\nCause A: " + model.DCAUSE_A + ",\nCause B: " + model.DCAUSE_B + ",\nCause C: " + model.DCAUSE_C + ",\nRemarks: " + model.REMARKS + ".");
            aslLog.USERPC = model.USERPC;
            db.AslLogDbSet.Add(aslLog);
        }


        public ASL_DELETE AslDelete = new ASL_DELETE();

        // Delete ALL INFORMATION from HMS_CDEATH TO ASL_DELETE Database Table.
        public void Delete_Death_LogData(DeathDTO model)
        {
            TimeZoneInfo timeZoneInfo;
            timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
            DateTime PrintDate = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
            var date = Convert.ToString(PrintDate.ToString("dd-MMM-yyyy"));
            var time = Convert.ToString(PrintDate.ToString("HH:mm:ss tt"));

            Int64 maxSerialNo = Convert.ToInt64((from n in db.AslDeleteDbSet where n.COMPID == model.COMPID && n.USERID == model.UPDUSERID select n.DELSLNO).Max());
            if (maxSerialNo == 0)
            {
                AslDelete.DELSLNO = Convert.ToInt64("1");
            }
            else
            {
                AslDelete.DELSLNO = maxSerialNo + 1;
            }

            AslDelete.COMPID = Convert.ToInt64(model.COMPID);
            AslDelete.USERID = model.UPDUSERID;
            AslDelete.DELSLNO = AslDelete.DELSLNO;
            AslDelete.DELDATE = Convert.ToString(date);
            AslDelete.DELTIME = Convert.ToString(time);
            AslDelete.DELIPNO = model.UPDIPNO;
            AslDelete.DELLTUDE = model.UPDLTUDE;
            AslDelete.TABLEID = "HMS_CDEATH";

            DateTime date1 = Convert.ToDateTime(model.DEATHDT);
            string ddt = date1.ToString("dd-MMM-yyyy");
            var deathDate = ddt;

            string consult = "", doctor = "";
            var DCONSULTID = Convert.ToInt64(model.DCONSULTID);
            var DDOCTORID = Convert.ToInt64(model.DDOCTORID);
            var find_Consultinfo = (from n in db.HMS_REFER where n.COMPID == model.COMPID & n.REFERID == DCONSULTID select n).ToList();
            foreach (var x in find_Consultinfo)
            {
                consult = x.REFERNM;
            }
            var find_Doctorinfo = (from n in db.HMS_REFER where n.COMPID == model.COMPID & n.REFERID == DDOCTORID select n).ToList();
            foreach (var y in find_Doctorinfo)
            {
                doctor = y.REFERNM;
            }

            AslDelete.DELDATA = Convert.ToString("Death Certificate Entry Page. Transaction No: " + model.TRANSNO + ",\nPatient Type: " + model.PATIENTTP + ",\nPatient ID: " + model.PATIENTID + ",\nPatient Name: " + model.PatientName + ",\nDeath Date: " + deathDate + ",\nDeath Time: " + model.DEATHTM + ",\nConsult Name: " + consult + ",\nDoctor Name: " + doctor + ",\nCause A: " + model.DCAUSE_A + ",\nCause B: " + model.DCAUSE_B + ",\nCause C: " + model.DCAUSE_C + ",\nRemarks: " + model.REMARKS + ".");
            AslDelete.USERPC = model.USERPC;
            db.AslDeleteDbSet.Add(AslDelete);
        }





        //Get
        public ActionResult Create()
        {
            return View();
        }

        //post
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(DeathDTO model)
        {
            if (ModelState.IsValid)
            {
                string current_Year = Convert.ToString(td.ToString("yyyy"));
                string Year = Convert.ToString(current_Year.Substring(2, 2));
                Int64 R = Convert.ToInt64(Year + "999999");

                var findPreviousData = (from m in db.HmsDeathDbSet
                                        where m.COMPID == model.COMPID && m.PATIENTYY == model.PATIENTYY
                                            && m.PATIENTYYID == model.PATIENTYYID
                                        select m).ToList();
                if (findPreviousData.Count == 0)
                {
                    var check_Again_SerialID = (from m in db.HmsDeathDbSet
                                                where m.COMPID == model.COMPID && m.TRANSYY == model.TRANSYY && m.TRANSNO == model.TRANSNO
                                                select m).ToList();

                    if (check_Again_SerialID.Count == 0)
                    {

                    }
                    else if (model.TRANSNO <= R && check_Again_SerialID.Count != 0)
                    {
                        model.TRANSNO = model.TRANSNO + 1;
                    }
                    else
                    {
                        TempData["DeathCreationMessage"] = "Not possible entry! ";
                        return RedirectToAction("Create");
                    }


                    model.USERPC = strHostName;
                    model.INSIPNO = ipAddress.ToString();
                    model.INSTIME = Convert.ToDateTime(td);
                    model.INSUSERID = Convert.ToInt64(System.Web.HttpContext.Current.Session["loggedUserID"]);

                    Death death = new Death();
                    death.COMPID = model.COMPID;
                    death.TRANSDT = Convert.ToDateTime(model.TRANSDT);
                    death.TRANSYY = model.TRANSYY;
                    death.TRANSNO = model.TRANSNO;
                    death.PATIENTTP = model.PATIENTTP;
                    death.PATIENTYY = model.PATIENTYY;
                    death.PATIENTYYID = model.PATIENTYYID;
                    death.PATIENTID = model.PATIENTID;
                    death.DEATHDT = Convert.ToDateTime(model.DEATHDT);
                    death.DEATHTM = model.DEATHTM;
                    death.DCONSULTID = model.DCONSULTID;
                    death.DDOCTORID = model.DDOCTORID;
                    death.DCAUSE_A = model.DCAUSE_A;
                    death.DCAUSE_B = model.DCAUSE_B;
                    death.DCAUSE_C = model.DCAUSE_C;
                    death.REMARKS = model.REMARKS;

                    death.USERPC = model.USERPC;
                    death.INSIPNO = model.INSIPNO;
                    death.INSTIME = model.INSTIME;
                    death.INSUSERID = Convert.ToInt64(model.INSUSERID);
                    death.INSLTUDE = model.INSLTUDE;

                    Insert_Death_LogData(model);
                    db.HmsDeathDbSet.Add(death);
                    db.SaveChanges();
                    TempData["DeathCreationMessage"] = "Death Certificate successfully registered! ";
                }
                else
                {
                    TempData["DeathCreationMessage"] = "Patient ID:" + model.PATIENTYYID + " already enrolled!!!";
                }


            }

            return RedirectToAction("Create");
        }





        //Get
        public ActionResult Update()
        {
            return View();
        }

        //post
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update(DeathDTO model)
        {
            if (ModelState.IsValid)
            {
                var result_Find = (from n in db.HmsDeathDbSet
                                   where model.COMPID == n.COMPID && n.TRANSYY == model.TRANSYY && n.TRANSNO == model.TRANSNO
                                   select n).Count();

                if (result_Find == 1)
                {
                    model.USERPC = strHostName;
                    model.UPDIPNO = ipAddress.ToString();
                    model.UPDTIME = Convert.ToDateTime(td);
                    model.UPDUSERID = Convert.ToInt64(System.Web.HttpContext.Current.Session["loggedUserID"]);

                    Update_Death_LogData(model);
                    db.SaveChanges();

                    Death death = new Death();
                    death.ID = model.ID;
                    death.COMPID = model.COMPID;
                    death.TRANSDT = Convert.ToDateTime(model.TRANSDT);
                    death.TRANSYY = model.TRANSYY;
                    death.TRANSNO = model.TRANSNO;
                    death.PATIENTTP = model.PATIENTTP;
                    death.PATIENTYY = model.PATIENTYY;
                    death.PATIENTYYID = model.PATIENTYYID;
                    death.PATIENTID = model.PATIENTID;
                    death.DEATHDT = Convert.ToDateTime(model.DEATHDT);
                    death.DEATHTM = model.DEATHTM;
                    death.DCONSULTID = model.DCONSULTID;
                    death.DDOCTORID = model.DDOCTORID;
                    death.DCAUSE_A = model.DCAUSE_A;
                    death.DCAUSE_B = model.DCAUSE_B;
                    death.DCAUSE_C = model.DCAUSE_C;
                    death.REMARKS = model.REMARKS;

                    death.USERPC = model.USERPC;
                    death.INSIPNO = model.INSIPNO;
                    death.INSTIME = model.INSTIME;
                    death.INSUSERID = model.INSUSERID;
                    death.INSLTUDE = model.INSLTUDE;
                    death.UPDIPNO = model.UPDIPNO;
                    death.UPDTIME = model.UPDTIME;
                    death.UPDUSERID = model.UPDUSERID;
                    death.UPDLTUDE = model.UPDLTUDE;

                    db.Entry(death).State = EntityState.Modified;
                    db.SaveChanges();

                    TempData["DeathUpdateMessage"] = "Death certificate successfully updated!";
                    return RedirectToAction("Update");
                }
            }
            return RedirectToAction("Update");
        }






        //Get
        public ActionResult Delete()
        {
            return View();
        }

        //post
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(DeathDTO model)
        {
            if (ModelState.IsValid)
            {
                var result_Find = (from n in db.HmsDeathDbSet
                                   where model.COMPID == n.COMPID && n.TRANSYY == model.TRANSYY && n.TRANSNO == model.TRANSNO
                                   select n).Count();

                if (result_Find == 1)
                {
                    Death deleteModel = new Death();
                    deleteModel.ID = model.ID;
                    deleteModel.COMPID = model.COMPID;
                    deleteModel.TRANSYY = model.TRANSYY;
                    deleteModel.TRANSNO = model.TRANSNO;
                    deleteModel = db.HmsDeathDbSet.Find(deleteModel.ID, deleteModel.COMPID, deleteModel.TRANSYY, deleteModel.TRANSNO);

                    model.USERPC = strHostName;
                    model.UPDIPNO = ipAddress.ToString();
                    model.UPDTIME = Convert.ToDateTime(td);
                    model.UPDUSERID = Convert.ToInt64(System.Web.HttpContext.Current.Session["loggedUserID"]);
                    model.UPDLTUDE = model.UPDLTUDE;

                    Delete_Death_DELETE(model);
                    Delete_Death_LogData(model);

                    db.HmsDeathDbSet.Remove(deleteModel);
                    db.SaveChanges();
                    TempData["DeathDeleteMessage"] = "Death certificate successfully deleted!";
                    return RedirectToAction("Delete");
                }
            }
            return RedirectToAction("Update");
        }



        //AutoComplete
        public JsonResult TagSearch_PatientInfo(string term, Int64 patientYear)
        {
            List<string> result = new List<string>();
            var compid = Convert.ToInt16(System.Web.HttpContext.Current.Session["loggedCompID"].ToString());
            var tags = from p in db.HMS_IpdDbSet where p.COMPID == compid && p.PATIENTYY == patientYear select new { p.PATIENTYYID };
            foreach (var tag in tags)
            {
                result.Add(tag.PATIENTYYID.ToString());
            }
            return this.Json(result.Where(t => t.StartsWith(term)), JsonRequestBehavior.AllowGet);
        }

        //AutoComplete 
        [AcceptVerbs(HttpVerbs.Get)]
        public JsonResult keyword_PatientInfo(string changedText, string patientYear)
        {
            var compid = Convert.ToInt16(System.Web.HttpContext.Current.Session["loggedCompID"].ToString());
            String itemId = "";
            Int64 pYear = Convert.ToInt64(patientYear);
            List<string> patientIDM_List = new List<string>();
            var tags = from p in db.HMS_IpdDbSet
                       where p.COMPID == compid && p.PATIENTYY == pYear
                       select new { p.PATIENTYYID, p.COMPID };
            foreach (var tag in tags)
            {
                patientIDM_List.Add(tag.PATIENTYYID.ToString());
            }

            var rt = patientIDM_List.Where(t => t.StartsWith(changedText)).ToList();

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
                    itemId = changedText.Substring(0, lenChangedtxt);
                }

                else
                {
                    itemId = changedText.Substring(0, lenChangedtxt - 1);
                }
            }
            else
            {
                itemId = changedText;
            }

            String patientNm = "", patientID = "", dDoctorID = "", doctorName = "";
            Int64 ValidationMessageForPatientID = 0;

            Regex regex = new Regex("^[0-9]+$");//check its int or string?
            if (regex.IsMatch(itemId))
            {
                Int64 patientYearID = Convert.ToInt64(itemId);
                var findpatientInfo = db.HMS_IpdDbSet.Where(n => n.PATIENTYYID == patientYearID && n.PATIENTYY == pYear &&
                                                        n.COMPID == compid).Select(n => new
                                                        {
                                                            n.PATIENTNM,
                                                            n.PATIENTYY,
                                                            n.PATIENTYYID,
                                                            n.PATIENTID,
                                                            n.DOCTORID,
                                                        });
                foreach (var n in findpatientInfo)
                {
                    patientID = Convert.ToString(n.PATIENTID);
                    patientNm = n.PATIENTNM;
                    dDoctorID = Convert.ToString(n.DOCTORID);
                }

                Int64 doctorID = Convert.ToInt64(dDoctorID);
                var find_DoctorName = db.HMS_REFER.Where(n => n.REFERID == doctorID && n.COMPID == compid).Select(n => new { n.REFERNM });

                foreach (var n in find_DoctorName)
                {
                    doctorName = n.REFERNM;
                }

                var checkDeathTable = (from m in db.HmsDeathDbSet
                                       where m.COMPID == compid && m.PATIENTYY == pYear && m.PATIENTYYID == patientYearID
                                       select m).ToList();
                if (checkDeathTable.Count == 1)
                {
                    ValidationMessageForPatientID = 1;
                }
                else
                {
                    ValidationMessageForPatientID = 0;
                }
            }

            var result = new
            {
                PATIENTYYID = itemId,

                PATIENTID = patientID,
                PATIENTNM = patientNm,
                DDOCTORID = dDoctorID,
                DOCTORNAME = doctorName,
                ValidationMeassage = ValidationMessageForPatientID,
            };
            return Json(result, JsonRequestBehavior.AllowGet);

        }




        //AutoComplete Birth (Update & Delete page)
        public JsonResult TagSearch_UD_Death(string term, Int64 compid, Int64 patientYear)
        {
            List<string> result = new List<string>();
            //var compid = Convert.ToInt16(System.Web.HttpContext.Current.Session["loggedCompID"].ToString());
            var tags = from p in db.HmsDeathDbSet where p.COMPID == compid && p.PATIENTYY == patientYear select new { p.PATIENTYYID };
            foreach (var tag in tags)
            {
                result.Add(tag.PATIENTYYID.ToString());
            }
            return this.Json(result.Where(t => t.StartsWith(term)), JsonRequestBehavior.AllowGet);
        }

        //AutoComplete Birth (Update & Delete page)
        [AcceptVerbs(HttpVerbs.Get)]
        public JsonResult keyword_UD_Death(string changedText, string compid, string pYear)
        {
            //var compid = Convert.ToInt16(System.Web.HttpContext.Current.Session["loggedCompID"].ToString());
            String itemId = "";
            Int64 companyid = Convert.ToInt64(compid);
            Int64 patientYear = Convert.ToInt64(pYear);
            // string changedText = Convert.ToString(changedText1);

            List<string> TransNo_List = new List<string>();
            var tags = from p in db.HmsDeathDbSet
                       where p.COMPID == companyid && p.PATIENTYY == patientYear
                       select new { p.PATIENTYYID, p.COMPID };
            foreach (var tag in tags)
            {
                TransNo_List.Add(tag.PATIENTYYID.ToString());
            }

            var rt = TransNo_List.Where(t => t.StartsWith(changedText)).ToList();

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
                    itemId = changedText.Substring(0, lenChangedtxt);
                }

                else
                {
                    itemId = changedText.Substring(0, lenChangedtxt - 1);
                }
            }
            else
            {
                itemId = changedText;
            }

            String transDate = "", deathDate = "", deathTime = "", patientID = "", patientNm = "", dConsultID = "", dDoctorID = "", doctorName = "", dCause_A = "", dCause_B = "", dCause_C = "", remarks = "", inserttime = "", insertIpno = "", insltude = "";
            Int64 Id = 0, companyID = 0, transYear = 0, insertUserId = 0, transNo = 0;

            Regex regex = new Regex("^[0-9]+$");//check its int or string?
            if (regex.IsMatch(itemId))
            {
                Int64 patientYearID = Convert.ToInt64(itemId);
                var findInfo = db.HmsDeathDbSet.Where(n => n.PATIENTYYID == patientYearID && n.PATIENTYY == patientYear &&
                                                             n.COMPID == companyid).Select(n => new
                                                             {
                                                                 n.ID,
                                                                 n.COMPID,
                                                                 n.TRANSDT,
                                                                 n.TRANSYY,
                                                                 n.TRANSNO,
                                                                 n.PATIENTTP,
                                                                 n.PATIENTYY,
                                                                 n.PATIENTYYID,
                                                                 n.PATIENTID,
                                                                 n.DEATHDT,
                                                                 n.DEATHTM,
                                                                 n.DCONSULTID,
                                                                 n.DDOCTORID,
                                                                 n.DCAUSE_A,
                                                                 n.DCAUSE_B,
                                                                 n.DCAUSE_C,
                                                                 n.REMARKS,
                                                                 insuserid = n.INSUSERID,
                                                                 instime = n.INSTIME,
                                                                 insipno = n.INSIPNO,
                                                                 insltude = n.INSLTUDE

                                                             });
                foreach (var n in findInfo)
                {
                    Id = n.ID;
                    companyID = Convert.ToInt64(n.COMPID);
                    transNo = Convert.ToInt64(n.TRANSNO);

                    string tDate = Convert.ToString(n.TRANSDT);
                    DateTime Tdate = DateTime.Parse(tDate);
                    transDate = Tdate.ToString("dd-MMM-yyyy");

                    transYear = Convert.ToInt64(n.TRANSYY);
                    //patientYear = Convert.ToInt64(n.PATIENTYY);
                    //patientYearID = Convert.ToInt64(n.PATIENTYYID);
                    patientID = n.PATIENTID;

                    string bDate = Convert.ToString(n.DEATHDT);
                    DateTime Bdate = DateTime.Parse(bDate);
                    deathDate = Bdate.ToString("dd-MMM-yyyy");

                    deathTime = n.DEATHTM;
                    dConsultID = n.DCONSULTID;
                    dDoctorID = n.DDOCTORID;
                    dCause_A = n.DCAUSE_A;
                    dCause_B = n.DCAUSE_B;
                    dCause_C = n.DCAUSE_C;
                    remarks = n.REMARKS;

                    insertUserId = n.insuserid;
                    inserttime = Convert.ToString(n.instime);
                    insertIpno = Convert.ToString(n.insipno);
                    insltude = Convert.ToString(n.insltude);
                }

                var find_PatientName = db.HMS_IpdDbSet.Where(n => n.PATIENTID == patientID &&
                                                                    n.COMPID == companyid).Select(n => new { n.PATIENTNM });
                foreach (var m in find_PatientName)
                {
                    patientNm = m.PATIENTNM;
                }

                Int64 doctorID = Convert.ToInt64(dDoctorID);
                var find_DoctorName = db.HMS_REFER.Where(n => n.REFERID == doctorID && n.COMPID == companyid).Select(n => new { n.REFERNM });

                foreach (var n in find_DoctorName)
                {
                    doctorName = n.REFERNM;
                }
            }

            var result = new
            {
                PATIENTYYID = itemId,

                ID = Id,
                TRANSNO = transNo,
                COMPID = companyID,
                TRANSDT = transDate,
                TRANSYY = transYear,
                //PATIENTYY = patientYear,
                PATIENTID = patientID,
                PATIENTNM = patientNm,
                DEATHDT = deathDate,
                DEATHTM = deathTime,
                DCONSULTID = dConsultID,
                DDOCTORID = dDoctorID,
                DOCTORNAME = doctorName,
                DCAUSE_A = dCause_A,
                DCAUSE_B = dCause_B,
                DCAUSE_C = dCause_C,
                REMARKS = remarks,

                INSUSERID = insertUserId,
                INSTIME = inserttime,
                INSIPNO = insertIpno,
                INSLTUDE = insltude
            };
            return Json(result, JsonRequestBehavior.AllowGet);

        }



    }
}