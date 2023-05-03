using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AslHMS.Models.DTO
{
    public class PharmacyDTO
    {
        public Int64 ID { get; set; }
        public Int64 COMPID { get; set; }


        //........................Pharmacy
        public string TRANSTP { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public string TRANSDT { get; set; }
        
        [StringLength(6, MinimumLength = 6)]
        public string TRANSMY { get; set; }
        public string TRANSMY_Update { get; set; }
        public Int64 TRANSNO { get; set; }
       
        public Int64? DEPTFR { get; set; }
        public Int64? DEPTTO { get; set; }
        public string DepartmentName_From_Issue { get; set; }
        public string DepartmentName_To_Issue { get; set; }

        public Int64? DEPT_FR_TO { get; set; }
        public string DepartmentName { get; set; }

        public string PATIENTTP { get; set; }
        public Int64? PATIENTYY { get; set; }
        public Int64? PATIENTYYID { get; set; }

        [StringLength(10, MinimumLength = 10)]
        public string PATIENTID { get; set; }

        [Required(ErrorMessage = "Patient Name required!")]
        public string PatientName { get; set; }
        
        public Int64? SUPPLIERID { get; set; }
        public string SupplierName { get; set; }
        
        public Int64 ITEMSL { get; set; }
        public Int64? MEDIID { get; set; }
        public string MEDINM { get; set; }
        public decimal? QTY { get; set; }
        public decimal? RATE { get; set; }
        public decimal? AMOUNT { get; set; }
        public string REMARKS { get; set; }



        //...........................Pharmacy Master
        public decimal? TOTAMT { get; set; }
        public decimal? VATRT { get; set; }
        public decimal? VATAMT { get; set; }
        public decimal? DISCOUNT { get; set; }
        public decimal? NETAMT { get; set; }







        public string USERPC { get; set; }
        public Int64 INSUSERID { get; set; }

        //[Display(Name = "Insert Time")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? INSTIME { get; set; }
        public string INSIPNO { get; set; }
        public string INSLTUDE { get; set; }
        public Int64 UPDUSERID { get; set; }

        //[Display(Name = "Update Time")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? UPDTIME { get; set; }
        public string UPDIPNO { get; set; }
        public string UPDLTUDE { get; set; }




        public string Insert { get; set; }
        public string Update { get; set; }
        public string Delete { get; set; }


        public Int64 count { get; set; }




    }
}