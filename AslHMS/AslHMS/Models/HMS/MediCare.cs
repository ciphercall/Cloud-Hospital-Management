using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace AslHMS.Models.HMS
{
    [Table("HMS_MEDICARE")]
    public class MediCare
    {

        [Key, Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public Int64 ID { get; set; }

        [Key, Column(Order = 1)]
        public Int64 COMPID { get; set; }

        [Key, Column(Order = 2)]
        public Int64 MCATID { get; set; }

        [Key, Column(Order = 3)]
        public Int64 MEDIID { get; set; }
        public string MEDINM { get; set; }
        public Int64? GENERICID { get; set; }
        public Int64? DOSAGEFID { get; set; }
        public Int64? PHARMAID { get; set; }

        [StringLength(10, MinimumLength = 0)]
        public string UNIT { get; set; }
        public Decimal? BUYRT { get; set; }
        public Decimal? SALRT { get; set; }
        public Decimal? STKMIN { get; set; }


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