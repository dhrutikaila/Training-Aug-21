using Microsoft.EntityFrameworkCore.Migrations;

namespace ToyProject1.Migrations
{
    public partial class empty_migration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            var sp = @"CREATE PROCEDURE [dbo].[Getcustomer]

                AS
                BEGIN
                    SELECT Name
                    FROM Customer;
                END";

            migrationBuilder.Sql(sp);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {

        }
    }
}
