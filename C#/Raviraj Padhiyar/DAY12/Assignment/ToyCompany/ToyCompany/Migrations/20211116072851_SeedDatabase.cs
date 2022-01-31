using Microsoft.EntityFrameworkCore.Migrations;

namespace ToyCompany.Migrations
{
    public partial class SeedDatabase : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("INSERT INTO ToyTypes(TypeName) VALUES ('ActionFigures')");
            migrationBuilder.Sql("INSERT INTO ToyTypes(TypeName) VALUES ('Puzzle')");
            migrationBuilder.Sql("INSERT INTO ToyTypes(TypeName) VALUES ('Dolls')");

            migrationBuilder.Sql("INSERT INTO Toys(ToyName,Price,TypeId) VALUES ('RubicCube',180,2)");
            migrationBuilder.Sql("INSERT INTO Toys(ToyName,Price,TypeId) VALUES ('DarthVader',520,1)");

            migrationBuilder.Sql("INSERT INTO Address(City,State) VALUES ('Ahmedabad','Gujarat')");
            migrationBuilder.Sql("INSERT INTO Address(City,State) VALUES ('Vadodara','Gujarat')");
            migrationBuilder.Sql("INSERT INTO Address(City,State) VALUES ('Surat','Gujarat')");

            migrationBuilder.Sql("INSERT INTO ManuFacturingPlants(AddressId) VALUES(1)");
            migrationBuilder.Sql("INSERT INTO ManuFacturingPlants(AddressId) VALUES(2)");
            migrationBuilder.Sql("INSERT INTO ManuFacturingPlants(AddressId) VALUES(3)");

            migrationBuilder.Sql("INSERT INTO ToyProductions(1,1)");
            migrationBuilder.Sql("INSERT INTO ToyProductions(1,3)");
            migrationBuilder.Sql("INSERT INTO ToyProductions(2,2)");
            migrationBuilder.Sql("INSERT INTO ToyProductions(3,2)");

            migrationBuilder.Sql("INSERT INTO Customers(Name,ContactNumber) VALUES('Parth Patel','9925999259')");
            migrationBuilder.Sql("INSERT INTO Customers(Name,ContactNumber) VALUES('Krunal Rana','9922999229')");
            migrationBuilder.Sql("INSERT INTO Customers(Name,ContactNumber) VALUES('Raxit Kher','9915999159')");

        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {

        }
    }
}
