-- SQL Day6 SUBQUERY ASSIGNMENT
-- 1. Select employee details from employee table if data exists in incentive table 

SELECT * FROM employee e WHERE EXISTS(SELECT i.EMPLOYEE_REF_ID FROM incentives i WHERE i.EMPLOYEE_REF_ID = e.EMPLOYEE_ID);

-- 2. Find Salary of the employee whose salary is more than Roy Salary 

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY FROM employee WHERE SALARY > (SELECT SALARY FROM employee WHERE FIRST_NAME = 'Roy');

-- 3. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.

SELECT EmployeeID,JobId,DATEDIFF(EndDate,StartDate) AS 'No. of Days' FROM jobhistory WHERE DepartmentID = (SELECT DepartmentID FROM jobhistory WHERE DepartmentID = 90);
				OR

SELECT EmployeeID,JobId,DATEDIFF(EndDate,StartDate) AS 'No. of Days' FROM jobhistory WHERE JobID IN (SELECT JobID FROM jobhistory WHERE DepartmentID = 90);



-- JOIN ASSIGNMENT USING SUBQUERIES

-- 1. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

SELECT DATEDIFF(i.INCENTIVE_DATE,e.JOINING_DATE) AS DateDiff FROM employee e,incentives i WHERE e.EMPLOYEE_ID IN (SELECT EMPLOYEE_REF_ID FROM employee);

-- 2. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000 

SELECT e.FIRST_NAME, i.INCENTIVE_AMOUNT FROM employee e,incentives i WHERE e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID AND e.EMPLOYEE_ID IN(SELECT i.EMPLOYEE_REF_ID FROM incentives WHERE i.INCENTIVE_AMOUNT > 3000);


-- 4. Select EmployeeName, ManagerName from the employee table. 

SELECT CONCAT(e1.FIRST_NAME," ",e1.LAST_NAME) AS EmpName, CONCAT(e2.FIRST_NAME," ",e2.LAST_NAME) AS MgrName FROM employee e1, employee e2 WHERE e1.MANAGER_ID IN(SELECT e2.EMPLOYEE_ID FROM employee);




