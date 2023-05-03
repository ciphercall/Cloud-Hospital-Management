using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AslHMS.Models.DTO
{
    public class OpHeadDTO
    {
       
        public Int64 ID { get; set; }

   
        public Int64 COMPID { get; set; }


        public Int64? OpHeadCID { get; set; }
        public string OpHeadCName { get; set; }

        public Int64? OpHeadID { get; set; }

        public string OpHeadName { get; set; }

     
        public decimal? Rate { get; set; }
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