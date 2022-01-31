SELECT E_NAME FROM Emp WHERE Sayary = (SELECT MAX(Salary) FROM Emp);

SELECT E_NAME FROM Emp WHERE Salary = (Salary MAX(Salary) FROM Emp WHERE Salary != (SELECT MAX(Salary) FROM Emp));

SELECT DepartmentName,COUNT(*) AS Total FROM Emp GROUP BY DepartmentName;

SELECT E_NAME FROM Emp WHERE DepartmentName IN (SELECT DepartmentName FROM Emp GROUP BY DepartmentName HAVING COUNT(*) < 3)

SELECT E_NAME FROM Emp WHERE Salary IN (SELECT MAX(Salary) FROM Emp GROUP BY DepartmentName)

SELECT * FROM Emp WHERE City IN ('RAJKOT','BOTAD')

SELECT E_NAME FROM Emp WHERE EmployeeID IN (SELECT DISTINCT(EmployeeID) FROM Project)

SELECT * FROM Emp WHERE EmployeeID EXISTS (SELECT EmployeeID FROM Project WHERE Emp.EmployeeID=Project.EmployeeID);