using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using AslHMS.DataAccess;
using AslHMS.Models;
using AslHMS.Models.DTO;
using AslHMS.Models.HMS;
using Microsoft.SqlServer.Server;

namespace AslHMS.Controllers.Api
{
    public class ApiPathologyMstController : ApiController
    {

        IFormatProvider dateformat = new System.Globalization.CultureInfo("fr-FR", true);
        TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Asia Standard Time");
        public DateTime td;

        AslHMSApiContext db = new AslHMSApiContext();

        //Get Ip ADDRESS,Time & user PC Name
        public string strHostName;
        public IPHostEntry ipHostInfo;
        public IPAddress ipAddress;

        public ApiPathologyMstController()
        {

            strHostName = System.Net.Dns.GetHostName();
            ipHostInfo = Dns.Resolve(Dns.GetHostName());
            ipAddress = ipHostInfo.AddressList[0];

            td = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
        }

        [System.Web.Http.Route("apiPathologyMst/getMYAndTansno")]
        [System.Web.Http.HttpGet]
        public List<string> makingTransMY_TRANSNO(string changedtxt, string changedtxt2)
        {
            string tablename = "HMS_PATHOMST";


            List<string> from_result = ShimulGenerateTransnoWithMonthYear.DateChanged_getMonth(changedtxt, changedtxt2, tablename);

            return from_result;
        }



        [System.Web.Http.Route("api/ApiPathologyMst/GetData")]
        [System.Web.Http.HttpGet]
        public IEnumerable<PathologyDTO> Get(string Compid, string TransactionDate, string TransMonth, string Transno, string PatientYear, string PathientYearid,
            string deliverydt, string deliverydtm, string Remarks, string InUserID, string InsLtude)
        {

            //Get Ip ADDRESS,Time & user PC Name


            Int64 InsUserID = Convert.ToInt64(InUserID);
            Int64 compid = Convert.ToInt64(Compid);
            Int64 transno = Convert.ToInt64(Transno);
            Int64 patientyid = Convert.ToInt64(PathientYearid);

            var ache_kina_data = (from n in db.PathologyMasterDbSet where n.COMPID == compid && n.TRANSNO == transno select n).ToList();
            if (ache_kina_data.Count == 0)
            {
                if (TransactionDate != "" || PathientYearid != "" || deliverydt != "")
                {
                    var search_patientid =
                        (from n in db.HMS_IpdDbSet where n.COMPID == compid && n.PATIENTYYID == patientyid select n)
                            .ToList();
                    string patientid = "";
                    foreach (var ipd in search_patientid)
                    {
                        patientid = Convert.ToString(ipd.PATIENTID);
                    }
                    PathologyMaster obj = new PathologyMaster()
                    {
                        COMPID = compid,

                        TRANSDT = Convert.ToDateTime(TransactionDate),
                        TRANSMY = TransMonth,
                        TRANSNO = Convert.ToInt64(Transno),
                        PATIENTID = patientid,
                        PATIENTYY = Convert.ToInt64(PatientYear),
                        PATIENTYYID = patientyid,
                        DVDT = Convert.ToDateTime(deliverydt),
                        DVTM = Convert.ToDateTime(deliverydtm),
                        REMARKS = Remarks,

                        USERPC = strHostName,
                        INSIPNO = ipAddress.ToString(),

                        INSTIME = Convert.ToDateTime(td),

                        INSUSERID = InsUserID,
                        INSLTUDE = InsLtude
                    };
                    db.PathologyMasterDbSet.Add(obj);
                    db.SaveChanges();

                    yield return new PathologyDTO
                    {

                        COMPID = compid,
                        TRANSDT = TransactionDate,
                        TRANSMY = TransMonth,
                        TRANSNO = Convert.ToInt64(Transno),
                        TESTSL = 0


                    };
                }


                else
                {
                    yield return new PathologyDTO
                    {

                        COMPID = compid,
                        TRANSDT = TransactionDate,
                        TRANSMY = TransMonth,
                        TRANSNO = Convert.ToInt64(Transno),
                        TESTSL = 0


                    };
                }








            }
            else
            {
                var child_data = (from n in db.PathologyDbSet where n.COMPID == compid && n.TRANSNO == transno select n).ToList();
                if (child_data.Count == 0)
                {
                    yield return new PathologyDTO
                    {

                        COMPID = compid,
                        TRANSDT = TransactionDate,
                        TRANSMY = TransMonth,
                        TRANSNO = Convert.ToInt64(Transno),
                        TESTSL = 0


                    };
                }
                else
                {

                    var patho_data = (from t1 in db.PathologyDbSet
                                      join t2 in db.HMS_TEST on t1.COMPID equals t2.COMPID
                                      where t1.COMPID == compid && t1.TRANSNO == transno && t1.TESTID == t2.TESTID
                                      select new
                                      {
                                          Id = t1.ID,

                                          compid = t1.COMPID,
                                          transdt = t1.TRANSDT,
                                          transmy = t1.TRANSMY,
                                          transn = t1.TRANSNO,
                                          patientyear = t1.PATIENTYY,
                                          patientyearid = t1.PATIENTYYID,
                                          patientid = t1.PATIENTID,
                                          testsl = t1.TESTSL,
                                          testid = t1.TESTID,
                                          testname = t2.TESTNM,
                                          amount = t1.AMOUNT,
                                          childremarks = t1.REMARKS



                                      });
                    foreach (var item in patho_data)
                    {

                        yield return new PathologyDTO
                        {
                            ID = item.Id,
                            COMPID = item.compid,
                            TRANSDT = Convert.ToString(item.transdt),
                            TRANSMY = item.transmy,
                            TRANSNO = item.transn,
                            PATIENTID = item.patientid,
                            PATIENTYY = item.patientyear,
                            PATIENTYYID = item.patientyearid,

                            TESTSL = item.testsl,
                            TESTID = item.testid,
                            TESTNM = item.testname,
                            AMOUNT = item.amount,
                            PathologyRemarks = item.childremarks

                        };
                    }
                }
            }

        }

