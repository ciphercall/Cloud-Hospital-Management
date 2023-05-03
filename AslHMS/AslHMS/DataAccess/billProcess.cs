using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using AslHMS.Models;
using AslHMS.Models.HMS;

namespace AslHMS.DataAccess
{
    public class billProcess
    {

        public static string processbill(Int64 compid, Int64 patientyearid, string billdate, Int64 billyear, Int64 billno, string patientyear, string patientid, Int64 Inuserid, string Insltude)
        {
            AslHMSApiContext db = new AslHMSApiContext();
            IFormatProvider dateformat = new System.Globalization.CultureInfo("fr-FR", true);
            TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
            DateTime td;



            //Get Ip ADDRESS,Time & user PC Name
            string strHostName;
            IPHostEntry ipHostInfo;
            IPAddress ipAddress;
            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];

            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);

            Bill obj = new Bill();
            //from headio table
            var search_headiodata =
                (from n in db.HMS_HEADIO where n.COMPID == compid && n.HEADTP == "IPD" select n).ToList();
            int i = 0;


            foreach (var headIo in search_headiodata)
            {
                if (headIo.HEADID.ToString().Substring(4, 2) == "01" || headIo.HEADID.ToString().Substring(4, 2) == "02")
                {
                    if (headIo.RATE > 0)
                    {
                        Int64 billserial = Convert.ToInt64((from n in db.BillDbSet
                                                            where n.COMPID == compid && n.BILLNO == billno
                                           && n.BILLYY == billyear

                                                            select n.BILLSL).Max());
                        obj.COMPID = compid;
                        obj.BILLDT = Convert.ToDateTime(billdate);
                        obj.BILLYY = billyear;
                        obj.BILLNO = billno;
                        obj.PATIENTYY = Convert.ToInt64(patientyear);
                        obj.PATIENTID = patientid;
                        obj.PATIENTYYID = patientyearid;
                        if (billserial == 0)
                        {
                            obj.BILLSL = Convert.ToInt64(Convert.ToString(billno) + "01");

                        }
                        else
                        {
                            obj.BILLSL = billserial + 1;
                        }
                        obj.BILLID = Convert.ToInt64(headIo.HEADID);
                        obj.AMOUNT = headIo.RATE;
                        obj.REMARKS = "";


                        obj.USERPC = strHostName;
                        obj.INSIPNO = ipAddress.ToString();

                        obj.INSTIME = Convert.ToDateTime(td);

                        obj.INSUSERID = Inuserid;
                        obj.INSLTUDE = Insltude;

                        db.BillDbSet.Add(obj);
                        db.SaveChanges();
                    }

                    i++;
                }
                if (i == 2)
                    break;



            }

            //from HMS_ICB and HMS_HEADIO
            //Int64 billid_icb = Convert.ToInt64(Convert.ToString(compid) + "103");
            var search_ICBData =
                (from n in db.HMS_IcbDbSet
                 where n.COMPID == compid && n.PATIENTYYID == patientyearid && n.BILLID != null
                 select n).ToList();

            foreach (var icb in search_ICBData)
            {

                decimal sum = 0;


                Int64 cbid = Convert.ToInt64(icb.CBID);
                Int64 fetch_rate = Convert.ToInt64((from n in db.HMS_HEADIO where n.COMPID == compid && n.HEADID == cbid select n.RATE).Sum());
                sum = sum + Convert.ToDecimal(fetch_rate * icb.TOTDAYS);


                if (sum > 0)
                {
                    Int64 billserial = Convert.ToInt64((from n in db.BillDbSet
                                                        where n.COMPID == compid && n.BILLNO == billno
                                       && n.BILLYY == billyear

                                                        select n.BILLSL).Max());
                    obj.COMPID = compid;
                    obj.BILLDT = Convert.ToDateTime(billdate);
                    obj.BILLYY = billyear;
                    obj.BILLNO = billno;
                    obj.PATIENTYY = Convert.ToInt64(patientyear);
                    obj.PATIENTID = patientid;
                    obj.PATIENTYYID = patientyearid;
                    if (billserial == 0)
                    {
                        obj.BILLSL = Convert.ToInt64(Convert.ToString(billno) + "01");

                    }
                    else
                    {
                        obj.BILLSL = billserial + 1;
                    }
                    obj.BILLID = Convert.ToInt64(icb.BILLID);
                    obj.AMOUNT = sum;
                    obj.REMARKS = "";


                    obj.USERPC = strHostName;
                    obj.INSIPNO = ipAddress.ToString();

                    obj.INSTIME = Convert.ToDateTime(td);

                    obj.INSUSERID = Inuserid;
                    obj.INSLTUDE = Insltude;

                    db.BillDbSet.Add(obj);
                    db.SaveChanges();
                }


            }



