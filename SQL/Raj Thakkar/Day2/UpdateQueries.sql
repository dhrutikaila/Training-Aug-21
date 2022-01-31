--Write a SQL statement to change the Email column of Employees table with �not available� for all employees.
UPDATE Employees 
SET Email='not available'

--Write a SQL statement to change the Email and CommissionPct column of employees table with �not available� and 0.10 for all employees.
UPDATE Employees 
SET Email='not available', CommissionPct=0.10

--Write a SQL statement to change the Email and CommissionPct column of employees table with �not available� and 0.10 for those employees whose DepartmentID is 110.
UPDATE Employees 
SET Email='not available', CommissionPct=0.10 
WHERE DepartmentID=110

--Write a SQL statement to change the Email column of employees table with �not available� for those employees whose DepartmentID is 80 and gets a commission is less than 20%
UPDATE Employees
SET Email='not available' 
WHERE DepartmentID=80 AND CommissionPct<0.20

--Write a SQL statement to change the Email column of employees table with �not available� for those employees who belongs to the �Accouning� department.
UPDATE Employees 
SET Email='not available' 
FROM Employees E JOIN Departments D 
ON d.DepartmentID=e.DepartmentID 
WHERE D.DepartmentName='Accounting'

--Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000.
UPDATE Employees 
SET Salary = 8000
WHERE EmployeeID=105 AND Salary<5000

--Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to department, which ID is 30 and the existing job ID does not start with SH.
UPDATE Employees 
SET JobId='SH_CLERK' 
WHERE EmployeeID=118 AND DepartmentID=30 AND JobId<>'SH%'

--Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that, salary will be increased by 25% for the department 40, 15% for department 90 and 10% for the department 110 and the rest of the departments will remain same.
UPDATE Employees 
SET Salary = CASE 
WHEN DepartmentID=40 THEN Salary+(Salary*0.25) 
WHEN DepartmentID=90 THEN Salary+(Salary*0.15) 
WHEN DepartmentID=110 THEN Salary+(Salary*0.10) 
ELSE Salary 
END