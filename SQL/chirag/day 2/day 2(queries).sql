 --write a SQL statement to change the Email column of Employees table with �not available� for all employees.
   UPDATE Employees SET email='not available' 

  --write a SQL statement to change the Email AND CommissionPct column of employees table with �not available� AND 0.10 for all employees.
  UPDATE Employees SET email='not available' , CommissionPct=0.1

  --write a SQL statement to change the Email AND CommissionPct column of employees table with �not available� AND 0.10 for those employees whose DepartmentID is 110.
  UPDATE Employees SET email='not available', CommissionPct=0.1 WHERE DepartmentID=100

  --write a SQL statement to change the Email column of employees table with �not available� for those employees whose DepartmentID is 80 AND   --gets a commission is less than 20%
  UPDATE Employees SET email='not available' WHERE DepartmentID=80 AND CommissionPct>20

  --write a SQL statement to change the Email column of employees table with �not available� for those employees who belongs to the �Accouning� department.
  UPDATE Employees SET salary=8000 WHERE EmployeeID=105 AND salary<15000


  --write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to department, which ID is 30 AND the existing job ID does not start with SH.
 UPDATE Employees SET jobid='SH_CLERK' WHERE JobId=118 AND JobId=30 AND not JobId='sh'

  --write a SQL statement to increase the salary of employees under the department 40, 90 AND 110 according to the company rules that, salary will be increased by 25% for the department 40, 15% for department 90 AND 10% for the department 110 AND the rest of the departments will remain same.
 
 UPDATE Employees SET Salary=salary+(Salary*25)/100   WHERE DepartmentID = 40 
UPDATE Employees SET Salary=salary+(Salary*10)/100   WHERE DepartmentID = 90
UPDATE Employees SET Salary=salary+(Salary*15)/100   WHERE DepartmentID = 110 


 UPDATE Employees SET Salary=20+1,CommissionPct=(CommissionPct+(CommissionPct*.10)) WHERE  JobId ='pu_clerk'AND Salary= (SELECT max(Salary ) FROM employees WHERE  JobId ='pu_clerk') or Salary= (SELECT min(Salary ) FROM employees WHERE  JobId ='pu_clerk')




  --get all employee details FROM the Employee table
SELECT * FROM employees

  --get FirstName, LastName FROM Employees table
selecet FirstName,LastName FROM Employees

  --get employee details FROM Employees table whose Employee Name is �Steven�
  SELECT * FROM employees WHERE firstname ='teven'

  --get employee details FROM Employees table whose Employee Name are �Neena� AND �Lex�
   SELECT * FROM employees WHERE firstname IN('Neena' ,'Lex')

  --get employee details FROM Employees table whose Employee name are not �Neena� AND �Neena�
  SELECT * FROM employees   WHERE firstname not IN('Neena' ,'Lex')

	SELECT TOP  2 salary  FROM Employees 

  --get employee details FROM Employees table whose Salary between 5000 AND 8000
  SELECT * FROM employees   WHERE salary between 5000 AND 8000

  --write a query to   --get the names (FirstName, LastName), Salary, PF of all the Employees (PF is calculated as 12% of salary).
  SELECT  firstname, lastname,salary,(salary*12)/100  FROM employees

  --get employee details FROM Employees table whose FirstName starts with �N�
  SELECT  *  FROM employees WHERE firstname like'n%'

  --write a query to   --get unique department ID FROM Employees table
  SELECT  distinct Departmentid FROM Employees

  --write a query to   --get all employee details FROM the employee tableORDER BY FirstName, descending.
  SELECT * FROM employees  ORDER BY FirstName desc

  --write a query to   --get the EmployeeID, names (FirstName, LastName), salary in ascending order of salary.
  SELECT employeeid ,firstname,lastname,salary FROM employees ORDER BY salary



 