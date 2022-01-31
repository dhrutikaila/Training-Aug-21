
CREATE TABLE Countries (
  CountryID varchar(2) NOT NULL,
  CountryName varchar(40) DEFAULT NULL,
  RegionID decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (CountryID)

) 


CREATE TABLE Country_new (
  CountryID varchar(2) NOT NULL,
  CountryName varchar(40) DEFAULT NULL,
  RegionID decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (CountryID)

) 

INSERT INTO countries  VALUES
('AR', 'Argentina', '2'),
('AU', 'Australia', '3'),
('BE', 'Belgium', '1'),
('BR', 'Brazil', '2'),
('CA', 'Canada', '2'),
('CH', 'Switzerland', '1'),
('CN', 'China', '3'),
('DE', 'Germany', '1'),
('DK', 'Denmark', '1'),
('EG', 'Egypt', '4'),
('FR', 'France', '1'),
('HK', 'HongKong', '3'),
('IL', 'Israel', '4'),
('IN', 'India', '3'),
('IT', 'Italy', '1'),
('JP', 'Japan', '3'),
('KW', 'Kuwait', '4'),
('MX', 'Mexico', '2'),
('NG', 'Nigeria', '4'),
('NL', 'Netherlands', '1'),
('SG', 'Singapore', '3'),
('UK', 'United Kingdom', '1'),
('US', 'United States of America', '2'),
('ZM', 'Zambia', '4'),
('ZW', 'Zimbabwe', '4');


INSERT INTO Country_new  VALUES
('AR', 'Argentina', '2'),
('EE', 'Australium', '3'),
('GG', 'Belgeria', '1')

SELECT * from Countries
SELECT * from Country_new


--1
INSERT INTO countries  VALUES
('IND', 'India', '4')

--2
INSERT INTO countries  VALUES
('SW', 'Switzerland','')

--3
INSERT INTO countries  VALUES
('AA', 'ACountry', '2'),
('BB', 'BCountry', '3'),
('CC', 'CCountry', '1')

--4
INSERT INTO Countries SELECT * from Country_new as CN
 WHERE CN.CountryID NOT IN (SELECT CountryID FROM Countries)
 
 --5
 DROP table Country_new
 
 CREATE TABLE Country_new (
  CountryID varchar(0) NOT NULL,
  CountryName varchar(40) DEFAULT NULL,
  RegionID decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (CountryID)
) 
 INSERT INTO countries  VALUES
('C0001', 'INDIA', '1001'),
('C0002', 'USA', '1007'),
('C0003', 'UK', '1003')

SELECT * from Country_new

-----------------------------------------------------------------------------------------------------------
CREATE TABLE  Employees (
    EmployeeID decimal(6,0) NOT NULL DEFAULT '0',
	FirstName varchar(20) DEFAULT NULL,
	LastName varchar(25) NOT NULL,
	Email varchar(25) NOT NULL,
	PhoneNumber varchar(20) DEFAULT NULL,
	HireDate date NOT NULL,
	JobId varchar(10) NOT NULL,
	Salary decimal(8,2) DEFAULT NULL,
	CommissionPct decimal(2,2) DEFAULT NULL,
	ManagerID decimal(6,0) DEFAULT NULL,
	DepartmentID decimal(4,0) DEFAULT NULL,
	CONSTRAINT pkEmployeeID PRIMARY KEY (EmployeeID),
	CONSTRAINT ukEmail UNIQUE  (Email)
	
 )
 
 CREATE TABLE  JobHistory (
   EmployeeID decimal(6,0) NOT NULL,
   StartDate date NOT NULL,
   EndDate date NOT NULL,
   JobID varchar(10) NOT NULL,
   DepartmentID decimal(4,0) DEFAULT NULL,
   PRIMARY KEY (EmployeeID,StartDate)

) 

INSERT INTO  JobHistory VALUES
('102', '1993-01-13', '1998-07-24', 'PROG', '60'),
('101', '1989-09-21', '1993-10-27', 'AC_ACCOUNT', '110'),
('101', '1993-10-28', '1997-03-15', 'AC_MGR', '110'),
('201', '1996-02-17', '1999-12-19', 'MK_REP', '20'),
('114', '1998-03-24', '1999-12-31', 'ST_CLERK', '50'),
('122', '1999-01-01', '1999-12-31', 'ST_CLERK', '50'),
('200', '1987-09-17', '1993-06-17', 'AD_ASST', '90'),
('176', '1998-03-24', '1998-12-31', 'SA_REP', '80'),
('176', '1999-01-01', '1999-12-31', 'SA_MAN', '80')
 
 
 CREATE TABLE  Jobs (
   EmployeeID decimal(6,0) NOT NULL,
   StartDate date NOT NULL,
   EndDate date NOT NULL,
   JobID varchar(10) NOT NULL,
   DepartmentID decimal(4,0) DEFAULT NULL,
   PRIMARY KEY (EmployeeID,StartDate)

) 

