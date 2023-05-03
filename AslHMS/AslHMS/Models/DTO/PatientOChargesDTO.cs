using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AslHMS.Models.DTO
{
    public class PatientOChargesDTO
    {

       
        public Int64 ID { get; set; }

 
        public Int64 COMPID { get; set; }

        public string PatientType { get; set; }
     
        public string TransactionDate { get; set; }
        public Int64 PatientYear { get; set; }
        public string PatientId { get; set; }

        public Int64? PatientYearId { get; set; }
        public string PatientName { get; set; }

        public Int64? TransSerial { get; set; }


        public Int64? ChargeId { get; set; }
        public string ChargeName { get; set; }


       
        public decimal? Amount { get; set; }

        public string Remarks { get; set; }




    
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