-- Practice Exercise:
--  (4)  Write a SQL statement to create a table employees including columns Employee_Id, FirstName, LastName, Email, PhoneNumber, Hire_Date, Job_Id, Salary, Commission, 
--     Manager_Id and Department_Id and make sure that, the Employee_Id column does not contain any duplicate value at the time of insertion, and the foreign key column DepartmentId,
--     reference by the column DepartmentId of Departments table,can contain only those values which are exists in the Department table and another foreign key column JobId, 
--     referenced by the column JobId of jobs table, can contain only those values which are exists in the jobs table.


-- Create Database 

CREATE DATABASE TraineeAug
USE TraineeAug

--Create Table 

CREATE TABLE [dbo].[employees](
	[Employee_Id] [int] NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[Email] [varchar](25) NOT NULL,
	[PhoneNumber] [varchar](10) NOT NULL,
	[Hire_Date] [date] NOT NULL,
	[Job_Id] [int] NULL,
	[Salary] [decimal](8, 2) NOT NULL,
	[Commission] [decimal](2, 2) NULL,
	[Manager_Id] [decimal](6, 0) NOT NULL,
	[Department_Id] [numeric](10, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Employee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [FK_employees_Department] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Department] ([Department_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [FK_employees_Department]
GO

ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [FK_employees_jobs] FOREIGN KEY([Job_Id])
REFERENCES [dbo].[jobs] ([JobId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [FK_employees_jobs]
GO




CREATE TABLE Department
(
Department_Id NUMERIC(10) PRIMARY KEY,
DEPARTMENT_NAME VARCHAR(20) NOT NULL,
DEP_LOCATION VARCHAR(15) NOT NULL
)

--Select table
SELECT * FROM employees

--Delete Table
DELETE  employees