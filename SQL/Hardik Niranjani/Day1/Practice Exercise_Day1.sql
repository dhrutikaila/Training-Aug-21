
--(1)--
--Write a SQL statement to create a table named countries including columns CountryId, CountryName 
--and RegionId and make sure that no countries except Italy, India and China will be entered in the table. 
--and combination of columns CountryId and RegionId will be unique.

CREATE TABLE countries
(
	CountryId INT CONSTRAINT countries_CountryId_PK PRIMARY KEY NOT NULL,
	CountryName varchar(30) CHECK(CountryName IN('India','Italy','China')) NOT NULL,
	RegionId INT UNIQUE(CountryId,RegionId) NOT NULL
)

INSERT INTO countries VALUES(1,'India', 64),(2,'Italy',65),(3,'India',66)
SELECT * FROM countries

--(2)--
--Write a SQL statement to create a table named JobHistory including columns EmployeeId, StartDate, End_Eate, 
--Job_Id and Department_Id and make sure that the value against column EndDate will be entered at the time of 
--insertion to the format like ‘–/–/—-‘.

CREATE TABLE JobHistory
(
	EmployeeId INT NOT NULL,
	StartDate  DATE NOT NULL,
	EndDate DATE NOT NULL CHECK(EndDate LIKE '--/--/----'),
	Job_Id INT NOT NULL,
	Department_Id INT CONSTRAINT JobHistory_DepartmentId_PK PRIMARY KEY NOT NULL
)



--(3)--
--Write a SQL statement to create a table named jobs including columns JobId, JobTitle, MinSalary and MaxSalary, 
--and make sure that, the default value for JobTitle is blank and MinSalary is 8000 and MaxSalary is NULL 
--will be entered automatically at the time of insertion if no value assigned for the specified columns.

CREATE TABLE jobs
(
	JobId INT CONSTRAINT jobs_JobId_PK PRIMARY KEY NOT NULL,
	JobTitle varchar(20) NOT NULL DEFAULT '',
	MinSalary decimal(5,0) DEFAULT 8000,
	MaxSalary decimal(8,0) DEFAULT NULL
)



--(4)--
--Write a SQL statement to create a table employees including columns Employee_Id, FirstName, LastName, 
--Email, PhoneNumber, Hire_Date, Job_Id, Salary, Commission, Manager_Id and Department_Id and make sure that, 
--the Employee_Id column does not contain any duplicate value at the time of insertion, and the foreign key column 
--DepartmentId, reference by the column DepartmentId of Departments table, can contain only those values which are 
--exists in the Department table and another foreign key column JobId, referenced by the column JobId of jobs table, 
--can contain only those values which are exists in the jobs table.

CREATE TABLE Departments(
	DepartmentId INT CONSTRAINT Departments_DepartmentId_PK PRIMARY KEY NOT NULL, 
	Dept_Name VARCHAR(35)
)

INSERT INTO Departments VALUES(1,'HR'),
							  (2,'Accounts'),
							  (3,'Development'),
							  (4,'Designing')

CREATE TABLE employees
(
	Employee_Id INT CONSTRAINT pkEmployee_Id PRIMARY KEY NOT NULL,
	FirstName varchar(15) NOT NULL,
	LastName varchar(25) Not Null,
	Email varchar(30) NOT NULL,
	PhoneNumber varchar(15) NOT NULL,
	Hire_Date date NOT NULL,
	Job_Id INT CONSTRAINT employees_JobId_FK FOREIGN KEY REFERENCES Jobs(JobId) NOT NULL, 
	Salary decimal(6,0) DEFAULT NULL,
	Commission INT DEFAULT NULL,
	Department_Id INT CONSTRAINT employees_DepartmentId_FK FOREIGN KEY REFERENCES Departments(DepartmentId) NOT NULL,
)

-----------------------------------------------------------------------------------------------------
--Alter statement--

--(1)--
--Write a SQL statement to add a foreign key constraint named fk_job_id on JobId column of JobHistory 
--table referencing to the primary key JobId of jobs table.


ALTER TABLE JobHistory
ADD CONSTRAINT fk_job_id
FOREIGN KEY(Job_Id)
REFERENCES jobs(JobId)
ON UPDATE CASCADE ON DELETE CASCADE;


--(2)--
--Write a SQL statement to drop the existing foreign key fk_job_id from JobHistory table on JobId column 
--which is referencing to the JobId of jobs table.


ALTER TABLE JobHistory
DROP CONSTRAINT fk_job_id;

--(3)--
--Write a SQL statement to add a new column named location to the JobHistory table.

ALTER TABLE JobHistory
ADD demo INT;