--------1.Inner join--------------------
--The SELECT statement returns the product and supplier information for any combination of parts supplied by a company 
--for which the company name starts with the letter F and the price of the product is more than $10
SELECT ProductID, PV.BusinessEntityID, [Name] FROM Purchasing.ProductVendor AS PPV
INNER JOIN Purchasing.Vendor AS PV ON (PPV.BusinessEntityID = PV.BusinessEntityID)
WHERE StandardPrice > $10 AND Name LIKE 'F%'

    SELECT Employee_Name=CONCAT(EMP.FirstName,SPACE(1),EMP.LastName),DEPT.DEPARTMENT_NAME
	FROM Employees AS EMP JOIN departments AS DEPT
	ON EMP.DepartmentID=DEPT.DEPARTMENT_ID

--------2.Outer join--------------------
--Left Outer Join
    SELECT Employee_Name=CONCAT(EMP.FirstName,SPACE(1),EMP.LastName),DEPT.DEPARTMENT_NAME
	FROM Employees AS EMP LEFT OUTER JOIN departments AS DEPT
	ON EMP.DepartmentID=DEPT.DEPARTMENT_ID


--Right Outer join
    SELECT Employee_Name=CONCAT(EMP.FirstName,SPACE(1),EMP.LastName),DEPT.DEPARTMENT_NAME
	FROM Employees AS EMP RIGHT OUTER JOIN departments AS DEPT
	ON EMP.DepartmentID=DEPT.DEPARTMENT_ID

--Full Outer Join
    SELECT Employee_Name=CONCAT(EMP.FirstName,SPACE(1),EMP.LastName),DEPT.DEPARTMENT_NAME
	FROM Employees AS EMP FULL OUTER JOIN departments AS DEPT
	ON EMP.DepartmentID=DEPT.DEPARTMENT_ID

--Self-Join
	 SELECT (EMP.FirstName+' '+EMP.LastName) AS EmployeeName,(MGR.FirstName+' '+MGR.LastName) AS ManagerName FROM Employees AS EMP LEFT OUTER JOIN Employees AS MGR
	 ON EMP.ManagerID=MGR.EmployeeID

--Cross-join
    SELECT Employee_Name=CONCAT(EMP.FirstName,SPACE(1),EMP.LastName),DEPT.DEPARTMENT_NAME,EMP.Salary FROM Employees AS EMP
	CROSS JOIN departments AS DEPT

	