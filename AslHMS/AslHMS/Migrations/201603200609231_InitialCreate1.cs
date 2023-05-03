namespace AslHMS.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.HMS_PHARMMST", "BILLID", c => c.Long());
        }
        
        public override void Down()
        {
            DropColumn("dbo.HMS_PHARMMST", "BILLID");
        }
    }
}
