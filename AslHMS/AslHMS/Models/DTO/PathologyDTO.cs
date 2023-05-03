using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AslHMS.Models.DTO
{
    public class PathologyDTO
    {


        public Int64 ID { get; set; }


        public Int64 COMPID { get; set; }



        public string TRANSDT { get; set; }
        public string TRANSMY { get; set; }

        public Int64? TRANSNO { get; set; }
        public string PATIENTID { get; set; }
        public Int64? PATIENTYY { get; set; }
        public Int64? PATIENTYYID { get; set; }
        public Int64 BillId { get; set; }

        public string PatientName { get; set; }
        public string DVDT { get; set; }


        public string DVTM { get; set; }


        public string REMARKS { get; set; }

        public Int64? TESTSL { get; set; }
        public Int64? TESTID { get; set; }
        public string TESTNM { get; set; }

        public decimal? AMOUNT { get; set; }
        public string PathologyRemarks { get; set; }




        [Display(Name = "User PC")]
        public string USERPC { get; set; }
        public Int64? INSUSERID { get; set; }

        [Display(Name = "Insert Time")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? INSTIME { get; set; }

        [Display(Name = "Inesrt IP ADDRESS")]
        public string INSIPNO { get; set; }
        public string INSLTUDE { get; set; }
        public Int64? UPDUSERID { get; set; }

        [Display(Name = "Update Time")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? UPDTIME { get; set; }

        [Display(Name = "Update IP ADDRESS")]
        public string UPDIPNO { get; set; }
        public string UPDLTUDE { get; set; }
    }
}