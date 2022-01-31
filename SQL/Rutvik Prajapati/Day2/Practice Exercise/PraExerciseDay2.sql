-- DML : -
    -- SELECT
        SELECT * FROM Employees

    -- INSERT
	   --FOR SPECIFIC COLLUMN INSERT ROW
	   INSERT INTO Employees (FirstName,LastName) 
	   VALUES('JAY','PATEL'),
			('MAYANK','PATEL')

	  --FOR ALL COLLUMN IN INSERT VALUE
	  INSERT INTO Employees
	   VALUES(119,'JAY','PATEL','JAYPATEL@',1234567890,1999-05-18,'AD_VP',25000,0.00,100,90),
			(120,'MAYANK','PATEL','MPATEL@',1234567891,1999-05-19,'AD_VP',30000,0.00,100,90)

    -- UPDATE
	 UPDATE Employees
	 SET FirstName = 'JAYA'
	 WHERE DepartmentID = 90

    -- DELETE  REMOVE ROW FROM TABLE 
	DELETE FROM Employees
	WHERE DepartmentID = 90

-- DQL : -
    -- Basic Select Statement
	SELECT FirstName,LastName
	FROM Employees

	SELECT * FROM Employees

    -- Literals & Concatenate
	   --LITERALS
	   SELECT FirstName ,'LITERALS_NAME',LastName
	   FROM Employees

	   --CONCATENATE
	   SELECT FirstName+ ' SPACE ' + LastName
	   FROM Employees

    -- Calculating Column Values
	SELECT FirstName,Salary,CommissionPct,TOTAL_SALARY = Salary+CommissionPct
	FROM Employees

    --  Where clause
	SELECT FirstName,LastName
	FROM Employees
	WHERE Salary>5000

	SELECT FirstName,LastName
	FROM Employees
	WHERE Salary>5000 AND JobId = 'AD_VP'
	
    -- Comparison & Logical Operator
	   --COMPARISON  <,>,<=,>=
	   SELECT FirstName,LastName
		FROM Employees
		WHERE Salary>5000 

		SELECT FirstName,LastName
		FROM Employees
		WHERE Salary<7000 

	   --LOGICAL OPERATOR AND , OR , NOT
	   SELECT FirstName,LastName,Salary
		FROM Employees
		WHERE Salary<7000 AND JobId = 'AD_VP'

		SELECT FirstName,LastName,Salary
		FROM Employees
		WHERE Salary<7000 OR JobId = 'AD_VP'

		SELECT FirstName,LastName,Salary
		FROM Employees
		WHERE NOT Salary<7000 


    -- Range Operator   BETWEEN , NOT BETWEEN
		SELECT FirstName,LastName,Salary
		FROM Employees
		WHERE  Salary BETWEEN 7000 AND 10000 

		SELECT FirstName,LastName,Salary
		FROM Employees
		WHERE  Salary NOT BETWEEN 7000 AND 10000 

    -- In/not in keyword
		SELECT FirstName,LastName,Salary,JobId
		FROM Employees
		WHERE  JobId IN('AD_VP','IT_PROG')

    -- Like, OrderBy, Top, Distinct
	    --LIKE
		SELECT FirstName,LastName
		FROM Employees
		WHERE FirstName LIKE('%A%')
	    
		--ORDER BY 
		SELECT FirstName,LastName,Salary
		FROM Employees
		ORDER BY Salary DESC

		--TOP 
		SELECT TOP 3 FirstName,LastName,Salary
		FROM Employees
		ORDER BY Salary DESC

		--Distinct
		SELECT DISTINCT JobId
		FROM Employees