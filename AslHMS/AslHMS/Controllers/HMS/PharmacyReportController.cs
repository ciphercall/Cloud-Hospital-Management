using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AslHMS.Models;
using AslHMS.Models.DTO;

namespace AslHMS.Controllers.HMS
{
    public class PharmacyReportController : AppController
    {
        private AslHMSApiContext db = new AslHMSApiContext();


        //Stock From (SaleController)
        public ActionResult PharmacyReportPage(PharmacyDTO model)
        {
            model = (PharmacyDTO)TempData["PharmacyReportViewModel"];
            TempData["PharmacyReportViewModel"] = null;

            var command = TempData["PharmacyCommand"].ToString();
            TempData["PharmacyReportViewModel"] = model;
            if (command == "A4")
            {
                if (model.TRANSTP == "SALE" || model.TRANSTP == "IRTS" || model.TRANSTP == "IUSE")
                {
                    return RedirectToAction("GetSaleMemo_Reports_BigSize");
                }
                else if (model.TRANSTP == "BUY" || model.TRANSTP == "IRTB")
                {
                    return RedirectToAction("GetBuyMemo_Reports_BigSize");
                }
                else //if (model.TRANSTP == "IISS")
                {
                    return RedirectToAction("GetIssueMemo_Reports_BigSize");
                }

            }
            else //if (command == "POS")
            {
                if (model.TRANSTP == "SALE" || model.TRANSTP == "IRTS" || model.TRANSTP == "IUSE")
                {
                    return RedirectToAction("GetSaleMemo_Reports_SmallSize");
                }
                else if (model.TRANSTP == "BUY" || model.TRANSTP == "IRTB")
                {
                    return RedirectToAction("GetBuyMemo_Reports_SmallSize");
                }
                else //if (model.TRANSTP == "IISS")
                {
                    return RedirectToAction("GetIssueMemo_Reports_SmallSize");
                }
            }
        }







        public ActionResult GetSaleMemo_Reports_BigSize()
        {
            var model = (PharmacyDTO)TempData["PharmacyReportViewModel"];

            if (model.TRANSTP == "SALE")
            {
                ViewBag.TransactionType = "Sale";
                ViewBag.LevelOfDepartment = "Department From";
            }
            else if (model.TRANSTP == "IRTS")
            {
                ViewBag.TransactionType = "Sale Return";
                ViewBag.LevelOfDepartment = "Department To";
            }
            else if (model.TRANSTP == "IUSE")
            {
                ViewBag.TransactionType = "Use";
                ViewBag.LevelOfDepartment = "Department From";
            }

            string Date = model.TRANSDT.ToString();
            DateTime dateParse = DateTime.Parse(Date);
            string getDate = dateParse.ToString("dd-MMM-yyyy");
            ViewBag.TransDate = getDate;

            ViewBag.PatientName = model.PatientName;
            ViewBag.DepartmentName = model.DepartmentName;
            ViewBag.PatientType = model.PATIENTTP;
            ViewBag.PatientID = model.PATIENTID;
            ViewBag.PatientName = model.PatientName;

            return View(model);
        }

        public ActionResult GetSaleMemo_Reports_SmallSize()
        {
            var model = (PharmacyDTO)TempData["PharmacyReportViewModel"];

            if (model.TRANSTP == "SALE")
            {
                ViewBag.TransactionType = "Sale";
                ViewBag.LevelOfDepartment = "Department From";
            }
            else if (model.TRANSTP == "IRTS")
            {
                ViewBag.TransactionType = "Sale Return";
                ViewBag.LevelOfDepartment = "Department To";
            }
            else if (model.TRANSTP == "IUSE")
            {
                ViewBag.TransactionType = "Use";
                ViewBag.LevelOfDepartment = "Department From";
            }

            string Date = model.TRANSDT.ToString();
            DateTime dateParse = DateTime.Parse(Date);
            string getDate = dateParse.ToString("dd-MMM-yyyy");
            ViewBag.TransDate = getDate;

            ViewBag.PatientName = model.PatientName;
            ViewBag.DepartmentName = model.DepartmentName;
            ViewBag.PatientType = model.PATIENTTP;
            ViewBag.PatientID = model.PATIENTID;
            ViewBag.PatientName = model.PatientName;
            return View(model);
        }

        




        public ActionResult GetBuyMemo_Reports_BigSize()
        {
            var model = (PharmacyDTO)TempData["PharmacyReportViewModel"];
            
            if (model.TRANSTP == "BUY")
            {
                ViewBag.TransactionType = "Purchase";
                ViewBag.LevelOfDepartment = "Department To";
            }
            else if (model.TRANSTP == "IRTB")
            {
                ViewBag.TransactionType = "Purchase Return";
                ViewBag.LevelOfDepartment = "Department From";
            }

            string Date = model.TRANSDT.ToString();
            DateTime dateParse = DateTime.Parse(Date);
            string getDate = dateParse.ToString("dd-MMM-yyyy");
            ViewBag.TransDate = getDate;

            ViewBag.SupplierName = model.SupplierName;
            ViewBag.DepartmentName = model.DepartmentName;

            return View(model);
        }

        public ActionResult GetBuyMemo_Reports_SmallSize()
        {
            var model = (PharmacyDTO)TempData["PharmacyReportViewModel"];

            if (model.TRANSTP == "BUY")
            {
                ViewBag.TransactionType = "Purchase";
                ViewBag.LevelOfDepartment = "Department To";
            }
            else if (model.TRANSTP == "IRTB")
            {
                ViewBag.TransactionType = "Purchase Return";
                ViewBag.LevelOfDepartment = "Department From";
            }

            string Date = model.TRANSDT.ToString();
            DateTime dateParse = DateTime.Parse(Date);
            string getDate = dateParse.ToString("dd-MMM-yyyy");
            ViewBag.TransDate = getDate;

            ViewBag.SupplierName = model.SupplierName;
            ViewBag.DepartmentName = model.DepartmentName;
            return View(model);
        }







        public ActionResult GetIssueMemo_Reports_BigSize()
        {
            var model = (PharmacyDTO)TempData["PharmacyReportViewModel"];
            if (model.TRANSTP == "IISS")
            {
                ViewBag.TransactionType = "Issue";
            }
            
            string Date = model.TRANSDT.ToString();
            DateTime dateParse = DateTime.Parse(Date);
            string getDate = dateParse.ToString("dd-MMM-yyyy");
            ViewBag.TransDate = getDate;

            ViewBag.DepartmentFrom = model.DepartmentName_From_Issue;
            ViewBag.DepartmentTo = model.DepartmentName_To_Issue;
            return View(model);
        }

        public ActionResult GetIssueMemo_Reports_SmallSize()
        {
            var model = (PharmacyDTO)TempData["PharmacyReportViewModel"];

            if (model.TRANSTP == "IISS")
            {
                ViewBag.TransactionType = "Issue";
            }

            string Date = model.TRANSDT.ToString();
            DateTime dateParse = DateTime.Parse(Date);
            string getDate = dateParse.ToString("dd-MMM-yyyy");
            ViewBag.TransDate = getDate;

            ViewBag.DepartmentFrom = model.DepartmentName_From_Issue;
            ViewBag.DepartmentTo = model.DepartmentName_To_Issue;
            return View(model);
        }

    }
}