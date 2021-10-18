--CTE : Comman table expression 
WITH CTE_NAME (FirstName,LastName)
AS 
(
SELECT FirstName,LastName FROM Employees
)
select FirstName from CTE_NAME


WITH CTE_Emp
AS
(
 SELECT E.FirstName,E.LastName,D.DepartmentName
 FROM Employees E 
 INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
 WHERE E.Salary>5000
)
SELECT * FROM CTE_Emp WHERE DepartmentName = 'IT'

--VIEW
CREATE VIEW VIEW_EMP
AS 
SELECT E.FirstName,E.LastName,D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID 

SELECT * FROM VIEW_EMP

CREATE VIEW VIEW_TEMP
AS
SELECT DepartmentID,COUNT(FirstName) AS NumOfEmp
FROM Employees
GROUP BY DepartmentID

SELECT * FROM VIEW_TEMP WHERE DepartmentID = 50


--Derived Table
SELECT TBL.FirstName FROM
(SELECT E.FirstName,I.IncentiveAmount
FROM Employees E 
INNER JOIN Incentives I ON I.EmployeeId=E.EmployeeID)TBL
WHERE TBL.IncentiveAmount > 5000


SELECT TBL.FirstName,TBL.City  FROM
(SELECT E.FirstName,D.DepartmentName,L.City,C.CountryName
FROM Employees E
INNER JOIN Departments D ON D.DepartmentID = E.DepartmentID
INNER JOIN Locations L ON D.LocationID = L.LocationID
INNER JOIN Countries C ON L.CountryID = C.CountryID)TBL
WHERE TBL.CountryName = 'United States of America'
