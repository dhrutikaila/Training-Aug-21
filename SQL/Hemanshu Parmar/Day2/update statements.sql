-------------------------------------------------------------Update statements------------------------------------------------------------------

Task1:
Write a SQL statement to change the Email column of Employees table with ‘not available’ for all employees.

Soln:
ALTER TABLE Employees DROP CONSTRAINT ukEmail
UPDATE Employees set Email='not available'

--For Adding multiple unique constraint later on..."ADD CONSTRAINT CONST_NAME UNIQUE (col1,col2...)"
--ALTER TABLE Employees ADD CONSTRAINT unq_name UNIQUE (Email,phone number,..)

Task2:
Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for all employees.

Soln:
UPDATE Employees set Email='not available',CommissionPct=0.10

Task3:
Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for those employees whose DepartmentID is 110.

Soln:
UPDATE Employees set Email='not available',CommissionPct=0.10 where DepartmentID=110

Task4:
Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees whose DepartmentID is 80 and gets a commission is less than 20%

Soln:
UPDATE Employees set Email='not available' where DepartmentID=80 AND CommissionPct<0.20

Task5:
Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees who belongs to the ‘Accouning’ department.

Soln:
UPDATE Employees set Email='not available'
FROM Employees as Emp join Departments as Dept
ON Emp.DepartmentID = Dept.DepartmentID
 where Dept.DepartmentName='Accounting'

Task6:
Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000.

--Note:CASE , WHEN (CONDITION) THEN(STATEMENT) ,ELSE (DEFAULT)...END

Soln:
UPDATE Employees set Salary =
(CASE
When Salary<5000 then 8000
ELSE Salary
END)
Where EmployeeID=105

Task7:
Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to department, which ID is 30 and the existing job ID does not start with SH.

Soln:
UPDATE Employees set JobId='SH_CLERK' where EmployeeID=118 AND DepartmentID=30 AND JobId!='SH%'

Task8:
Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that, salary will be increased by 25% for the department 40, 15% for department 90 and 10% for the department 110 and the rest of the departments will remain same.

Soln:
UPDATE Employees 
	set Salary = 
		CASE
		when DepartmentID=40 
			then Salary+((0.25*Salary))
		when DepartmentID=90
			then (Salary+(0.15*Salary))
		when DepartmentID=110
			then (Salary+(0.10*Salary))
		ELSE 
			Salary
		END


