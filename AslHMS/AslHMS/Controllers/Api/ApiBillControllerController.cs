using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using AslHMS.DataAccess;
using AslHMS.Models;
using AslHMS.Models.DTO;
using AslHMS.Models.HMS;

namespace AslHMS.Controllers.Api
{
    public class ApiBillController : ApiController
    {

        IFormatProvider dateformat = new System.Globalization.CultureInfo("fr-FR", true);
        TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
        public DateTime td;

        AslHMSApiContext db = new AslHMSApiContext();

        //Get Ip ADDRESS,Time & user PC Name
        public string strHostName;
        public IPHostEntry ipHostInfo;
        public IPAddress ipAddress;

        public ApiBillController()
        {

            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];

            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
        }


        [System.Web.Http.Route("apiBill/getyearAndBillno")]
        [System.Web.Http.HttpGet]
        public List<string> makeyearandbillno(string changedtxt, string changedtxt2)
        {
            DateTime tarnsdt = Convert.ToDateTime(changedtxt);
            string converttoString = Convert.ToString(tarnsdt.ToString("dd-MMM-yyyy"));
            string getYear = converttoString.Substring(7, 4);
            string get2digityear = converttoString.Substring(9, 2);





            AslHMSApiContext db = new AslHMSApiContext();

            Int64 compid = Convert.ToInt64(changedtxt2);
            Int64 year = Convert.ToInt64(getYear);

            Int64 maxvalue = 0, Trans = 0;

            string billno = "";
            try
            {
                Int64 find_billno =
               Convert.ToInt64((from n in db.BillMasterDbSet where n.COMPID == compid && n.BILLYY == year select n.BILLNO).Max());
                if (find_billno == 0)
                {
                    billno = get2digityear + "000001";
                }
                else
                {
                    billno = Convert.ToString(find_billno + 1);
                }
            }
            catch (Exception)
            {
                billno = get2digityear + "000001";
            }







            List<string> result = new List<string>();
            result.Add(getYear);
            result.Add(billno);

            return result;



        }


        [System.Web.Http.Route("ApiBill/getAmount")]
        [System.Web.Http.HttpGet]
        public string getamount(Int64 Billid, Int64 Compid)
        {
            var find_amount = (from n in db.HMS_HEADIO where n.COMPID == Compid && n.HEADID == Billid select n).ToList();
            decimal amount = 0;
            foreach (var test in find_amount)
            {
                amount = Convert.ToDecimal(test.RATE);
            }
            return amount.ToString();
        }