INSERT INTO  Jobs VALUES
('112', '1993-01-18', '1998-07-24', 'PROG', '60'),
('144', '1989-09-28', '1993-10-27', 'ACCOUNT', '90'),
('191', '1993-10-21', '1997-03-15', 'MGR', '110')


CREATE TABLE Departments (
   DepartmentID decimal(4,0) NOT NULL DEFAULT '0',
   DepartmentName varchar(30) NOT NULL,
   ManagerID decimal(6,0) DEFAULT NULL,
   LocationID decimal(4,0) DEFAULT NULL,
	PRIMARY KEY (DepartmentID)
 )

 INSERT INTO Departments  VALUES
('10', 'Administration', '200', '1700'),
('20', 'Marketing', '201', '1800'),
('30', 'Purchasing', '114', '1700'),
('40', 'Human Resources', '203', '2400'),
('50', 'Shipping', '121', '1500'),
('60', 'IT', '103', '1400'),
('70', 'Public Relations', '204', '2700'),
('80', 'Sales', '145', '2500'),
('90', 'Executive', '100', '1700'),
('100', 'Finance', '108', '1700'),
('110', 'Accounting', '205', '1700'),
('120', 'Treasury', '0', '1700'),
('130', 'Corporate Tax', '0', '1700'),
('140', 'Control And Credit', '0', '1700'),
('150', 'Shareholder Services', '0', '1700'),
('160', 'Benefits', '0', '1700'),
('170', 'Manufacturing', '0', '1700'),
('180', 'Construction', '0', '1700'),
('190', 'Contracting', '0', '1700'),
('200', 'Operations', '0', '1700'),
('210', 'IT Support', '0', '1700'),
('220', 'NOC', '0', '1700'),
('230', 'IT Helpdesk', '0', '1700'),
('240', 'Government Sales', '0', '1700'),
('250', 'Retail Sales', '0', '1700'),
('260', 'Recruiting', '0', '1700'),
('270', 'Payroll', '0', '1700')


 SELECT * FROM Employees
 SELECT * FROM Jobs
 SELECT * FROM JobHistory
 SELECT * FROM Departments
 --1
 ALTER TABLE Employees ADD UNIQUE (JobId)
 
 --2
 ALTER TABLE Countries ADD CONSTRAINT  UC_country UNIQUE (CountryID,RegionID)
 
 --3
 CREATE TABLE New_countries ( 
COUNTRY_ID int IDENTITY(1,1) PRIMARY KEY ,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID int NOT NULL
)
DROP table New_countries
INSERT INTO New_countries(COUNTRY_NAME,REGION_ID) VALUES('India',111);
INSERT INTO New_countries(COUNTRY_NAME,REGION_ID) VALUES('Iran',121);
SELECT * FROM New_countries

--4
CREATE TABLE New_countries ( 
COUNTRY_ID int IDENTITY(1,1) PRIMARY KEY ,
COUNTRY_NAME varchar(40) DEFAULT 'N/A',
REGION_ID int NOT NULL
)
INSERT INTO New_countries(COUNTRY_NAME,REGION_ID) VALUES(111);

--5
SELECT * FROM JobHistory WHERE EXISTS (SELECT JobId FROM Jobs WHERE JobHistory.JobID=Jobs.JobID)

--6
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

CONSTRAINT Fk_DEPARTMENT_ID FOREIGN KEY (DEPARTMENT_ID) REFERENCES Departments(DEPARTMENT_ID),
CONSTRAINT FK_JOB_ID FOREIGN KEY (JOB_ID) REFERENCES Jobs(JOB_ID)

)
CREATE TABLE Departments (
   DepartmentID decimal(4,0) NOT NULL DEFAULT '0',
   DepartmentName varchar(30) NOT NULL,
   ManagerID decimal(6,0) NOT NULL,
   LocationID decimal(4,0) NOT NULL,
	PRIMARY KEY (DepartmentID)
 )
  ALTER TABLE Departments ADD CONSTRAINT  UC_country UNIQUE (DEPARTMENT_ID,MANAGER_ID)



