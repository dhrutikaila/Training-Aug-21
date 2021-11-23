using Microsoft.EntityFrameworkCore.Migrations;

namespace ToyShop.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Customers",
                columns: table => new
                {
                    customerId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    firstName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    lastName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    phoneNumber = table.Column<int>(type: "int", nullable: false),
                    isActive = table.Column<bool>(type: "bit", nullable: false, defaultValue: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Customers", x => x.customerId);
                });

            migrationBuilder.CreateTable(
                name: "ToyTypes",
                columns: table => new
                {
                    typeId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    typeName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    isActive = table.Column<bool>(type: "bit", nullable: false, defaultValue: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ToyTypes", x => x.typeId);
                });

            migrationBuilder.CreateTable(
                name: "Addresses",
                columns: table => new
                {
                    addressId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    address = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    city = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    customerId = table.Column<int>(type: "int", nullable: false),
                    isActive = table.Column<bool>(type: "bit", nullable: false, defaultValue: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Addresses", x => x.addressId);
                    table.ForeignKey(
                        name: "FK_Addresses_Customers_customerId",
                        column: x => x.customerId,
                        principalTable: "Customers",
                        principalColumn: "customerId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ToyPlants",
                columns: table => new
                {
                    plantId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    plantName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    plantCity = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    toyTypeId = table.Column<int>(type: "int", nullable: false),
                    isActive = table.Column<bool>(type: "bit", nullable: false, defaultValue: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ToyPlants", x => x.plantId);
                    table.ForeignKey(
                        name: "FK_ToyPlants_ToyTypes_toyTypeId",
                        column: x => x.toyTypeId,
                        principalTable: "ToyTypes",
                        principalColumn: "typeId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Orders",
                columns: table => new
                {
                    orderId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    addressId = table.Column<int>(type: "int", nullable: false),
                    isActive = table.Column<bool>(type: "bit", nullable: false, defaultValue: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Orders", x => x.orderId);
                    table.ForeignKey(
                        name: "FK_Orders_Addresses_addressId",
                        column: x => x.addressId,
                        principalTable: "Addresses",
                        principalColumn: "addressId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Toys",
                columns: table => new
                {
                    toyId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    toyName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    toyPrice = table.Column<double>(type: "float", nullable: false),
                    ToyPlantId = table.Column<int>(type: "int", nullable: false),
                    isActive = table.Column<bool>(type: "bit", nullable: false, defaultValue: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Toys", x => x.toyId);
                    table.ForeignKey(
                        name: "FK_Toys_ToyPlants_ToyPlantId",
                        column: x => x.ToyPlantId,
                        principalTable: "ToyPlants",
                        principalColumn: "plantId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Items",
                columns: table => new
                {
                    itemId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    quantity = table.Column<int>(type: "int", nullable: false),
                    toyId = table.Column<int>(type: "int", nullable: false),
                    orderId = table.Column<int>(type: "int", nullable: false),
                    isActive = table.Column<bool>(type: "bit", nullable: false, defaultValue: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Items", x => x.itemId);
                    table.ForeignKey(
                        name: "FK_Items_Orders_orderId",
                        column: x => x.orderId,
                        principalTable: "Orders",
                        principalColumn: "orderId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Items_Toys_toyId",
                        column: x => x.toyId,
                        principalTable: "Toys",
                        principalColumn: "toyId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Addresses_customerId",
                table: "Addresses",
                column: "customerId");

            migrationBuilder.CreateIndex(
                name: "IX_Items_orderId",
                table: "Items",
                column: "orderId");

            migrationBuilder.CreateIndex(
                name: "IX_Items_toyId",
                table: "Items",
                column: "toyId");

            migrationBuilder.CreateIndex(
                name: "IX_Orders_addressId",
                table: "Orders",
                column: "addressId");

            migrationBuilder.CreateIndex(
                name: "IX_ToyPlants_toyTypeId",
                table: "ToyPlants",
                column: "toyTypeId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Toys_ToyPlantId",
                table: "Toys",
                column: "ToyPlantId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Items");

            migrationBuilder.DropTable(
                name: "Orders");

            migrationBuilder.DropTable(
                name: "Toys");

            migrationBuilder.DropTable(
                name: "Addresses");

            migrationBuilder.DropTable(
                name: "ToyPlants");

            migrationBuilder.DropTable(
                name: "Customers");

            migrationBuilder.DropTable(
                name: "ToyTypes");
        }
    }
}
