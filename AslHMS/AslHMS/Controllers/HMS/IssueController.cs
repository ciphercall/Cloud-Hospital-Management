using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using AslHMS.Models;
using AslHMS.Models.DTO;
using AslHMS.Models.HMS;

namespace AslHMS.Controllers.HMS
{
    public class IssueController : AppController
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

        public IssueController()
        {
            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];
            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);

            ViewData["HighLight_Menu_HMS_Form"] = "High Light Menu";
        }





        public ASL_LOG aslLog = new ASL_LOG();


        // SAVE ALL INFORMATION from cart(Issue Master) TO Asl_lOG Database Table.
        public void Insert_PharmacyMaster_LogData(PharmacyDTO model)
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
            aslLog.LOGIPNO = ipAddress.ToString();
            aslLog.LOGLTUDE = model.INSLTUDE;
            aslLog.TABLEID = "HMS_PHARMMST";

            string transType = "";
            if (model.TRANSTP == "IISS")
            {
                transType = "Issue";
            }
            aslLog.LOGDATA = Convert.ToString("Issue - Payment Information. Trasaction type: " + transType + ",\nDate: " + model.TRANSDT + ",\nMemo No: " + model.TRANSNO + ",\nDepartment From: " + model.DepartmentName_From_Issue + ",\nDepartment To: " + model.DepartmentName_To_Issue + ",\nTotal Amount: " + model.TOTAMT + ",\nNet Amount: " + model.NETAMT + ",\nRemarks: " + model.REMARKS + ".");
            aslLog.USERPC = strHostName;

            db.AslLogDbSet.Add(aslLog);
            db.SaveChanges();
        }

        // SAVE ALL INFORMATION from cart(Issue Master) TO Asl_lOG Database Table.
        public void Update_PharmacyMaster_LogData(PharmacyDTO model)
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
            aslLog.LOGTYPE = "UPDATE";
            aslLog.LOGSLNO = aslLog.LOGSLNO;
            aslLog.LOGDATE = Convert.ToDateTime(date);
            aslLog.LOGTIME = Convert.ToString(time);
            aslLog.LOGIPNO = ipAddress.ToString();
            aslLog.LOGLTUDE = model.INSLTUDE;
            aslLog.TABLEID = "HMS_PHARMMST";

            string transType = "";
            if (model.TRANSTP == "IISS")
            {
                transType = "Issue";
            }
            aslLog.LOGDATA = Convert.ToString("Issue(Update Menu)-Payment Information. Trasaction type: " + transType + ",\nDate: " + model.TRANSDT + ",\nMemo No: " + model.TRANSNO + ",\nDepartment From: " + model.DepartmentName_From_Issue + ",\nDepartment To: " + model.DepartmentName_To_Issue + ",\nTotal Amount: " + model.TOTAMT + ",\nNet Amount: " + model.NETAMT + ",\nRemarks: " + model.REMARKS + ".");
            aslLog.USERPC = strHostName;

            db.AslLogDbSet.Add(aslLog);
            db.SaveChanges();
        }

        // SAVE ALL INFORMATION from cart(Issue Master) TO Asl_lOG Database Table.
        public void Delete_PharmacyMaster_LogData(PharmacyDTO model)
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
            aslLog.LOGTYPE = "DELETE";
            aslLog.LOGSLNO = aslLog.LOGSLNO;
            aslLog.LOGDATE = Convert.ToDateTime(date);
            aslLog.LOGTIME = Convert.ToString(time);
            aslLog.LOGIPNO = ipAddress.ToString();
            aslLog.LOGLTUDE = model.INSLTUDE;
            aslLog.TABLEID = "HMS_PHARMMST";

            string transType = "";
            if (model.TRANSTP == "IISS")
            {
                transType = "Issue";
            }
            aslLog.LOGDATA = Convert.ToString("Issue - Payment Information. Trasaction type: " + transType + ",\nDate: " + model.TRANSDT + ",\nMemo No: " + model.TRANSNO + ",\nDepartment From: " + model.DepartmentName_From_Issue + ",\nDepartment To: " + model.DepartmentName_To_Issue + ",\nTotal Amount: " + model.TOTAMT + ",\nNet Amount: " + model.NETAMT + ",\nRemarks: " + model.REMARKS + ".");
            aslLog.USERPC = strHostName;

            db.AslLogDbSet.Add(aslLog);
            db.SaveChanges();
        }





        // SAVE ALL INFORMATION from grid(Issue data) TO Asl_lOG Database Table.
        public void Insert_Pharmacy_LogData(PharmacyDTO model)
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
            aslLog.LOGIPNO = ipAddress.ToString();
            aslLog.LOGLTUDE = model.INSLTUDE;
            aslLog.TABLEID = "HMS_PHARMACY";

            string transType = "";
            if (model.TRANSTP == "IISS")
            {
                transType = "Issue";
            }
            aslLog.LOGDATA = Convert.ToString("Issue. Trasaction type: " + transType + ",\nDate: " + model.TRANSDT + ",\nMemo No: " + model.TRANSNO + ",\nDepartment From: " + model.DepartmentName_From_Issue + ",\nDepartment To: " + model.DepartmentName_To_Issue + ",\nItem name: " + model.MEDINM + ",\nQty:" + model.QTY + ",\nRate:" + model.RATE + ",\nAmount:" + model.AMOUNT + ".");
            aslLog.USERPC = strHostName;

            db.AslLogDbSet.Add(aslLog);
            db.SaveChanges();
        }

        // Edit ALL INFORMATION from Grid(Issue data) TO Asl_lOG Database Table.
        public void update_Pharmacy_LogData(PharmacyDTO model)
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
            aslLog.LOGTYPE = "UPDATE";
            aslLog.LOGSLNO = aslLog.LOGSLNO;
            aslLog.LOGDATE = Convert.ToDateTime(date);
            aslLog.LOGTIME = Convert.ToString(time);
            aslLog.LOGIPNO = ipAddress.ToString();
            aslLog.LOGLTUDE = model.INSLTUDE;
            aslLog.TABLEID = "HMS_PHARMACY";

            string transType = "";
            if (model.TRANSTP == "IISS")
            {
                transType = "Issue";
            }
            aslLog.LOGDATA = Convert.ToString("Issue. Trasaction type: " + transType + ",\nDate: " + model.TRANSDT + ",\nMemo No: " + model.TRANSNO + ",\nDepartment From: " + model.DepartmentName_From_Issue + ",\nDepartment To: " + model.DepartmentName_To_Issue + ",\nItem name: " + model.MEDINM + ",\nQty:" + model.QTY + ",\nRate:" + model.RATE + ",\nAmount:" + model.AMOUNT + ".");
            aslLog.USERPC = strHostName;

            db.AslLogDbSet.Add(aslLog);
            db.SaveChanges();
        }

        // Delete ALL INFORMATION from Grid(Issue data) TO Asl_lOG Database Table.
        public void Delete_Pharmacy_LogData(PharmacyDTO model)
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
            aslLog.LOGTYPE = "DELETE";
            aslLog.LOGSLNO = aslLog.LOGSLNO;
            aslLog.LOGDATE = Convert.ToDateTime(date);
            aslLog.LOGTIME = Convert.ToString(time);
            aslLog.LOGIPNO = ipAddress.ToString();
            aslLog.LOGLTUDE = model.INSLTUDE;
            aslLog.TABLEID = "HMS_PHARMACY";

            string transType = "";
            if (model.TRANSTP == "IISS")
            {
                transType = "Issue";
            }
            aslLog.LOGDATA = Convert.ToString("Issue. Trasaction type: " + transType + ",\nDate: " + model.TRANSDT + ",\nMemo No: " + model.TRANSNO + ",\nDepartment From: " + model.DepartmentName_From_Issue + ",\nDepartment To: " + model.DepartmentName_To_Issue + ",\nItem name: " + model.MEDINM + ",\nQty:" + model.QTY + ",\nRate:" + model.RATE + ",\nAmount:" + model.AMOUNT + ".");
            aslLog.USERPC = strHostName;

            db.AslLogDbSet.Add(aslLog);
            db.SaveChanges();
        }







        public ASL_DELETE AslDelete = new ASL_DELETE();

        // Delete ALL INFORMATION from Grid(Issue Data) TO ASL_DELETE Database Table.
        public void Delete_Pharmacys_LogDelete(PharmacyDTO model)
        {
            TimeZoneInfo timeZoneInfo;
            timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
            DateTime PrintDate = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
            var date = Convert.ToString(PrintDate.ToString("dd-MMM-yyyy"));
            var time = Convert.ToString(PrintDate.ToString("hh:mm:ss tt"));

            Int64 maxSerialNo = Convert.ToInt64((from n in db.AslDeleteDbSet where n.COMPID == model.COMPID && n.USERID == model.INSUSERID select n.DELSLNO).Max());
            if (maxSerialNo == 0)
            {
                AslDelete.DELSLNO = Convert.ToInt64("1");
            }
            else
            {
                AslDelete.DELSLNO = maxSerialNo + 1;
            }

            AslDelete.COMPID = Convert.ToInt64(model.COMPID);
            AslDelete.USERID = model.INSUSERID;
            AslDelete.DELSLNO = AslDelete.DELSLNO;
            AslDelete.DELDATE = Convert.ToString(date);
            AslDelete.DELTIME = Convert.ToString(time);
            AslDelete.DELIPNO = ipAddress.ToString();
            AslDelete.DELLTUDE = model.INSLTUDE;
            AslDelete.TABLEID = "HMS_PHARMACY";

            string transType = "";
            if (model.TRANSTP == "IISS")
            {
                transType = "Issue";
            }
            AslDelete.DELDATA = Convert.ToString("Issue. Trasaction type: " + transType + ",\nDate: " + model.TRANSDT + ",\nMemo No: " + model.TRANSNO + ",\nDepartment From: " + model.DepartmentName_From_Issue + ",\nDepartment To: " + model.DepartmentName_To_Issue + ",\nItem name: " + model.MEDINM + ",\nQty:" + model.QTY + ",\nRate:" + model.RATE + ",\nAmount:" + model.AMOUNT + ".");
            AslDelete.USERPC = strHostName;

            db.AslDeleteDbSet.Add(AslDelete);
            db.SaveChanges();
        }

        // Delete ALL INFORMATION from cart(Issue Master) TO ASL_DELETE Database Table.
        public void Delete_PharmacyMaster_LogDelete(PharmacyDTO model)
        {
            TimeZoneInfo timeZoneInfo;
            timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
            DateTime PrintDate = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
            var date = Convert.ToString(PrintDate.ToString("dd-MMM-yyyy"));
            var time = Convert.ToString(PrintDate.ToString("hh:mm:ss tt"));

            Int64 maxSerialNo = Convert.ToInt64((from n in db.AslDeleteDbSet where n.COMPID == model.COMPID && n.USERID == model.INSUSERID select n.DELSLNO).Max());
            if (maxSerialNo == 0)
            {
                AslDelete.DELSLNO = Convert.ToInt64("1");
            }
            else
            {
                AslDelete.DELSLNO = maxSerialNo + 1;
            }

            AslDelete.COMPID = Convert.ToInt64(model.COMPID);
            AslDelete.USERID = model.INSUSERID;
            AslDelete.DELSLNO = AslDelete.DELSLNO;
            AslDelete.DELDATE = Convert.ToString(date);
            AslDelete.DELTIME = Convert.ToString(time);
            AslDelete.DELIPNO = ipAddress.ToString();
            AslDelete.DELLTUDE = model.INSLTUDE;
            AslDelete.TABLEID = "HMS_PHARMMST";

            string transType = "";
            if (model.TRANSTP == "IISS")
            {
                transType = "Issue";
            }
            AslDelete.DELDATA = Convert.ToString("Issue - Payment Information. Trasaction type: " + transType + ",\nDate: " + model.TRANSDT + ",\nMemo No: " + model.TRANSNO + ",\nDepartment From: " + model.DepartmentName_From_Issue + ",\nDepartment To: " + model.DepartmentName_To_Issue + ",\nTotal Amount: " + model.TOTAMT + ",\nNet Amount: " + model.NETAMT + ",\nRemarks: " + model.REMARKS + ".");
            AslDelete.USERPC = strHostName;

            db.AslDeleteDbSet.Add(AslDelete);
            db.SaveChanges();
        }










        // GET: /SaleSaleReturnUse/
        public ActionResult Create()
        {
            return View();
        }

        [AcceptVerbs("POST")]
        [ActionName("Create")]
        public ActionResult CreatePost(PharmacyDTO model, string command)
        {
            if (command == "Save" || command == "A4" || command == "POS")
            {
                model.TRANSTP = "IISS";
                var checkPharmacy = (from n in db.HmsPharmacyDbSet
                                     where n.COMPID == model.COMPID && n.TRANSTP == model.TRANSTP && n.TRANSMY == model.TRANSMY
                                         && n.TRANSNO == model.TRANSNO
                                     select n).ToList();
                if (checkPharmacy.Count == 0)
                {
                    TempData["Issue-Create"] = "Please input valid data !";
                    return RedirectToAction("Create");
                }

                PharmMst pharmacyMaster = new PharmMst();
                var checkPharmacyMaster = (from n in db.HmsPharmMstDbSet
                                           where n.COMPID == model.COMPID && n.TRANSTP == model.TRANSTP && n.TRANSMY == model.TRANSMY
                                               && n.TRANSNO == model.TRANSNO
                                           select n).ToList();
                if (checkPharmacyMaster.Count == 0)
                {
                    pharmacyMaster.COMPID = model.COMPID;
                    pharmacyMaster.TRANSTP = model.TRANSTP;
                    pharmacyMaster.TRANSDT = Convert.ToDateTime(model.TRANSDT);
                    pharmacyMaster.TRANSMY = model.TRANSMY;
                    pharmacyMaster.TRANSNO = model.TRANSNO;
                    pharmacyMaster.DEPTFR = model.DEPTFR;
                    pharmacyMaster.DEPTTO = model.DEPTTO;

                    pharmacyMaster.TOTAMT = model.TOTAMT;
                    //pharmacyMaster.VATAMT = model.VATAMT;
                    //pharmacyMaster.DISCOUNT = model.DISCOUNT;
                    pharmacyMaster.NETAMT = model.NETAMT;
                    pharmacyMaster.REMARKS = model.REMARKS;

                    pharmacyMaster.USERPC = strHostName;
                    pharmacyMaster.INSIPNO = ipAddress.ToString();
                    pharmacyMaster.INSTIME = Convert.ToDateTime(td);
                    pharmacyMaster.INSUSERID = model.INSUSERID;
                    pharmacyMaster.INSLTUDE = Convert.ToString(model.INSLTUDE);

                    db.HmsPharmMstDbSet.Add(pharmacyMaster);
                    db.SaveChanges();

                    Insert_PharmacyMaster_LogData(model);

                    TempData["Issue-Create"] = "Create successfully.";
                    if (command == "A4" || command == "POS")
                    {
                        TempData["PharmacyCommand"] = command;
                        TempData["PharmacyReportViewModel"] = model;
                        return RedirectToAction("PharmacyReportPage", "PharmacyReport");
                    }
                    else
                    {
                        return RedirectToAction("Create");
                    }
                }
            }
            else if (command == "Refresh")
            {
                return RedirectToAction("Create");
            }
            return RedirectToAction("Create");
        }









        // GET: /SaleSaleReturnUse/
        public ActionResult Update()
        {
            return View();
        }

        [AcceptVerbs("POST")]
        [ActionName("Update")]
        public ActionResult UpdatePost(PharmacyDTO model, string command)
        {
            if (command == "Save" || command == "A4" || command == "POS")
            {
                model.TRANSTP = "IISS";
                var checkPharmacyMaster = (from n in db.HmsPharmMstDbSet
                                           where n.COMPID == model.COMPID && n.TRANSTP == model.TRANSTP && n.TRANSMY == model.TRANSMY
                                               && n.TRANSNO == model.TRANSNO
                                           select n).ToList();
                if (checkPharmacyMaster.Count == 1)
                {
                    foreach (var item in checkPharmacyMaster)
                    {
                        item.TOTAMT = model.TOTAMT;
                        //item.VATAMT = model.VATAMT;
                        //item.DISCOUNT = model.DISCOUNT;
                        item.NETAMT = model.NETAMT;
                        item.REMARKS = model.REMARKS;

                        item.USERPC = strHostName;
                        item.UPDIPNO = ipAddress.ToString();
                        item.UPDTIME = Convert.ToDateTime(td);
                        item.UPDUSERID = model.INSUSERID;
                        item.UPDLTUDE = Convert.ToString(model.INSLTUDE);

                    }
                    db.SaveChanges();

                    Update_PharmacyMaster_LogData(model);
                }
                else // if (checkPharmacyMaster.Count == 0)
                {
                    PharmMst pharmacyMaster = new PharmMst();
                    pharmacyMaster.COMPID = model.COMPID;
                    pharmacyMaster.TRANSTP = model.TRANSTP;
                    pharmacyMaster.TRANSDT = Convert.ToDateTime(model.TRANSDT);
                    pharmacyMaster.TRANSMY = model.TRANSMY;
                    pharmacyMaster.TRANSNO = model.TRANSNO;
                    pharmacyMaster.DEPTFR = model.DEPTFR;
                    pharmacyMaster.DEPTTO = model.DEPTTO;

                    pharmacyMaster.TOTAMT = model.TOTAMT;
                    //pharmacyMaster.VATAMT = model.VATAMT;
                    //pharmacyMaster.DISCOUNT = model.DISCOUNT;
                    pharmacyMaster.NETAMT = model.NETAMT;
                    pharmacyMaster.REMARKS = model.REMARKS;

                    pharmacyMaster.USERPC = strHostName;
                    pharmacyMaster.INSIPNO = ipAddress.ToString();
                    pharmacyMaster.INSTIME = Convert.ToDateTime(td);
                    pharmacyMaster.INSUSERID = model.INSUSERID;
                    pharmacyMaster.INSLTUDE = Convert.ToString(model.INSLTUDE);

                    db.HmsPharmMstDbSet.Add(pharmacyMaster);
                    db.SaveChanges();

                    Insert_PharmacyMaster_LogData(model);

                }
                TempData["Issue-Update"] = "Update successfully.";

                if (command == "A4" || command == "POS")
                {
                    TempData["PharmacyCommand"] = command;
                    TempData["PharmacyReportViewModel"] = model;
                    return RedirectToAction("PharmacyReportPage", "PharmacyReport");
                }
                else
                {
                    return RedirectToAction("Update");
                }
            }
            else if (command == "Refresh")
            {
                return RedirectToAction("Update");
            }
            return RedirectToAction("Update");
        }









        // GET: /SaleSaleReturnUse/
        public ActionResult Delete()
        {
            return View();
        }

        [AcceptVerbs("POST")]
        [ActionName("Delete")]
        public ActionResult DeletePost(PharmacyDTO model, string command)
        {
            if (command == "Delete")
            {
                model.TRANSTP = "IISS";
                var findPharmacyDataNull = (from n in db.HmsPharmacyDbSet
                                            where n.COMPID == model.COMPID && n.TRANSTP == model.TRANSTP && n.TRANSMY == model.TRANSMY
                                                && n.TRANSNO == model.TRANSNO
                                            select n).OrderBy(e => e.ITEMSL).ToList();
                if (findPharmacyDataNull.Count != 0)
                {
                    foreach (var item in findPharmacyDataNull)
                    {
                        db.HmsPharmacyDbSet.Remove(item);
                        db.SaveChanges();

                        model.QTY = item.QTY;
                        model.RATE = item.RATE;
                        model.AMOUNT = item.AMOUNT;
                        var findInfo = db.HmsMediCareDbSet.Where(n => n.MEDIID == item.MEDIID && n.COMPID == model.COMPID).Select(n => new
                        {
                            n.MEDINM,
                        });
                        foreach (var n in findInfo)
                        {
                            model.MEDINM = Convert.ToString(n.MEDINM);
                        }

                        Delete_Pharmacy_LogData(model);
                        Delete_Pharmacys_LogDelete(model);
                    }
                }


                var findPharmacyMasterInfo = (from n in db.HmsPharmMstDbSet
                                              where n.COMPID == model.COMPID && n.TRANSTP == model.TRANSTP && n.TRANSMY == model.TRANSMY
                                                  && n.TRANSNO == model.TRANSNO
                                              select n).ToList();
                if (findPharmacyMasterInfo.Count != 0)
                {
                    foreach (var item in findPharmacyMasterInfo)
                    {
                        db.HmsPharmMstDbSet.Remove(item);
                        db.SaveChanges();

                        Delete_PharmacyMaster_LogData(model);
                        Delete_PharmacyMaster_LogDelete(model);
                    }
                }
                TempData["Issue-Delete"] = "Delete successfully.";
                return RedirectToAction("Delete");
            }
            else if (command == "Refresh")
            {
                return RedirectToAction("Delete");
            }
            return RedirectToAction("Delete");
        }












        //(Create Page)
        [AcceptVerbs(HttpVerbs.Get)]
        public JsonResult GetMonthYear_MemoNO(string changedText, string transactionType, string compid)
        {
            transactionType = "IISS";
            Int64 comapnyid = Convert.ToInt64(compid);

            string converttoString = Convert.ToString(changedText);
            string getYear = converttoString.Substring(9, 2);
            string getMonth = converttoString.Substring(3, 3).ToUpper();
            string monthYear = getMonth + "-" + getYear;//DEC-15 (Example)

            DateTime getDate = Convert.ToDateTime(changedText);
            string currentMonth = getDate.ToString("MM"), memoNo = "";
            var findTransNo = (from m in db.HmsPharmacyDbSet
                               where m.COMPID == comapnyid && m.TRANSTP == transactionType && m.TRANSMY == monthYear
                               select m).ToList();
            if (findTransNo.Count == 0)
            {
                memoNo = getYear + currentMonth + "0001";
            }
            else
            {
                Int64 max_TransNO = Convert.ToInt64((from m in db.HmsPharmacyDbSet where m.COMPID == comapnyid && m.TRANSTP == transactionType && m.TRANSMY == monthYear select m.TRANSNO).Max());
                Int64 R = Convert.ToInt64(getYear + currentMonth + "9999");
                if (max_TransNO <= R)
                {
                    memoNo = Convert.ToString(max_TransNO + 1);
                }
                else
                {
                    memoNo = "Not access!!!";
                }
            }
            var result = new { TRANSMY = monthYear, TRANSNO = memoNo };
            return Json(result, JsonRequestBehavior.AllowGet);
        }







        //Department autocomplete (Create Page)
        public JsonResult TagSearch_Department(string term, string compid)
        {
            Int64 companyid = Convert.ToInt64(compid);
            List<string> result = new List<string>();
            var tags = from p in db.HMS_DEPT where p.COMPID == companyid && p.DEPTTP == "PHARMACY" select new { p.DEPTNM };
            foreach (var tag in tags)
            {
                result.Add(tag.DEPTNM.ToString());
            }
            return this.Json(result.Where(t => t.StartsWith(term)), JsonRequestBehavior.AllowGet);
        }

        //Department From Field autocomplete (Create Page)
        [AcceptVerbs(HttpVerbs.Get)]
        public JsonResult keyword_GetDepartmentFrom(string changedText, string companyid)
        {
            var compid = Convert.ToInt16(companyid);
            String itemId = "";

            // string changedText = Convert.ToString(changedText1);

            List<string> departmentList = new List<string>();
            var tags = from p in db.HMS_DEPT
                       where p.COMPID == compid && p.DEPTTP == "PHARMACY"
                       select new { p.DEPTNM };
            foreach (var tag in tags)
            {
                departmentList.Add(tag.DEPTNM.ToString());
            }

            var rt = departmentList.Where(t => t.StartsWith(changedText)).ToList();

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

            String departmentName = "";
            Int64 deptId = 0;

            var findInfo = db.HMS_DEPT.Where(n => n.DEPTNM == itemId && n.DEPTTP == "PHARMACY" &&
                                                         n.COMPID == compid).Select(n => new
                                                         {
                                                             n.DEPTNM,
                                                             n.DEPTID

                                                         });
            foreach (var n in findInfo)
            {
                deptId = Convert.ToInt64(n.DEPTID);
                departmentName = Convert.ToString(n.DEPTNM);
            }

            var result = new { DEPTFR = deptId, DEPTNM = itemId };
            return Json(result, JsonRequestBehavior.AllowGet);

        }

        //Department To Field autocomplete (Create Page)
        [AcceptVerbs(HttpVerbs.Get)]
        public JsonResult keyword_GetDepartmentTo(string changedText, string companyid)
        {
            var compid = Convert.ToInt16(companyid);
            String itemId = "";

            // string changedText = Convert.ToString(changedText1);

            List<string> departmentList = new List<string>();
            var tags = from p in db.HMS_DEPT
                       where p.COMPID == compid && p.DEPTTP == "PHARMACY"
                       select new { p.DEPTNM };
            foreach (var tag in tags)
            {
                departmentList.Add(tag.DEPTNM.ToString());
            }

            var rt = departmentList.Where(t => t.StartsWith(changedText)).ToList();

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

            String departmentName = "";
            Int64 deptId = 0;

            var findInfo = db.HMS_DEPT.Where(n => n.DEPTNM == itemId && n.DEPTTP == "PHARMACY" &&
                                                         n.COMPID == compid).Select(n => new
                                                         {
                                                             n.DEPTNM,
                                                             n.DEPTID

                                                         });
            foreach (var n in findInfo)
            {
                deptId = Convert.ToInt64(n.DEPTID);
                departmentName = Convert.ToString(n.DEPTNM);
            }

            var result = new { DEPTTO = deptId, DEPTNM = itemId };
            return Json(result, JsonRequestBehavior.AllowGet);

        }





        //Medi Name(item name) Field autocomplete
        public JsonResult TagSearch_MediName(string term, string compid)
        {
            Int64 companyid = Convert.ToInt64(compid);
            List<string> result = new List<string>();
            var tags = from p in db.HmsMediCareDbSet where p.COMPID == companyid select new { p.MEDINM };
            foreach (var tag in tags)
            {
                result.Add(tag.MEDINM.ToString());
            }
            return this.Json(result.Where(t => t.StartsWith(term)), JsonRequestBehavior.AllowGet);
        }

        //Medi Name(item name) Field autocomplete 
        [AcceptVerbs(HttpVerbs.Get)]
        public JsonResult keyword_GetMediName(string changedText, string companyid)
        {
            var compid = Convert.ToInt16(companyid);
            String itemId = "";

            // string changedText = Convert.ToString(changedText1);

            List<string> itemList = new List<string>();
            var tags = from p in db.HmsMediCareDbSet where p.COMPID == compid select new { p.MEDINM };
            foreach (var tag in tags)
            {
                itemList.Add(tag.MEDINM.ToString());
            }

            var rt = itemList.Where(t => t.StartsWith(changedText)).ToList();

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

            String mediName = "";
            Int64 mediID = 0, saleRate = 0;

            var findInfo = db.HmsMediCareDbSet.Where(n => n.MEDINM == itemId && n.COMPID == compid).Select(n => new
            {
                n.MEDINM,
                n.MEDIID,
                n.SALRT,
            });
            foreach (var n in findInfo)
            {
                mediID = Convert.ToInt64(n.MEDIID);
                mediName = Convert.ToString(n.MEDINM);
                saleRate = Convert.ToInt64(n.SALRT);
            }

            var result = new { MEDIID = mediID, MEDINM = itemId, SALRT = saleRate };
            return Json(result, JsonRequestBehavior.AllowGet);

        }







        //Memo NO Field autocomplete (Update Page)
        public JsonResult TagSearch_transNO(string term, Int64 compid, string transactionType, string transactionDate)
        {
            transactionType = "IISS";
            DateTime date = Convert.ToDateTime(transactionDate);
            List<string> result = new List<string>();
            var tags = (from p in db.HmsPharmacyDbSet where p.COMPID == compid && p.TRANSTP == transactionType && p.TRANSDT == date select new { p.TRANSNO }).Distinct();
            foreach (var tag in tags)
            {
                result.Add(tag.TRANSNO.ToString());
            }
            return this.Json(result.Where(t => t.StartsWith(term)), JsonRequestBehavior.AllowGet);
        }


        //Memo NO Field autocomplete (Update Page)
        [AcceptVerbs(HttpVerbs.Get)]
        public JsonResult keyword_GetTransNO(string changedText, string companyid, string transactionType, string transactionDate)
        {
            transactionType = "IISS";
            DateTime date = Convert.ToDateTime(transactionDate);
            var compid = Convert.ToInt16(companyid);
            String itemId = "";

            List<string> memoNoList = new List<string>();
            var tags = (from p in db.HmsPharmacyDbSet where p.COMPID == compid && p.TRANSTP == transactionType && p.TRANSDT == date select new { p.TRANSNO }).Distinct();
            foreach (var tag in tags)
            {
                memoNoList.Add(tag.TRANSNO.ToString());
            }

            var rt = memoNoList.Where(t => t.StartsWith(changedText)).ToList();

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

            String departmentNameFrom = "", departmentNameTo = "", transDate = "";
            Int64 department_From_id = 0, department_To_id = 0;

            Regex regex = new Regex("^[0-9]+$");//check its int or string?
            if (regex.IsMatch(itemId))
            {
                Int64 memoNo = Convert.ToInt64(itemId);
                var findInfo = db.HmsPharmacyDbSet.Where(n => n.COMPID == compid && n.TRANSNO == memoNo && n.TRANSTP == transactionType && n.TRANSDT == date
                                                       ).Select(n => new
                                                       {
                                                           n.TRANSDT,
                                                           n.DEPTFR,
                                                           n.DEPTTO,

                                                       }).ToList();
                foreach (var n in findInfo)
                {
                    transDate = Convert.ToString(n.TRANSDT);
                    department_From_id = Convert.ToInt64(n.DEPTFR);
                    department_To_id = Convert.ToInt64(n.DEPTTO);
                    break;
                }

                if (department_From_id != 0)
                {
                    var findDepartmentFromInfo = db.HMS_DEPT.Where(n => n.DEPTID == department_From_id && n.DEPTTP == "PHARMACY" &&
                                                        n.COMPID == compid).Select(n => new
                                                        {
                                                            n.DEPTNM,

                                                        });
                    foreach (var n in findDepartmentFromInfo)
                    {
                        departmentNameFrom = Convert.ToString(n.DEPTNM);
                    }
                }
                if (department_To_id != 0)
                {
                    var findDepartmentToInfo = db.HMS_DEPT.Where(n => n.DEPTID == department_To_id && n.DEPTTP == "PHARMACY" &&
                                                        n.COMPID == compid).Select(n => new
                                                        {
                                                            n.DEPTNM,

                                                        });
                    foreach (var n in findDepartmentToInfo)
                    {
                        departmentNameTo = Convert.ToString(n.DEPTNM);
                    }
                }
            }

            var result = new { TRANSNO = itemId, TRANSDT = transDate, DEPTFR = department_From_id, DEPTTO = department_To_id, DEPTNAME_F = departmentNameFrom, DEPTNAME_T = departmentNameTo };
            return Json(result, JsonRequestBehavior.AllowGet);

        }







        //(Update Page)
        [AcceptVerbs(HttpVerbs.Get)]
        public JsonResult GetMonthYear(string changedText)
        {
            string getYear = changedText.Substring(9, 2);
            string getMonth = changedText.Substring(3, 3).ToUpper();
            string monthYear = getMonth + "-" + getYear;//DEC-15 (Example)

            var result = new { TRANSMY = monthYear };
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        //(Update Page)
        [AcceptVerbs(HttpVerbs.Get)]
        public JsonResult GetPaymentInfo(Int64 companyid, Int64 transNo, string transactionType, string transMonthYear)
        {
            transactionType = "IISS";
            var findPaymentInfo = db.HmsPharmMstDbSet.Where(n => n.COMPID == companyid && n.TRANSNO == transNo && n.TRANSTP == transactionType && n.TRANSMY == transMonthYear).Select(n => new
            {
                n.TOTAMT,
                n.VATAMT,
                n.DISCOUNT,
                n.NETAMT,
                n.REMARKS
            }).ToList();

            string totalAmount = "", vatAmount = "", Discount = "", NetAmount = "", remarks = "";
            if (findPaymentInfo.Count == 1)
            {
                foreach (var a in findPaymentInfo)
                {
                    totalAmount = Convert.ToString(a.TOTAMT);
                    vatAmount = Convert.ToString(a.VATAMT);
                    Discount = Convert.ToString(a.DISCOUNT);
                    NetAmount = Convert.ToString(a.NETAMT);
                    if (a.REMARKS != null)
                    {
                        remarks = a.REMARKS;
                    }
                    else
                    {
                        remarks = "";
                    }

                }
            }
            else
            {
                var findChildData = db.HmsPharmacyDbSet.Where(n => n.COMPID == companyid && n.TRANSNO == transNo && n.TRANSTP == transactionType && n.TRANSMY == transMonthYear).Select(n => new
                {
                    n.AMOUNT,
                }).ToList();
                Decimal amount = 0;
                foreach (var b in findChildData)
                {
                    amount += Convert.ToDecimal(b.AMOUNT);
                }
                totalAmount = Convert.ToString(amount);
                vatAmount = Convert.ToString(0);
                Discount = Convert.ToString(0);
                NetAmount = Convert.ToString(amount);
            }

            var result = new { TOTAMT = totalAmount, VATAMT = vatAmount, DISCOUNT = Discount, NETAMT = NetAmount, REMARKS = remarks };
            return Json(result, JsonRequestBehavior.AllowGet);
        }

    }
}