        [System.Web.Http.Route("ApiBill/GetData")]
        [System.Web.Http.HttpGet]
        public IEnumerable<BillMasterDTO> Get(string Compid, string BillDate, string Billyear, string Billno, string PatientYear, string PatientYearID,
            string DischargeDt, string DischargeTm, string Remarks, string InUserID, string InsLtude)
        {

            //Get Ip ADDRESS,Time & user PC Name


            Int64 InsUserID = Convert.ToInt64(InUserID);
            Int64 compid = Convert.ToInt64(Compid);
            Int64 BILLYY = Convert.ToInt64(Billyear);
            Int64 BILLNO = Convert.ToInt64(Billno);
            Int64 patientyid = Convert.ToInt64(PatientYearID);

            var ache_kina_data = (from n in db.BillMasterDbSet where n.COMPID == compid && n.BILLNO == BILLNO && n.BILLYY == BILLYY select n).ToList();

            if (ache_kina_data.Count == 0)
            {

                var search_patientid =
                    (from n in db.HMS_IpdDbSet where n.COMPID == compid && n.PATIENTYYID == patientyid select n)
                        .ToList();
                string patientid = "";
                foreach (var ipd in search_patientid)
                {
                    patientid = Convert.ToString(ipd.PATIENTID);
                }
                BillMaster obj = new BillMaster()
                {
                    COMPID = compid,

                    BILLDT = Convert.ToDateTime(BillDate),
                    BILLYY = BILLYY,
                    BILLNO = BILLNO,
                    PATIENTID = patientid,
                    PATIENTYY = Convert.ToInt64(PatientYear),
                    PATIENTYYID = patientyid,
                    DISCHGDT = Convert.ToDateTime(DischargeDt),
                    DISCHGTM = Convert.ToDateTime(DischargeTm),
                    REMARKS = Remarks,

                    USERPC = strHostName,
                    INSIPNO = ipAddress.ToString(),

                    INSTIME = Convert.ToDateTime(td),

                    INSUSERID = InsUserID,
                    INSLTUDE = InsLtude
                };
                db.BillMasterDbSet.Add(obj);
                db.SaveChanges();

                string result = billProcess.processbill(compid, patientyid, BillDate, BILLYY, BILLNO, PatientYear, patientid, InsUserID, InsLtude);

                var child_data = (from n in db.BillDbSet where n.COMPID == compid && n.BILLYY == BILLYY && n.BILLNO == BILLNO select n).ToList();
                if (child_data.Count == 0)
                {
                    yield return new BillMasterDTO
                    {
                        COMPID = compid,
                        BILLDT = BillDate,
                        BILLYY = BILLYY,
                        BILLNO = BILLNO,
                        BILLSL = 0


                    };
                }
                else
                {

                    var bill_data = (from t1 in db.BillDbSet
                                     join t2 in db.HMS_HEADIO on t1.COMPID equals t2.COMPID
                                     where t1.COMPID == compid && t1.BILLNO == BILLNO && t1.BILLYY == BILLYY && t1.BILLID == t2.HEADID

                                     select new
                                     {
                                         Id = t1.ID,

                                         compid = t1.COMPID,
                                         billdt = t1.BILLDT,
                                         billyear = t1.BILLYY,
                                         billno = t1.BILLNO,
                                         patientyear = t1.PATIENTYY,
                                         patientyearid = t1.PATIENTYYID,
                                         patientid = t1.PATIENTID,
                                         billsl = t1.BILLSL,
                                         billid = t1.BILLID,
                                         billname = t2.HEADNM,
                                         amount = t1.AMOUNT,
                                         childremarks = t1.REMARKS



                                     });
                    foreach (var item in bill_data)
                    {

                        yield return new BillMasterDTO
                        {
                            ID = item.Id,
                            COMPID = item.compid,
                            BILLDT = Convert.ToString(item.billdt),
                            BILLYY = item.billyear,
                            BILLNO = item.billno,
                            PATIENTID = item.patientid,
                            PATIENTYY = item.patientyear,
                            PATIENTYYID = item.patientyearid,

                            BILLSL = item.billsl,
                            BILLID = item.billid,
                            BillName = item.billname,
                            AMOUNT = item.amount,
                            RemarksChild = item.childremarks

                        };
                    }
                }











            }
            else
            {
                var child_data = (from n in db.BillDbSet where n.COMPID == compid && n.BILLYY == BILLYY && n.BILLNO == BILLNO select n).ToList();
                if (child_data.Count == 0)
                {
                    yield return new BillMasterDTO
                    {
                        COMPID = compid,
                        BILLDT = BillDate,
                        BILLYY = BILLYY,
                        BILLNO = BILLNO,
                        BILLSL = 0


                    };
                }
                else
                {

                    var bill_data = (from t1 in db.BillDbSet
                                     join t2 in db.HMS_HEADIO on t1.COMPID equals t2.COMPID
                                     where t1.COMPID == compid && t1.BILLNO == BILLNO && t1.BILLYY == BILLYY && t1.BILLID == t2.HEADID

                                     select new
                                     {
                                         Id = t1.ID,

                                         compid = t1.COMPID,
                                         billdt = t1.BILLDT,
                                         billyear = t1.BILLYY,
                                         billno = t1.BILLNO,
                                         patientyear = t1.PATIENTYY,
                                         patientyearid = t1.PATIENTYYID,
                                         patientid = t1.PATIENTID,
                                         billsl = t1.BILLSL,
                                         billid = t1.BILLID,
                                         billname = t2.HEADNM,
                                         amount = t1.AMOUNT,
                                         childremarks = t1.REMARKS



                                     });
                    foreach (var item in bill_data)
                    {

                        yield return new BillMasterDTO
                        {
                            ID = item.Id,
                            COMPID = item.compid,
                            BILLDT = Convert.ToString(item.billdt),
                            BILLYY = item.billyear,
                            BILLNO = item.billno,
                            PATIENTID = item.patientid,
                            PATIENTYY = item.patientyear,
                            PATIENTYYID = item.patientyearid,

                            BILLSL = item.billsl,
                            BILLID = item.billid,
                            BillName = item.billname,
                            AMOUNT = item.amount,
                            RemarksChild = item.childremarks

                        };
                    }
                }
            }

        }