            //from consult table
            //Int64 billid = Convert.ToInt64(Convert.ToString(compid) + "104");

            var find_billid =
                (from n in db.HmsPConsultants where n.COMPID == compid && n.PATIENTYYID == patientyearid && n.BILLID != null select n).ToList();
            foreach (var pConsultant in find_billid)
            {
                Int64 find_data_Pconsult = Convert.ToInt64((from n in db.HmsPConsultants where n.COMPID == compid && n.PATIENTYYID == patientyearid && n.BILLID == pConsultant.BILLID select n.AMOUNT).Sum());

                if (find_data_Pconsult > 0)
                {
                    Int64 billserial = Convert.ToInt64((from n in db.BillDbSet
                                                        where n.COMPID == compid && n.BILLNO == billno
                                       && n.BILLYY == billyear

                                                        select n.BILLSL).Max());
                    obj.COMPID = compid;
                    obj.BILLDT = Convert.ToDateTime(billdate);
                    obj.BILLYY = billyear;
                    obj.BILLNO = billno;
                    obj.PATIENTYY = Convert.ToInt64(patientyear);
                    obj.PATIENTID = patientid;
                    obj.PATIENTYYID = patientyearid;
                    if (billserial == 0)
                    {
                        obj.BILLSL = Convert.ToInt64(Convert.ToString(billno) + "01");

                    }
                    else
                    {
                        obj.BILLSL = billserial + 1;
                    }
                    obj.BILLID = Convert.ToInt64(pConsultant.BILLID);
                    obj.AMOUNT = find_data_Pconsult;
                    obj.REMARKS = "";


                    obj.USERPC = strHostName;
                    obj.INSIPNO = ipAddress.ToString();

                    obj.INSTIME = Convert.ToDateTime(td);

                    obj.INSUSERID = Inuserid;
                    obj.INSLTUDE = Insltude;

                    db.BillDbSet.Add(obj);
                    db.SaveChanges();

                }



            }



            //from HMS_OT

