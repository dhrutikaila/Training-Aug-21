--Practice Exercise:

--(1)Write a SQL statement to create a table named countries including columns CountryId, 
--CountryName and RegionId and make sure that no countries except Italy, India and China will be entered in the table.
--and combination of columns CountryId and RegionId will be unique.
	
	CREATE TABLE COUNTRIES 
	(
		CountryId INT PRIMARY KEY NOT NULL, 
		CountryName VARCHAR(20) CONSTRAINT ChkCountryName CHECK(CountryName IN('italy','india','china')),
		RegionId INT CONSTRAINT UniqueRegionId UNIQUE
	)
	INSERT INTO COUNTRIES VALUES(2,'India',2)
	SELECT * FROM COUNTRIES

--(2)Write a SQL statement to create a table named JobHistory including columns EmployeeId, 
--StartDate, End_Eate, Job_Id and Department_Id and make sure that the value against column 
--EndDate will be entered at the time of insertion to the format like ‘–/–/—-‘.
	
	CREATE TABLE  JobHistory
	(
		EmployeeId INT PRIMARY KEY NOT NULL, 
		StartDate DATE, 
		End_Date VARCHAR(20) CONSTRAINT ChkEndDate CHECK(End_Date LIKE '__/__/____'), 
		Job_Id INT,
		Department_Id INT
	)
	
	INSERT INTO JobHistory VALUES(1,'2021-01-07','09/08/2021',1,1)
	SELECT * FROM JobHistory


--(3)Write a SQL statement to create a table named jobs including columns JobId, 
--JobTitle, MinSalary and MaxSalary, and make sure that, the default value for JobTitle 
--is blank and MinSalary is 8000 and MaxSalary is NULL will be entered automatically 
--at the time of insertion if no value assigned for the specified columns.
	
	CREATE TABLE JOBS 
	(
		JobId INT,
		JobTitle VARCHAR(20) CONSTRAINT DefaultJobTitle DEFAULT ' ',
		MinSalary INT CONSTRAINT DefaultMinSalary DEFAULT 8000,
		MaxSalary INT CONSTRAINT DefaultMaxSalary DEFAULT NULL,
	)
	INSERT INTO JOBS(JobId)VALUES(1)
	SELECT * FROM JOBS

--(4)Write a SQL statement to create a table employees including columns 
--Employee_Id, FirstName, LastName, Email, PhoneNumber, Hire_Date, Job_Id, Salary, 
--Commission, Manager_Id and Department_Id and make sure that, the Employee_Id column does not 
--contain any duplicate value at the time of insertion, and the foreign key column DepartmentId,
--reference by the column DepartmentId of Departments table, can contain only those values which are
--exists in the Department table and another foreign key column JobId, referenced by the column JobId of jobs table,
--can contain only those values which are exists in the jobs table.
	
	CREATE TABLE Departments
	(
		Department_Id INT NOT NULL CONSTRAINT PK_dpt PRIMARY KEY IDENTITY(1,1), 
		Dept_Name VARCHAR(30)
	)

INSERT INTO Departments VALUES('HR'),
		('Accounts'),
		('Development'),
		('Designing')

SELECT * FROM Departments

CREATE TABLE Job
(JobID INT PRIMARY KEY NOT NULL)
INSERT INTO Job VALUES(1)
SELECT * FROM Job

CREATE TABLE EMPLOYEES
	(
	   Employee_Id INT PRIMARY KEY NOT NULL, 
	   FirstName VARCHAR(20),
	   LastName VARCHAR(20),
	   Email VARCHAR(20),
	   PhoneNumber VARCHAR(15),
	   Hire_Date DATE,
	   Job_Id INT  CONSTRAINT FkJobId FOREIGN KEY REFERENCES JOB(JobId),
	   Salary INT,
	   Commission INT,
	   Manager_Id INT,
	   Department_Id INT CONSTRAINT FkDepartmentId FOREIGN KEY REFERENCES Departments(Department_Id)
	)

--Alter statement

--(1)Write a SQL statement to add a foreign key constraint named fk_job_id on JobId column of JobHistory table
--referencing to the primary key JobId of jobs table.

		ALTER TABLE JobHistory ADD CONSTRAINT fk_job_id FOREIGN KEY(Jobid) REFERENCES Jobs(JobId)

--(2)Write a SQL statement to drop the existing foreign key fk_job_id from JobHistory table on JobId column
--which is referencing to the JobId of jobs table.

		ALTER TABLE JobHistory DROP CONSTRAINT fk_job_id 

--(3)Write a SQL statement to add a new column named location to the JobHistory table.

		ALTER TABLE JobHistory ADD location VARCHAR(20)
		
--Assignment:

--You have been hired to create a relational database to support a car sales business.
--You need to store information on the business’s employees, inventory, and completed sales.
--You also need to account for the fact that each salesperson receives a different percentage of their sales in commission.
--What tables and columns would you create in your relational database, and how would you link the tables?


CREATE TABLE EmployeesB
(
    EmployeeID int PRIMARY KEY,
    Department varchar(10) NOT NULL,
    Department_Id INT NOT NULL,
    FirstName varchar(15) NOT NULL,
    LastName varchar(15) NOT NULL,
    PhoneNo numeric(10) NOT NULL,
    Email varchar(50) CONSTRAINT ckEmail CHECK(Email LIKE '_%@__%.__%'),
    JoiningDate date NOT NULL,
    Commission int,
)

 CREATE TABLE Inventory
(
    CarID int NOT NULL PRIMARY KEY,
    CarCompany varchar(10) NOT NULL,
    CarName varchar(10) NOT NULL,
    Stock int NOT NULL,
    MRP money NOT NULL,
    Discount int,
)

 CREATE TABLE Sales
(
    EmployeeID int NOT NULL, 
    CarID int NOT NULL,
    SaleID int NOT NULL PRIMARY KEY,
    SaleDate date NOT NULL,
    SaleAmt int NOT NULL,
    PaymentMethod varchar(10) NOT NULL,
    CustomerName varchar(30) NOT NULL,
    CONSTRAINT fk_CarID FOREIGN KEY (CarID) REFERENCES Inventory(CarID) 
)

ALTER TABLE Sales
ADD CONSTRAINT fk_empid FOREIGN KEY (EmployeeID) REFERENCES EmployeesB(EmployeeID) 