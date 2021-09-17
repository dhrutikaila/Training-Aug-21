
USE NewOne

CREATE TABLE JobHistory
(
EmployeeId int CONSTRAINT pkEmployeeId PRIMARY KEY,
StartDate date CONSTRAINT ChkStartDate NOT NULL,
EndDate varchar(10) CONSTRAINT ChkEndDate CHECK (EndDate LIKE '[0-3][0-9]/[0-1][0-2]/[0-9][0-9][0-9][0-9]'),
Job_Id int CONSTRAINT ChkJobId NOT NULL,
Department_Id int CONSTRAINT ChkDepartmentId NOT NULL
)

INSERT INTO JobHistory (EmployeeId,StartDate,EndDate,Job_Id,Department_Id) values (2,'02/08/2021','02/02/2022',2,3);

INSERT INTO JobHistory (EmployeeId,StartDate,EndDate,Job_Id,Department_Id) values (3,'12/08/2029','02-01-2020',2,3);

select * from JobHistory




