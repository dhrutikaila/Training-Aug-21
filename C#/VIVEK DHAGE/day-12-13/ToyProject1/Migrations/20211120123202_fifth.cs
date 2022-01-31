using Microsoft.EntityFrameworkCore.Migrations;

namespace ToyProject1.Migrations
{
    public partial class fifth : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Purchases_Orders_OrderId",
                table: "Purchases");

            migrationBuilder.DropIndex(
                name: "IX_Purchases_OrderId",
                table: "Purchases");

            migrationBuilder.DropColumn(
                name: "OrderId",
                table: "Purchases");

            migrationBuilder.AddColumn<int>(
                name: "PurchaseId",
                table: "Orders",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Orders_PurchaseId",
                table: "Orders",
                column: "PurchaseId",
                unique: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Purchases_PurchaseId",
                table: "Orders",
                column: "PurchaseId",
                principalTable: "Purchases",
                principalColumn: "PurchaseId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Purchases_PurchaseId",
                table: "Orders");

            migrationBuilder.DropIndex(
                name: "IX_Orders_PurchaseId",
                table: "Orders");

            migrationBuilder.DropColumn(
                name: "PurchaseId",
                table: "Orders");

            migrationBuilder.AddColumn<int>(
                name: "OrderId",
                table: "Purchases",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Purchases_OrderId",
                table: "Purchases",
                column: "OrderId",
                unique: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Purchases_Orders_OrderId",
                table: "Purchases",
                column: "OrderId",
                principalTable: "Orders",
                principalColumn: "OrderId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
