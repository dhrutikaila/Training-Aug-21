/* Q2 Write a SQL statement to create a table named JobHistory including columns 
EmployeeId, StartDate, End_Eate, Job_Id and Department_Id and make sure that the value against 
column EndDate will be entered at the time of insertion to the format like ‘–/–/—-‘. */


use db1;

CREATE TABLE JobHistory
(
EmployeeId int not null PRIMARY KEY IDENTITY(1,1),
StartDate date not null,
End_Date varchar(10) CONSTRAINT ChkDate CHECK (End_Date LIKE '--/--/----'),
Job_Id varchar(20) not null,
Department_Id varchar(8) not null,
)


INSERT INTO JobHistory (StartDate,End_Date,Job_Id,Department_Id) VALUES ('2000-12-11','08/10/2005','node02','dotnet')