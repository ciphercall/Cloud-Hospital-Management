using AslHMS.Models.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AslHMS.Controllers.HM
{
    public class DailyReportController : AppController
    {
        //
        // GET: /DailyReport/

        public ActionResult Index()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Index(OpdDTO model)
        {
            //var pdf = new PdfResult(aCnfJobModel, "GetJOBRegister_JobTypeReport");
            //return pdf;

            TempData["DailyOutdoorReport"] = model;
            return RedirectToAction("DailyOutdoorReport");
        }
        public ActionResult DailyOutdoorReport()
        {

            OpdDTO model = (OpdDTO)TempData["DailyOutdoorReport"];
            return View(model);
        }
	}
}