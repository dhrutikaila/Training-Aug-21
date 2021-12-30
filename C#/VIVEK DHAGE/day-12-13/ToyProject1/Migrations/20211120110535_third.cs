using Microsoft.EntityFrameworkCore.Migrations;

namespace ToyProject1.Migrations
{
    public partial class third : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Purchases_Toys_ToyId",
                table: "Purchases");

            migrationBuilder.DropIndex(
                name: "IX_Purchases_ToyId",
                table: "Purchases");

            migrationBuilder.RenameColumn(
                name: "ToyId",
                table: "Purchases",
                newName: "ToysIdFk");

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

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Purchases_Toys_ToysIdFk",
                table: "Purchases");

            migrationBuilder.DropIndex(
                name: "IX_Purchases_ToysIdFk",
                table: "Purchases");

            migrationBuilder.RenameColumn(
                name: "ToysIdFk",
                table: "Purchases",
                newName: "ToyId");

            migrationBuilder.CreateIndex(
                name: "IX_Purchases_ToyId",
                table: "Purchases",
                column: "ToyId");

            migrationBuilder.AddForeignKey(
                name: "FK_Purchases_Toys_ToyId",
                table: "Purchases",
                column: "ToyId",
                principalTable: "Toys",
                principalColumn: "ToyId",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