            var find_data_SURGEON =
                (from n in db.HmsOTDbSet
                 where n.COMPID == compid && n.PATIENTYYID == patientyearid && n.OTPTP == "SURGEON" && n.BILLID != null
                 select n).ToList();
            var find_data_ASSISTANT =
               (from n in db.HmsOTDbSet
                where n.COMPID == compid && n.PATIENTYYID == patientyearid && n.OTPTP == "ASSISTANT" && n.BILLID != null
                select n).ToList();
            var find_data_OTCHARGE =
             (from n in db.HmsOTDbSet
              where n.COMPID == compid && n.PATIENTYYID == patientyearid && n.OTPTP == "OTCHARGE" && n.BILLID != null
              select n).ToList();
            var find_data_ANESTHE =
             (from n in db.HmsOTDbSet
              where n.COMPID == compid && n.PATIENTYYID == patientyearid && n.OTPTP == "ANESTHESIOLOGIST" && n.BILLID != null
              select n).ToList();
            Int64 find_data_OT5 = Convert.ToInt64((from n in db.HmsOTDbSet where n.COMPID == compid && n.PATIENTYYID == patientyearid && n.OTPTP == "SURGEON" select n.OTPAMT).Sum());
            Int64 find_data_OT6 = Convert.ToInt64((from n in db.HmsOTDbSet where n.COMPID == compid && n.PATIENTYYID == patientyearid && n.OTPTP == "ASSISTANT" select n.OTPAMT).Sum());
            Int64 find_data_OT7 = Convert.ToInt64((from n in db.HmsOTDbSet where n.COMPID == compid && n.PATIENTYYID == patientyearid && n.OTPTP == "OTCHARGE" select n.OTPAMT).Sum());
            Int64 find_data_OT8 = Convert.ToInt64((from n in db.HmsOTDbSet where n.COMPID == compid && n.PATIENTYYID == patientyearid && n.OTPTP == "ANESTHESIOLOGIST" select n.OTPAMT).Sum());
            foreach (var ot in find_data_SURGEON)
            {
                if (find_data_OT5 > 0)
                {
                    Int64 billserial = Convert.ToInt64((from n in db.BillDbSet
                                                        where n.COMPID == compid && n.BILLNO == billno
                                       && n.BILLYY == billyear

                                                        select n.BILLSL).Max());
                    obj.COMPID = compid;
                    obj.BILLDT = Convert.ToDateTime(billdate);
                    obj.BILLYY = billyear;
                    obj.BILLNO = billno;
                    obj.PATIENTYY = Convert.ToInt64(patientyear);
                    obj.PATIENTID = patientid;
                    obj.PATIENTYYID = patientyearid;
                    if (billserial == 0)
                    {
                        obj.BILLSL = Convert.ToInt64(Convert.ToString(billno) + "01");

                    }
                    else
                    {
                        obj.BILLSL = billserial + 1;
                    }
                    obj.BILLID = Convert.ToInt64(ot.BILLID);
                    obj.AMOUNT = find_data_OT5;
                    obj.REMARKS = "";


                    obj.USERPC = strHostName;
                    obj.INSIPNO = ipAddress.ToString();

                    obj.INSTIME = Convert.ToDateTime(td);

                    obj.INSUSERID = Inuserid;
                    obj.INSLTUDE = Insltude;

                    db.BillDbSet.Add(obj);
                    db.SaveChanges();
                    break;
                }
            }
            foreach (var ot in find_data_ASSISTANT)
            {
                if (find_data_OT6 > 0)
                {
                    Int64 billserial = Convert.ToInt64((from n in db.BillDbSet
                                                        where n.COMPID == compid && n.BILLNO == billno
                                       && n.BILLYY == billyear

                                                        select n.BILLSL).Max());
                    obj.COMPID = compid;
                    obj.BILLDT = Convert.ToDateTime(billdate);
                    obj.BILLYY = billyear;
                    obj.BILLNO = billno;
                    obj.PATIENTYY = Convert.ToInt64(patientyear);
                    obj.PATIENTID = patientid;
                    obj.PATIENTYYID = patientyearid;
                    if (billserial == 0)
                    {
                        obj.BILLSL = Convert.ToInt64(Convert.ToString(billno) + "01");

                    }
                    else
                    {
                        obj.BILLSL = billserial + 1;
                    }
                    obj.BILLID = Convert.ToInt64(ot.BILLID);
                    obj.AMOUNT = find_data_OT6;
                    obj.REMARKS = "";


                    obj.USERPC = strHostName;
                    obj.INSIPNO = ipAddress.ToString();

                    obj.INSTIME = Convert.ToDateTime(td);

                    obj.INSUSERID = Inuserid;
                    obj.INSLTUDE = Insltude;

                    db.BillDbSet.Add(obj);
                    db.SaveChanges();
                    break;

                }
            }
            foreach (var ot in find_data_OTCHARGE)
            {
                if (find_data_OT7 > 0)
                {
                    Int64 billserial = Convert.ToInt64((from n in db.BillDbSet
                                                        where n.COMPID == compid && n.BILLNO == billno
                                       && n.BILLYY == billyear

                                                        select n.BILLSL).Max());
                    obj.COMPID = compid;
                    obj.BILLDT = Convert.ToDateTime(billdate);
                    obj.BILLYY = billyear;
                    obj.BILLNO = billno;
                    obj.PATIENTYY = Convert.ToInt64(patientyear);
                    obj.PATIENTID = patientid;
                    obj.PATIENTYYID = patientyearid;
                    if (billserial == 0)
                    {
                        obj.BILLSL = Convert.ToInt64(Convert.ToString(billno) + "01");

                    }
                    else
                    {
                        obj.BILLSL = billserial + 1;
                    }
                    obj.BILLID = Convert.ToInt64(ot.BILLID);
                    obj.AMOUNT = find_data_OT7;
                    obj.REMARKS = "";


                    obj.USERPC = strHostName;
                    obj.INSIPNO = ipAddress.ToString();

                    obj.INSTIME = Convert.ToDateTime(td);

                    obj.INSUSERID = Inuserid;
                    obj.INSLTUDE = Insltude;

                    db.BillDbSet.Add(obj);
                    db.SaveChanges();
                    break;

                }
            }
            foreach (var ot in find_data_ANESTHE)
            {
                if (find_data_OT8 > 0)
                {
                    Int64 billserial = Convert.ToInt64((from n in db.BillDbSet
                                                        where n.COMPID == compid && n.BILLNO == billno
                                       && n.BILLYY == billyear

                                                        select n.BILLSL).Max());
                    obj.COMPID = compid;
                    obj.BILLDT = Convert.ToDateTime(billdate);
                    obj.BILLYY = billyear;
                    obj.BILLNO = billno;
                    obj.PATIENTYY = Convert.ToInt64(patientyear);
                    obj.PATIENTID = patientid;
                    obj.PATIENTYYID = patientyearid;
                    if (billserial == 0)
                    {
                        obj.BILLSL = Convert.ToInt64(Convert.ToString(billno) + "01");

                    }
                    else
                    {
                        obj.BILLSL = billserial + 1;
                    }
                    obj.BILLID = Convert.ToInt64(ot.BILLID);
                    obj.AMOUNT = find_data_OT8;
                    obj.REMARKS = "";


                    obj.USERPC = strHostName;
                    obj.INSIPNO = ipAddress.ToString();

                    obj.INSTIME = Convert.ToDateTime(td);

                    obj.INSUSERID = Inuserid;
                    obj.INSLTUDE = Insltude;

                    db.BillDbSet.Add(obj);
                    db.SaveChanges();
                    break;

                }
            }


