using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AslHMS.Models.DTO
{
    public class OTMasterDTO
    {
       
        public Int64 ID { get; set; }

    
        public Int64 COMPID { get; set; }

        public string  TransactionDate { get; set; }
        public Int64 TransYear { get; set; }
        public Int64? TransNo { get; set; }

        public string PatientType { get; set; }
        public Int64? PatientYear { get; set; }
        public Int64? PatientyearId { get; set; }
        public string PatientName { get; set; }
        public string PatientId { get; set; }
        public Int64 BillId { get; set; }
        public Int64? OPHID { get; set; }
        public string OpHeadName { get; set; }
        public string OPTMFR { get; set; }

        public string OPTMTO { get; set; }

        public string OTPTP { get; set; }
        public Int64? OTPID { get; set; }
        public string OTPName { get; set; }
   
        public decimal? OTPAMT { get; set; }
        public string REMARKS { get; set; }

       
        public string USERPC { get; set; }
        public Int64? INSUSERID { get; set; }



       
        public DateTime? INSTIME { get; set; }

       
        public string INSIPNO { get; set; }
        public string INSLTUDE { get; set; }
        public Int64? UPDUSERID { get; set; }

     
        public DateTime? UPDTIME { get; set; }

        public string UPDIPNO { get; set; }
        public string UPDLTUDE { get; set; }
    }
}