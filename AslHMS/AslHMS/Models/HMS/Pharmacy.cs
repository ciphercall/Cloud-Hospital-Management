using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace AslHMS.Models.HMS
{
    [Table("HMS_PHARMACY")]
    public class Pharmacy
    {

        [Key, Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public Int64 ID { get; set; }

        [Key, Column(Order = 1)]
        public Int64 COMPID { get; set; }

        [Key, Column(Order = 2)]
        public string TRANSTP { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? TRANSDT { get; set; }

        [Key, Column(Order = 3)]
        [StringLength(6, MinimumLength = 6)]
        public string TRANSMY { get; set; }

        [Key, Column(Order = 4)]
        public Int64 TRANSNO { get; set; }

        [Key, Column(Order = 5)]
        public Int64 ITEMSL { get; set; }
        public Int64? DEPTFR { get; set; }
        public Int64? DEPTTO { get; set; }

        [StringLength(7, MinimumLength = 0)]
        public string PATIENTTP { get; set; }
        public Int64? PATIENTYY { get; set; }
        public Int64? PATIENTYYID { get; set; }

        [StringLength(10, MinimumLength = 10)]
        public string PATIENTID { get; set; }
        public Int64? SUPPLIERID { get; set; }
        public Int64? MEDIID { get; set; }
        public decimal? QTY { get; set; }
        public decimal? RATE { get; set; }
        public decimal? AMOUNT { get; set; }
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