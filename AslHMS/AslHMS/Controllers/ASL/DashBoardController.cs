using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AslHMS.Models;

namespace AslHMS.Controllers
{
    public class DashBoardController : AppController
    {
        //
        // GET: /ShowJob/

        public ActionResult Index()
        {
            return View();
        }

      
    }
}
