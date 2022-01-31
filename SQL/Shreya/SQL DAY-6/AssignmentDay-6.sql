--Select employee details from employee table if data exists in incentive table 
select * from Employee
SELECT * FROM Incentive

SELECT * FROM Employee WHERE EMPLOYEE_ID IN(
SELECT EMPLOYEE_REF_ID  FROM Incentive)

--Find Salary of the employee whose salary is more than Roy Salary

SELECT FIRST_NAME+' '+LAST_NAME 'name', Salary FROM Employee WHERE Salary > ALL
(SELECT Salary FROM Employee WHERE FIRST_NAME = 'Roy')

--Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount
CREATE VIEW vEmpDetail
AS
SELECT e.FIRST_NAME,e.LAST_NAME,e.SALARY,e.JOINING_DATE,i.INCENTIVE_DATE,i.INCENTIVE_AMOUNT 
FROM Employee e, Incentive i

select * from vEmpDetail

	
--Create a view to select Select first_name, incentive amount from employee and incentives
--table for those employees who have incentives and incentive amount greater than 3000

CREATE VIEW vEmpIncentiveDetail
AS
SELECT e.FIRST_NAME,e.LAST_NAME,i.INCENTIVE_AMOUNT FROM Employee e
JOIN Incentive i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID
WHERE i.INCENTIVE_AMOUNT > 3000

select * from vEmpIncentiveDetail

