-- Q1 Write a SQL statement to change the Email column of Employees table with ‘not available’ for all employees.
ALTER TABLE dbo.Employees DROP CONSTRAINT ukEmail
UPDATE dbo.Employees 
SET Email = 'Not Available'


-- Q2 Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for all employees.

UPDATE dbo.Employees 
SET Email = 'Not Available', CommissionPct = 0.10


-- Q3 Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for those employees whose DepartmentID is 110.

UPDATE dbo.Employees 
SET Email = 'Not Available', CommissionPct = 0.10
WHERE DepartmentID = 110


-- Q4 Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees whose DepartmentID is 80 and gets a commission is less than 20%

UPDATE dbo.Employees 
SET Email = 'Not Available'
WHERE DepartmentID = 80 AND CommissionPct<0.2


-- Q5 Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees who belongs to the ‘Accouning’ department.

UPDATE dbo.Employees 
SET Email = 'Not Available'
WHERE JobId = 'FI_ACCOUNT'


-- Q6 Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000.

UPDATE dbo.Employees 
SET Salary = 8000
WHERE EmployeeID = 105 AND Salary<5000


-- Q7 Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to department, which ID is 30 and the existing job ID does not start with SH.

UPDATE dbo.Employees 
SET JobId = 'SH_CLERK'
WHERE EmployeeID = 118 AND DepartmentID = 30 AND JobId NOT LIKE 'SH%'


/* Q8 Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that, salary will be increased by 25% for the department 40, 15% for department 90 and 
10% for the department 110 and the rest of the departments will remain same. */

UPDATE dbo.Employees 
SET Salary = CASE DepartmentID
				 WHEN 40 THEN Salary+(Salary*.25) 
				 WHEN 90 THEN Salary+(Salary*.15)
				 WHEN 110 THEN Salary+(Salary*.10)
				 ELSE Salary
			 END


-- Q9 Write a SQL statement to increase the minimum and maximum salary of PU_CLERK by 2000 as well as the salary for those employees by 20% and commission by 10% .

UPDATE dbo.Employees
SET Salary = Salary + (Salary*0.20), CommissionPct = CommissionPct + 0.10
WHERE JobId = 'PU_CLERK