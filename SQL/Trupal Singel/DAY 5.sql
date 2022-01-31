
CREATE TABLE Incentives(
EMPLOYEE_REF_ID INT PRIMARY KEY,
INCENTIVE_DATE DATE NOT NULL,
INCENTIVE_AMOUNT NUMERIC(20) NOT NULL
)

SELECT * FROM Incentives
SELECT * FROM Employe

SELECT FORMAT(GETDATE(),'dd - MMM - yyyy') from Incentives

INSERT INTO Incentives
VALUES (1,'1 FEB 2013',5000),
(2,'1 FEB 2013',3000),
(3,'1 FEB 2013',4000)

DELETE FROM Incentives

SELECT a.FirstName,b.INCENTIVE_DATE, a.Hiredate, DATEDIFF(MONTH, a.HireDate, b.INCENTIVE_DATE) 
FROM Employees a JOIN Incentives b ON a.EmployeeID = b.EMPLOYEE_REF_ID

--SELECT FirstName, CONVERT(VARCHAR(10), HireDate)- CONVERT(VARCHAR(10),INCENTIVE_DATE) FROM Employees a JOIN Incentives b ON a.EmployeeID  = b.EMPLOYEE_REF_ID

CREATE TABLE Employe(
EMPLOYEE_ID INT PRIMARY KEY IDENTITY(1,1),
FIRST_NAME VARCHAR(10) NOT NULL ,
LAST_NAME VARCHAR(10) NOT NULL,
SALARY MONEY NOT NULL,
JOINING_DATE DATETIME NOT NULL,
DEPARTMENT VARCHAR(10) NOT NULL,
MANAGER_ID INT )

INSERT INTO Employe (FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT, MANAGER_ID)
VALUES ('John', 'Abraham', 1000000, '2013-01-01 00:00:00', 'Banking', NULL),
('Michael', 'Clarke', 8000000, '2013-01-01 00:00:00', 'Insurance', 1),
('Roy', 'Thomas', 7000000, '2013-02-01 00:00:00', 'Banking', 1),
('Tom', 'Jose', 6000000, '2013-02-01 00:00:00', 'Insurance', 2),
('Jerry', 'Pinto', 6500000, '2013-02-01 00:00:00', 'Insurance', 3),
('Philip', 'Mathew', 7500000, '2013-01-01 00:00:00', 'Services', 3),
('TestName1', '123', 6500000, '2013-01-01 00:00:00', 'Services', 2),
('TestName2', 'Lname%', 6000000, '2013-02-01 00:00:00', 'Insurance', 2)


/* 1. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table. */


SELECT e.Employee_ID, DIFF_IN_MONTHS=DATEDIFF(MM, e.joining_date, i.incentive_date) from Employe e join Incentives i
on e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID

--***************** OR ***************--

SELECT a.FIRST_NAME,
convert(varchar(5), DATEPART(MONTH,INCENTIVE_DATE) - DATEPART(MONTH,JOINING_DATE)) +' months'+' ' + convert(VARCHAR(5),
DATEPART(YEAR,INCENTIVE_DATE) - DATEPART(year,JOINING_DATE))+ ' yEARS' AS 'YEARSANDMONTH'
FROM Employe A JOIN Incentives b ON a.EMPLOYEE_ID = b.EMPLOYEE_REF_ID


/* 2. Select first_name, incentive amount from employee and incentives table for those employees 
who have incentives and incentive amount greater than 3000 */ 

Select FIRST_NAME,INCENTIVE_AMOUNT from Employe a join incentives B 
on A.EMPLOYEE_ID = B.EMPLOYEE_REF_ID and INCENTIVE_AMOUNT > 3000

/* 3.	Select first_name, incentive amount from employee and incentives table for all employees 
even if they didn’t get incentives. */

SELECT FIRST_NAME,INCENTIVE_AMOUNT FROM Employe a LEFT JOIN incentives B 
ON A.EMPLOYEE_ID = B.EMPLOYEE_REF_ID

/* 4. Select EmployeeName, ManagerName from the employee table. */

SELECT a.FIRST_NAME AS Employee_Name, b.FIRST_NAME AS manager_name
FROM   employe a
JOIN   employe b ON a.manager_id = b.employee_id

SELECT * FROM Employe 

/* Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives 
and set incentive amount as 0 for those employees who didn’t get incentives. */

SELECT FIRST_NAME, ISNULL(INCENTIVE_AMOUNT,0) FROM Employe a LEFT JOIN incentives B 
ON A.EMPLOYEE_ID = B.EMPLOYEE_REF_ID 