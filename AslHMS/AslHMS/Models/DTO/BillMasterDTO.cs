using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AslHMS.Models.DTO
{
    public class BillMasterDTO
    {

        public Int64 ID { get; set; }


        public Int64 COMPID { get; set; }

        public string BILLDT { get; set; }


        public Int64? BILLYY { get; set; }
        public Int64? BILLNO { get; set; }
        public Int64? PATIENTYY { get; set; }
        public Int64? PATIENTYYID { get; set; }
        public string PATIENTID { get; set; }
        public string PatientName { get; set; }

        public DateTime? DISCHGDT { get; set; }


        public DateTime? DISCHGTM { get; set; }

        public decimal? TOTAMT { get; set; }

        public decimal? SCHARGE { get; set; }

        public decimal? VATAMT { get; set; }

        public decimal? GROSSAMT { get; set; }

        public decimal? ADVAMT { get; set; }

        public decimal? DISCOUNT { get; set; }

        public decimal? NETAMT { get; set; }

        public decimal? PAIDAMT { get; set; }

        public decimal? BALAMT { get; set; }
        public Int64? DISCID { get; set; }
        public Int64? DUEHID { get; set; }
        public string RemarksMaster { get; set; }




        public Int64? BILLSL { get; set; }
        public Int64? BILLID { get; set; }
        public string BillName { get; set; }
        public decimal? AMOUNT { get; set; }
        public string RemarksChild { get; set; }



        public string USERPC { get; set; }
        public Int64 INSUSERID { get; set; }


        public DateTime? INSTIME { get; set; }
        public string INSIPNO { get; set; }
        public string INSLTUDE { get; set; }
        public Int64 UPDUSERID { get; set; }


        public DateTime? UPDTIME { get; set; }
        public string UPDIPNO { get; set; }
        public string UPDLTUDE { get; set; }
    }
}