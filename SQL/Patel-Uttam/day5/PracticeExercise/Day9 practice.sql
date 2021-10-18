USE [Day9 (JOIN)]

--Practice Exercise

-- Join : Join Clause use to retrive collective data from more the one related tables
		--Join is very useful when we want such data that depends on two or more data-tables
		--we can use join between tables that has one or more same column.

		--Three type of join 
			--Inner Join
			--Outer Join
				-- Left Join
				-- Right join
				-- Full join
			--Self Join



-- Inner Join  : Inner Join use to retvire data that present at both table and satisfy join condition.


SELECT * FROM Locations
SELECT * FROM Countries
--SELECT * FROM JobHistory


-- Display name and departname of emplyoee

SELECT Employees.FirstName , Employees.LastName AS 'Name' , Departments.DepartmentName FROM Employees 
JOIN Departments 
ON Employees.DepartmentID = Departments.DepartmentID


-- Display name and departname of emplyoees has FirstName 'Steven' 

SELECT Employees.FirstName , Employees.LastName AS 'Name' , Departments.DepartmentName FROM Employees 
JOIN Departments 
ON Employees.DepartmentID = Departments.DepartmentID
WHERE Employees.FirstName = 'Steven'


-- Display name of department and city of employee.
SELECT e.FirstName , e.LastName AS 'Name' , d.DepartmentName , l.City FROM Departments d
JOIN Employees e
ON e.DepartmentID = d.DepartmentID
JOIN Locations AS l
ON d.LocationID = l.LocationID




-- Outer Join : Outer join use to retrive data that present in both/all table or only in any of one.

	
	
	
	-- Left Join : Left Join use to retrive data, present in both/all tables along with all data from Left side table.


	-- Display departname and name of emplyoee, (display all department)  

	SELECT Departments.DepartmentName , Employees.FirstName , Employees.LastName AS 'Name' FROM Departments 
	LEFT JOIN Employees
	ON Employees.DepartmentID = Departments.DepartmentID


	-- Display departname where no one work now. 

	SELECT Employees.FirstName , Employees.LastName AS 'Name' , Departments.DepartmentName FROM Departments 
	LEFT JOIN Employees 
	ON Employees.DepartmentID = Departments.DepartmentID
	WHERE Employees.FirstName IS NULL


	-- Display LocationID and related DepartmentName. (consider all LocationID )

	SELECT l.LocationID, d.DepartmentName FROM Locations AS l
	LEFT JOIN Departments d
	ON l.LocationID = d.LocationID






	-- Right Join : Right Join use to retrive data, present in both/all tables along with all data from Right side table.


	-- Display name and departname of emplyoee, (display all department)  

	SELECT Employees.FirstName , Employees.LastName AS 'Name' , Departments.DepartmentName FROM Employees 
	RIGHT JOIN Departments
	ON Employees.DepartmentID = Departments.DepartmentID


	-- Display LocationID where no Department available now. 

	SELECT l.LocationID, d.DepartmentName FROM Departments d
	RIGHT JOIN Locations AS l
	ON l.LocationID = d.LocationID


	-- Display Department , locationID and country  (consider all locationID and country )

	SELECT  d.DepartmentName , l.LocationID ,c.CountryName FROM Departments AS d
	RIGHT JOIN Locations l
	ON l.LocationID = d.LocationID
	RIGHT JOIN Countries AS c
	ON l.CountryID = c.CountryID




	
	-- Full Join : Full join use to retrive all data either present or not in both/all tabels.
	

	-- Display CountryID and CountryName of emplyoee, (display all department)  

	SELECT Employees.ManagerID AS 'e.managerid' , Departments.ManagerID AS 'd.managerid' FROM Employees 
	FULL JOIN Departments
	ON Employees.ManagerID = Departments.ManagerID



	-- Display Department , locationID and country  (consider all Department, locationID and country )

	SELECT  d.DepartmentName , l.LocationID ,c.CountryName FROM Departments AS d
	FULL JOIN Locations l
	ON l.LocationID = d.LocationID
	FULL JOIN Countries AS c
	ON l.CountryID = c.CountryID




-- Self join : When we perform joining on table with it self it refe as self-join.
			-- In self join we must have to give two different alise name to table.
			-- self join show a poor table design or normalize form.


-----------------------------------------------------------------------------------------------
		--CREATE TABLE DummyEmp 
		--(
		--	EmployeeID int Primary Key,
		--	EmpName varchar(25) NOT NULL,
		--	ManagerID int NOT NULL
		--);
		
		--INSERT into DummyEmp VALUES
		--(1,'Manager',0),
		--(2,'Senior Developer',1),
		--(3,'HR',1),
		--(4,'Junior Developer',2),
		--(5,'Assistant HR',3),
		--(6,'Senior Accountant',0);

	-------------------------------------------------------------------------------------------------

		-- Display EmpName has designation of Manager.

		SELECT o.EmployeeID , o.EmpName , c.EmployeeID FROM DummyEmp AS o
		JOIN DummyEmp AS c
		ON o.EmployeeID = c.ManagerID

		-- Display EmpName has no designation of Manager.
		
		SELECT  o.EmpName , c.EmployeeID FROM DummyEmp AS o
		LEFT JOIN DummyEmp AS c
		ON o.EmployeeID = c.ManagerID
		WHERE c.EmployeeID IS NULL



		-- Display EmpName and employee under it .
		
		SELECT  o.EmpName AS 'ManagerName' , c.EmpName FROM DummyEmp AS o
		JOIN DummyEmp AS c
		ON o.EmployeeID = c.ManagerID
		


-- Cross Join : Simillar to other joins Cross join also use to retrive combine data from tables, 
			--  but unlike other join, Cross join does not use 'ON' to specify condition.
			--  In Cross join it produce a result table as cartesian product of raw of two table.
			--  E.x : If one table has n row and another table has m raw, then number of row result table has is (n*m).
			--  Purpose of Cross join is to generate a result table that contains all possible combination from two tables.  


-----------------------------------------------------------------------------------------------------------------
			--CREATE TABLE Scanks 
			--(
			--	SnackNumber int PRIMARY KEY IDENTITY(1,1),
			--	Snack Varchar(50) NOT NULL UNIQUE ,
			--	Price int NOT NULL
			--	CONSTRAINT notnull CHECK (Price > 0)
			--);

			--CREATE TABLE Beverages 
			--(
			--	BeverageNumber int PRIMARY KEY IDENTITY(1,1),
			--	Beverage Varchar(50) NOT NULL UNIQUE ,
			--	Price int NOT NULL
			--	CONSTRAINT notnullbeverages CHECK (Price > 0)
			--);


			--INSERT INTO Scanks(Snack ,Price) VALUES('Burger',25),
			--										('Sandwich',30),
			--										('Samosa',20),
			--										('Toast',15)


			--INSERT INTO Beverages(Beverage ,Price) VALUES('Tea',10),
			--										('Coffee',20),
			--										('Juice',30),
			--										('Soft Drink',25)

-----------------------------------------------------------------------------------------------------------------


SELECT s.Snack , b.Beverage , (s.Price + b.Price) as 'Total' FROM Scanks AS s , Beverages AS b 


-- OR

SELECT s.Snack , b.Beverage , (s.Price + b.Price) as 'Total' FROM Scanks AS s 
CROSS JOIN Beverages AS b 

