using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace AslHMS.Models.HMS
{
    [Table("HMS_IPD")]
    public class Ipd
    {
        [Key, Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public Int64 ID { get; set; }

        [Key, Column(Order = 1)]
        public Int64 COMPID { get; set; }

   
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? TRANSDT { get; set; }
        public Int64 PATIENTYY { get; set; }
        public string PATIENTID { get; set; }

        public Int64? PATIENTYYID { get; set; }
        public string PATIENTNM { get; set; }
        public string GUARDIANNM { get; set; }
        public string GENDER { get; set; }
        public string AGE { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? DOB { get; set; }
        public string MSTATUS { get; set; }
        public string RELIGION { get; set; }
        public string OCCUPATION { get; set; }
        public string TELNO { get; set; }
        [RegularExpression(@"^([0-9]{11})", ErrorMessage = "Insert a valid phone Number like 01900000000")]
        public string MOBNO { get; set; }
        public string ADDRPRE { get; set; }
        public string ADDRPER { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? ADMITDT { get; set; }
        public string ADMITTM { get; set; }
        public Int64? DOCTORID { get; set; }
        public Int64? REFERID { get; set; }
     
        [Range(typeof(Decimal), "0", "999999999999999", ErrorMessage = "{0} must be a decimal/number between {1} and {2}.")]
        public decimal? PCNTR { get; set; }
        
        public string REMARKS { get; set; }




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