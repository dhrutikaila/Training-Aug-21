-- Practice Exercise:

--                 Practice the same with SSMS GUI and writing queries as well.

--1.Write a SQL statement to create a table named countries including columns CountryId, CountryName and RegionId and make sure that no countries except Italy, India and China will be entered in the table. and combination of columns CountryId and RegionId will be unique.
CREATE TABLE ContryName(
CountryId INT UNIQUE, 
CountryName VARCHAR(70) CHECK(CountryName not IN('Italy','India','China')),
RegionId INT UNIQUE
);

-- 2.Write a SQL statement to create a table named JobHistory including columns EmployeeId, StartDate, End_Eate, Job_Id and Department_Id and make sure that the value against column EndDate will be entered at the time of insertion to the format like ‘–/–/—-‘.
CREATE TABLE JobHistory (
EmployeeId int unique, 
StartDate date, 
End_Date date check(End_Date like '–/–/—-') , 
Job_Id int ,
Department_Id int
);

-- 3.Write a SQL statement to create a table named jobs including columns JobId, JobTitle, MinSalary and MaxSalary, and make sure that, the default value for JobTitle is blank and MinSalary is 8000 and MaxSalary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.
CREATE TABLE jobs (
JobId int PRIMARY KEY, 
JobTitle varchar(30) DEFAULT '', 
MinSalary varchar(10) DEFAULT '8000',
MaxSalary varchar(10) DEFAULT NULL
);

-- 4.Write a SQL statement to create a table employees including columns Employee_Id, FirstName, LastName, Email, PhoneNumber, Hire_Date, Job_Id, Salary, Commission, Manager_Id and Department_Id and make sure that, the Employee_Id column does not contain any duplicate value at the time of insertion, and the foreign key column DepartmentId, reference by the column DepartmentId of Departments table, can contain only those values which are exists in the Department table and another foreign key column JobId, referenced by the column JobId of jobs table, can contain only those values which are exists in the jobs table.
CREATE TABLE Departments(
DepartmentId INT PRIMARY KEY,
DepartmentName varchar(20)
);

CREATE TABLE employees  (
Employee_Id INT PRIMARY KEY, 
FirstName varchar(50), 
LastName varchar(50), 
Email varchar(100), 
PhoneNumber varchar(10), 
Hire_Date date, 
Job_Id int FOREIGN KEY REFERENCES jobs(JobId), 
Salary varchar(10), 
Commission varchar(50), 
Manager_Id int,
Department_Id  int FOREIGN KEY REFERENCES Departments(DepartmentId),
);

-- Alter statement

-- 1.Write a SQL statement to add a foreign key constraint named fk_job_id on JobId column of JobHistory table referencing to the primary key JobId of jobs table.
ALTER TABLE JobHistory
ADD CONSTRAINT fk_job_id 
FOREIGN KEY (Job_Id) REFERENCES jobs(JobId);

-- 2.Write a SQL statement to drop the existing foreign key fk_job_id from JobHistory table on JobId column which is referencing to the JobId of jobs table.
ALTER TABLE JobHistory
DROP CONSTRAINT fk_job_id;


-- 3.Write a SQL statement to add a new column named location to the JobHistory table.
ALTER TABLE JobHistory
ADD location varchar(30);
