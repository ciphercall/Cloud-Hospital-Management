using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using AslHMS.Models;
using AslHMS.Models.DTO;

namespace AslHMS.Controllers.HM
{
    public class ReportParameterController : AppController
    {
        //
        AslHMSApiContext db = new AslHMSApiContext();
        // GET: /ReportParameter/
        public ActionResult Index()
        {
            return View();
        }


        [AcceptVerbs("POST")]
        [ActionName("Index")]
        public ActionResult IndexPost(OpdDTO model,string command)
        {
            if (command == "Test Pad")
            {
                TempData["TestPad"] = model;
                return RedirectToAction("TestPad");
            }

            else if (command == "Test Pad USG_XRAY")
            {
                TempData["Test_Pad_USG_XRAY"] = model;
                return RedirectToAction("TestPadUsgXray");
            }
            else if (command == "Lab Order")
            {
                TempData["LabOrder"] = model;
                return RedirectToAction("LabOrder");
            }
            else if (command == "Submit")
            {
                TempData["Pathological_report"] = model;
                return RedirectToAction("PathologicalReport");
            }
            else
            {
                return null;
            }
           
        }

        public ActionResult TestPad()
        {

            OpdDTO model = (OpdDTO)TempData["TestPad"];
            return View(model);
        }

        public ActionResult TestPadUsgXray()
        {
            OpdDTO model = (OpdDTO)TempData["Test_Pad_USG_XRAY"];
            return View(model);
        }
        public ActionResult LabOrder()
        {
            OpdDTO model = (OpdDTO)TempData["LabOrder"];
            return View(model);
        }

        public ActionResult PathologicalReport()
        {
            OpdDTO model = (OpdDTO)TempData["Pathological_report"];
            return View(model);
        }
        
        public JsonResult testorCat(string Type,string PatientdID)
        {
            Int64 comid = Convert.ToInt64(System.Web.HttpContext.Current.Session["loggedCompID"]);
         
            List<SelectListItem> testorcatList = new List<SelectListItem>();
            var data_from_opd =
                (from n in db.HMS_OPD where n.COMPID == comid && n.PATIENTID == PatientdID select n).ToList();



            if (Type == "Category")
            {

                var ans1 = from n in db.HMS_TESTMST where n.COMPID == comid  select new { n.TCATID, n.TCATNM };
                foreach (var opd in data_from_opd)
                {
                    foreach (var x in ans1)
                    {
                        if (x.TCATID == opd.TCATID)
                        {
                            testorcatList.Add(new SelectListItem { Text = x.TCATNM, Value = Convert.ToString(x.TCATID) });
                        }

                       
                    }
                }
                
            }

            else if (Type == "Test")
            {
                var ans1 = from n in db.HMS_TEST where n.COMPID == comid select new { n.TESTID, n.TESTNM };
                foreach (var opd in data_from_opd)
                {
                   
                    foreach (var x in ans1)
                    {
                        if (x.TESTID == opd.TESTID)
                        {
                            testorcatList.Add(new SelectListItem { Text = x.TESTNM, Value = Convert.ToString(x.TESTID) });
                        }
                       
                    }
                }
                
            }









            return Json(new SelectList(testorcatList, "Value", "Text"));

        }
	}
}