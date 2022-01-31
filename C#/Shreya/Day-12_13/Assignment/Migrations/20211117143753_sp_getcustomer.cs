using Microsoft.EntityFrameworkCore.Migrations;

namespace Day12_13.Migrations
{
    public partial class sp_getcustomer : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            var CustomerAddress = @"CREATE PROCEDURE [dbo].[GetCustomerAddress]
                    @AddressId varchar(50)
                AS
                BEGIN
                    SET NOCOUNT ON;
                    select * from Addresse where AddressId=@AddressId
                END";
            migrationBuilder.Sql(CustomerAddress);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {

        }
    }
}
