using Microsoft.EntityFrameworkCore.Migrations;

namespace ToyShop.Migrations
{
    public partial class spcreation : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            var sp_GetProductDetails = @"CREATE PROCEDURE [dbo].[GetProductDetails]
                                            AS
                                                BEGIN
                                                    SET NOCOUNT ON;
                                                    SELECT * FROM Toys
                                                END";

            migrationBuilder.Sql(sp_GetProductDetails);

            //var sp_PlaceOrder = @"CREATE PROCEDURE [dbo].[PlaceOrder]
            //                        @AddressId INT,@ToyId INT,@Quantity INT,@OrderId INT
            //                                AS
            //                                    BEGIN
            //                                        SET NOCOUNT ON;
            //                                        INSERT INTO Orders (addressId) VALUES (@AddressId)
            //                                        INSERT INTO Items (quantity,toyId,orderId) VALUES (@Quantity,@ToyId,@OrderId)
            //                                    END";

            //migrationBuilder.Sql(sp_PlaceOrder);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {

        }
    }
}