        [System.Web.Http.Route("ApiBill/grid/Child")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage AddChildData(BillMasterDTO model)
        {


            var check_data = (from n in db.BillDbSet
                              where n.COMPID == model.COMPID && n.BILLNO == model.BILLNO
                                  && n.BILLYY == model.BILLYY && n.BILLID == model.BILLID
                              select n).ToList();
            if (check_data.Count == 0)
            {
                Int64 billserial = Convert.ToInt64((from n in db.BillDbSet
                                                    where n.COMPID == model.COMPID && n.BILLNO == model.BILLNO
                                   && n.BILLYY == model.BILLYY

                                                    select n.BILLSL).Max());
                var search_patientid =
                     (from n in db.HMS_IpdDbSet where n.COMPID == model.COMPID && n.PATIENTYYID == model.PATIENTYYID select n)
                         .ToList();
                string patientid = "";
                foreach (var ipd in search_patientid)
                {
                    patientid = Convert.ToString(ipd.PATIENTID);
                }

                if (billserial == 0)
                {


                    Bill childData = new Bill();

                    childData.COMPID = model.COMPID;

                    childData.BILLDT = Convert.ToDateTime(model.BILLDT);
                    childData.BILLYY = Convert.ToInt64(model.BILLYY);
                    childData.BILLNO = Convert.ToInt64(model.BILLNO);
                    childData.PATIENTYY = model.PATIENTYY;
                    childData.PATIENTYYID = model.PATIENTYYID;
                    childData.PATIENTID = patientid;
                    childData.BILLSL = Convert.ToInt64(Convert.ToString(model.BILLNO) + "01");
                    childData.BILLID = Convert.ToInt64(model.BILLID);
                    childData.AMOUNT = model.AMOUNT;
                    childData.REMARKS = model.RemarksChild;

                    childData.USERPC = strHostName;
                    childData.INSIPNO = ipAddress.ToString();
                    childData.INSTIME = Convert.ToDateTime(td);
                    childData.INSUSERID = model.INSUSERID;
                    childData.INSLTUDE = model.INSLTUDE;

                    db.BillDbSet.Add(childData);

                    db.SaveChanges();

                    model.ID = childData.ID;
                    model.COMPID = model.COMPID;
                    model.BILLDT = model.BILLDT;
                    model.BILLNO = model.BILLNO;
                    model.BILLYY = model.BILLYY;
                    model.PATIENTYY = model.PATIENTYY;
                    model.PATIENTYYID = model.PATIENTYYID;




                    //Insert_OpdLogData(model);






                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                    return response;
                }
                else
                {
                    Bill childData = new Bill();

                    childData.COMPID = model.COMPID;

                    childData.BILLDT = Convert.ToDateTime(model.BILLDT);
                    childData.BILLYY = Convert.ToInt64(model.BILLYY);
                    childData.BILLNO = Convert.ToInt64(model.BILLNO);
                    childData.PATIENTYY = model.PATIENTYY;
                    childData.PATIENTYYID = model.PATIENTYYID;
                    childData.PATIENTID = patientid;
                    childData.BILLSL = billserial + 1;
                    childData.BILLID = Convert.ToInt64(model.BILLID);
                    childData.AMOUNT = model.AMOUNT;
                    childData.REMARKS = model.RemarksChild;


                    childData.USERPC = strHostName;
                    childData.INSIPNO = ipAddress.ToString();
                    childData.INSTIME = Convert.ToDateTime(td);
                    childData.INSUSERID = model.INSUSERID;
                    childData.INSLTUDE = model.INSLTUDE;

                    db.BillDbSet.Add(childData);

                    db.SaveChanges();


                    model.ID = childData.ID;
                    model.COMPID = model.COMPID;
                    model.BILLDT = model.BILLDT;
                    model.BILLNO = model.BILLNO;
                    model.BILLYY = model.BILLYY;
                    model.PATIENTYY = model.PATIENTYY;
                    model.PATIENTYYID = model.PATIENTYYID;





                    //Insert_OpdLogData(model);






                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                    return response;
                }

            }
            else
            {
                model.BILLSL = 0;
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                return response;
            }


        }

        [System.Web.Http.Route("ApiBill/SaveData")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage SaveData(BillMasterDTO model)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

            var duplicate_data_test =
                    (from n in db.BillDbSet
                     where n.COMPID == model.COMPID && n.BILLNO == model.BILLNO
                        && n.BILLID == model.BILLID && n.BILLSL == model.BILLSL
                     select n).ToList();
            Int64 id = 0;
            if (duplicate_data_test.Count > 0)
            {
                foreach (var x in duplicate_data_test)
                {
                    id = x.ID;
                }
                if (id == model.ID)
                {

                    var data_find = (from n in db.BillDbSet where n.ID == model.ID select n).ToList();

                    foreach (var item in data_find)
                    {
                        var find_amount = (from n in db.HMS_HEADIO where n.COMPID == model.COMPID && n.HEADID == model.BILLID select n).ToList();
                        decimal amount = 0;
                        foreach (var test in find_amount)
                        {
                            amount = Convert.ToDecimal(test.RATE);
                        }
                        item.ID = model.ID;
                        item.COMPID = model.COMPID;

                        item.BILLDT = item.BILLDT;
                        item.BILLYY = item.BILLYY;
                        item.BILLNO = Convert.ToInt64(model.BILLNO);
                        item.PATIENTYY = item.PATIENTYY;
                        item.PATIENTYYID = item.PATIENTYYID;
                        item.PATIENTID = item.PATIENTID;
                        item.BILLSL = item.BILLSL;
                        item.BILLID = Convert.ToInt64(model.BILLID);

                        item.AMOUNT = amount;

                        item.REMARKS = model.RemarksChild;

                        item.USERPC = item.USERPC;
                        item.INSIPNO = item.INSIPNO;
                        item.INSLTUDE = item.INSLTUDE;
                        item.INSTIME = item.INSTIME;
                        item.INSUSERID = item.INSUSERID;



                        item.UPDIPNO = ipAddress.ToString();
                        item.UPDTIME = Convert.ToDateTime(td);



                    }


                    //db.Entry(cartFilter).State = EntityState.Modified;

                    try
                    {
                        db.SaveChanges();
                    }
                    catch (DbUpdateConcurrencyException ex)
                    {
                        return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
                    }

                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                    return response;
                }
                else
                {
                    model.BILLSL = 0;



                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                    return response;
                }

            }

            else
            {
                var data_find = (from n in db.BillDbSet where n.ID == model.ID select n).ToList();
                foreach (var item in data_find)
                {
                    var find_amount = (from n in db.HMS_HEADIO where n.COMPID == model.COMPID && n.HEADID == model.BILLID select n).ToList();
                    decimal amount = 0;
                    foreach (var test in find_amount)
                    {
                        amount = Convert.ToDecimal(test.RATE);
                    }
                    item.ID = model.ID;
                    item.COMPID = model.COMPID;

                    item.BILLDT = item.BILLDT;
                    item.BILLYY = item.BILLYY;
                    item.BILLNO = Convert.ToInt64(model.BILLNO);
                    item.PATIENTYY = item.PATIENTYY;
                    item.PATIENTYYID = item.PATIENTYYID;
                    item.PATIENTID = item.PATIENTID;
                    item.BILLSL = item.BILLSL;
                    item.BILLID = Convert.ToInt64(model.BILLID);

                    item.AMOUNT = amount;

                    item.REMARKS = model.RemarksChild;

                    item.USERPC = item.USERPC;
                    item.INSIPNO = item.INSIPNO;
                    item.INSLTUDE = item.INSLTUDE;
                    item.INSTIME = item.INSTIME;
                    item.INSUSERID = item.INSUSERID;



                    item.UPDIPNO = ipAddress.ToString();
                    item.UPDTIME = Convert.ToDateTime(td);

                    db.SaveChanges();
                }
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                return response;
            }

        }

        [System.Web.Http.Route("ApiBill/DeleteData")]
        [System.Web.Http.HttpPost]
        // DELETE api/<controller>/5
        public HttpResponseMessage DeleteData(BillMasterDTO model)
        {

            System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AslHMSApiContext"].ToString());
            string query = string.Format("DELETE FROM HMS_BILL WHERE ID='{0}'", model.ID);
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
            }
            conn.Close();
            Pathology testObj = new Pathology();






            return Request.CreateResponse(HttpStatusCode.OK, testObj);
        }


