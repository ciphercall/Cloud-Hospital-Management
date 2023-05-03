using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace AslHMS.Models.HMS
{
    [Table("HMS_CDISCHG")]
    public class Discharge
    {
        [Key, Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public Int64 ID { get; set; }

        [Key, Column(Order = 1)]
        public Int64 COMPID { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? TRANSDT { get; set; }

        [Key, Column(Order = 2)]
        public Int64 TRANSYY { get; set; }

        [Key, Column(Order = 3)]
        public Int64 TRANSNO { get; set; }

        [StringLength(7, MinimumLength = 0)]
        public string PATIENTTP { get; set; }
        public Int64 PATIENTYY { get; set; }
        public Int64 PATIENTYYID { get; set; }

        [StringLength(10, MinimumLength = 10)]
        public string PATIENTID { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? DISCHGDT { get; set; }
        public string DISCHGTM { get; set; }

        [StringLength(100, MinimumLength = 0)]
        public string DIAGNOSIS { get; set; }
        public string OPNOTE { get; set; }
        public string TREATMENT { get; set; }
        public string ADVICE { get; set; }
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