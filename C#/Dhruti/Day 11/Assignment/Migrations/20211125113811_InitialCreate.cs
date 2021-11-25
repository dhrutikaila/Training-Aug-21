using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Hospital_Mange.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Departments",
                columns: table => new
                {
                    DeptID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DeptName = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Departme__0148818E0E67723E", x => x.DeptID);
                });

            migrationBuilder.CreateTable(
                name: "Doctors",
                columns: table => new
                {
                    DoctorID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorName = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: false),
                    Age = table.Column<byte>(type: "tinyint", nullable: false),
                    Gender = table.Column<byte>(type: "tinyint", nullable: false),
                    PhoneNumber = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: false),
                    Address = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Doctors", x => x.DoctorID);
                });

            migrationBuilder.CreateTable(
                name: "Drugs",
                columns: table => new
                {
                    DrugsID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DrugName = table.Column<string>(type: "varchar(25)", unicode: false, maxLength: 25, nullable: false),
                    Price = table.Column<decimal>(type: "decimal(8,2)", nullable: false),
                    ExpiryDate = table.Column<DateTime>(type: "date", nullable: false),
                    DrugDescription = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    Quantity = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Drugs__96604F90B8D05331", x => x.DrugsID);
                });

            migrationBuilder.CreateTable(
                name: "ObjectMaster",
                columns: table => new
                {
                    Type_Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Type_Name = table.Column<string>(type: "varchar(20)", unicode: false, maxLength: 20, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__ObjectMa__FE90DD9E8E225B19", x => x.Type_Id);
                });

            migrationBuilder.CreateTable(
                name: "Patients",
                columns: table => new
                {
                    PatientID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PatientName = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: false),
                    Age = table.Column<byte>(type: "tinyint", nullable: false),
                    Gender = table.Column<byte>(type: "tinyint", nullable: false),
                    PhoneNumber = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: false),
                    Address = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: false),
                    BloodGroup = table.Column<string>(type: "varchar(3)", unicode: false, maxLength: 3, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Patients", x => x.PatientID);
                });

            migrationBuilder.CreateTable(
                name: "HealthcareAssistants",
                columns: table => new
                {
                    AssistantID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AssistantName = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: false),
                    Age = table.Column<byte>(type: "tinyint", nullable: false),
                    Gender = table.Column<byte>(type: "tinyint", nullable: false),
                    PhoneNumber = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: false),
                    Salary = table.Column<decimal>(type: "decimal(8,2)", nullable: true),
                    DeptNo = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Healthca__3756F7502BCFE540", x => x.AssistantID);
                    table.ForeignKey(
                        name: "FK_Dept",
                        column: x => x.DeptNo,
                        principalTable: "Departments",
                        principalColumn: "DeptID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Object",
                columns: table => new
                {
                    Obj_Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Type_Id = table.Column<int>(type: "int", nullable: false),
                    Obj_Name = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Object__2D8B34D56A0789F6", x => x.Obj_Id);
                    table.ForeignKey(
                        name: "FK_Type_Id",
                        column: x => x.Type_Id,
                        principalTable: "ObjectMaster",
                        principalColumn: "Type_Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Prescription",
                columns: table => new
                {
                    PreID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PreDate = table.Column<DateTime>(type: "date", nullable: false),
                    PatientID = table.Column<int>(type: "int", nullable: false),
                    DoctorID = table.Column<int>(type: "int", nullable: false),
                    DrugsID = table.Column<int>(type: "int", nullable: false),
                    DayPart = table.Column<byte>(type: "tinyint", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Prescrip__7024C129B4A9EF0A", x => x.PreID);
                    table.ForeignKey(
                        name: "FK_DrID",
                        column: x => x.DoctorID,
                        principalTable: "Doctors",
                        principalColumn: "DoctorID",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_DrugId",
                        column: x => x.DrugsID,
                        principalTable: "Drugs",
                        principalColumn: "DrugsID",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatID",
                        column: x => x.PatientID,
                        principalTable: "Patients",
                        principalColumn: "PatientID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Treatment",
                columns: table => new
                {
                    TrtID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TrtDate = table.Column<DateTime>(type: "date", nullable: false, defaultValueSql: "(getdate())"),
                    DeptID = table.Column<int>(type: "int", nullable: false),
                    PatientID = table.Column<int>(type: "int", nullable: false),
                    DoctorID = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Treatmen__B8F3CCD1C2087D41", x => x.TrtID);
                    table.ForeignKey(
                        name: "FK_DeptID",
                        column: x => x.DeptID,
                        principalTable: "Departments",
                        principalColumn: "DeptID",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_DoctorID",
                        column: x => x.DoctorID,
                        principalTable: "Doctors",
                        principalColumn: "DoctorID",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientID",
                        column: x => x.PatientID,
                        principalTable: "Patients",
                        principalColumn: "PatientID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_HealthcareAssistants_DeptNo",
                table: "HealthcareAssistants",
                column: "DeptNo");

            migrationBuilder.CreateIndex(
                name: "IX_Object_Type_Id",
                table: "Object",
                column: "Type_Id");

            migrationBuilder.CreateIndex(
                name: "IX_Prescription_DoctorID",
                table: "Prescription",
                column: "DoctorID");

            migrationBuilder.CreateIndex(
                name: "IX_Prescription_DrugsID",
                table: "Prescription",
                column: "DrugsID");

            migrationBuilder.CreateIndex(
                name: "IX_Prescription_PatientID",
                table: "Prescription",
                column: "PatientID");

            migrationBuilder.CreateIndex(
                name: "IX_Treatment_DeptID",
                table: "Treatment",
                column: "DeptID");

            migrationBuilder.CreateIndex(
                name: "IX_Treatment_DoctorID",
                table: "Treatment",
                column: "DoctorID");

            migrationBuilder.CreateIndex(
                name: "IX_Treatment_PatientID",
                table: "Treatment",
                column: "PatientID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "HealthcareAssistants");

            migrationBuilder.DropTable(
                name: "Object");

            migrationBuilder.DropTable(
                name: "Prescription");

            migrationBuilder.DropTable(
                name: "Treatment");

            migrationBuilder.DropTable(
                name: "ObjectMaster");

            migrationBuilder.DropTable(
                name: "Drugs");

            migrationBuilder.DropTable(
                name: "Departments");

            migrationBuilder.DropTable(
                name: "Doctors");

            migrationBuilder.DropTable(
                name: "Patients");
        }
    }
}
