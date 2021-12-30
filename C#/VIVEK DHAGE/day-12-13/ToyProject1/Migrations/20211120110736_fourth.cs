using Microsoft.EntityFrameworkCore.Migrations;

namespace ToyProject1.Migrations
{
    public partial class fourth : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Purchases_Toys_ToysIdFk",
                table: "Purchases");

            migrationBuilder.DropIndex(
                name: "IX_Purchases_ToysIdFk",
                table: "Purchases");

            migrationBuilder.DropColumn(
                name: "ToysIdFk",
                table: "Purchases");

            migrationBuilder.CreateIndex(
                name: "IX_Purchases_ToysId",
                table: "Purchases",
                column: "ToysId",
                unique: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Purchases_Toys_ToysId",
                table: "Purchases",
                column: "ToysId",
                principalTable: "Toys",
                principalColumn: "ToyId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Purchases_Toys_ToysId",
                table: "Purchases");

            migrationBuilder.DropIndex(
                name: "IX_Purchases_ToysId",
                table: "Purchases");

            migrationBuilder.AddColumn<int>(
                name: "ToysIdFk",
                table: "Purchases",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Purchases_ToysIdFk",
                table: "Purchases",
                column: "ToysIdFk",
                unique: true,
                filter: "[ToysIdFk] IS NOT NULL");

            migrationBuilder.AddForeignKey(
                name: "FK_Purchases_Toys_ToysIdFk",
                table: "Purchases",
                column: "ToysIdFk",
                principalTable: "Toys",
                principalColumn: "ToyId",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
