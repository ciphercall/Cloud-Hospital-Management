using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using AslHMS.Models;
using AslHMS.Models.DTO;
using AslHMS.Models.HMS;

namespace AslHMS.Controllers.HMS
{
    public class BirthController : AppController
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

        public BirthController()
        {
            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];
            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
            ViewData["HighLight_Menu_HMS_Form"] = "High Light Menu";
        }




        public ASL_LOG aslLog = new ASL_LOG();

        // SAVE ALL INFORMATION from HMS_CBIRTH TO Asl_lOG Database Table.
        public void Insert_Birth_LogData(BirthDTO model)
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
            aslLog.TABLEID = "HMS_CBIRTH";

            DateTime date1 = Convert.ToDateTime(model.BIRTHDT);
            string ddt = date1.ToString("dd-MMM-yyyy");
            var brthDate = ddt;

            aslLog.LOGDATA = Convert.ToString("Birth Certificate Entry Page. Transaction No: " + model.TRANSNO + ",\nPatient Type: " + model.PATIENTTP + ",\nPatient ID: " + model.PATIENTID + ",\nPatient Name: " + model.PatientName + ",\nBaby Name: " + model.BABYNM + ",\nBaby Gender: " + model.GENDER + ",\nBirth Date: " + brthDate + ",\nBirth Time: " + model.BIRTHTM + ",\nFile NO: " + model.FILENO + ",\nRemarks: " + model.REMARKS + ".");
            aslLog.USERPC = model.USERPC;
            db.AslLogDbSet.Add(aslLog);
        }

        // Edit ALL INFORMATION from HMS_CBIRTH TO Asl_lOG Database Table.
        public void Update_Birth_LogData(BirthDTO model)
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
            aslLog.TABLEID = "HMS_CBIRTH";

            DateTime date1 = Convert.ToDateTime(model.BIRTHDT);
            string ddt = date1.ToString("dd-MMM-yyyy");
            var brthDate = ddt;

            aslLog.LOGDATA = Convert.ToString("Birth Certificate Entry Page. Transaction No: " + model.TRANSNO + ",\nPatient Type: " + model.PATIENTTP + ",\nPatient ID: " + model.PATIENTID + ",\nPatient Name: " + model.PatientName + ",\nBaby Name: " + model.BABYNM + ",\nBaby Gender: " + model.GENDER + ",\nBirth Date: " + brthDate + ",\nBirth Time: " + model.BIRTHTM + ",\nFile NO: " + model.FILENO + ",\nRemarks: " + model.REMARKS + ".");
            aslLog.USERPC = model.USERPC;
            db.AslLogDbSet.Add(aslLog);
        }

        // Delete ALL INFORMATION from HMS_CBIRTH TO Asl_lOG Database Table.
        public void Delete_Birth_DELETE(BirthDTO model)
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
            aslLog.TABLEID = "HMS_CBIRTH";

            DateTime date1 = Convert.ToDateTime(model.BIRTHDT);
            string ddt = date1.ToString("dd-MMM-yyyy");
            var brthDate = ddt;

            aslLog.LOGDATA = Convert.ToString("Birth Certificate Entry Page. Transaction No: " + model.TRANSNO + ",\nPatient Type: " + model.PATIENTTP + ",\nPatient ID: " + model.PATIENTID + ",\nPatient Name: " + model.PatientName + ",\nBaby Name: " + model.BABYNM + ",\nBaby Gender: " + model.GENDER + ",\nBirth Date: " + brthDate + ",\nBirth Time: " + model.BIRTHTM + ",\nFile NO: " + model.FILENO + ",\nRemarks: " + model.REMARKS + ".");
            aslLog.USERPC = model.USERPC;
            db.AslLogDbSet.Add(aslLog);
        }


        public ASL_DELETE AslDelete = new ASL_DELETE();

        // Delete ALL INFORMATION from HMS_CBIRTH TO ASL_DELETE Database Table.
        public void Delete_Birth_LogData(BirthDTO model)
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
            AslDelete.TABLEID = "HMS_CBIRTH";

            DateTime date1 = Convert.ToDateTime(model.BIRTHDT);
            string ddt = date1.ToString("dd-MMM-yyyy");
            var brthDate = ddt;

            AslDelete.DELDATA = Convert.ToString("Birth Certificate Entry Page. Transaction No: " + model.TRANSNO + ",\nPatient Type: " + model.PATIENTTP + ",\nPatient ID: " + model.PATIENTID + ",\nPatient Name: " + model.PatientName + ",\nBaby Name: " + model.BABYNM + ",\nBaby Gender: " + model.GENDER + ",\nBirth Date: " + brthDate + ",\nBirth Time: " + model.BIRTHTM + ",\nFile NO: " + model.FILENO + ",\nRemarks: " + model.REMARKS + ".");
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
        public ActionResult Create(BirthDTO model)
        {
            if (ModelState.IsValid)
            {
                string current_Year = Convert.ToString(td.ToString("yyyy"));
                string Year = Convert.ToString(current_Year.Substring(2, 2));
                Int64 R = Convert.ToInt64(Year + "999999");


                var findPreviousData = (from m in db.HmsBirthDbSet
                                        where m.COMPID == model.COMPID && m.PATIENTYY == model.PATIENTYY
                                            && m.PATIENTYYID == model.PATIENTYYID
                                        select m).ToList();
                if (findPreviousData.Count == 0)
                {
                    var check_Again_SerialID = (from m in db.HmsBirthDbSet
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
                        TempData["BirthCreationMessage"] = "Not possible entry! ";
                        return RedirectToAction("Create");
                    }


                    model.USERPC = strHostName;
                    model.INSIPNO = ipAddress.ToString();
                    model.INSTIME = Convert.ToDateTime(td);
                    model.INSUSERID = Convert.ToInt64(System.Web.HttpContext.Current.Session["loggedUserID"]);

                    Birth birth = new Birth();
                    birth.COMPID = model.COMPID;
                    birth.TRANSDT = Convert.ToDateTime(model.TRANSDT);
                    birth.TRANSYY = model.TRANSYY;
                    birth.TRANSNO = model.TRANSNO;
                    birth.PATIENTTP = model.PATIENTTP;
                    birth.PATIENTYY = model.PATIENTYY;
                    birth.PATIENTYYID = model.PATIENTYYID;
                    birth.PATIENTID = model.PATIENTID;
                    birth.BABYNM = model.BABYNM;
                    birth.GENDER = model.GENDER;
                    birth.BIRTHDT = Convert.ToDateTime(model.BIRTHDT);
                    birth.BIRTHTM = model.BIRTHTM;
                    birth.FILENO = model.FILENO;
                    birth.REMARKS = model.REMARKS;

                    birth.USERPC = model.USERPC;
                    birth.INSIPNO = model.INSIPNO;
                    birth.INSTIME = model.INSTIME;
                    birth.INSUSERID = Convert.ToInt64(model.INSUSERID);
                    birth.INSLTUDE = model.INSLTUDE;

                    Insert_Birth_LogData(model);
                    db.HmsBirthDbSet.Add(birth);
                    db.SaveChanges();
                    TempData["BirthCreationMessage"] = "Birth Certificate successfully registered! ";
                }
                else
                {
                    TempData["BirthCreationMessage"] = "Patient ID:" + model.PATIENTYYID + " already enrolled!!!";
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
        public ActionResult Update(BirthDTO model)
        {
            if (ModelState.IsValid)
            {
                var result_Find = (from n in db.HmsBirthDbSet
                                   where model.COMPID == n.COMPID && n.TRANSYY == model.TRANSYY && n.TRANSNO == model.TRANSNO
                                   select n).Count();

                if (result_Find == 1)
                {
                    model.USERPC = strHostName;
                    model.UPDIPNO = ipAddress.ToString();
                    model.UPDTIME = Convert.ToDateTime(td);
                    model.UPDUSERID = Convert.ToInt64(System.Web.HttpContext.Current.Session["loggedUserID"]);

                    Update_Birth_LogData(model);
                    db.SaveChanges();

                    Birth birth = new Birth();
                    birth.ID = model.ID;
                    birth.COMPID = model.COMPID;
                    birth.TRANSDT = Convert.ToDateTime(model.TRANSDT);
                    birth.TRANSYY = model.TRANSYY;
                    birth.TRANSNO = model.TRANSNO;
                    birth.PATIENTTP = model.PATIENTTP;
                    birth.PATIENTYY = model.PATIENTYY;
                    birth.PATIENTYYID = model.PATIENTYYID;
                    birth.PATIENTID = model.PATIENTID;
                    birth.BABYNM = model.BABYNM;
                    birth.GENDER = model.GENDER;
                    birth.BIRTHDT = Convert.ToDateTime(model.BIRTHDT);
                    birth.BIRTHTM = model.BIRTHTM;
                    birth.FILENO = model.FILENO;
                    birth.REMARKS = model.REMARKS;

                    birth.USERPC = model.USERPC;
                    birth.INSIPNO = model.INSIPNO;
                    birth.INSTIME = model.INSTIME;
                    birth.INSUSERID = model.INSUSERID;
                    birth.INSLTUDE = model.INSLTUDE;
                    birth.UPDIPNO = model.UPDIPNO;
                    birth.UPDTIME = model.UPDTIME;
                    birth.UPDUSERID = model.UPDUSERID;
                    birth.UPDLTUDE = model.UPDLTUDE;

                    db.Entry(birth).State = EntityState.Modified;
                    db.SaveChanges();

                    TempData["BirthUpdateMessage"] = "Birth certificate successfully updated!";
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
        public ActionResult Delete(BirthDTO model)
        {
            if (ModelState.IsValid)
            {
                var result_Find = (from n in db.HmsBirthDbSet
                                   where model.COMPID == n.COMPID && n.TRANSYY == model.TRANSYY && n.TRANSNO == model.TRANSNO
                                   select n).Count();

                if (result_Find == 1)
                {
                    Birth deleteModel = new Birth();
                    deleteModel.ID = model.ID;
                    deleteModel.COMPID = model.COMPID;
                    deleteModel.TRANSYY = model.TRANSYY;
                    deleteModel.TRANSNO = model.TRANSNO;
                    deleteModel = db.HmsBirthDbSet.Find(deleteModel.ID, deleteModel.COMPID, deleteModel.TRANSYY, deleteModel.TRANSNO);

                    model.USERPC = strHostName;
                    model.UPDIPNO = ipAddress.ToString();
                    model.UPDTIME = Convert.ToDateTime(td);
                    model.UPDUSERID = Convert.ToInt64(System.Web.HttpContext.Current.Session["loggedUserID"]);
                    model.UPDLTUDE = model.UPDLTUDE;

                    Delete_Birth_DELETE(model);
                    Delete_Birth_LogData(model);

                    db.HmsBirthDbSet.Remove(deleteModel);
                    db.SaveChanges();
                    TempData["BirthDeleteMessage"] = "Birth certificate successfully deleted!";
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
            var compid = Convert.ToInt64(System.Web.HttpContext.Current.Session["loggedCompID"].ToString());
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

            String patientNm = "", patientID = "";
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

                                                         });
                foreach (var n in findpatientInfo)
                {
                    patientID = Convert.ToString(n.PATIENTID);
                    patientNm = n.PATIENTNM;
                }

                var checkBirthTable = (from m in db.HmsBirthDbSet
                                       where m.COMPID == compid && m.PATIENTYY == pYear && m.PATIENTYYID == patientYearID
                                       select m).ToList();
                if (checkBirthTable.Count == 1)
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
                ValidationMeassage = ValidationMessageForPatientID,
            };
            return Json(result, JsonRequestBehavior.AllowGet);

        }







        //AutoComplete Birth (Update & Delete page)
        public JsonResult TagSearch_UD_Birth(string term, Int64 compid, Int64 patientYear)
        {
            List<string> result = new List<string>();
            //var compid = Convert.ToInt16(System.Web.HttpContext.Current.Session["loggedCompID"].ToString());
            var tags = from p in db.HmsBirthDbSet where p.COMPID == compid && p.PATIENTYY == patientYear select new { p.PATIENTYYID };
            foreach (var tag in tags)
            {
                result.Add(tag.PATIENTYYID.ToString());
            }
            return this.Json(result.Where(t => t.StartsWith(term)), JsonRequestBehavior.AllowGet);
        }

        //AutoComplete Birth (Update & Delete page)
        [AcceptVerbs(HttpVerbs.Get)]
        public JsonResult keyword_UD_Birth(string changedText, string compid, string pYear)
        {
            //var compid = Convert.ToInt16(System.Web.HttpContext.Current.Session["loggedCompID"].ToString());
            String itemId = "";
            Int64 companyid = Convert.ToInt64(compid);
            Int64 patientYear = Convert.ToInt64(pYear);
            // string changedText = Convert.ToString(changedText1);

            List<string> TransNo_List = new List<string>();
            var tags = from p in db.HmsBirthDbSet
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

            String transDate = "", birthDate = "", birthTime = "", patientID = "", patientNm = "", babyName = "", babyGender = "", fileno = "", remarks = "", inserttime = "", insertIpno = "", insltude = "";
            Int64 Id = 0, companyID = 0, transYear = 0, insertUserId = 0, transNo = 0;

            Regex regex = new Regex("^[0-9]+$");//check its int or string?
            if (regex.IsMatch(itemId))
            {
                Int64 patientYearID = Convert.ToInt64(itemId);
                var findpatientInfo = db.HmsBirthDbSet.Where(n => n.PATIENTYYID == patientYearID && n.PATIENTYY == patientYear &&
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
                                                                 n.BABYNM,
                                                                 n.GENDER,
                                                                 n.BIRTHDT,
                                                                 n.BIRTHTM,
                                                                 n.FILENO,
                                                                 n.REMARKS,
                                                                 insuserid = n.INSUSERID,
                                                                 instime = n.INSTIME,
                                                                 insipno = n.INSIPNO,
                                                                 insltude = n.INSLTUDE

                                                             });
                foreach (var n in findpatientInfo)
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
                    babyName = n.BABYNM;
                    babyGender = n.GENDER;

                    string bDate = Convert.ToString(n.BIRTHDT);
                    DateTime Bdate = DateTime.Parse(bDate);
                    birthDate = Bdate.ToString("dd-MMM-yyyy");

                    birthTime = n.BIRTHTM;
                    fileno = n.FILENO;
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
                BABYNM = babyName,
                GENDER = babyGender,
                BIRTHDT = birthDate,
                BIRTHTM = birthTime,
                FILENO = fileno,
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