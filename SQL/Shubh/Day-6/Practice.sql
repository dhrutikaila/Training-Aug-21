--1. name, salaries of the employees who have higher salary than average salary. 
SELECT CONCAT(FirstName,' ',LastName) AS 'Employee_Name', Salary FROM Employees WHERE Salary>(SELECT AVG(Salary) FROM Employees)

--2. names of employees who works in the Sales department. 
SELECT CONCAT(FirstName,' ', LastName) AS 'Name' 
	FROM Employees 
		WHERE DepartmentID=(SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Sales')

--3. names of employees who have a manager.
SELECT CONCAT(FirstName,' ',LastName) AS 'Employee Name',ManagerID FROM Employees
	WHERE ManagerID IN (SELECT ManagerID FROM Departments)
	
--4. names of employees who are managers. 
SELECT CONCAT(FirstName,' ',LastName) AS 'Manager Name' FROM Employees
	WHERE (EmployeeID IN (SELECT ManagerID FROM Employees))
	
--5. names, salary of employees whose salary is equal to the minimum salary for their job grade. 
SELECT CONCAT(E.FirstName,' ', E.LastName) AS 'Name', E.Salary, E.JobId
	FROM Employees E WHERE E.Salary=(SELECT MIN(S.Salary) FROM Employees S WHERE E.JobId = S.JobId)

--6. names, salary of employees who earn less than Mr. King. 
SELECT CONCAT(FirstName,' ',LastName) AS 'Employee_Name', Salary FROM Employees 
	WHERE Salary < (SELECT Salary FROM Employees WHERE CONCAT(FirstName,' ',LastName) = 'Steven King')

--7. names, salary of employees who earn the minimum salary for all departments. 
SELECT CONCAT(FirstName,' ', LastName) AS 'Name', Salary, DepartmentID FROM Employees 
	WHERE Salary IN (SELECT MIN(Salary) FROM Employees GROUP BY DepartmentID)

--8. names, salary of employees who earns more than average salary of all department. 
SELECT CONCAT(FirstName,' ',LastName) AS 'Employee Name', Salary AS 'More Than Average' 
	FROM Employees WHERE Salary>ALL
		(SELECT AVG(Salary)FROM Employees GROUP BY DepartmentID)

--9. names, department ID and department name of all employees. 
CREATE VIEW EmpName
AS
SELECT CONCAT(E.FirstName,' ',E.LastName) AS 'Name', D.DepartmentID, D.DepartmentName
FROM Employees E 
JOIN Departments D ON E.DepartmentID=D.DepartmentID
GO
SELECT * FROM EmpName

--10. employee id, last name, manager id, manager last name. 
CREATE VIEW EmpMgr
AS
SELECT M.EmployeeID, M.LastName AS 'Employee', M.ManagerID, E.LastName AS 'Manager'
FROM Employees E 
JOIN Employees M ON E.EmployeeID=M.ManagerID
GO
SELECT * FROM EmpMgr

--11. names, hire date of employees who were hired after 'Jones'. 
CREATE VIEW EmpJones
AS
SELECT CONCAT(FirstName,' ',LastName) AS 'Name', HireDate
FROM Employees
WHERE HireDate > (SELECT HireDate FROM Employees WHERE LastName='Jones')
GO
SELECT * FROM EmpJones

--12. department ID, department name and manager first name. 
CREATE VIEW DepMgr
AS
SELECT D.DepartmentID, D.DepartmentName ,CONCAT(E.FirstName,' ',E.LastName) AS 'Manager'
FROM Departments D 
JOIN Employees E ON D.ManagerID=E.EmployeeID
GO
SELECT * FROM DepMgr

--13. job title and average salary of employees. 
CREATE VIEW EmpSal
AS
SELECT JobId, AVG(Salary) AS 'AvgSal'
FROM Employees
GROUP BY JobId
GO
SELECT * FROM EmpSal