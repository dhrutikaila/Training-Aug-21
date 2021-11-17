
/* 1. Write a SQL statement to create a table named countries including columns CountryId, 
CountryName and RegionId and make sure that no countries except Italy, India and China will be entered in the table. 
and combination of columns CountryId and RegionId will be unique.*/

CREATE TABLE COUNTRY(
CountryID varchar(2) NOT NULL,
CountryName varchar(20) NOT NULL,
RegionID DECIMAL(5,0) NOT NULL,
CONSTRAINT CID UNIQUE(CountryID),
CONSTRAINT RID UNIQUE(RegionID),
CONSTRAINT CNAME CHECK(CountryName IN('India','China','Italy')),
)

INSERT INTO COUNTRY (CountryID,CountryName,RegionID)
VALUES ('IN','India',1),
('IT','Italy',4),
('CH','China',6)

SELECT * FROM COUNTRY


/* 2. Write a SQL statement to create a table named JobHistory including columns 
EmployeeId, StartDate, End_Eate, Job_Id and Department_Id and make sure that the value against 
column EndDate will be entered at the time of insertion to the format like ‘–/–/—-‘.*/

CREATE TABLE JHistory(
EmployeeID INT NOT NULL,
   StartDate DATE NOT NULL,
   End_Date DATE NOT NULL, 
   Job_ID INT NOT NULL ,
   Department_ID decimal(4,0) DEFAULT NULL,
   PRIMARY KEY (EmployeeID,StartDate)
)

INSERT INTO JHistory(EmployeeID,StartDate,End_Date,Job_ID)
VALUES (1,'12-04-1998','12-04-1998',12),
(2,'08-12-1998','2-01-2021',13),
(3,'12-12-2012','22-02-2021',14),
(4,'08-12-2012','18-05-2021',15),
(5,'21-04-2000','02-06-2021',26),
(6,'05-10-2015','13-10-2021',08)

 SELECT [EmployeeID]
            ,CONVERT(VARCHAR(10), [End_Date], 103) [End_Date]
    FROM JHistory

/* 3. Write a SQL statement to create a table named jobs including columns 
	JobId, JobTitle, MinSalary and MaxSalary, and make sure that, the default value for
	JobTitle is blank and MinSalary is 8000 and MaxSalary is NULL will be entered automatically 
	at the time of insertion if no value assigned for the specified columns.*/

CREATE TABLE Job(
	Job_Id int primary key NOT NULL,
	JobTitle varchar(25) NULL,
	Min_Salary numeric(18, 0) NULL,
	Max_Salary numeric(18, 0) NULL
) 
ALTER TABLE Job ADD  CONSTRAINT DF_Job_Min_Salary  DEFAULT ((8000)) FOR Min_Salary

INSERT INTO Job(Job_Id)
VALUES (1),(2),(3),(4)

SELECT * FROM Job

/*  4. Write a SQL statement to create a table employees including columns 
	Employee_Id, FirstName, LastName, Email, PhoneNumber, Hire_Date, Job_Id, Salary, Commission, Manager_Id and Department_Id 
	and make sure that, the Employee_Id column does not contain any duplicate value at the time of insertion, 
	and the foreign key column DepartmentId, reference by the column DepartmentId of Departments table, 
	can contain only those values which are exists in the Department table and another foreign key column 
	JobId, referenced by the column JobId of jobs table, can contain only those values which are exists in the jobs table.*/
   
   CREATE TABLE New_Employee
(
	E_Id int CONSTRAINT PK_EmpId PRIMARY KEY,
	FirstName varchar(15) NOT NULL,
	LastName varchar(15) NOT NULL,
	Email_ID nvarchar(50)Not NULL CONSTRAINT UK_Email UNIQUE,
	CONSTRAINT CK_mail CHECK(Email_ID LIKE '%_@_%._%'),
	PhoneNumber Numeric(10) NOT NULL CONSTRAINT UK_MNUM UNIQUE,
	Hire_Date date NOT NULL,
	JobId int ,
	Salary NUMERIC(10),
	Commission NUMERIC(10),
	Manager_Id NUMERIC(20),
	Dept_Id DECIMAL(4),	
)

ALTER TABLE New_Employee ADD  CONSTRAINT DF_jobid  DEFAULT ((0)) FOR JobId
ALTER TABLE New_Employee ADD  CONSTRAINT DF_Deptid  DEFAULT ((0)) FOR Dept_Id
--ALTER TABLE New_Employee ADD  CONSTRAINT job_idfk FOREIGN KEY (JobId) REFERENCES Job(Job_Id)
--ALTER TABLE New_Employee ADD  CONSTRAINT FK_DEPTID FOREIGN KEY (Dept_Id) REFERENCES Departments(DepartmentID)

SELECT * FROM New_Employee

INSERT INTO New_Employee(E_Id,FirstName,LastName,Email_ID,PhoneNumber,Hire_Date)
VALUES(1,'Trupal','Singel','tnsingel0987@gmail.com',564127890,'02-08-2021'),
(2,'Trupal','Singel','singel@gmail.com',0987456321,'02-08-2021')



