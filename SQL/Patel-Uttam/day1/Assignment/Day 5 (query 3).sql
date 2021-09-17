/*Write a SQL statement to create a table named jobs including columns JobId, JobTitle, MinSalary and MaxSalary, and make sure that, the default value for JobTitle is blank and MinSalary is 8000 and MaxSalary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.*/

USE [Day5 (SSMS)]
GO

CREATE TABLE Jobs
(
JobId int Primary Key IDENTITY(1,1), 
JobTitle varchar(25) DEFAULT ' ', 
MinSalary int DEFAULT 8000 , 
MaxSalary int DEFAULT NULL
CONSTRAINT salarymin CHECK(MinSalary >= 8000),
CONSTRAINT salarymax CHECK(MaxSalary > MinSalary)
);
GO

INSERT into Jobs(JobId,JobTitle,MinSalary,MaxSalary) VALUES(1,'Traniee',10000,22000);
GO

SELECT * FROM Jobs
GO

INSERT into Jobs(JobId,MinSalary) VALUES(2,8500);
GO

SELECT * FROM Jobs
GO