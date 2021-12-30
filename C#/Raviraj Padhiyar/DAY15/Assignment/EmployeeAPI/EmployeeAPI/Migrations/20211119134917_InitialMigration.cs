using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace EmployeeAPI.Migrations
{
    public partial class InitialMigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Employees",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    AddressLine1 = table.Column<string>(type: "nvarchar(240)", maxLength: 240, nullable: true),
                    AddressLine2 = table.Column<string>(type: "nvarchar(240)", maxLength: 240, nullable: true),
                    AddressLine3 = table.Column<string>(type: "nvarchar(240)", maxLength: 240, nullable: true),
                    CitizenShipId = table.Column<long>(type: "bigint", nullable: false),
                    CitizenShipLegislationCode = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    CitizenShipStatus = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    CitizenShipToDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    City = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    CorrespondenceLangauge = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    Country = table.Column<string>(type: "nvarchar(60)", maxLength: 60, nullable: true),
                    CreationDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DateOfBirth = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DisplayName = table.Column<string>(type: "nvarchar(240)", maxLength: 240, nullable: true),
                    DriversLicenseExpirationDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DriversLicenseId = table.Column<long>(type: "bigint", nullable: false),
                    DriversLicenseIssuingCountry = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    EffectiveStartDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Ethnicity = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    FirstName = table.Column<string>(type: "nvarchar(150)", maxLength: 150, nullable: true),
                    Gender = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    HireDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    HomeFaxAreaCode = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    HomeFaxCountryCode = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    HomeFaxExtension = table.Column<string>(type: "nvarchar(60)", maxLength: 60, nullable: true),
                    HomeFaxLegislationCode = table.Column<string>(type: "nvarchar(4)", maxLength: 4, nullable: true),
                    HomeFaxNumber = table.Column<string>(type: "nvarchar(60)", maxLength: 60, nullable: true),
                    HomePhoneAreaCode = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    HomePhoneCountryCode = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    HomePhoneExtension = table.Column<string>(type: "nvarchar(60)", maxLength: 60, nullable: true),
                    HomePhoneLegislationCode = table.Column<string>(type: "nvarchar(4)", maxLength: 4, nullable: true),
                    HomePhoneNumber = table.Column<string>(type: "nvarchar(60)", maxLength: 60, nullable: true),
                    Honors = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: true),
                    LastName = table.Column<string>(type: "nvarchar(150)", maxLength: 150, nullable: true),
                    LastUpdateDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    LegalEntityId = table.Column<long>(type: "bigint", nullable: false),
                    LicenseNumber = table.Column<string>(type: "nvarchar(150)", maxLength: 150, nullable: true),
                    MaritalStatus = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    MiddleName = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: true),
                    MilitaryVetStatus = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    NameSuffix = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: true),
                    NationalID = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    NationalIdCountry = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Employees", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Assignments",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    AssignmentId = table.Column<long>(type: "bigint", nullable: false),
                    ActionCode = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    ActionReasonCode = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    ActualTerminationDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    AssignmentCategory = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    AssignmentName = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: true),
                    AssignmentNumber = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    AssignmentProjectEndDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    AssignmentStatus = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    AssignmentStatusTypeId = table.Column<long>(type: "bigint", nullable: false),
                    BuisnessUnitID = table.Column<long>(type: "bigint", nullable: false),
                    CreationDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DefualtExpenseAccount = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DepartmentId = table.Column<long>(type: "bigint", nullable: false),
                    EffectiveEndDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    EffectiveStartDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    EndTime = table.Column<string>(type: "nvarchar(5)", maxLength: 5, nullable: true),
                    Frequency = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    FullPartTime = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    GradeID = table.Column<long>(type: "bigint", nullable: false),
                    GradeLadderId = table.Column<long>(type: "bigint", nullable: false),
                    JobId = table.Column<long>(type: "bigint", nullable: false),
                    LastUpdateDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    LegalEntityID = table.Column<long>(type: "bigint", nullable: false),
                    LocationID = table.Column<long>(type: "bigint", nullable: false),
                    ManagerAssignmentId = table.Column<long>(type: "bigint", nullable: false),
                    ManagerID = table.Column<long>(type: "bigint", nullable: false),
                    EmployeeId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Assignments", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Assignments_Employees_EmployeeId",
                        column: x => x.EmployeeId,
                        principalTable: "Employees",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Assignments_EmployeeId",
                table: "Assignments",
                column: "EmployeeId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Assignments");

            migrationBuilder.DropTable(
                name: "Employees");
        }
    }
}
