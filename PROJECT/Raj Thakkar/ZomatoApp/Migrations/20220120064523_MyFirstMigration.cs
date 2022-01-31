using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ZomatoApp.Migrations
{
    public partial class MyFirstMigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Cart",
                columns: table => new
                {
                    CartId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    productId = table.Column<int>(type: "int", nullable: false),
                    productQuantity = table.Column<int>(type: "int", nullable: false),
                    productName = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: false),
                    productPrice = table.Column<int>(type: "int", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Cart", x => x.CartId);
                });

            migrationBuilder.CreateTable(
                name: "Category",
                columns: table => new
                {
                    Category_Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Category_Name = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    Res_Id = table.Column<int>(type: "int", nullable: false),
                    ResName = table.Column<string>(type: "nchar(255)", fixedLength: true, maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Category", x => x.Category_Id);
                });

            migrationBuilder.CreateTable(
                name: "City",
                columns: table => new
                {
                    CityId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CityName = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_City", x => x.CityId);
                });

            migrationBuilder.CreateTable(
                name: "OrderStatus",
                columns: table => new
                {
                    Orderstatusid = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Orderstauts = table.Column<string>(type: "nchar(10)", fixedLength: true, maxLength: 10, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_OrderStatus", x => x.Orderstatusid);
                });

            migrationBuilder.CreateTable(
                name: "Payment",
                columns: table => new
                {
                    PaymentId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PaymentName = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Payment", x => x.PaymentId);
                });

            migrationBuilder.CreateTable(
                name: "Product",
                columns: table => new
                {
                    ProductId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProductName = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: false),
                    Product_Price = table.Column<decimal>(type: "money", nullable: false),
                    Product_Image = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: false),
                    Categoryid = table.Column<int>(type: "int", nullable: false),
                    RestaurantId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Product", x => x.ProductId);
                });

            migrationBuilder.CreateTable(
                name: "Restaurant",
                columns: table => new
                {
                    RestaurantId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RestaurantName = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    RestaurantCity = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    RestFoodPricetwoperson = table.Column<decimal>(type: "money", nullable: false),
                    RestorentImage = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    Offer1id = table.Column<int>(type: "int", nullable: true),
                    Offer2id = table.Column<int>(type: "int", nullable: true),
                    Payment1id = table.Column<int>(type: "int", nullable: true),
                    Payment2id = table.Column<int>(type: "int", nullable: true),
                    Restaurantfoodtype = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Restaurant", x => x.RestaurantId);
                });

            migrationBuilder.CreateTable(
                name: "UserSignup",
                columns: table => new
                {
                    User_id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Options = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false),
                    Phoneno = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false),
                    Emails = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Names = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Lpassword = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserSignupData", x => x.User_id);
                });

            migrationBuilder.CreateTable(
                name: "Ordertable",
                columns: table => new
                {
                    orderid = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    dates = table.Column<DateTime>(type: "datetime", nullable: false),
                    CustomerName = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    CustomerId = table.Column<int>(type: "int", nullable: false),
                    Orderstats = table.Column<int>(type: "int", nullable: false),
                    Paymentid = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Ordertab__080E3775578830CC", x => x.orderid);
                    table.ForeignKey(
                        name: "FK_orderstatus",
                        column: x => x.Orderstats,
                        principalTable: "OrderStatus",
                        principalColumn: "Orderstatusid",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_paymentdats",
                        column: x => x.Paymentid,
                        principalTable: "Payment",
                        principalColumn: "PaymentId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_userid",
                        column: x => x.CustomerId,
                        principalTable: "UserSignup",
                        principalColumn: "User_id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "paymenttable",
                columns: table => new
                {
                    payid = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    cardnumber = table.Column<string>(type: "nvarchar(12)", maxLength: 12, nullable: false),
                    cardcvv = table.Column<string>(type: "nvarchar(3)", maxLength: 3, nullable: false),
                    cardName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    userid = table.Column<int>(type: "int", nullable: false),
                    orderid = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__paymentt__082D8EEB6B7BC8BD", x => x.payid);
                    table.ForeignKey(
                        name: "FK_orderSales",
                        column: x => x.orderid,
                        principalTable: "Ordertable",
                        principalColumn: "orderid",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_TempSales",
                        column: x => x.userid,
                        principalTable: "UserSignup",
                        principalColumn: "User_id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Ordertable_CustomerId",
                table: "Ordertable",
                column: "CustomerId");

            migrationBuilder.CreateIndex(
                name: "IX_Ordertable_Orderstats",
                table: "Ordertable",
                column: "Orderstats");

            migrationBuilder.CreateIndex(
                name: "IX_Ordertable_Paymentid",
                table: "Ordertable",
                column: "Paymentid");

            migrationBuilder.CreateIndex(
                name: "IX_paymenttable_orderid",
                table: "paymenttable",
                column: "orderid");

            migrationBuilder.CreateIndex(
                name: "IX_paymenttable_userid",
                table: "paymenttable",
                column: "userid");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Cart");

            migrationBuilder.DropTable(
                name: "Category");

            migrationBuilder.DropTable(
                name: "City");

            migrationBuilder.DropTable(
                name: "paymenttable");

            migrationBuilder.DropTable(
                name: "Product");

            migrationBuilder.DropTable(
                name: "Restaurant");

            migrationBuilder.DropTable(
                name: "Ordertable");

            migrationBuilder.DropTable(
                name: "OrderStatus");

            migrationBuilder.DropTable(
                name: "Payment");

            migrationBuilder.DropTable(
                name: "UserSignup");
        }
    }
}
