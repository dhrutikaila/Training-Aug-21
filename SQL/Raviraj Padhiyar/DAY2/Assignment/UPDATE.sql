--q1

--Write a SQL statement to change the Email column of Employees table with ‘not available’ for all employees.
ALTER TABLE Emplyees
DROP CONSTRAINT ukEmail

UPDATE Employees
SET Email = 'not available'

SELECT * FROM Employees

--q2
--Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for all employees.

ALTER TABLE Emplyees
DROP CONSTRAINT ukEmail

UPDATE Employees
SET Email = 'not available',CommissionPct=0.10

SELECT * FROM Employees

-q3
--Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for those employees whose DepartmentID is 110.
ALTER TABLE Emplyees
DROP CONSTRAINT ukEmail

UPDATE Employees
SET Email = 'not available',CommissionPct=0.10
WHERE DepartmentID=110

SELECT * FROM Employees

--q4
--Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees whose DepartmentID is 80 and gets a commission is less than 20%
ALTER TABLE Employees
DROP CONSTRAINT ukEmail

UPDATE Employees
SET Email = 'not available'
WHERE DepartmentID=80 AND CommissionPct < 0.20

SELECT * FROM Employees

--q5
--Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees who belongs to the ‘Accouning’ department.

SELECT * FROM Departments

ALTER TABLE Employees
DROP CONSTRAINT ukEmail

UPDATE Employees
SET Email = 'not available'
WHERE DepartmentID=110

SELECT * FROM Employees

--q6
--Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000.

UPDATE Employees
SET Salary=8000
WHERE EmployeeID=105 AND Salary<5000

--q7
--Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to department, which ID is 30 and the existing job ID does not start with SH.
UPDATE Employees
SET JobId='SH_CLERK'
WHERE EmployeeID=118 AND DepartmentID=30 AND JobId NOT LIKE 'SH%'

SELECT * FROM Employees

--q8
--Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that, salary will be increased by 25% for the department 40, 15% for department 90 and 10% for the department 110 and the rest of the departments will remain same.
UPDATE Employees
SET Salary += Salary*0.25
where DepartmentID = 40

UPDATE Employees
SET Salary += Salary*0.15
where DepartmentID = 90

UPDATE Employees
SET Salary += Salary*0.10
where DepartmentID = 110

SELECT * FROM Employees

-q9
--Write a SQL statement to increase the minimum and maximum salary of PU_CLERK by 2000 as well as the salary for those employees by 20% and commission by 10% .
UPDATE Employees SET Salary += Salary*0.20 WHERE JobId='PU_CLERK'

UPDATE Employees SET CommissionPct += 0.10 WHERE JobId='PU_CLERK'

SELECT * FROM Employees