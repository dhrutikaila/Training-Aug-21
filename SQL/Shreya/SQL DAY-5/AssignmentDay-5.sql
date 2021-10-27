CREATE TABLE Employee
(
EMPLOYEE_ID INT PRIMARY KEY IDENTITY(1,1),
FIRST_NAME VARCHAR(10) NOT NULL ,
LAST_NAME VARCHAR(10) NOT NULL,
SALARY MONEY NOT NULL,
JOINING_DATE DATETIME NOT NULL,
DEPARTMENT VARCHAR(10) NOT NULL,
MANAGER_ID INT 
)

INSERT INTO Employee (FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT,MANAGER_ID)
VALUES
('JOHN','ABRAHAM',1000000,'01-01-2013 12:00:00 ','Banking',NULL )
INSERT INTO Employee (FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT,MANAGER_ID)
VALUES
('MICHEL','CLARKE',800000,'01-01-2013 12:00:00 ','Insuarance',1 ),
('Roy','Thomas',700000,'01-02-2013 12:00:00 ','Banking',1 ),
('Tom','Jose',600000,'01-02-2013 12:00:00 ','Insuarance',2 ),
('Jerry','Pinto',650000,'01-02-2013 12:00:00 ','Insuarance',3 ),
('Philip','Mathew',750000,'01-01-2013 12:00:00 ','Services',3 ),
('Testname1','123',650000,'01-01-2013 12:00:00 ','Services',2 ),
('Testname2','Lname%',600000,'01-02-2013 12:00:00 ','Insuarance',2 )


--ALTER TABLE Employee ALTER COLUMN JOINING_DATE CONVERT(VARCHAR(20),JOINING_DATE,106)

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,
JOINING_DATEE=CONVERT(VARCHAR(20),JOINING_DATE,113),DEPARTMENT,MANAGER_ID
FROM Employee



CREATE TABLE Incentive
(
EMPLOYEE_REF_ID INT CONSTRAINT emp_fk REFERENCES Employee(EMPLOYEE_ID) ON UPDATE CASCADE,
INCENTIVE_DATE DATE NOT NULL,
INCENTIVE_AMOUNT MONEY NOT NULL
)

INSERT INTO Incentive (EMPLOYEE_REF_ID,INCENTIVE_DATE,INCENTIVE_AMOUNT)
VALUES
(1,'01-02-2013',5000),
(2,'01-02-2013',3000),
(3,'01-02-2013',4000)

--Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

SELECT e.FIRST_NAME,e.LAST_NAME,DATEDIFF(DAYOFYEAR,e.JOINING_DATE,i.INCENTIVE_DATE)
FROM Employee AS e JOIN Incentive as i
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID 
 
 --Select first_name, incentive amount from employee and incentives table for those employees
 --who have incentives and incentive amount greater than 3000

 SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT
 FROM Employee AS e JOIN Incentive AS i 
 ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID
 WHERE (i.INCENTIVE_AMOUNT) > 3000 

 --Select first_name, incentive amount from employee and incentives table for all employees 
 --even if they didn’t get incentives.

SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT 
FROM Employee AS e LEFT JOIN Incentive AS i
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID

--Select EmployeeName, ManagerName from the employee table
SELECT * FROM Employee

SELECT  e.FIRST_NAME AS 'Employee Name',m.FIRST_NAME AS 'Manager Name'
FROM Employee e LEFT JOIN Employee AS m
ON e.MANAGER_ID = m.EMPLOYEE_ID



--Select first_name, incentive amount from employee and incentives table for all employees even if they
--didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

SELECT e.FIRST_NAME,ISNULL(i.INCENTIVE_AMOUNT,0)
FROM Employee AS e LEFT JOIN Incentive AS i
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID 