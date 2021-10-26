
--1)Write a SQL statement to create a table named countries including columns CountryId, CountryName and RegionId and make sure that no 
--countries except Italy, India and China will be entered in the table. and combination of columns CountryId and RegionId will be unique.

USE [Day-1]

CREATE TABLE COUNTRIES
(
countryId TINYINT  PRIMARY KEY IDENTITY(1,1),
countryName VARCHAR(10) NOT NULL UNIQUE CHECK ( countryName in('india','china','italy')),
regionalId TINYINT UNIQUE
)
INSERT INTO COUNTRIES VALUES ('china', 02)
INSERT INTO COUNTRIES VALUES ('india', 06)
INSERT INTO COUNTRIES VALUES ('japan', 10)
INSERT INTO COUNTRIES VALUES ('italy', 08)


SELECT * FROM COUNTRIES



--2) Write a SQL statement to create a table named JobHistory including columns EmployeeId, StartDate, End_Eate, Job_Id and Department_Id
--   and make sure that the value against column EndDate will be entered at the time of insertion to the format like ‘–/–/—-‘.

CREATE TABLE JOBHISTORY
(
EmployeeId INT PRIMARY KEY IDENTITY(1,1),
StartDate Date NOT NULL,
EndDate Date CHECK (EndDate LIKE '--/--/----'), 
JobId INT NOT NULL,
DepartmentId INT
);

INSERT INTO JOBHISTORY VALUES ('2021-02-07','04/08/2021',2,4);
INSERT INTO JOBHISTORY VALUES ('2021-02-07','04/08/2021',2,4);



--3) Write a SQL statement to create a table named jobs including columns JobId, JobTitle, MinSalary and MaxSalary, and make sure that, 
--   the default value for JobTitle is blank and MinSalary is 8000 and MaxSalary is NULL will be entered automatically at the time of 
--   insertion if no value assigned for the specified columns.


CREATE TABLE JOBS
(
JobId INT PRIMARY KEY IDENTITY(1,1),
JobTitle VARCHAR(10) NOT NULL DEFAULT ' ',
MinSalary DECIMAL(6,0) DEFAULT NULL,
MaxSalary DECIMAL(6,0) DEFAULT 8000
);

INSERT INTO JOBS VALUES ('developer',4000,10000)

SELECT * FROM JOBS




--4)Write a SQL statement to create a table employees including columns Employee_Id, FirstName, LastName, Email, PhoneNumber, Hire_Date,
--Job_Id, Salary, Commission, Manager_Id and Department_Id and make sure that, the Employee_Id column does not contain any duplicate value 
--at the time of insertion, and the foreign key column DepartmentId, reference by the column DepartmentId of Departments table, can contain 
--only those values which are exists in the Department table and another foreign key column JobId, referenced by the column JobId of jobs 
--table, can contain only those values which are exists in the jobs table.

CREATE TABLE employees ( EmployeeID INT PRIMARY KEY Identity(1,1), 
FIRST_NAME  VARCHAR(20) NOT NULL, 
LAST_NAME  VARCHAR(25) NOT NULL, 
EMAIL  VARCHAR(25) NOT NULL, 
PHONE_NUMBER  VARCHAR(10) NOT NULL, 
HIRE_DATE date NOT NULL, 
JOB_ID INT NOT NULL, 
SALARY DECIMAL(8,2) NOT NULL,
COMMISSION_PER DECIMAL(5,2) NOT NULL,
MANAGER_ID INT NOT NULL, 
DEPARTMENT_ID INT NOT NULL, 


CONSTRAINT FK_DEPARTMENT_ID FOREIGN KEY (DEPARTMENT_ID) REFERENCES departments(DEPARTMENT_ID),
CONSTRAINT FK_JOB_ID FOREIGN KEY (JOB_ID) REFERENCES jobs(JOB_ID));

CREATE TABLE departments ( DEPARTMENT_ID INT PRIMARY KEY Identity(1,1));




--5 Write a SQL statement to add a foreign key constraint named fk_job_id on JobId column of JobHistory table referencing to the 
--  primary key JobId of jobs table.
ALTER TABLE JobHistory ADD CONSTRAINT fk_job_id FOREIGN KEY (JobId) REFERENCES Jobs(JobId)

 

--6 Write a SQL statement to drop the existing foreign key fk_job_id from JobHistory table on JobId column which is referencing to
--  the JobId of jobs table.
ALTER TABLE JobHistory DROP CONSTRAINT fk_job_id

 

--7 Write a SQL statement to add a new column named location to the JobHistory table.
ALTER TABLE JobHistory ADD Location NVARCHAR(100)