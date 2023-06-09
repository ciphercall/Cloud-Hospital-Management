﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AslHMS.Models;
using AslHMS.Models.DTO;

namespace AslHMS.Controllers.HMS
{
    public class MediController : AppController
    {

        AslHMSApiContext db = new AslHMSApiContext();

        //Get Ip ADDRESS,Time & user PC Name
        public string strHostName;
        public IPHostEntry ipHostInfo;
        public IPAddress ipAddress;
        public MediController()
        {
            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];

            ViewData["HighLight_Menu_BillingForm"] = "Heigh Light Menu";
        }






        public ASL_LOG aslLog = new ASL_LOG();


        // SAVE ALL INFORMATION from grid(MediMaster data) TO Asl_lOG Database Table.
        public void Insert_mediMaster_LogData(MediMstDTO model)
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
            aslLog.TABLEID = "HMS_MEDIMST";
            aslLog.LOGDATA = Convert.ToString("Medical Category Information Page. Medical name: " + model.MCATNM + ".");
            aslLog.USERPC = model.USERPC;

            db.AslLogDbSet.Add(aslLog);
            db.SaveChanges();
        }


        // Edit ALL INFORMATION from Grid(MediMaster data) TO Asl_lOG Database Table.
        public void update_mediMaster_LogData(MediMstDTO model)
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
            aslLog.TABLEID = "HMS_MEDIMST";
            aslLog.LOGDATA = Convert.ToString("Medical Category Information Page. Medical name: " + model.MCATNM + ".");
            aslLog.USERPC = strHostName;

            db.AslLogDbSet.Add(aslLog);
            db.SaveChanges();
        }






        // Delete ALL INFORMATION from Grid(MediMaster data) TO Asl_lOG Database Table.
        public void Delete_mediMaster_LogData(MediMstDTO model)
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
            aslLog.TABLEID = "HMS_MEDIMST";
            aslLog.LOGDATA = Convert.ToString("Medical Category Information Page. Medical name: " + model.MCATNM + ".");
            aslLog.USERPC = strHostName;

            db.AslLogDbSet.Add(aslLog);
            db.SaveChanges();
        }





        // SAVE ALL INFORMATION from grid(MediCare data) TO Asl_lOG Database Table.
        public void Insert_MediCare_LogData(MediCareDTO model)
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
            aslLog.TABLEID = "HMS_MEDICARE";

            string McategoryName = "", pharmaName = "", genericName = "", dosageName = "";

            var find_MedicalCategoryName = (from n in db.HmsMediMstDbSet where n.COMPID == model.COMPID && n.MCATID == model.MCATID select new { n.MCATNM }).ToList();
            foreach (var m in find_MedicalCategoryName)
            {
                McategoryName = m.MCATNM;
            }

            var find_PharmaName = (from n in db.HmsPharmaDbSet where n.COMPID == model.COMPID && n.PHARMAID == model.PHARMAID select new { n.PHARMANM }).ToList();
            foreach (var n in find_PharmaName)
            {
                pharmaName = n.PHARMANM;
            }

            var find_genericName = (from gendos in db.HmsGendosDbSet where gendos.COMPID == model.COMPID && gendos.GDID == model.GENERICID select new { gendos.GDNM }).ToList();
            foreach (var n in find_genericName)
            {
                genericName = n.GDNM;
            }

            var find_dosageName = (from gendos in db.HmsGendosDbSet where gendos.COMPID == model.COMPID && gendos.GDID == model.DOSAGEFID select new { gendos.GDNM }).ToList();
            foreach (var n in find_dosageName)
            {
                dosageName = n.GDNM;
            }


            aslLog.LOGDATA = Convert.ToString("Medical category wise care information page. Medical name: " + model.MEDINM + ",\nGeneric name: " + genericName + ",\nDosage name: " + dosageName + ",\nPharma name: " + pharmaName + ",\nUnit: " + model.UNIT + ",\nBuy Rate: " + model.BUYRT + ",\nSale Rate: " + model.SALRT + ",\nStock Minimum: " + model.STKMIN + ",\nCreate for this Category: " + McategoryName + ".");
            aslLog.USERPC = model.USERPC;

            db.AslLogDbSet.Add(aslLog);
            db.SaveChanges();
        }






        // Edit ALL INFORMATION from Grid(MediCare data) TO Asl_lOG Database Table.
        public void update_MediCare_LogData(MediCareDTO model)
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
            aslLog.TABLEID = "HMS_MEDICARE";

            string McategoryName = "", pharmaName = "", genericName = "", dosageName = "";

            var find_MedicalCategoryName = (from n in db.HmsMediMstDbSet where n.COMPID == model.COMPID && n.MCATID == model.MCATID select new { n.MCATNM }).ToList();
            foreach (var m in find_MedicalCategoryName)
            {
                McategoryName = m.MCATNM;
            }

            var find_PharmaName = (from n in db.HmsPharmaDbSet where n.COMPID == model.COMPID && n.PHARMAID == model.PHARMAID select new { n.PHARMANM }).ToList();
            foreach (var n in find_PharmaName)
            {
                pharmaName = n.PHARMANM;
            }

            var find_genericName = (from gendos in db.HmsGendosDbSet where gendos.COMPID == model.COMPID && gendos.GDID == model.GENERICID select new { gendos.GDNM }).ToList();
            foreach (var n in find_genericName)
            {
                genericName = n.GDNM;
            }

            var find_dosageName = (from gendos in db.HmsGendosDbSet where gendos.COMPID == model.COMPID && gendos.GDID == model.DOSAGEFID select new { gendos.GDNM }).ToList();
            foreach (var n in find_dosageName)
            {
                dosageName = n.GDNM;
            }

            aslLog.LOGDATA = Convert.ToString("Medical category wise care information page. Medical name: " + model.MEDINM + ",\nGeneric name: " + genericName + ",\nDosage name: " + dosageName + ",\nPharma name: " + pharmaName + ",\nUnit: " + model.UNIT + ",\nBuy Rate: " + model.BUYRT + ",\nSale Rate: " + model.SALRT + ",\nStock Minimum: " + model.STKMIN + ",\nCreate for this Category: " + McategoryName + ".");
            aslLog.USERPC = strHostName;

            db.AslLogDbSet.Add(aslLog);
            db.SaveChanges();
        }








        // Delete ALL INFORMATION from Grid(MediCare data) TO Asl_lOG Database Table.
        public void Delete_mediCare_LogData(MediCareDTO model)
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
            aslLog.TABLEID = "HMS_MEDICARE";

            string McategoryName = "", pharmaName = "", genericName = "", dosageName = "";

            var find_MedicalCategoryName = (from n in db.HmsMediMstDbSet where n.COMPID == model.COMPID && n.MCATID == model.MCATID select new { n.MCATNM }).ToList();
            foreach (var m in find_MedicalCategoryName)
            {
                McategoryName = m.MCATNM;
            }

            var find_PharmaName = (from n in db.HmsPharmaDbSet where n.COMPID == model.COMPID && n.PHARMAID == model.PHARMAID select new { n.PHARMANM }).ToList();
            foreach (var n in find_PharmaName)
            {
                pharmaName = n.PHARMANM;
            }

            var find_genericName = (from gendos in db.HmsGendosDbSet where gendos.COMPID == model.COMPID && gendos.GDID == model.GENERICID select new { gendos.GDNM }).ToList();
            foreach (var n in find_genericName)
            {
                genericName = n.GDNM;
            }

            var find_dosageName = (from gendos in db.HmsGendosDbSet where gendos.COMPID == model.COMPID && gendos.GDID == model.DOSAGEFID select new { gendos.GDNM }).ToList();
            foreach (var n in find_dosageName)
            {
                dosageName = n.GDNM;
            }

            aslLog.LOGDATA = Convert.ToString("Medical category wise care information page. Medical name: " + model.MEDINM + ",\nGeneric name: " + genericName + ",\nDosage name: " + dosageName + ",\nPharma name: " + pharmaName + ",\nUnit: " + model.UNIT + ",\nBuy Rate: " + model.BUYRT + ",\nSale Rate: " + model.SALRT + ",\nStock Minimum: " + model.STKMIN + ",\nCreate for this Category: " + McategoryName + ".");
            aslLog.USERPC = strHostName;

            db.AslLogDbSet.Add(aslLog);
            db.SaveChanges();
        }






        public ASL_DELETE AslDelete = new ASL_DELETE();

        // Delete ALL INFORMATION from MediMaster TO ASL_DELETE Database Table.
        public void Delete_mediMaster_LogDelete(MediMstDTO model)
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
            AslDelete.TABLEID = "HMS_MEDIMST";
            AslDelete.DELDATA = Convert.ToString("Medical Category Information Page. Medical name: " + model.MCATNM + ".");
            AslDelete.USERPC = strHostName;

            db.AslDeleteDbSet.Add(AslDelete);
            db.SaveChanges();
        }








        // Delete ALL INFORMATION from Medicare TO ASL_DELETE Database Table.
        public void Delete_mediCare_LogDelete(MediCareDTO model)
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
            AslDelete.TABLEID = "HMS_MEDICARE";

            string McategoryName = "", pharmaName = "", genericName = "", dosageName = "";

            var find_MedicalCategoryName = (from n in db.HmsMediMstDbSet where n.COMPID == model.COMPID && n.MCATID == model.MCATID select new { n.MCATNM }).ToList();
            foreach (var m in find_MedicalCategoryName)
            {
                McategoryName = m.MCATNM;
            }

            var find_PharmaName = (from n in db.HmsPharmaDbSet where n.COMPID == model.COMPID && n.PHARMAID == model.PHARMAID select new { n.PHARMANM }).ToList();
            foreach (var n in find_PharmaName)
            {
                pharmaName = n.PHARMANM;
            }

            var find_genericName = (from gendos in db.HmsGendosDbSet where gendos.COMPID == model.COMPID && gendos.GDID == model.GENERICID select new { gendos.GDNM }).ToList();
            foreach (var n in find_genericName)
            {
                genericName = n.GDNM;
            }

            var find_dosageName = (from gendos in db.HmsGendosDbSet where gendos.COMPID == model.COMPID && gendos.GDID == model.DOSAGEFID select new { gendos.GDNM }).ToList();
            foreach (var n in find_dosageName)
            {
                dosageName = n.GDNM;
            }
            AslDelete.DELDATA = Convert.ToString("Medical category wise care information page. Medical name: " + model.MEDINM + ",\nGeneric name: " + genericName + ",\nDosage name: " + dosageName + ",\nPharma name: " + pharmaName + ",\nUnit: " + model.UNIT + ",\nBuy Rate: " + model.BUYRT + ",\nSale Rate: " + model.SALRT + ",\nStock Minimum: " + model.STKMIN + ",\nCreate for this Category: " + McategoryName + ".");
            AslDelete.USERPC = strHostName;

            db.AslDeleteDbSet.Add(AslDelete);
            db.SaveChanges();
        }






        // GET: get_MediMstInfo
        public ActionResult get_MediMstInfo()
        {
            return View();
        }



        // GET: Index
        public ActionResult Index()
        {
            return View();
        }
    }
}