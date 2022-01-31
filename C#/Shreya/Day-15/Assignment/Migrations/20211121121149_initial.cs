using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Day_15_Assignment.Migrations
{
    public partial class initial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Employees",
                columns: table => new
                {
                    EmployeeId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AddressLine1 = table.Column<string>(nullable: true),
                    AddressLine2 = table.Column<string>(nullable: true),
                    AddressLine3 = table.Column<string>(nullable: true),
                    CitizenshipId = table.Column<long>(nullable: false),
                    CitizenshipLegislationCode = table.Column<string>(nullable: true),
                    CitizenshipStatus = table.Column<string>(nullable: true),
                    CitizenshipToDate = table.Column<DateTime>(nullable: false),
                    City = table.Column<string>(nullable: true),
                    CorrespondenceLanguage = table.Column<string>(nullable: true),
                    Country = table.Column<string>(nullable: true),
                    CreationDate = table.Column<DateTime>(nullable: false),
                    DateOfBirth = table.Column<DateTime>(nullable: false),
                    DisplayName = table.Column<string>(nullable: true),
                    DriversLicenseExpirationDate = table.Column<string>(nullable: true),
                    DriversLicenseId = table.Column<long>(nullable: false),
                    DriversLicenseIssuingCountry = table.Column<string>(nullable: true),
                    EffectiveStartDate = table.Column<DateTime>(nullable: false),
                    Ethnicity = table.Column<string>(nullable: true),
                    FirstName = table.Column<string>(nullable: true),
                    Gender = table.Column<string>(nullable: true),
                    HireDate = table.Column<DateTime>(nullable: false),
                    HomeFaxAreaCode = table.Column<string>(nullable: true),
                    HomeFaxCountryCode = table.Column<string>(nullable: true),
                    HomeFaxExtension = table.Column<string>(nullable: true),
                    HomeFaxLegislationCode = table.Column<string>(nullable: true),
                    HomeFaxNumber = table.Column<string>(nullable: true),
                    HomePhoneAreaCode = table.Column<string>(nullable: true),
                    HomePhoneCountryCode = table.Column<string>(nullable: true),
                    HomePhoneExtension = table.Column<string>(nullable: true),
                    HomePhoneLegislationCode = table.Column<string>(nullable: true),
                    MyPropHomePhoneNumbererty = table.Column<string>(nullable: true),
                    Honors = table.Column<string>(nullable: true),
                    LastName = table.Column<string>(nullable: true),
                    LastUpdateDate = table.Column<DateTime>(nullable: false),
                    LegalEntityId = table.Column<long>(nullable: false),
                    LicenseNumber = table.Column<string>(nullable: true),
                    MaritalStatus = table.Column<string>(nullable: true),
                    MiddleName = table.Column<string>(nullable: true),
                    MilitaryVetStatus = table.Column<string>(nullable: true),
                    NameSuffix = table.Column<string>(nullable: true),
                    NationalId = table.Column<string>(nullable: true),
                    NationalIdCountry = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Employees", x => x.EmployeeId);
                });

            migrationBuilder.CreateTable(
                name: "Assignments",
                columns: table => new
                {
                    AssignmentId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    EmployeesId = table.Column<int>(nullable: false),
                    ActionCode = table.Column<string>(nullable: true),
                    ActionReasonCode = table.Column<string>(nullable: true),
                    ActualTerminationDate = table.Column<DateTime>(nullable: false),
                    AssignmentCategory = table.Column<string>(nullable: true),
                    AssignmentName = table.Column<string>(nullable: true),
                    AssignmentNumber = table.Column<string>(nullable: true),
                    AssignmentProjectedEndDate = table.Column<DateTime>(nullable: false),
                    AssignmentStatus = table.Column<string>(nullable: true),
                    AssignmentStatusTypeId = table.Column<long>(nullable: false),
                    BusinessUnitId = table.Column<long>(nullable: false),
                    CreationDate = table.Column<DateTime>(nullable: false),
                    DefaultExpenseAccount = table.Column<string>(nullable: true),
                    DepartmentId = table.Column<long>(nullable: false),
                    EffectiveEndDate = table.Column<DateTime>(nullable: false),
                    EffectiveStartDate = table.Column<DateTime>(nullable: false),
                    EndTime = table.Column<string>(nullable: true),
                    Frequency = table.Column<string>(nullable: true),
                    FullPartTime = table.Column<string>(nullable: true),
                    GradeId = table.Column<long>(nullable: false),
                    GradeLadderId = table.Column<long>(nullable: false),
                    JobId = table.Column<long>(nullable: false),
                    LastUpdateDate = table.Column<DateTime>(nullable: false),
                    LegalEntityId = table.Column<long>(nullable: false),
                    LocationId = table.Column<long>(nullable: false),
                    ManagerAssignmentId = table.Column<long>(nullable: false),
                    ManagerId = table.Column<long>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Assignments", x => x.AssignmentId);
                    table.ForeignKey(
                        name: "FK_Assignments_Employees_EmployeesId",
                        column: x => x.EmployeesId,
                        principalTable: "Employees",
                        principalColumn: "EmployeeId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Assignments_EmployeesId",
                table: "Assignments",
                column: "EmployeesId");
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
