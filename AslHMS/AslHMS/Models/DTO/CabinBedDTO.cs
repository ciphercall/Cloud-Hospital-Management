using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AslHMS.Models.DTO
{
    public class CabinBedDTO
    {

        public Int64 ID { get; set; }

     
        public Int64 COMPID { get; set; }



        public Int64 PatientYear { get; set; }
        public string PatientId { get; set; }
        public string PatientName { get; set; }

        public Int64? PatientYearID { get; set; }
        public Int64 BillId { get; set; }

        public string CabinType { get; set; }
        public Int64? CabinID { get; set; }
        public string CabinHead { get; set; }

     
        public string EFDT { get; set; }

        public string EFTM { get; set; }
      
        public string ETDT { get; set; }
        public string ETTM { get; set; }


   
        public decimal? TotalHours { get; set; }
      
        public decimal? TotalDays { get; set; }

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