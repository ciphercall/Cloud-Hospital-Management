using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity.Core.Metadata.Edm;
using System.Linq;
using System.Web;
using AslHMS.Models.HMS;

//using DotNetOpenAuth.OpenId.Extensions.AttributeExchange;

namespace AslHMS.Models
{
    public class PageModel
    {

        public PageModel()
        {
            this.aslMenumst = new ASL_MENUMST();
            this.aslMenu = new ASL_MENU();
            this.aslUserco = new AslUserco();
            this.aslCompany = new AslCompany();
            this.aslLog = new ASL_LOG();
         

            this.Hms_Pharmacy = new Pharmacy();
            this.Hms_PharmacyMst = new PharmMst();   
        }

        public ASL_MENUMST aslMenumst { get; set; }
        public ASL_MENU aslMenu { get; set; }
        public AslUserco aslUserco { get; set; }
        public AslCompany aslCompany { get; set; }
        public ASL_LOG aslLog { get; set; }

        public Pharmacy Hms_Pharmacy { get; set; }
        public PharmMst Hms_PharmacyMst { get; set; }




        [Display(Name = "HeadType")]
        public string HeadType { get; set; }


        [Required(ErrorMessage = "From date field can not be empty!")]
        [DataType(DataType.Date)]
        public DateTime? FromDate { get; set; }

        [Required(ErrorMessage = "To Date field can not be empty!")]
        [DataType(DataType.Date)]
        public DateTime? ToDate { get; set; }




        //HMS-ReportController
        [Required(ErrorMessage = "From date field can not be empty!")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public string Report_FromDate { get; set; }

        [Required(ErrorMessage = "To Date field can not be empty!")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public string Report_ToDate { get; set; }
        
        [Required(ErrorMessage = "Department Name field can not be empty!")]
        public Int64 DEPTID { get; set; }

        [Required(ErrorMessage = "Transaction Type field can not be empty!")]
        public string TRANSTP { get; set; }



    }
}