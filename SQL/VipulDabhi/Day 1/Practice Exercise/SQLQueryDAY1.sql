CREATE TABLE Students
(
	StudentID INT,
	FirstName VARCHAR(100),
	LastName VARCHAR(100),
	Gender VARCHAR(100),
	Stream VARCHAR(100),
	CONSTRAINT Stu_Primarykey PRIMARY KEY (StudentID)
	
)
ALTER TABLE Students
	 ADD Address VARCHAR(100) 


DROP TABLE Students

--Day1 Practice Tutorialsite

--Write a SQL statement to create a table named countries including columns CountryId, CountryName and RegionId and make sure that no countries except Italy, India and China will be entered in the table.
--and combination of columns CountryId and RegionId will be unique.
CREATE TABLE Country
(
CountryId INT PRIMARY KEY,
CountryName varchar(100) CHECK(CountryName IN('Italy','India','China')), 
RegionId INT UNIQUE,
CONSTRAINT CidnotRid CHECK (CountryId != RegionID),

)
SELECT * FROM Country

--Write a SQL statement to create a table named JobHistory including columns EmployeeId, StartDate, End_Eate, Job_Id and Department_Id and make sure that the value against column EndDate will be entered at the time of insertion to the format like ‘–/–/—-‘.
CREATE TABLE JobHistory
(
EmployeeId INT PRIMARY KEY,
StartDate DateTime,
End_Date DateTime,
Job_ID INT,
Depatment_Id INT,
)
SELECT * FROM JobHistory


--Write a SQL statement to create a table named jobs including columns JobId, JobTitle, MinSalary and MaxSalary, and make sure that, 
--the default value for JobTitle is blank and MinSalary is 8000 and MaxSalary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.
CREATE TABLE jobs
(
JobId INT,
JobTitle VARCHAR(100) DEFAULT NULL,
MinSalary INT CHECK (MinSalary >= 8000),
MaxSalary INT DEFAULT NULL,
PRIMARY KEY (JobId)
)
SELECT * FROM jobs


--Write a SQL statement to create a table employees including columns Employee_Id, FirstName, LastName, Email, PhoneNumber, Hire_Date, Job_Id, Salary, Commission, Manager_Id and Department_Id 
--and make sure that, the Employee_Id column does not contain any duplicate value at the time of insertion, and the foreign key column DepartmentId, reference by the column DepartmentId of 
--Departments table, can contain only those values which are exists in the Department table and another foreign key column JobId, referenced by the column JobId of jobs table, can contain only those values which are exists in the jobs table.

CREATE TABLE Employees
(
employeeId INT UNIQUE,
FirstName VARCHAR(100),
LastName VARCHAR(100),
Email VARCHAR(100),
PhoneNumber INT,
Hire_Date DATETIME,
Job_Id INT,
Salary INT,
Commission INT,
manager_Id INT,
Department_Id INT PRIMARY KEY,
FOREIGN KEY (Job_Id) REFERENCES jobs(JobId),
FOREIGN KEY (Department_Id) REFERENCES Department(DepartmentId),
)
CREATE TABLE Department 
(
DepartmentId INT
PRIMARY KEY (DepartmentId)
)
SELECT * FROM Department

--Write a SQL statement to add a foreign key constraint named fk_job_id on JobId column of JobHistory table referencing to the primary key JobId of jobs table.
ALTER TABLE JobHistory
ADD CONSTRAINT fk_job_id FOREIGN KEY (Job_ID) REFERENCES jobs(JobId)

--Write a SQL statement to drop the existing foreign key fk_job_id from JobHistory table on JobId column which is referencing to the JobId of jobs table.
ALTER TABLE JobHistory
DROP CONSTRAINT 

--Write a SQL statement to add a new column named location to the JobHistory table.
ALTER TABLE JobHistory
ADD location_ VARCHAR(100)

