USE JOIN


QUERY 1

--SELECT employee details FROM employee table if data exists in incentive table ?

SELECT * FROM Employee E join Incentives I ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID

QUERY 2

--Find Salary of the employee whose salary is more than Roy Salary

SELECT FIRST_NAME FROM Employee WHERE Salary>(SELECT Salary FROM Employee WHERE FIRST_NAME='Roy')

Query 3

--Create a view to SELECT FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount

CREATE VIEW Details
AS
(SELECT FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,
(SELECT INCENTIVE_DATE  FROM Incentives WHERE EMPLOYEE_REF_ID=e.EMPLOYEE_ID) AS IncentiveDate,
(SELECT INCENTIVE_AMOUNT  FROM Incentives WHERE EMPLOYEE_REF_ID=e.EMPLOYEE_ID) AS IncentiveAmount
FROM Employee e)

Query 4

--Create a view to SELECT SELECT first_name, incentive amount FROM employee and incentives table for those employees who have incentives and incentive amount greater than 3000

CREATE VIEW NAME_AMOUNT 
AS
(SELECT FIRST_NAME,INCENTIVE_AMOUNT FROM Employee e JOIN Incentives i
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID
WHERE i.INCENTIVE_AMOUNT>3000)