            //from HMS_PHARMMST
            //Int64 billid_ph9 = Convert.ToInt64(Convert.ToString(compid) + "109");
            var find_data_SALE =
              (from n in db.HmsPharmMstDbSet
               where n.COMPID == compid && n.PATIENTYYID == patientyearid && (n.TRANSTP == "SALE" || n.TRANSTP == "IRTS") && n.BILLID != null
               select n).ToList();
            decimal sale_data = Convert.ToDecimal((from n in db.HmsPharmMstDbSet
                                                   where n.COMPID == compid && n.PATIENTYYID == patientyearid
                                                         && n.TRANSTP == "SALE"
                                                   select n.NETAMT).Sum());
            decimal salereturn_data = Convert.ToDecimal((from n in db.HmsPharmMstDbSet
                                                         where n.COMPID == compid && n.PATIENTYYID == patientyearid
                                                               && n.TRANSTP == "IRTS"
                                                         select n.NETAMT).Sum());
            decimal finalvalue = sale_data - salereturn_data;
            foreach (var pharmMst in find_data_SALE)
            {
                if (finalvalue > 0)
                {
                    Int64 billserial = Convert.ToInt64((from n in db.BillDbSet
                                                        where n.COMPID == compid && n.BILLNO == billno
                                       && n.BILLYY == billyear

                                                        select n.BILLSL).Max());
                    obj.COMPID = compid;
                    obj.BILLDT = Convert.ToDateTime(billdate);
                    obj.BILLYY = billyear;
                    obj.BILLNO = billno;
                    obj.PATIENTYY = Convert.ToInt64(patientyear);
                    obj.PATIENTID = patientid;
                    obj.PATIENTYYID = patientyearid;
                    if (billserial == 0)
                    {
                        obj.BILLSL = Convert.ToInt64(Convert.ToString(billno) + "01");

                    }
                    else
                    {
                        obj.BILLSL = billserial + 1;
                    }
                    obj.BILLID = Convert.ToInt64(pharmMst.BILLID);
                    obj.AMOUNT = finalvalue;
                    obj.REMARKS = "";


                    obj.USERPC = strHostName;
                    obj.INSIPNO = ipAddress.ToString();

                    obj.INSTIME = Convert.ToDateTime(td);

                    obj.INSUSERID = Inuserid;
                    obj.INSLTUDE = Insltude;

                    db.BillDbSet.Add(obj);
                    db.SaveChanges();
                    break;
                }


            }

            //Int64 billid_ph10 = Convert.ToInt64(Convert.ToString(compid) + "110");

            var find_data_IUSE =
            (from n in db.HmsPharmMstDbSet
             where n.COMPID == compid && n.PATIENTYYID == patientyearid && n.TRANSTP == "IUSE" && n.BILLID != null
             select n).ToList();
            decimal IUSE_data = Convert.ToDecimal((from n in db.HmsPharmMstDbSet
                                                   where n.COMPID == compid && n.PATIENTYYID == patientyearid
                                                         && n.TRANSTP == "IUSE"
                                                   select n.NETAMT).Sum());
            foreach (var pharmMst in find_data_IUSE)
            {
                if (IUSE_data > 0)
                {
                    Int64 billserial = Convert.ToInt64((from n in db.BillDbSet
                                                        where n.COMPID == compid && n.BILLNO == billno
                                       && n.BILLYY == billyear

                                                        select n.BILLSL).Max());
                    obj.COMPID = compid;
                    obj.BILLDT = Convert.ToDateTime(billdate);
                    obj.BILLYY = billyear;
                    obj.BILLNO = billno;
                    obj.PATIENTYY = Convert.ToInt64(patientyear);
                    obj.PATIENTID = patientid;
                    obj.PATIENTYYID = patientyearid;
                    if (billserial == 0)
                    {
                        obj.BILLSL = Convert.ToInt64(Convert.ToString(billno) + "01");

                    }
                    else
                    {
                        obj.BILLSL = billserial + 1;
                    }
                    obj.BILLID = Convert.ToInt64(pharmMst.BILLID);
                    obj.AMOUNT = IUSE_data;
                    obj.REMARKS = "";


                    obj.USERPC = strHostName;
                    obj.INSIPNO = ipAddress.ToString();

                    obj.INSTIME = Convert.ToDateTime(td);

                    obj.INSUSERID = Inuserid;
                    obj.INSLTUDE = Insltude;

                    db.BillDbSet.Add(obj);
                    db.SaveChanges();
                    break;
                }
            }

