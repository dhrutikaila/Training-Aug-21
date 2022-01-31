/* Write a SQL statement to create a table employees including columns Employee_Id, FirstName, LastName, Email, PhoneNumber,
Hire_Date, Job_Id, Salary, Commission, Manager_Id and Department_Id and make sure that, the Employee_Id column does 
not contain any duplicate value at the time of insertion, and the foreign key column DepartmentId, reference by the column
DepartmentId of Departments table, can contain only those values which are exists in the Department table and another 
foreign key column JobId, referenced by the column JobId of jobs table, can contain only those values which are exists in 
the jobs table. */

USE [Day5 (SSMS)]
GO

CREATE TABLE Departments
(
DepartmentId int PRIMARY KEY IDENTITY(1,1), 
DepartmentName varchar(10) NOT NULL, 
HOD varchar(10) NOT NULL, 
);
GO

CREATE TABLE Jobs_2
(
JobId int PRIMARY KEY IDENTITY(1,1), 
DepartmentTitle varchar(10) NOT NULL, 
JobDescription varchar(10) DEFAULT NULL, 
);
GO



CREATE TABLE employees
(
Employee_Id int PRIMARY KEY IDENTITY(1,1), 
FirstName varchar(10) NOT NULL, 
LastName varchar(10) NOT NULL, 
Email varchar(25) NOT NULL, 
PhoneNumber bigint NOT NULL,
Hire_Date varchar(10) NOT NULL, 
Job_Id int NOT NULL, 
Salary int NOT NULL, 
Commission int DEFAULT NULL, 
Manager_Id int DEFAULT 1,
Department_Id int NOT NULL,
CONSTRAINT U_email UNIQUE(Email),
CONSTRAINT U_phonenumber UNIQUE(PhoneNumber),
CONSTRAINT minSalary CHECK( Salary >= 10000),
CONSTRAINT FK_depid FOREIGN KEY (Department_Id) REFERENCES Departments(DepartmentId),
CONSTRAINT FK_jobid FOREIGN KEY (Job_Id) REFERENCES Jobs_2(JobId)
);
GO

INSERT into Departments VALUES ('.NET','SSS');
GO

INSERT into Departments VALUES ('Node.JS','AAA');
GO

INSERT into Departments VALUES ('QA','VVV');
GO

SELECT * FROM Departments

GO

INSERT into Jobs_2 VALUES ('Traniee','ffd');
GO

INSERT into Jobs_2 VALUES ('Developer','gthyj');
GO

INSERT into Jobs_2 VALUES ('HR','vdtjkiul');
GO

SELECT * FROM Jobs_2
SELECT * FROM Departments
GO

SELECT CONVERT(varchar , GETDATE(),103)
Go


INSERT into Employees VALUES ('Uttam','Patel','abc@xyz.com','8425795245','31/08/2021',1,10000,'','',1);
GO

SELECT * FROM employees
GO

INSERT into Employees VALUES ('Jimmy','Patel','123@xyz.com','9524584257','31/08/2021',4,10000,'',NULL,3);
GO

SELECT * FROM employees
GO

SELECT * FROM Departments   
JOIN 
employees as e
ON
e.Department_Id = DepartmentId;
GO

SELECT * FROM Jobs_2   
JOIN 
employees as e
ON
e.Job_Id = JobId;
Go
