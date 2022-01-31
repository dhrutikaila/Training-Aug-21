--Practice-1
--Write a SQL statement to create a table named countries including columns CountryId, CountryName and RegionId and make sure that no countries except Italy, India and China will be entered in the table. and combination of columns CountryId and RegionId will be unique.


CREATE TABLE countries (
COUNTRY_ID VARCHAR(10) NOT NULL UNIQUE DEFAULT '',
COUNTRY_NAME VARCHAR(40) UNIQUE NULL CHECK(COUNTRY_NAME IN('Italy','India','China')),
REGION_ID VARCHAR(2) UNIQUE NOT NULL,
PRIMARY KEY (COUNTRY_ID,REGION_ID)
)

INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES (1, 'India', 5)
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES (2, 'iTALY', 3)


SELECT * FROM countrieS


--Practice-2
--Write a SQL statement to create a table named JobHistory including columns EmployeeId, StartDate, End_Eate, Job_Id and Department_Id and make sure that the value against column EndDate will be entered at the time of insertion to the format like ‘–/–/—-‘.

CREATE TABLE JobHistory(
EmployeeID INT PRIMARY KEY IDENTITY(1,1),
StartDate DATE NOT NULL,
EndDate VARCHAR(10),
CONSTRAINT CHK_DATE CHECK (EndDate LIKE '--/--/----'),
JobID INT NOT NULL,
DepartmentId VARCHAR(15)
)
INSERT INTO JobHistory VALUES ('2019-08-06','08/05/2021', 6, 'CIVIL')

SELECT * from JobHistory


--Practice-3
--Write a SQL statement to create a table named jobs including columns JobId, JobTitle, MinSalary and MaxSalary, and make sure that, the default value for JobTitle is blank and MinSalary is 8000 and MaxSalary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.


CREATE TABLE jobs( 
JOB_ID INT PRIMARY KEY IDENTITY(1,1), 
JOB_TITLE VARCHAR(35) DEFAULT ' ', 
MIN_SALARY DECIMAL(6,0) DEFAULT 8000, 
MAX_SALARY DECIMAL(6,0) DEFAULT NULL
);
INSERT INTO jobs (MIN_SALARY,MAX_SALARY) values (60000,NULL),(1000,2000)
INSERT INTO jobs (JOB_TITLE,MAX_SALARY) VALUES ('Sr_Executive',12000)

SELECT * from jobs


--Practice-4
--Write a SQL statement to create a table employees including columns Employee_Id, FirstName, LastName, Email, PhoneNumber, Hire_Date, Job_Id, Salary, Commission, Manager_Id and Department_Id and make sure that, the Employee_Id column does not contain any duplicate value at the time of insertion, and the foreign key column DepartmentId, reference by the column DepartmentId of Departments table, can contain only those values which are exists in the Department table and another foreign key column JobId, referenced by the column JobId of jobs table, can contain only those values which are exists in the jobs table.


CREATE TABLE employees ( 
	EmployeeID INT PRIMARY KEY Identity(1,1), 
	FIRST_NAME VARCHAR(20) not NULL, 
	LAST_NAME VARCHAR(25) NOT NULL, 
	EMAIL VARCHAR(25) NOT NULL, 
	PHONE_NUMBER VARCHAR(20) not NULL, 
	HIRE_DATE date NOT NULL, 
	JOB_ID INT NOT NULL, 
	SALARY decimal(8,2) NOT NULL,
	COMMISSION_PER decimal(5,2) NOT NULL,
	MANAGER_ID INT NOT NULL, 
	DEPARTMENT_ID INT NOT null, 

	CONSTRAINT FK_DEPARTMENT_ID FOREIGN KEY (DEPARTMENT_ID) REFERENCES departments(DEPARTMENT_ID),
	CONSTRAINT FK_JOB_ID FOREIGN KEY (JOB_ID) REFERENCES jobs(JOB_ID)
);