            //from HMS_PATHOLOGY

            var search_billid_patho = (from n in db.PathologyDbSet
                                       where n.COMPID == compid && n.PATIENTYYID == patientyearid && n.BILLID != null
                                       select new { n.BILLID }).Distinct().ToList();
            foreach (var patho in search_billid_patho)
            {
                Int64 billid_path = Convert.ToInt64(patho.BILLID);
                decimal sum_amount = Convert.ToDecimal((from n in db.PathologyDbSet
                                                        where n.COMPID == compid && n.PATIENTYYID == patientyearid && n.BILLID == billid_path

                                                        select n.AMOUNT).Sum());
                if (sum_amount > 0)
                {
                    Int64 billserial = Convert.ToInt64((from n in db.BillDbSet
                                                        where n.COMPID == compid && n.BILLNO == billno
                                       && n.BILLYY == billyear

                                                        select n.BILLSL).Max());
                    obj.COMPID = compid;
                    obj.BILLDT = Convert.ToDateTime(billdate);
                    obj.BILLYY = billyear;
                    obj.BILLNO = billno;
                    obj.PATIENTYY = Convert.ToInt64(patientyear);
                    obj.PATIENTID = patientid;
                    obj.PATIENTYYID = patientyearid;
                    if (billserial == 0)
                    {
                        obj.BILLSL = Convert.ToInt64(Convert.ToString(billno) + "01");

                    }
                    else
                    {
                        obj.BILLSL = billserial + 1;
                    }
                    obj.BILLID = billid_path;
                    obj.AMOUNT = sum_amount;
                    obj.REMARKS = "";


                    obj.USERPC = strHostName;
                    obj.INSIPNO = ipAddress.ToString();

                    obj.INSTIME = Convert.ToDateTime(td);

                    obj.INSUSERID = Inuserid;
                    obj.INSLTUDE = Insltude;

                    db.BillDbSet.Add(obj);
                    db.SaveChanges();
                }

            }

            //from HMS_PCHGOTC
            var search_billid_pchg = (from n in db.HmsPChargeDbSet
                                      where n.COMPID == compid && n.PATIENTYYID == patientyearid && n.CHARGEID != null
                                      select new { n.CHARGEID }).Distinct().ToList();
            foreach (var pchg in search_billid_pchg)
            {
                Int64 billid_pcharge = Convert.ToInt64(pchg.CHARGEID);
                decimal sum_amount = Convert.ToDecimal((from n in db.HmsPChargeDbSet
                                                        where n.COMPID == compid && n.PATIENTYYID == patientyearid && n.CHARGEID == billid_pcharge
                                                        select n.AMOUNT).Sum());
                if (sum_amount > 0)
                {
                    Int64 billserial = Convert.ToInt64((from n in db.BillDbSet
                                                        where n.COMPID == compid && n.BILLNO == billno
                                       && n.BILLYY == billyear

                                                        select n.BILLSL).Max());
                    obj.COMPID = compid;
                    obj.BILLDT = Convert.ToDateTime(billdate);
                    obj.BILLYY = billyear;
                    obj.BILLNO = billno;
                    obj.PATIENTYY = Convert.ToInt64(patientyear);
                    obj.PATIENTID = patientid;
                    obj.PATIENTYYID = patientyearid;
                    if (billserial == 0)
                    {
                        obj.BILLSL = Convert.ToInt64(Convert.ToString(billno) + "01");

                    }
                    else
                    {
                        obj.BILLSL = billserial + 1;
                    }
                    obj.BILLID = billid_pcharge;
                    obj.AMOUNT = sum_amount;
                    obj.REMARKS = "";


                    obj.USERPC = strHostName;
                    obj.INSIPNO = ipAddress.ToString();

                    obj.INSTIME = Convert.ToDateTime(td);

                    obj.INSUSERID = Inuserid;
                    obj.INSLTUDE = Insltude;

                    db.BillDbSet.Add(obj);
                    db.SaveChanges();
                }
            }




            return "OK";
        }
    }
}