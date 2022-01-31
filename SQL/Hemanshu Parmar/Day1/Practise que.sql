
-------------------------------------------------------------Practise Exercise----------------------------------------------------------------- 

Task1:
Write a SQL statement to create a table named countries including columns CountryId, CountryName and RegionId and make sure that no countries except Italy, India and China will be entered in the table. and combination of columns CountryId and RegionId will be unique.

Solution:
CREATE TABLE Countries (
COUNTRY_ID varchar(10) NOT NULL UNIQUE DEFAULT '',
COUNTRY_NAME varchar(40) UNIQUE NULL CHECK(COUNTRY_NAME IN('Italy','India','China')) ,
REGION_ID varchar(2) UNIQUE NOT NULL,
PRIMARY KEY (COUNTRY_ID,REGION_ID))


Task2:

Write a SQL statement to create a table named JobHistory including columns EmployeeId, StartDate, End_Eate, Job_Id and Department_Id and make sure that the value against column EndDate will be entered at the time of insertion to the format like ‘–/–/—-‘.

Solution:
CREATE TABLE JobHistory(
EmployeeID INT PRIMARY KEY Identity(1,1),
StartDate Date Not null,
EndDate Date Not null,
CONSTRAINT Check_date check (EndDate Like '--/--/----'),
JobID int Not null,
DepartmentId int Not null
)

INSERT INTO JobHistory values ('2021-12-08','2021-05-05',101,1001);


Task3:
Write a SQL statement to create a table named jobs including columns JobId, JobTitle, MinSalary and MaxSalary, and make sure that, the default value for JobTitle is blank and MinSalary is 8000 and MaxSalary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.

Solution:

CREATE TABLE Jobs( 
JOB_ID INT PRIMARY KEY Identity(1,1), 
JOB_TITLE varchar(35) DEFAULT ' ', 
MIN_SALARY decimal(6,0) DEFAULT 8000, 
MAX_SALARY decimal(6,0) DEFAULT NULL
)

INSERT INTO Jobs (MIN_SALARY,MAX_SALARY) values ('minimum',1000,2000),(500,1000)

SELECT* from Jobs

Task4:
Write a SQL statement to create a table employees including columns Employee_Id, FirstName, LastName, Email, PhoneNumber, Hire_Date, Job_Id, Salary, Commission, Manager_Id and Department_Id and make sure that, the Employee_Id column does not contain any duplicate value at the time of insertion, and the foreign key column DepartmentId, reference by the column DepartmentId of Departments table, can contain only those values which are exists in the Department table and another foreign key column JobId, referenced by the column JobId of jobs table, can contain only those values which are exists in the jobs table.


Solution:
CREATE TABLE Employees ( EmployeeID INT PRIMARY KEY Identity(1,1), 
FIRST_NAME varchar(20) NOT NULL, 
LAST_NAME varchar(25) NOT NULL, 
EMAIL varchar(25) NOT NULL, 
PHONE_NUMBER varchar(20) not NULL, 
HIRE_DATE date NOT NULL, 
JOB_ID int NOT NULL, 
SALARY decimal(6,2) Not NULL,
COMMISSION_PER decimal(5,2) Not NULL,
MANAGER_ID int Not NULL, 
DEPARTMENT_ID int Not null, 

CONSTRAINT FK_DEPARTMENT_ID FOREIGN KEY (DEPARTMENT_ID) REFERENCES Departments(DEPARTMENT_ID),
CONSTRAINT FK_JOB_ID FOREIGN KEY (JOB_ID) REFERENCES Jobs(JOB_ID)

)

CREATE TABLE Departments ( DEPARTMENT_ID INT PRIMARY KEY Identity(1,1))

