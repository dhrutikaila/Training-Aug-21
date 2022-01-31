using Microsoft.EntityFrameworkCore.Migrations;

namespace ToyCompany.Migrations
{
    public partial class UpdatedShippingAddressModel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "PurchaseOrderId",
                table: "ShippingAddresses",
                newName: "OrderHeaderId");

            migrationBuilder.AddColumn<bool>(
                name: "IsActive",
                table: "Customers",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.CreateIndex(
                name: "IX_ShippingAddresses_AddressId",
                table: "ShippingAddresses",
                column: "AddressId");

            migrationBuilder.CreateIndex(
                name: "IX_ShippingAddresses_OrderHeaderId",
                table: "ShippingAddresses",
                column: "OrderHeaderId");

            migrationBuilder.AddForeignKey(
                name: "FK_ShippingAddresses_Addresses_AddressId",
                table: "ShippingAddresses",
                column: "AddressId",
                principalTable: "Addresses",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ShippingAddresses_OrderHeaders_OrderHeaderId",
                table: "ShippingAddresses",
                column: "OrderHeaderId",
                principalTable: "OrderHeaders",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ShippingAddresses_Addresses_AddressId",
                table: "ShippingAddresses");

            migrationBuilder.DropForeignKey(
                name: "FK_ShippingAddresses_OrderHeaders_OrderHeaderId",
                table: "ShippingAddresses");

            migrationBuilder.DropIndex(
                name: "IX_ShippingAddresses_AddressId",
                table: "ShippingAddresses");

            migrationBuilder.DropIndex(
                name: "IX_ShippingAddresses_OrderHeaderId",
                table: "ShippingAddresses");

            migrationBuilder.DropColumn(
                name: "IsActive",
                table: "Customers");

            migrationBuilder.RenameColumn(
                name: "OrderHeaderId",
                table: "ShippingAddresses",
                newName: "PurchaseOrderId");
        }
    }
}
