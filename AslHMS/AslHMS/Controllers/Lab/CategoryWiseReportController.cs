using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AslHMS.Models.DTO;

namespace AslHMS.Controllers.HM
{
    public class CategoryWiseReportController : AppController
    {
        //
        // GET: /CategoryWiseReport/
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(OpdDTO model)
        {
            //var pdf = new PdfResult(aCnfJobModel, "GetJOBRegister_JobTypeReport");
            //return pdf;

            TempData["CategoryWiseReport"] = model;
            return RedirectToAction("CategoryWiseReport");
        }
        public ActionResult CategoryWiseReport()
        {
            OpdDTO model = (OpdDTO)TempData["CategoryWiseReport"];
            return View(model);
        }
	}
}