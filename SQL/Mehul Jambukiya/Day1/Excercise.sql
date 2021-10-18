
CREATE DATABASE NewOne

USE NewOne

/*1.Write a SQL statement to create a table named countries including columns CountryId,
CountryName and RegionId and make sure that no countries except Italy, India and China
will be entered in the table. and combination of columns CountryId and RegionId will be unique.*/

CREATE TABLE Countries
(
 CountryId tinyint,
 CountryName varchar(5) CONSTRAINT	ChkCountriesCountryName CHECK ( CountryName IN ('India','Italy','China')),
 RegionId tinyint,
 CONSTRAINT PkCountryIdRegionId PRIMARY KEY(CountryId,RegionId)
)

ALTER TABLE Countries ALTER COLUMN CountryName varchar(5) NOT NULL;

INSERT INTO Countries VALUES (1,'India',1);
INSERT INTO Countries VALUES (2,'Italy',4);
INSERT INTO Countries VALUES (3,'China',2);
INSERT INTO Countries VALUES (4,'Australia',6);

ALTER TABLE Countries ALTER COLUMN CountryName varchar(15) NOT NULL;

INSERT INTO Countries VALUES (4,'Australia',6);

SELECT * FROM Countries


/*2.Write a SQL statement to create a table named JobHistory including columns EmployeeId,
StartDate, End_Eate, Job_Id and Department_Id and make sure that the value against column
EndDate will be entered at the time of insertion to the format like ‘–/–/—-‘.*/

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

SELECT * FROM JobHistory


/*3.Write a SQL statement to create a table named jobs including columns JobId, JobTitle, 
MinSalary and MaxSalary, and make sure that, the default value for JobTitle is blank and 
MinSalary is 8000 and MaxSalary is NULL will be entered automatically at the time of insertion 
if no value assigned for the specified columns.*/

CREATE TABLE Jobs
(
 JobId int CONSTRAINT pkJobId PRIMARY KEY,
 JobTitle varchar(25) CONSTRAINT defJobTilte DEFAULT '',
 MinSalary int CONSTRAINT difMinSal DEFAULT 8000,
 MaxSalary int CONSTRAINT difMaxsal DEFAULT NULL
);


INSERT INTO Jobs (JobId) values (5);
INSERT INTO Jobs (JobId,JobTitle,MinSalary,MaxSalary) values (15,'Junior Software Engineer',20000,30000);
INSERT INTO Jobs (JobId,JobTitle) values (17,'Sr Software Engineer');

SELECT * FROM Jobs;


/*4.Write a SQL statement to create a table employees including columns Employee_Id, FirstName, 
LastName, Email, PhoneNumber, Hire_Date, Job_Id, Salary, Commission, Manager_Id and Department_Id
and make sure that, the Employee_Id column does not contain any duplicate value at the time of insertion,
and the foreign key column DepartmentId, reference by the column DepartmentId of Departments table,
can contain only those values which are exists in the Department table and another foreign key column
JobId, referenced by the column JobId of jobs table, can contain only those values which are exists in the jobs table.*/


CREATE TABLE Departments
(
 DepartmentId int CONSTRAINT pkDepartmentId PRIMARY KEY,
 DepartmentName varchar(25) CONSTRAINT DeptName NOT NULL
);

CREATE TABLE Jobs
(
 JobId int CONSTRAINT pkJobId PRIMARY KEY,
 JobTitle varchar(25) CONSTRAINT JobTitle NOT NULL,
);

CREATE TABLE employees
(
 Employee_Id int CONSTRAINT PkEmpId PRIMARY KEY,
 FirstName varchar(20) CONSTRAINT Fname NOT NULL,
 LastName varchar(20) CONSTRAINT Lname NOT NULL,
 Email varchar(30) CONSTRAINT Email NOT NULL,
 PhoneNumber numeric(10) CONSTRAINT Phone NOT NULL,
 Hire_Date DATE CONSTRAINT Hdate NOT NULL,
 Job_Id int CONSTRAINT FkJobId FOREIGN KEY REFERENCES Jobs(JobId) ON DELETE SET NULL ON UPDATE CASCADE,
 Salary int CONSTRAINT Salary NOT NULL,
 Commission int CONSTRAINT defCommission DEFAULT NULL,
 Manager_Id int CONSTRAINT ManagerId NOT NULL,
 Department_Id int CONSTRAINT FkDepartmentId FOREIGN KEY REFERENCES Departments(DepartmentId) ON DELETE SET NULL ON UPDATE CASCADE,
);

INSERT INTO Departments VALUES (1,'DotNet'),(2,'PHP');

INSERT INTO Jobs VALUES (11,'Jr SE'),(12,'Sr SE');

INSERT INTO employees VALUES (21,'Paresh','Shah','paresh@gmail.com',1234567899,'05/05/2020',11,25000,500,5,1);
INSERT INTO employees VALUES (23,'Haresh','Dave','haresh@gmail.com',2534567899,'05/05/2020',11,24000,200,6,2);
INSERT INTO employees VALUES (25,'Dhaval','Patel','dhaval@gmail.com',3234567899,'05/05/2018',12,25000,900,5,1);

SELECT * FROM employees;
SELECT * FROM Jobs;
SELECT * FROM Departments;