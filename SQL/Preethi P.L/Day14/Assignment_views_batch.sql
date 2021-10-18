-- DAY6 VIEWS ASSIGNMENT

-- 3. Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount

CREATE VIEW employee_view AS 
SELECT e.FIRST_NAME,e.LAST_NAME,e.SALARY,e.JOINING_DATE,i.INCENTIVE_DATE,i.INCENTIVE_AMOUNT FROM employee e
INNER JOIN incentives i
ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID;

-- 4. Create a view to select Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

CREATE VIEW empview AS
SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT FROM employee e
INNER JOIN incentives i 
ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID
WHERE i.INCENTIVE_AMOUNT > 3000;

-- Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London

CREATE VIEW employees_view AS
SELECT e.FirstName,e.LastName,e.JobId,e.DepartmentID,d.DepartmentName FROM employees e 
INNER JOIN departments d
ON e.DepartmentID = d.DepartmentID
INNER JOIN locations l
ON d.LocationID = l.LocationID
WHERE l.City = 'London';

-- Create a View to get the department name and number of employees in the department.

CREATE VIEW dept_view AS
SELECT d.DepartmentName,COUNT(e.EmployeeID) AS No_of_Employees FROM employees e
INNER JOIN departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentID;

-- Write a View to display the department name, manager name, and city.

CREATE VIEW mgr_view AS
SELECT d.DepartmentName,CONCAT(e.FirstName," ",e.LastName) AS ManagerName,l.City FROM employees e
INNER JOIN departments d
ON e.EmployeeID = d.ManagerID
INNER JOIN locations l
ON d.LocationID = l.LocationID;

-- Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.

CREATE VIEW managerview AS
SELECT d.DepartmentName,e.FirstName,e.LastName,e.HireDate,e.Salary,DATEDIFF(CURDATE(),e.HireDate)/365 AS Experiece FROM employees e 
INNER JOIN departments d 
ON e.EmployeeID = d.ManagerID 
WHERE DATEDIFF(CURDATE(),e.HireDate)/365 > 15;



-- BATCH Assignment

-- Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ from employee table

SELECT CASE DEPARTMENT 
		WHEN 'Banking' THEN 'Bank Dept' 
        	WHEN 'Insurance' THEN 'Insurance Dept' 
        	WHEN 'Services' THEN 'Services Dept' 
        	END 
FROM employee;