        [System.Web.Http.Route("ApiBill/Save2ndPart")]
        [System.Web.Http.HttpGet]
        public IEnumerable<BillMasterDTO> Get(string Compid, string Billno, string Totalamount, string ServiceCharge,
           string Vatamount, string Grossamount, string Advance, string Discount, string Discountid, string Netamount, string Paidamount, string Balamount, string Duehosid)
        {

            Int64 compid = Convert.ToInt64(Compid);

            Int64 billno = Convert.ToInt64(Billno);

            Int64 duehid = 0, discountid = 0;
            if (Duehosid != "")
            {
                duehid = Convert.ToInt64(Duehosid);
            }
            else
            {
                duehid = 0;
            }
            if (Discountid != "")
            {
                discountid = Convert.ToInt64(Discountid);
            }
            else
            {
                discountid = 0;
            }





            var ache_kina_data = (from n in db.BillMasterDbSet where n.COMPID == compid && n.BILLNO == billno select n).ToList();
            if (ache_kina_data.Count == 0)
            {
                //yield return new OpdDTO
                //{

                //    CompanyID = compid,
                //    TransactionDate = fdate,

                //    TestSerial = 0

                //};
                return null;

            }
            else
            {
                foreach (var item in ache_kina_data)
                {
                    item.ID = item.ID;
                    item.COMPID = item.COMPID;
                    item.BILLDT = item.BILLDT;
                    item.BILLYY = item.BILLYY;
                    item.BILLNO = item.BILLNO;
                    item.PATIENTID = item.PATIENTID;
                    item.PATIENTYYID = item.PATIENTYYID;
                    item.PATIENTYY = item.PATIENTYY;
                    item.DISCHGDT = item.DISCHGDT;
                    item.DISCHGTM = item.DISCHGTM;

                    item.USERPC = item.USERPC;
                    item.INSUSERID = item.INSUSERID;
                    item.INSIPNO = item.INSIPNO;
                    item.INSLTUDE = item.INSLTUDE;
                    item.INSTIME = item.INSTIME;

                    item.TOTAMT = Convert.ToDecimal(Totalamount);
                    item.SCHARGE = Convert.ToDecimal(ServiceCharge);
                    item.VATAMT = Convert.ToDecimal(Vatamount);
                    item.GROSSAMT = Convert.ToDecimal(Grossamount);
                    item.ADVAMT = Convert.ToDecimal(Advance);
                    item.DISCOUNT = Convert.ToDecimal(Discount);
                    item.DISCID = discountid;




                    item.NETAMT = Convert.ToDecimal(Netamount);
                    item.PAIDAMT = Convert.ToDecimal(Paidamount);
                    item.BALAMT = Convert.ToDecimal(Balamount);
                    item.DUEHID = duehid;
                    db.SaveChanges();
                }



            }


            return null;





        }
    }
}
