--View Practice
--display details of manager 
CREATE VIEW ManagerView
AS
		SELECT CONCAT(e.FirstName,' ',e.LastName) AS [Manager Name],d.DepartmentID,d.ManagerID
				 ,d.DepartmentName ,l.StreetAddress,l.City,l.PostalCode
				 FROM Employees AS e
				 JOIN Departments AS d
				 ON e.DepartmentID = d.DepartmentID
				 JOIN Locations AS l
				 ON l.LocationID = d.LocationID
				 WHERE e.EmployeeID = d.ManagerID

SELECT * FROM ManagerView

--Subquerie Practice
--6. Name of Employee whose Salary greater than avg salary 
		
		SELECT FirstName, LastName,JobId, Salary 
				FROM Employees AS e
				WHERE Salary >ALL 
				(SELECT  AVG(Salary) FROM Employees)
				ORDER BY Salary DESC


