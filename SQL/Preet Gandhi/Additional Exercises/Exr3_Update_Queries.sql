USE Additional_Practice

CREATE TABLE Employees (
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
	CONSTRAINT ukEmail UNIQUE (Email),
)


ALTER TABLE Employees DROP CONSTRAINT ukEmail
--1)Write a SQL statement to change the Email column of Employees table with 'not available' for all employees.
UPDATE Employees SET Email = 'Not Available'

--2)Write a SQL statement to change the Email and CommissionPct column of employees table with 'not available' and 0.10 for all employees.
UPDATE Employees SET Email = 'Not Available' , CommissionPct = 0.10

--3)Write a SQL statement to change the Email and CommissionPct column of employees table with 'not available' and 0.10 for those employees whose DepartmentID is 110.
UPDATE Employees SET Email = 'Not Avilable' , CommissionPct = 0.10 WHERE DepartmentID = 110

--4)Write a SQL statement to change the Email column of employees table with 'not available' for those employees whose DepartmentID is 80 and gets a commission is less than 20%
UPDATE Employees SET Email = 'Not Available' WHERE DepartmentID = 80 AND CommissionPct<0.20

--5)Write a SQL statement to change the Email column of employees table with 'not available' for those employees who belongs to the 'Accouning' department.
UPDATE Employees SET Email='Not Available' WHERE JobID LIKE '%ACCOUNT'

--6)Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000.
UPDATE Employees SET Salary = 8000 WHERE EmployeeID = 105 AND Salary < 5000

--7)Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to department, which ID is 30 and the existing job ID does not start with SH.
UPDATE Employees SET JobID = 'SH_CLERK' WHERE EmployeeID = 118 AND DepartmentID = 30 AND JobID NOT LIKE 'SH%'

--8)Write a SQL statement to increase the salary of employees under the department 40, 90 and
--  110 according to the company rules that, salary will be increased by 25% for the department 40, 
--  15% for department 90 and 10% for the department 110 and the rest of the departments will remain same.
UPDATE Employees SET Salary += (Salary*0.25) WHERE DepartmentID = 40
UPDATE Employees SET Salary += (Salary*0.15) WHERE DepartmentID = 90
UPDATE Employees SET Salary += (salary*0.10) WHERE DepartmentID = 110

--9)Write a SQL statement to increase the minimum and maximum salary of PU_CLERK by 2000 as well as the salary for those employees by 20% and commission by 10% .
UPDATE Employees SET Salary += (Salary*0.20) , CommissionPct += (CommissionPct*0.10) WHERE JobID = 'PU_CLERK'


SELECT * FROM Employees