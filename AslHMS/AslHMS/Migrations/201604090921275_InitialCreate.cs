namespace AslHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.GL_ACCHART",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        COMPID = c.Long(nullable: false),
                        HEADTP = c.Long(nullable: false),
                        ACCOUNTCD = c.Long(nullable: false),
                        CONTROLCD = c.Long(nullable: false),
                        ACCOUNTNM = c.String(),
                        BRANCHID = c.Long(nullable: false),
                        HLEVELCD = c.Long(nullable: false),
                        HDRCRTP = c.String(maxLength: 1),
                        HPOSTTP = c.String(maxLength: 1),
                        HSTATUS = c.String(maxLength: 1),
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
                .PrimaryKey(t => new { t.ID, t.COMPID, t.HEADTP, t.ACCOUNTCD });
            
        }
        
        public override void Down()
        {
            DropTable("dbo.GL_ACCHART");
        }
    }
}
