-- 1. Select employee details from employee table if data exists in incentive table ?
Select * from EMPLOYEE where EMPLOYEE_ID in (select EMPLOYEE_REF_ID from Incentives)


-- 2. Find Salary of the employee whose salary is more than Roy Salary
SELECT * FROM Employee
WHERE SALARY > (SELECT SALARY FROM Employee WHERE FIRST_NAME = 'ROY')


-- 3. Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount
Select FIRST_NAME, LAST_NAME, Salary, JOINING_DATE,i.INCENTIVE_DATE ,i.INCENTIVE_AMOUNT 
from EMPLOYEE e join Incentives i on e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID


-- 4. Create a view to select Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
CREATE VIEW High_Inc_Emp
AS
SELECT E.FIRST_NAME , I.INCENTIVE_AMOUNT FROM Employee AS E
JOIN Incentive AS I
ON E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID
WHERE I.INCENTIVE_AMOUNT > 3000


  