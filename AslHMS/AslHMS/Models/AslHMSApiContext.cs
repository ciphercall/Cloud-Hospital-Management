using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Web;
using AslHMS.Models.Account;
using AslHMS.Models.HMS;

namespace AslHMS.Models
{
    public class AslHMSApiContext : DbContext
    {
        public AslHMSApiContext()
            : base("name=AslHMSApiContext")
        {
            //base.Configuration.ProxyCreationEnabled = false;
        }

        public DbSet<AslCompany> AslCompanyDbSet { get; set; }
        public DbSet<AslUserco> AslUsercoDbSet { get; set; }
        public DbSet<ASL_LOG> AslLogDbSet { get; set; }
        public DbSet<ASL_DELETE> AslDeleteDbSet { get; set; }
        public DbSet<ASL_MENUMST> AslMenumstDbSet { get; set; }
        public DbSet<ASL_MENU> AslMenuDbSet { get; set; }
        public DbSet<ASL_ROLE> AslRoleDbSet { get; set; }

        public DbSet<Department> HMS_DEPT { get; set; }
        public DbSet<TestMaster> HMS_TESTMST { get; set; }
        public DbSet<Test> HMS_TEST { get; set; }
        public DbSet<SignBy> HMS_SIGNBY { get; set; }
        public DbSet<ManagementRF> HMS_MGTRF { get; set; }
        public DbSet<Management> HMS_MGT { get; set; }
        public DbSet<RefPersonContact> HMS_RFPCNT { get; set; }
        public DbSet<Refer> HMS_REFER { get; set; }
        public DbSet<TestNV> HMS_TESTNV { get; set; }
        public DbSet<TestV> HMS_TESTV { get; set; }
        public DbSet<Opd> HMS_OPD { get; set; }
        public DbSet<OpdMaster> HMS_OPDMST { get; set; }
        public DbSet<OpdReceive> HMS_OPDRCV { get; set; }
        public DbSet<Result> HMS_RESULT { get; set; }

        public DbSet<HeadIO> HMS_HEADIO { get; set; }
        public DbSet<OphMaster> HMS_OPHMST { get; set; }
        public DbSet<OpHead> HMS_OPHEAD { get; set; }
        public DbSet<Ipd> HMS_IpdDbSet { get; set; } //PatientIndoor
        public DbSet<Icb> HMS_IcbDbSet { get; set; }
        public DbSet<PConsultant> HmsPConsultants { get; set; }
        public DbSet<PInvestigation> HmsPInvestinDbSet { get; set; }
        public DbSet<PCharges> HmsPChargeDbSet { get; set; }
        public DbSet<OTMaster> HmsOTMaster { get; set; }
        public DbSet<OT> HmsOTDbSet { get; set; }
      



        //Pharma Part
        public DbSet<Pharma> HmsPharmaDbSet { get; set; }
        public DbSet<Gendos> HmsGendosDbSet { get; set; }
        public DbSet<MediMst> HmsMediMstDbSet { get; set; }
        public DbSet<MediCare> HmsMediCareDbSet { get; set; }
        public DbSet<PharmMst> HmsPharmMstDbSet { get; set; }
        public DbSet<Pharmacy> HmsPharmacyDbSet { get; set; }
        public DbSet<Birth> HmsBirthDbSet { get; set; }
        public DbSet<Death> HmsDeathDbSet { get; set; }
        public DbSet<Discharge> HmsDischargeDbSet { get; set; }
        public DbSet<PathologyMaster> PathologyMasterDbSet { get; set; }
        public DbSet<Pathology> PathologyDbSet { get; set; }
        public DbSet<BillMaster> BillMasterDbSet { get; set; }
        public DbSet<Bill> BillDbSet { get; set; }

        //Acount
        public DbSet<GL_ACCHART> GlAcchartDbSet { get; set; }


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<OneToManyCascadeDeleteConvention>();

        }
    }
}