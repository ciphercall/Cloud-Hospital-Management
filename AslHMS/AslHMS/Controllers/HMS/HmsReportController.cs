using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AslHMS.Models;

namespace AslHMS.Controllers.HMS
{
    public class HmsReportController : AppController
    {
        private AslHMSApiContext db = new AslHMSApiContext();


        //HMS Report (PURCHASE/RETURN - SUPPLIER)
        public ActionResult Purchase_PurchaseReturn_Supplier()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Purchase_PurchaseReturn_Supplier(PageModel model)
        {
            TempData["Purchase_PurchaseReturn_Supplier_model"] = model;
            return RedirectToAction("Get_Purchase_PurchaseReturn_Supplier");
        }

        public ActionResult Get_Purchase_PurchaseReturn_Supplier()
        {
            var model = (PageModel)TempData["Purchase_PurchaseReturn_Supplier_model"];
            return View(model);
        }







        //HMS Report (PURCHASE SUMMARY - ITEM)
        public ActionResult PurchaseSummary_Item()
        {
            return View();
        }

        [HttpPost]
        public ActionResult PurchaseSummary_Item(PageModel model)
        {
            TempData["PurchaseSummary_Item_model"] = model;
            return RedirectToAction("Get_PurchaseSummary_Item");
        }

        public ActionResult Get_PurchaseSummary_Item()
        {
            var model = (PageModel)TempData["PurchaseSummary_Item_model"];
            return View(model);
        }









        //HMS Report (PURCHASE DETAILS - INVOICE)
        public ActionResult PurchaseDetails_Invoice()
        {
            return View();
        }

        [HttpPost]
        public ActionResult PurchaseDetails_Invoice(PageModel model)
        {
            TempData["PurchaseDetails_Invoice_model"] = model;
            return RedirectToAction("Get_PurchaseDetails_Invoice");
        }

        public ActionResult Get_PurchaseDetails_Invoice()
        {
            var model = (PageModel)TempData["PurchaseDetails_Invoice_model"];
            return View(model);
        }











        //HMS Report (CLOSING STOCK)
        public ActionResult Closing_Stock()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Closing_Stock(PageModel model, string command)
        {
            TempData["Closing_Stock_model"] = model;
            if (command == "Print Summary")
            {
                return RedirectToAction("Get_Closing_Stock_Summary");
            }
            else //if (command == "Print Summary")
            {
                return RedirectToAction("Get_Closing_Stock_Details");
            }
        }

        public ActionResult Get_Closing_Stock_Summary()
        {
            var model = (PageModel)TempData["Closing_Stock_model"];
            return View(model);
        }

        public ActionResult Get_Closing_Stock_Details()
        {
            var model = (PageModel)TempData["Closing_Stock_model"];
            return View(model);
        }






        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
	}
}