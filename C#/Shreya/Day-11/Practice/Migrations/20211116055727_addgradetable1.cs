using Microsoft.EntityFrameworkCore.Migrations;

namespace EFCoreExample.Migrations
{
    public partial class addgradetable1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Students_Grades_GradeId",
                table: "Students");

            migrationBuilder.RenameColumn(
                name: "GradeId",
                table: "Students",
                newName: "GradeID");

            migrationBuilder.RenameIndex(
                name: "IX_Students_GradeId",
                table: "Students",
                newName: "IX_Students_GradeID");

            migrationBuilder.AlterColumn<int>(
                name: "GradeID",
                table: "Students",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Students_Grades_GradeID",
                table: "Students",
                column: "GradeID",
                principalTable: "Grades",
                principalColumn: "GradeId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Students_Grades_GradeID",
                table: "Students");

            migrationBuilder.RenameColumn(
                name: "GradeID",
                table: "Students",
                newName: "GradeId");

            migrationBuilder.RenameIndex(
                name: "IX_Students_GradeID",
                table: "Students",
                newName: "IX_Students_GradeId");

            migrationBuilder.AlterColumn<int>(
                name: "GradeId",
                table: "Students",
                type: "int",
                nullable: true,
                oldClrType: typeof(int));

            migrationBuilder.AddForeignKey(
                name: "FK_Students_Grades_GradeId",
                table: "Students",
                column: "GradeId",
                principalTable: "Grades",
                principalColumn: "GradeId",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
