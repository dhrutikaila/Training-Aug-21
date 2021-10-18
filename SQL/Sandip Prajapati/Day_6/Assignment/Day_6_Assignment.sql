-------------DAY-6-------------
CREATE TABLE Locations
(
   LocationID decimal(4,0) NOT NULL DEFAULT '0',
   StreetAddress varchar(40) DEFAULT NULL,
   PostalCode varchar(12) DEFAULT NULL,
   City varchar(30) NOT NULL,
   StateProvince varchar(25) DEFAULT NULL,
   CountryID varchar(2) DEFAULT NULL,
  PRIMARY KEY (LocationID),
 
)

INSERT INTO Locations  VALUES
('1000', '1297 Via Cola di Rie', '989', 'Roma', '', 'IT'),
('1100', '93091 Calle della Testa', '10934', 'Venice', '', 'IT'),
('1200', '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP'),
('1300', '9450 Kamiya-cho', '6823', 'Hiroshima', '', 'JP'),
('1400', '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'),
('1500', '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US'),
('1600', '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US'),
('1700', '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US'),
('1800', '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA'),
('1900', '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA'),
('2000', '40-5-12 Laogianggen', '190518', 'Beijing', '', 'CN'),
('2100', '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN'),
('2200', '12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU'),
('2300', '198 Clementi North', '540198', 'Singapore', '', 'SG'),
('2400', '8204 Arthur St', '', 'London', '', 'UK'),
('2500', '"Magdalen Centre', ' The Oxford ', 'OX9 9ZB', 'Oxford', 'Ox'),
('2600', '9702 Chester Road', '9629850293', 'Stretford', 'Manchester', 'UK'),
('2700', 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE'),
('2800', 'Rua Frei Caneca 1360', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR'),
('2900', '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH'),
('3000', 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH'),
('3100', 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL'),
('3200', 'Mariano Escobedo 9991', '11932', 'Mexico City', '"Distrito Federal', '"');

SELECT * FROM Locations
DROP TABLE JobHistory


CREATE TABLE  JobHistory (
   EmployeeID decimal(6,0) NOT NULL,
   StartDate date NOT NULL,
   EndDate date NOT NULL,
   JobID varchar(10) NOT NULL,
   DepartmentID decimal(4,0) DEFAULT NULL,
   PRIMARY KEY (EmployeeID,StartDate),

) 
INSERT INTO  JobHistory VALUES
('102', '1993-01-13', '1998-07-24', 'IT_PROG', '60'),
('101', '1989-09-21', '1993-10-27', 'AC_ACCOUNT', '110'),
('101', '1993-10-28', '1997-03-15', 'AC_MGR', '110'),
('201', '1996-02-17', '1999-12-19', 'MK_REP', '20'),
('114', '1998-03-24', '1999-12-31', 'ST_CLERK', '50'),
('122', '1999-01-01', '1999-12-31', 'ST_CLERK', '50'),
('200', '1987-09-17', '1993-06-17', 'AD_ASST', '90'),
('176', '1998-03-24', '1998-12-31', 'SA_REP', '80'),
('191', '1999-01-01', '1999-12-31', 'SA_MAN', '80')

select * from JobHistory
--------ASSIGNMENT--------
--Select employee details from employee table if data exists in incentive table ?
SELECT * FROM Employees
WHERE EXISTS (SELECT * FROM INCEPTIVE_TABLE)

--Find Salary of the employee whose salary is more than Roy Salary
SELECT * FROM Employees
WHERE FirstName='Roy'

SELECT * FROM Employees ORDER BY FirstName

UPDATE Employees
SET FirstName = 'Roy'
WHERE EmployeeID ='191'

SELECT * FROM Employees
WHERE Salary>(SELECT Salary FROM Employees WHERE FirstName='Roy')

--Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount
CREATE VIEW EMPINC
AS
SELECT FirstName,LastName,Salary,HireDate,INCEPTIVE_DATE,INCEPTIVE_SALARY  FROM Employees AS EMP JOIN INCEPTIVE_TABLE AS INC
ON EMP.EmployeeID = INC.EmployeeID;

SELECT * FROM EMPINC;

--Create a view to select Select first_name, incentive amount from employee and incentives table 
--for those employees who have incentives and incentive amount greater than 3000
CREATE VIEW EMPINC1
AS
SELECT FirstName,INCEPTIVE_SALARY FROM Employees EMP JOIN INCEPTIVE_TABLE AS INC
ON EMP.EmployeeID = INC.EmployeeID
WHERE INCEPTIVE_SALARY>3000 AND INCEPTIVE_SALARY IS NOT NULL;

SELECT * FROM EMPINC1;

--Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London
SELECT * FROM Employees;
SELECT * FROM Jobs;
SELECT * FROM Departments;

CREATE VIEW EMPWORK
AS
SELECT (FirstName+' '+LastName)NAME,JobId,DEP.DepartmentID,DEP.DepartmentName 
FROM ((Employees AS EMP JOIN Departments AS DEP ON EMP.DepartmentID=DEP.DepartmentID)
JOIN Locations AS LOC ON DEP.LocationID = LOC.LocationID)
WHERE LOC.City = 'LONDON';

SELECT * FROM EMPWORK

--Create a View to get the department name and number of employees in the department.
CREATE VIEW DEPEMP
AS
SELECT DepartmentName,COUNT(EmployeeID) as NUMBER_OF_EMPLOYEES FROM Departments AS DEP JOIN Employees AS EMP ON DEP.DepartmentID = EMP.DepartmentID
GROUP BY DepartmentName;

--Find the employee ID, job title, number of days between ending date and starting date 
--for all jobs in department 90 from job history.
SELECT EmployeeID,JobTitle,DATEDIFF(DAY,StartDate,EndDate) AS DAY_DIFF FROM JobHistory AS JBH JOIN Jobs AS JB
ON JBH.EmployeeID = JB.JobId
WHERE DepartmentID = '90';

--Write a View to display the department name, manager name, and city.
CREATE VIEW MANGINFO
AS
SELECT DepartmentName,(FirstName+' '+LastName)AS ManagerName,City  FROM( (Employees AS EMP JOIN Departments AS DEP ON EMP.EmployeeID=DEP.ManagerID) 
JOIN Locations AS LOC ON DEP.LocationID=LOC.LocationID);

SELECT * FROM MANGINFO;

--Create a View to display department name, name (first_name, last_name), hire date, salary of the manager 
--for all managers whose experience is more than 15 years.
CREATE VIEW MANGINFO1
AS
SELECT DepartmentName,(FirstName+' '+LastName)NAME,HireDate,Salary FROM Departments AS DEP JOIN Employees AS EMP ON DEP.ManagerID = EMP.EmployeeID
WHERE DATEDIFF(YEAR,HireDate,SYSDATETIME())>15;

SELECT * FROM MANGINFO1;

----------------SUPPORTED-TASK----------------
-----------SUBQUERY
--1. Write a query to find the names (first_name, last_name) and
--salaries of the employees who have higher salary than the employee whose last_name='Bull'. 
