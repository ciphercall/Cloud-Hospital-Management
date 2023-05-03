using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AslHMS.Models.DTO
{
    public class PatientIndoorDTO
    {
      
        public Int64 ID { get; set; }

      
        public Int64 COMPID { get; set; }

        public DateTime? TransactionDT { get; set; }
        public Int64 PatientYear { get; set; }
        public string PatientID { get; set; }

        public Int64? PatientYearID { get; set; }
        public string PatientName { get; set; }
        public string GurdianName { get; set; }
        public string gender { get; set; }
        public string Age { get; set; }
      
        public DateTime? DateOfBirth { get; set; }
        public string MaritalStatus { get; set; }
        public string Religion { get; set; }
        public string Occupation { get; set; }
        public string TelephoneNo { get; set; }
        public string MobileNo { get; set; }
        public string PresentAddress { get; set; }
        public string PermanentAddress{ get; set; }
        
        
        public DateTime? AdmitDate { get; set; }
        public string AdmitTime { get; set; }
        public Int64? DoctorID { get; set; }
        public string DoctorName { get; set; }
        public string ReferName { get; set; }
        public Int64? ReferID { get; set; }

    
        public decimal? Percentage { get; set; }

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