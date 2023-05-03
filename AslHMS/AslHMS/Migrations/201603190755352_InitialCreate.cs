namespace AslHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.AslCompanies",
                c => new
                    {
                        AslCompanyId = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(),
                        COMPNM = c.String(nullable: false),
                        ADDRESS = c.String(nullable: false),
                        CONTACTNO = c.String(nullable: false),
                        EMAILID = c.String(nullable: false),
                        WEBID = c.String(),
                        STATUS = c.String(nullable: false),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => t.AslCompanyId);
            
            CreateTable(
                "dbo.ASL_DELETE",
                c => new
                    {
                        Asl_DeleteID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(),
                        USERID = c.Long(),
                        DELSLNO = c.Long(),
                        DELDATE = c.String(),
                        DELTIME = c.String(),
                        DELIPNO = c.String(),
                        DELLTUDE = c.String(),
                        TABLEID = c.String(),
                        DELDATA = c.String(),
                        USERPC = c.String(),
                    })
                .PrimaryKey(t => t.Asl_DeleteID);
            
            CreateTable(
                "dbo.ASL_LOG",
                c => new
                    {
                        Asl_LOGid = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(),
                        USERID = c.Long(),
                        LOGTYPE = c.String(),
                        LOGSLNO = c.Long(),
                        LOGDATE = c.DateTime(),
                        LOGTIME = c.String(),
                        LOGIPNO = c.String(),
                        LOGLTUDE = c.String(),
                        TABLEID = c.String(),
                        LOGDATA = c.String(),
                        USERPC = c.String(),
                    })
                .PrimaryKey(t => t.Asl_LOGid);
            
            CreateTable(
                "dbo.ASL_MENU",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        MODULEID = c.String(),
                        SERIAL = c.Long(),
                        MENUTP = c.String(),
                        MENUID = c.String(),
                        MENUNM = c.String(),
                        ACTIONNAME = c.String(),
                        CONTROLLERNAME = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.ASL_MENUMST",
                c => new
                    {
                        MODULEID = c.String(nullable: false, maxLength: 128),
                        MODULENM = c.String(nullable: false),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                    })
                .PrimaryKey(t => t.MODULEID);
            
            CreateTable(
                "dbo.ASL_ROLE",
                c => new
                    {
                        ASL_ROLEId = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        USERID = c.Long(nullable: false),
                        MODULEID = c.String(nullable: false),
                        SERIAL = c.Long(),
                        MENUTP = c.String(nullable: false),
                        MENUID = c.String(),
                        STATUS = c.String(),
                        INSERTR = c.String(),
                        UPDATER = c.String(),
                        DELETER = c.String(),
                        MENUNAME = c.String(),
                        ACTIONNAME = c.String(),
                        CONTROLLERNAME = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                    })
                .PrimaryKey(t => t.ASL_ROLEId);
            
            CreateTable(
                "dbo.AslUsercoes",
                c => new
                    {
                        AslUsercoId = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(),
                        USERID = c.Long(),
                        USERNM = c.String(nullable: false),
                        DEPTNM = c.String(),
                        OPTP = c.String(nullable: false),
                        ADDRESS = c.String(nullable: false),
                        MOBNO = c.String(nullable: false),
                        EMAILID = c.String(),
                        LOGINBY = c.String(nullable: false),
                        LOGINID = c.String(nullable: false),
                        LOGINPW = c.String(nullable: false),
                        TIMEFR = c.String(nullable: false),
                        TIMETO = c.String(nullable: false),
                        STATUS = c.String(nullable: false),
                        USERPC = c.String(),
                        INSUSERID = c.Long(nullable: false),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(nullable: false),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => t.AslUsercoId);
            
            CreateTable(
                "dbo.HMS_BILL",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        BILLDT = c.DateTime(),
                        BILLYY = c.Long(nullable: false),
                        BILLNO = c.Long(nullable: false),
                        PATIENTYY = c.Long(),
                        PATIENTYYID = c.Long(),
                        PATIENTID = c.String(),
                        BILLSL = c.Long(),
                        BILLID = c.Long(nullable: false),
                        AMOUNT = c.Decimal(precision: 18, scale: 2),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(nullable: false),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(nullable: false),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID });
            
            CreateTable(
                "dbo.HMS_BILLMST",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        BILLDT = c.DateTime(),
                        BILLYY = c.Long(nullable: false),
                        BILLNO = c.Long(nullable: false),
                        PATIENTYY = c.Long(),
                        PATIENTYYID = c.Long(),
                        PATIENTID = c.String(),
                        DISCHGDT = c.DateTime(),
                        DISCHGTM = c.DateTime(),
                        TOTAMT = c.Decimal(precision: 18, scale: 2),
                        SCHARGE = c.Decimal(precision: 18, scale: 2),
                        VATAMT = c.Decimal(precision: 18, scale: 2),
                        GROSSAMT = c.Decimal(precision: 18, scale: 2),
                        ADVAMT = c.Decimal(precision: 18, scale: 2),
                        DISCOUNT = c.Decimal(precision: 18, scale: 2),
                        NETAMT = c.Decimal(precision: 18, scale: 2),
                        PAIDAMT = c.Decimal(precision: 18, scale: 2),
                        BALAMT = c.Decimal(precision: 18, scale: 2),
                        DISCID = c.Long(),
                        DUEHID = c.Long(),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(nullable: false),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(nullable: false),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID });
            
            CreateTable(
                "dbo.HMS_DEPT",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        DEPTID = c.Long(nullable: false),
                        DEPTNM = c.String(),
                        DEPTTP = c.String(),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.DEPTID });
            
            CreateTable(
                "dbo.HMS_HEADIO",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        HEADTP = c.String(),
                        HEADID = c.Long(),
                        HEADNM = c.String(),
                        RATE = c.Decimal(precision: 18, scale: 2),
                        HEADFOR = c.String(),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID });
            
            CreateTable(
                "dbo.HMS_ICB",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        PATIENTYY = c.Long(nullable: false),
                        PATIENTID = c.String(),
                        PATIENTYYID = c.Long(),
                        BILLID = c.Long(),
                        CBTP = c.String(),
                        CBID = c.Long(),
                        EFDT = c.DateTime(),
                        EFTM = c.String(),
                        ETDT = c.DateTime(),
                        ETTM = c.String(),
                        TOTHOUR = c.Decimal(precision: 18, scale: 2),
                        TOTDAYS = c.Decimal(precision: 18, scale: 2),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID });
            
            CreateTable(
                "dbo.HMS_IPD",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        TRANSDT = c.DateTime(),
                        PATIENTYY = c.Long(nullable: false),
                        PATIENTID = c.String(),
                        PATIENTYYID = c.Long(),
                        PATIENTNM = c.String(),
                        GUARDIANNM = c.String(),
                        GENDER = c.String(),
                        AGE = c.String(),
                        DOB = c.DateTime(),
                        MSTATUS = c.String(),
                        RELIGION = c.String(),
                        OCCUPATION = c.String(),
                        TELNO = c.String(),
                        MOBNO = c.String(),
                        ADDRPRE = c.String(),
                        ADDRPER = c.String(),
                        ADMITDT = c.DateTime(),
                        ADMITTM = c.String(),
                        DOCTORID = c.Long(),
                        REFERID = c.Long(),
                        PCNTR = c.Decimal(precision: 18, scale: 2),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID });
            
            CreateTable(
                "dbo.HMS_MGT",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        MGTID = c.Long(nullable: false),
                        MGTNM = c.String(),
                        DESIG = c.String(),
                        ADDRESS = c.String(),
                        MOBNO1 = c.String(),
                        MOBNO2 = c.String(),
                        EMAILID = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.MGTID });
            
            CreateTable(
                "dbo.HMS_MGTRF",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        MGTID = c.Long(nullable: false),
                        REFERID = c.Long(),
                        RFPCNT = c.Decimal(precision: 18, scale: 2),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.MGTID });
            
            CreateTable(
                "dbo.HMS_OPD",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        TRANSDT = c.DateTime(),
                        TRANSMY = c.String(),
                        TRANSNO = c.String(),
                        PATIENTYY = c.Long(nullable: false),
                        PATIENTID = c.String(),
                        PATIENTYYID = c.Long(),
                        REFERID = c.Long(),
                        BILLID = c.Long(nullable: false),
                        TESTSL = c.Long(),
                        TCATID = c.Long(),
                        TESTID = c.Long(),
                        AMOUNT = c.Decimal(precision: 18, scale: 2),
                        PCNTR = c.Decimal(precision: 18, scale: 2),
                        PCNTD = c.Decimal(precision: 18, scale: 2),
                        DISCR = c.Decimal(precision: 18, scale: 2),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID });
            
            CreateTable(
                "dbo.HMS_OPDMST",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        TRANSDT = c.DateTime(),
                        TRANSMY = c.String(),
                        TRANSNO = c.String(),
                        PATIENTYY = c.Long(nullable: false),
                        PATIENTID = c.String(),
                        PATIENTYYID = c.Long(),
                        PATIENTNM = c.String(),
                        GENDER = c.String(),
                        AGE = c.String(),
                        MOBNO = c.String(),
                        ADDRESS = c.String(),
                        DOCTORID = c.Long(),
                        REFERID = c.Long(),
                        RFPCNT = c.Decimal(precision: 18, scale: 2),
                        DVDT = c.DateTime(),
                        DVTM = c.String(),
                        TOTAMT = c.Decimal(precision: 18, scale: 2),
                        DISCREF = c.Decimal(precision: 18, scale: 2),
                        DISCHOS = c.Decimal(precision: 18, scale: 2),
                        DISCNET = c.Decimal(precision: 18, scale: 2),
                        NETAMT = c.Decimal(precision: 18, scale: 2),
                        RCVAMT = c.Decimal(precision: 18, scale: 2),
                        DUEAMT = c.Decimal(precision: 18, scale: 2),
                        DUEHID = c.Long(),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID });
            
            CreateTable(
                "dbo.HMS_OPDRCV",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        TRANSDT = c.DateTime(),
                        TRANSMY = c.String(),
                        TRANSNO = c.Long(),
                        PATIENTID = c.String(),
                        PATIENTYY = c.Long(),
                        PATIENTYYID = c.Long(),
                        DUEAMTP = c.Decimal(precision: 18, scale: 2),
                        DISCHOS = c.Decimal(precision: 18, scale: 2),
                        NETAMT = c.Decimal(precision: 18, scale: 2),
                        RCVAMT = c.Decimal(precision: 18, scale: 2),
                        DUEAMT = c.Decimal(precision: 18, scale: 2),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID });
            
            CreateTable(
                "dbo.HMS_OPHEAD",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        OPHCID = c.Long(),
                        OPHID = c.Long(),
                        OPHNM = c.String(),
                        OPHRT = c.Decimal(precision: 18, scale: 2),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID });
            
            CreateTable(
                "dbo.HMS_OPHMST",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        OPHCID = c.Long(),
                        OPHCNM = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID });
            
            CreateTable(
                "dbo.HMS_REFER",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        REFERID = c.Long(nullable: false),
                        REFERGID = c.Long(),
                        REFERNM = c.String(),
                        TITLE = c.String(),
                        ADDRESS = c.String(),
                        MOBNO1 = c.String(),
                        MOBNO2 = c.String(),
                        EMAILID = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.REFERID });
            
            CreateTable(
                "dbo.HMS_RESULT",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        TRANSDT = c.DateTime(),
                        PATIENTTP = c.String(),
                        PATIENTID = c.String(),
                        PATIENTYYID = c.Long(),
                        TESTID = c.Long(),
                        RESTID = c.Long(),
                        RESULT = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID });
            
            CreateTable(
                "dbo.HMS_RFPCNT",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        REFERID = c.Long(nullable: false),
                        TCATID = c.Long(),
                        RFPCNT = c.Decimal(precision: 18, scale: 2),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.REFERID });
            
            CreateTable(
                "dbo.HMS_SIGNBY",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        SIGNID = c.Long(nullable: false),
                        AUTHNM = c.String(),
                        TITLE = c.String(),
                        DEPTNM = c.String(),
                        INSTITUTE = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.SIGNID });
            
            CreateTable(
                "dbo.HMS_TEST",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        TCATID = c.Long(nullable: false),
                        TESTID = c.Long(nullable: false),
                        IPDID = c.Long(nullable: false),
                        OPDID = c.Long(nullable: false),
                        TESTNM = c.String(),
                        RATE = c.Decimal(precision: 18, scale: 2),
                        PCNTD = c.Decimal(precision: 18, scale: 2),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.TCATID, t.TESTID });
            
            CreateTable(
                "dbo.HMS_TESTMST",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        TCATID = c.Long(nullable: false),
                        TCATNM = c.String(),
                        IPDID = c.Long(nullable: false),
                        OPDID = c.Long(nullable: false),
                        TOPYN = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.TCATID });
            
            CreateTable(
                "dbo.HMS_TESTNV",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        TESTID = c.Long(nullable: false),
                        RESTID = c.Long(),
                        RESTNM = c.String(),
                        RESTGR = c.String(),
                        RESTMU = c.String(),
                        SHOWTP = c.String(),
                        LENGTH = c.Long(),
                        DECIML = c.Long(),
                        NVALUE = c.String(),
                        RESTSL = c.Long(),
                        RESTGRV = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.TESTID });
            
            CreateTable(
                "dbo.HMS_TESTV",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        TCATID = c.Long(nullable: false),
                        TESTID = c.Long(nullable: false),
                        TVACID = c.Long(nullable: false),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.TCATID, t.TESTID });
            
            CreateTable(
                "dbo.HMS_CBIRTH",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        TRANSYY = c.Long(nullable: false),
                        TRANSNO = c.Long(nullable: false),
                        TRANSDT = c.DateTime(),
                        PATIENTTP = c.String(maxLength: 7),
                        PATIENTYY = c.Long(nullable: false),
                        PATIENTYYID = c.Long(nullable: false),
                        PATIENTID = c.String(maxLength: 10),
                        BABYNM = c.String(),
                        GENDER = c.String(maxLength: 6),
                        BIRTHDT = c.DateTime(),
                        BIRTHTM = c.String(),
                        FILENO = c.String(maxLength: 10),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(nullable: false),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(nullable: false),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.TRANSYY, t.TRANSNO });
            
            CreateTable(
                "dbo.HMS_CDEATH",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        TRANSYY = c.Long(nullable: false),
                        TRANSNO = c.Long(nullable: false),
                        TRANSDT = c.DateTime(),
                        PATIENTTP = c.String(maxLength: 7),
                        PATIENTYY = c.Long(nullable: false),
                        PATIENTYYID = c.Long(nullable: false),
                        PATIENTID = c.String(maxLength: 10),
                        DEATHDT = c.DateTime(),
                        DEATHTM = c.String(),
                        DCONSULTID = c.String(maxLength: 15),
                        DDOCTORID = c.String(maxLength: 15),
                        DCAUSE_A = c.String(),
                        DCAUSE_B = c.String(),
                        DCAUSE_C = c.String(),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(nullable: false),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(nullable: false),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.TRANSYY, t.TRANSNO });
            
            CreateTable(
                "dbo.HMS_CDISCHG",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        TRANSYY = c.Long(nullable: false),
                        TRANSNO = c.Long(nullable: false),
                        TRANSDT = c.DateTime(),
                        PATIENTTP = c.String(maxLength: 7),
                        PATIENTYY = c.Long(nullable: false),
                        PATIENTYYID = c.Long(nullable: false),
                        PATIENTID = c.String(maxLength: 10),
                        DISCHGDT = c.DateTime(),
                        DISCHGTM = c.String(),
                        DIAGNOSIS = c.String(maxLength: 100),
                        OPNOTE = c.String(),
                        TREATMENT = c.String(),
                        ADVICE = c.String(),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(nullable: false),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(nullable: false),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.TRANSYY, t.TRANSNO });
            
            CreateTable(
                "dbo.HMS_GENDOS",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        GDID = c.Long(nullable: false),
                        GDTP = c.String(),
                        GDNM = c.String(),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(nullable: false),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(nullable: false),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.GDID });
            
            CreateTable(
                "dbo.HMS_MEDICARE",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        MCATID = c.Long(nullable: false),
                        MEDIID = c.Long(nullable: false),
                        MEDINM = c.String(),
                        GENERICID = c.Long(),
                        DOSAGEFID = c.Long(),
                        PHARMAID = c.Long(),
                        UNIT = c.String(maxLength: 10),
                        BUYRT = c.Decimal(precision: 18, scale: 2),
                        SALRT = c.Decimal(precision: 18, scale: 2),
                        STKMIN = c.Decimal(precision: 18, scale: 2),
                        USERPC = c.String(),
                        INSUSERID = c.Long(nullable: false),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(nullable: false),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.MCATID, t.MEDIID });
            
            CreateTable(
                "dbo.HMS_MEDIMST",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        MCATID = c.Long(nullable: false),
                        MCATNM = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(nullable: false),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(nullable: false),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.MCATID });
            
            CreateTable(
                "dbo.HMS_OT",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        TRANSDT = c.DateTime(),
                        TRANSYY = c.Long(nullable: false),
                        TRANSNO = c.Long(),
                        PATIENTTP = c.String(),
                        PATIENTYY = c.Long(),
                        PATIENTYYID = c.Long(),
                        PATIENTID = c.String(),
                        BILLID = c.Long(),
                        OPHID = c.Long(),
                        OTPTP = c.String(),
                        OTPID = c.Long(),
                        OTPAMT = c.Decimal(precision: 18, scale: 2),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID });
            
            CreateTable(
                "dbo.HMS_OTMST",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        TRANSDT = c.DateTime(),
                        TRANSYY = c.Long(nullable: false),
                        TRANSNO = c.Long(),
                        PATIENTTP = c.String(),
                        PATIENTYY = c.Long(),
                        PATIENTYYID = c.Long(),
                        PATIENTID = c.String(),
                        OPHID = c.Long(),
                        OPTMFR = c.String(),
                        OPTMTO = c.String(),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID });
            
            CreateTable(
                "dbo.HMS_PCHGOTC",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        PATIENTTP = c.String(),
                        TRANSDT = c.DateTime(),
                        PATIENTYY = c.Long(nullable: false),
                        PATIENTID = c.String(),
                        PATIENTYYID = c.Long(),
                        TRANSSL = c.Long(),
                        CHARGEID = c.Long(),
                        AMOUNT = c.Decimal(precision: 18, scale: 2),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID });
            
            CreateTable(
                "dbo.HMS_PCONSULT",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        PATIENTTP = c.String(),
                        TRANSDT = c.DateTime(),
                        PATIENTYY = c.Long(nullable: false),
                        PATIENTID = c.String(),
                        PATIENTYYID = c.Long(),
                        BILLID = c.Long(),
                        TRANSSL = c.Long(),
                        DOCTORID = c.Long(),
                        AMOUNT = c.Decimal(precision: 18, scale: 2),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID });
            
            CreateTable(
                "dbo.HMS_PHARMACY",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        TRANSTP = c.String(nullable: false, maxLength: 128),
                        TRANSMY = c.String(nullable: false, maxLength: 6),
                        TRANSNO = c.Long(nullable: false),
                        ITEMSL = c.Long(nullable: false),
                        TRANSDT = c.DateTime(),
                        DEPTFR = c.Long(),
                        DEPTTO = c.Long(),
                        PATIENTTP = c.String(maxLength: 7),
                        PATIENTYY = c.Long(),
                        PATIENTYYID = c.Long(),
                        PATIENTID = c.String(maxLength: 10),
                        SUPPLIERID = c.Long(),
                        MEDIID = c.Long(),
                        QTY = c.Decimal(precision: 18, scale: 2),
                        RATE = c.Decimal(precision: 18, scale: 2),
                        AMOUNT = c.Decimal(precision: 18, scale: 2),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(nullable: false),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(nullable: false),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.TRANSTP, t.TRANSMY, t.TRANSNO, t.ITEMSL });
            
            CreateTable(
                "dbo.HMS_PHARMA",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        PHARMAID = c.Long(nullable: false),
                        PHARMAGID = c.Long(),
                        PHARMANM = c.String(),
                        ADDRESS = c.String(),
                        CONTACT = c.String(),
                        STATUS = c.String(maxLength: 1),
                        USERPC = c.String(),
                        INSUSERID = c.Long(nullable: false),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(nullable: false),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.PHARMAID });
            
            CreateTable(
                "dbo.HMS_PHARMMST",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        TRANSTP = c.String(nullable: false, maxLength: 128),
                        TRANSMY = c.String(nullable: false, maxLength: 6),
                        TRANSNO = c.Long(nullable: false),
                        TRANSDT = c.DateTime(),
                        DEPTFR = c.Long(),
                        DEPTTO = c.Long(),
                        PATIENTTP = c.String(maxLength: 7),
                        PATIENTYY = c.Long(),
                        PATIENTYYID = c.Long(),
                        PATIENTID = c.String(maxLength: 10),
                        SUPPLIERID = c.Long(),
                        TOTAMT = c.Decimal(precision: 18, scale: 2),
                        VATAMT = c.Decimal(precision: 18, scale: 2),
                        DISCOUNT = c.Decimal(precision: 18, scale: 2),
                        NETAMT = c.Decimal(precision: 18, scale: 2),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(nullable: false),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(nullable: false),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID, t.TRANSTP, t.TRANSMY, t.TRANSNO });
            
            CreateTable(
                "dbo.HMS_PINVESTN",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        PATIENTTP = c.String(),
                        TRANSDT = c.DateTime(),
                        PATIENTYY = c.Long(nullable: false),
                        PATIENTID = c.String(),
                        PATIENTYYID = c.Long(),
                        BILLID = c.Long(),
                        TRANSSL = c.Long(),
                        INVESTNID = c.Long(),
                        AMOUNT = c.Decimal(precision: 18, scale: 2),
                        SERVICEID = c.Long(),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID });
            
            CreateTable(
                "dbo.HMS_PATHOLOGY",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        TRANSDT = c.DateTime(),
                        TRANSMY = c.String(),
                        TRANSNO = c.Long(),
                        PATIENTID = c.String(),
                        PATIENTYY = c.Long(),
                        PATIENTYYID = c.Long(),
                        BILLID = c.Long(),
                        TESTSL = c.Long(),
                        TESTID = c.Long(),
                        AMOUNT = c.Decimal(precision: 18, scale: 2),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID });
            
            CreateTable(
                "dbo.HMS_PATHOMST",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        TRANSDT = c.DateTime(),
                        TRANSMY = c.String(),
                        TRANSNO = c.Long(),
                        PATIENTID = c.String(),
                        PATIENTYY = c.Long(),
                        PATIENTYYID = c.Long(),
                        DVDT = c.DateTime(),
                        DVTM = c.DateTime(),
                        REMARKS = c.String(),
                        USERPC = c.String(),
                        INSUSERID = c.Long(),
                        INSTIME = c.DateTime(),
                        INSIPNO = c.String(),
                        INSLTUDE = c.String(),
                        UPDUSERID = c.Long(),
                        UPDTIME = c.DateTime(),
                        UPDIPNO = c.String(),
                        UPDLTUDE = c.String(),
                    })
                .PrimaryKey(t => new { t.ID, t.COMPID });
            
        }
        
        public override void Down()
        {
            DropTable("dbo.HMS_PATHOMST");
            DropTable("dbo.HMS_PATHOLOGY");
            DropTable("dbo.HMS_PINVESTN");
            DropTable("dbo.HMS_PHARMMST");
            DropTable("dbo.HMS_PHARMA");
            DropTable("dbo.HMS_PHARMACY");
            DropTable("dbo.HMS_PCONSULT");
            DropTable("dbo.HMS_PCHGOTC");
            DropTable("dbo.HMS_OTMST");
            DropTable("dbo.HMS_OT");
            DropTable("dbo.HMS_MEDIMST");
            DropTable("dbo.HMS_MEDICARE");
            DropTable("dbo.HMS_GENDOS");
            DropTable("dbo.HMS_CDISCHG");
            DropTable("dbo.HMS_CDEATH");
            DropTable("dbo.HMS_CBIRTH");
            DropTable("dbo.HMS_TESTV");
            DropTable("dbo.HMS_TESTNV");
            DropTable("dbo.HMS_TESTMST");
            DropTable("dbo.HMS_TEST");
            DropTable("dbo.HMS_SIGNBY");
            DropTable("dbo.HMS_RFPCNT");
            DropTable("dbo.HMS_RESULT");
            DropTable("dbo.HMS_REFER");
            DropTable("dbo.HMS_OPHMST");
            DropTable("dbo.HMS_OPHEAD");
            DropTable("dbo.HMS_OPDRCV");
            DropTable("dbo.HMS_OPDMST");
            DropTable("dbo.HMS_OPD");
            DropTable("dbo.HMS_MGTRF");
            DropTable("dbo.HMS_MGT");
            DropTable("dbo.HMS_IPD");
            DropTable("dbo.HMS_ICB");
            DropTable("dbo.HMS_HEADIO");
            DropTable("dbo.HMS_DEPT");
            DropTable("dbo.HMS_BILLMST");
            DropTable("dbo.HMS_BILL");
            DropTable("dbo.AslUsercoes");
            DropTable("dbo.ASL_ROLE");
            DropTable("dbo.ASL_MENUMST");
            DropTable("dbo.ASL_MENU");
            DropTable("dbo.ASL_LOG");
            DropTable("dbo.ASL_DELETE");
            DropTable("dbo.AslCompanies");
        }
    }
}