        [System.Web.Http.Route("apiPathologyMst/grid/Child")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage AddChildData(PathologyDTO model)
        {


            var check_data = (from n in db.PathologyDbSet
                              where n.COMPID == model.COMPID && n.TRANSMY == model.TRANSMY
                                  && n.TRANSNO == model.TRANSNO && n.TESTID == model.TESTID
                              select n).ToList();
            if (check_data.Count == 0)
            {
                Int64 testSerial = Convert.ToInt64((from n in db.PathologyDbSet
                                                    where n.COMPID == model.COMPID && n.TRANSMY == model.TRANSMY
                                   && n.TRANSNO == model.TRANSNO

                                                    select n.TESTSL).Max());
                var search_patientid =
                     (from n in db.HMS_IpdDbSet where n.COMPID == model.COMPID && n.PATIENTYYID == model.PATIENTYYID select n)
                         .ToList();
                string patientid = "";
                foreach (var ipd in search_patientid)
                {
                    patientid = Convert.ToString(ipd.PATIENTID);
                }

                var find_ipdid =
                            (from n in db.HMS_TEST where n.COMPID == model.COMPID && n.TESTID == model.TESTID select n)
                                .ToList();
                Int64 billid = 0;
                foreach (var test in find_ipdid)
                {
                    billid = test.IPDID;
                }

                if (testSerial == 0)
                {


                    Pathology childData = new Pathology();

                    childData.COMPID = model.COMPID;

                    childData.TRANSDT = Convert.ToDateTime(model.TRANSDT);
                    childData.TRANSMY = model.TRANSMY;
                    childData.TRANSNO = model.TRANSNO;
                    childData.PATIENTYY = model.PATIENTYY;
                    childData.PATIENTYYID = model.PATIENTYYID;
                    childData.PATIENTID = patientid;

                    childData.BILLID = billid;
                    childData.TESTSL = 1;
                    childData.TESTID = model.TESTID;
                    childData.AMOUNT = model.AMOUNT;
                    childData.REMARKS = model.PathologyRemarks;

                    childData.USERPC = strHostName;
                    childData.INSIPNO = ipAddress.ToString();
                    childData.INSTIME = Convert.ToDateTime(td);
                    childData.INSUSERID = model.INSUSERID;
                    childData.INSLTUDE = model.INSLTUDE;

                    db.PathologyDbSet.Add(childData);

                    db.SaveChanges();

                    model.ID = childData.ID;
                    model.COMPID = model.COMPID;
                    model.TRANSDT = model.TRANSDT;
                    model.TRANSMY = model.TRANSMY;
                    model.TRANSNO = model.TRANSNO;
                    model.PATIENTYY = model.PATIENTYY;
                    model.PATIENTYYID = model.PATIENTYYID;




                    //Insert_OpdLogData(model);






                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                    return response;
                }
                else
                {
                    Pathology childData = new Pathology();

                    childData.COMPID = model.COMPID;


                    childData.TRANSDT = Convert.ToDateTime(model.TRANSDT);
                    childData.TRANSMY = model.TRANSMY;
                    childData.TRANSNO = model.TRANSNO;
                    childData.PATIENTYY = model.PATIENTYY;
                    childData.PATIENTYYID = model.PATIENTYYID;
                    childData.BILLID = billid;
                    childData.PATIENTID = patientid;
                    childData.TESTSL = testSerial + 1;
                    childData.TESTID = model.TESTID;
                    childData.AMOUNT = model.AMOUNT;
                    childData.REMARKS = model.PathologyRemarks;

                    childData.USERPC = strHostName;
                    childData.INSIPNO = ipAddress.ToString();
                    childData.INSTIME = Convert.ToDateTime(td);
                    childData.INSUSERID = model.INSUSERID;
                    childData.INSLTUDE = model.INSLTUDE;

                    db.PathologyDbSet.Add(childData);

                    db.SaveChanges();


                    model.ID = childData.ID;
                    model.COMPID = model.COMPID;
                    model.TRANSDT = model.TRANSDT;
                    model.TRANSMY = model.TRANSMY;
                    model.TRANSNO = model.TRANSNO;
                    model.PATIENTYY = model.PATIENTYY;
                    model.PATIENTYYID = model.PATIENTYYID;





                    //Insert_OpdLogData(model);






                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                    return response;
                }

            }
            else
            {
                model.TESTSL = 0;
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                return response;
            }


        }

        [System.Web.Http.Route("ApiPathologyMst/getAmount")]
        [System.Web.Http.HttpGet]
        public string getamount(Int64 Testid, Int64 Compid)
        {
            var find_amount = (from n in db.HMS_TEST where n.COMPID == Compid && n.TESTID == Testid select n).ToList();
            decimal amount = 0;
            foreach (var test in find_amount)
            {
                amount = Convert.ToDecimal(test.RATE);
            }
            return amount.ToString();
        }


        [System.Web.Http.Route("ApiPathologyMst/SaveData")]
        [System.Web.Http.HttpPost]
        public HttpResponseMessage SaveData(PathologyDTO model)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

            var duplicate_data_test =
                    (from n in db.PathologyDbSet
                     where n.COMPID == model.COMPID && n.TRANSNO == model.TRANSNO
                        && n.TESTSL == model.TESTSL && n.TESTID == model.TESTID
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

                    var data_find = (from n in db.PathologyDbSet where n.ID == model.ID select n).ToList();

                    foreach (var item in data_find)
                    {
                        var find_amount = (from n in db.HMS_TEST where n.COMPID == model.COMPID && n.TESTID == model.TESTID select n).ToList();
                        decimal amount = 0;
                        foreach (var test in find_amount)
                        {
                            amount = Convert.ToDecimal(test.RATE);
                        }

                        var find_ipdid =
                                    (from n in db.HMS_TEST where n.COMPID == model.COMPID && n.TESTID == model.TESTID select n)
                                        .ToList();
                        Int64 billid = 0;
                        foreach (var test in find_ipdid)
                        {
                            billid = test.IPDID;
                        }

                        item.ID = model.ID;
                        item.COMPID = model.COMPID;

                        item.TRANSDT = item.TRANSDT;
                        item.TRANSMY = item.TRANSMY;
                        item.TRANSNO = model.TRANSNO;
                        item.PATIENTYY = item.PATIENTYY;
                        item.PATIENTYYID = item.PATIENTYYID;
                        item.PATIENTID = item.PATIENTID;
                        item.BILLID = billid;
                        item.TESTSL = item.TESTSL;
                        item.TESTID = model.TESTID;

                        item.AMOUNT = amount;

                        item.REMARKS = model.PathologyRemarks;

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
                    model.TESTSL = 0;
                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                    return response;
                }

            }

            else
            {
                model.TESTSL = 0;
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, model);


                return response;
            }

        }

        [System.Web.Http.Route("ApiPathologyMst/DeleteData")]
        [System.Web.Http.HttpPost]
        // DELETE api/<controller>/5
        public HttpResponseMessage DeleteData(PathologyDTO model)
        {

            System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AslHMSApiContext"].ToString());
            string query = string.Format("DELETE FROM HMS_PATHOLOGY WHERE ID='{0}'", model.ID);
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
    }
}

