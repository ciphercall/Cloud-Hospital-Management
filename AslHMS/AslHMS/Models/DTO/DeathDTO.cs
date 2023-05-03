using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AslHMS.Models.DTO
{
    public class DeathDTO
    {
        public Int64 ID { get; set; }
        public Int64 COMPID { get; set; }

        [Required(ErrorMessage = "Trans Date can not be empty!")]
        public string TRANSDT { get; set; }

        [Required(ErrorMessage = "Year required!")]
        public Int64 TRANSYY { get; set; }

        [Required(ErrorMessage = "Trans No required!")]
        public Int64 TRANSNO { get; set; }

        [StringLength(7, MinimumLength = 0)]
        public string PATIENTTP { get; set; }
        public Int64 PATIENTYY { get; set; }

        [Required(ErrorMessage = "Patient ID required!")]
        public Int64 PATIENTYYID { get; set; }

        [StringLength(10, MinimumLength = 10)]
        public string PATIENTID { get; set; }

        [Required(ErrorMessage = "Patient Name required!")]
        public string PatientName { get; set; }

        [Required(ErrorMessage = "Death Date field required!")]
        public string DEATHDT { get; set; }
        public string DEATHTM { get; set; }

        [StringLength(15, MinimumLength = 0)]
        public string DCONSULTID { get; set; }
        [StringLength(15, MinimumLength = 0)]
        public string DDOCTORID { get; set; }

        [StringLength(100, MinimumLength = 0)]
        public string DCAUSE_A { get; set; }
        [StringLength(100, MinimumLength = 0)]
        public string DCAUSE_B { get; set; }
        [StringLength(100, MinimumLength = 0)]
        public string DCAUSE_C { get; set; }
        [StringLength(100, MinimumLength = 0)]
        public string REMARKS { get; set; }




        public string USERPC { get; set; }
        public Int64 INSUSERID { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? INSTIME { get; set; }
        public string INSIPNO { get; set; }
        public string INSLTUDE { get; set; }
        public Int64 UPDUSERID { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? UPDTIME { get; set; }
        public string UPDIPNO { get; set; }
        public string UPDLTUDE { get; set; }
    }
}