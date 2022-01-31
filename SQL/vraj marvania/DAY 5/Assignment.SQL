--Assignment:


CREATE TABLE Employee(
EMPLOYEE_ID  INT CONSTRAINT PK_EMPLOYEE_ID PRIMARY KEY NOT NULL,
FIRST_NAME  VARCHAR(50),
LAST_NAME VARCHAR(50),
SALARY MONEY,
JOINING_DATE DATETIME,
DEPARTMENT VARCHAR(50),
MANAGER_ID INT ,
)


INSERT INTO Employee VALUES
(1,'John','Abraham',1000000,'01-JAN-13 12:00:00 AM','Banking',NULL),
(2,'Michael','Clarke',800000,'01-JAN-13 12:00:00 AM','Insurance',1),
(3,	'Roy'	,'Thomas',700000,'01-FEB-13 12:00:00 AM','Banking',1),
(4,	'Tom'	,'Jose'	,600000,'01-FEB-13 12:00:00 AM','Insurance',2),
(5,	'Jerry'	,'Pinto'	,650000,'01-FEB-13 12:00:00 AM','Insurance',3),
(6,	'Philip'	,'Mathew'	,750000,'01-JAN-13 12:00:00 AM','Services',3),
(7,	'TestName1'	,'123'	,650000,'01-JAN-13 12:00:00 AM','Services',2),
(8,	'TestName2'	,'Lname%'	,600000,'01-FEB-13 12:00:00 AM','Insurance',2)




CREATE TABLE Incentives
(
EMPLOYEE_REF_ID  int CONSTRAINT fk_EMPLOYEE_REF_ID foreign key  REFERENCES  Employee(EMPLOYEE_ID),
INCENTIVE_DATE	DATE ,
INCENTIVE_AMOUNT MONEY
)

INSERT INTO  Incentives VALUES(1,'01-FEB-13',5000),
(2,'01-FEB-13',3000),
(3,'01-FEB-13',4000),



SELECT * FROM Incentives
SELECT * FROM Employee
--________________________________________________________________________________________________

--1.Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

        SELECT DATEDIFF(DAY,E.JOINING_DATE,I.INCENTIVE_DATE) AS DATEDIFF_IN_DAY 
        FROM Employee E  INNER JOIN  Incentives I ON I.EMPLOYEE_REF_ID = E.EMPLOYEE_ID


/*2.Select first_name, incentive amount from employee and incentives 
    table for those employees who have incentives and incentive amount
    greater than 3000*/



        SELECT E.FIRST_NAME ,I.INCENTIVE_AMOUNT FROM Employee E 
        INNER JOIN Incentives I ON I.EMPLOYEE_REF_ID = E.EMPLOYEE_ID
        WHERE I.INCENTIVE_AMOUNT>3000


/*3. Select first_name, incentive amount from employee
     and incentives table for all employees even if they didn’t get incentives.*/

        SELECT  E.FIRST_NAME ,I.INCENTIVE_AMOUNT 
        FROM Employee E 
        LEFT OUTER JOIN Incentives I ON I.EMPLOYEE_REF_ID = E.EMPLOYEE_ID
 
-- 4. Select EmployeeName, ManagerName from the employee table.


        SELECT I.FIRST_NAME AS EmployeeName ,E.FIRST_NAME AS ManagerName 
        FROM Employee E ,Employee i  WHERE E.EMPLOYEE_ID=I.MANAGER_ID
        SELECT * FROM Employee

/* 5. Select first_name, incentive amount from employee and incentives
    table for all employees even if they didn’t get incentives and set
    incentive amount as 0 for those employees who didn’t get incentives.*/
 
 
        SELECT  E.FIRST_NAME , ISNULL(I.INCENTIVE_AMOUNT,0) 
        FROM Employee E 
        LEFT OUTER JOIN Incentives I ON I.EMPLOYEE_REF_ID = E.EMPLOYEE_ID
