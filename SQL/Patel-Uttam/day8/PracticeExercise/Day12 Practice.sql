USE [Day12 (Batch)]


-- Practice Exercise


 -- Batch :  Batch is group of SQL queries execute together by sql server 
		--	Batch execution of queries is more efficient then separate query execution.
		--	GO command is use.


-- E.X : 

-- Create view of employee table

SELECT * FROM Employees;
UPDATE Employees SET FirstName = 'Uttam' WHERE EmployeeID = 101;
SELECT * FROM Employees;
UPDATE Employees SET FirstName = 'Steven' WHERE EmployeeID = 101;
SELECT * FROM Employees;
GO



-- Variable declare in batch
-- we can declare variable  Using 'DECLARE' and set it value by 'SET'.
-- '@' use at start of variable_name.
-- 'PRINT' Command is use to display variable

DECLARE @var1 int
SET @var1 = 20
PRINT @var1
GO

DECLARE @var2 varchar(10)
SET @var2 = 'qwerty'
PRINT @var2
GO

DECLARE @var3 binary
SET @var3 = 10
PRINT @var3
GO



-- Programming Construct : Programming Construct allows to execution conditional statement in batches.
						-- 'IF-ELSE' , 'CASE' , 'WHILE' use by Batch for control execution folw of statements.


	-- IF-ELSE  :  If-Else is use to perform execution of statement based on condition , if Condition true 'If' part is execute or condition is false 'Else' part is execute.



	-- Select salary of employee , if salary <10000 then add 3000 in Salary or Print 'Salary Sufficient'.

	DECLARE @salary int
	DECLARE @EmpID int

	SET @EmpID = 101 --Enter EmployeeID 

	SELECT @salary = Salary FROM Employees WHERE EmployeeID = @EmpID
	--PRINT @Salary

	IF @salary < 10000
	BEGIN
	UPDATE Employees SET Salary = @Salary + 3000 WHERE EmployeeID = @EmpID
	SELECT @salary = Salary FROM Employees WHERE EmployeeID = @EmpID
	PRINT @Salary
	END

	ELSE
	PRINT 'Salary sufficient'

	GO





	-- CASE  : CASE use when we want one result value from list of conditions have respected possible value to it . 



	
	--ex
	SELECT 'Department' = CASE DepartmentID 
							WHEN 90 THEN 'Depart is 90'
							WHEN 110 THEN 'Depart is 110'
							WHEN 50 THEN 'Depart is 50'
							ELSE 'Not Define'
							END
		FROM Employees 



	-- ex
	UPDATE Employees SET Salary = CASE DepartmentID
	WHEN 90 THEN (Salary + 500)
	WHEN 100 THEN (Salary + 500)
	WHEN 30 THEN (Salary + 500)
	ELSE Salary
	END





	-- WHILE : WHILE is use to repeatedly Execute particular statement till it holds CONDITION 'TRUE'.




	WHILE(SELECT AVG(Salary) FROM Employees_15000 ) < 10000
	BegiN
	SELECT Salary FROM Employees_15000 WHERE Salary < 10000
	UPDATE Employees_15000 SET Salary = Salary+1000 WHERE Salary < 10000

	PRINT 'Increment'

	IF (SELECT AVG(Salary) FROM Employees_15000) < 10000
	CONTINUE
	ELSE
	PRINT 'terminate'
	END 

	PRINT 'out';







-- Self learn

	-- Exepct
	-- Intersect
	-- Union / Union All 

	CREATE TABLE Books1
	(
    id INT,
    name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price INT NOT NULL
	)
 
	CREATE TABLE Books2
	(
    id INT,
    name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price INT NOT NULL
	)

	-- insert

	INSERT INTO Books1
 
	VALUES
	(1, 'Book1', 'Classics', 1800),
	(2, 'Book2', 'Literary Fiction', 1500),            
	(3, 'Book3', 'History', 2000),
	(4, 'Book4', 'Sci-Fi and Fantasy', 1300),
	(5, 'Book5', 'Humour', 5500),
	(6, 'Book6', 'Thriller and Mystery', 5000),
	(7, 'Book7', 'Romance', 8000),
	(8, 'Book8', 'Mythological Fiction', 5000),
	(9, 'Book9', 'Historical Fiction', 5400),
	(10, 'Book10', 'Religion and Mythology', 3200)
 
	INSERT INTO Books2
 
	VALUES

	(5, 'Book5', 'Humour', 5500),
	(6, 'Book6', 'Thriller and Mystery', 5000),
	(7, 'Book7', 'Romance', 8000),
	(8, 'Book8', 'Mythological Fiction', 5000),
	(9, 'Book9', 'Historical Fiction', 5400),
	(10, 'Book10', 'Religion and Mythology', 3200),
	(11, 'Book11', 'Biography and Memoir', 8000),
	(12, 'Book12', 'Self-Help', 5000),
	(13, 'Book13', 'Travel and Places', 5400),
	(14, 'Book14', 'Best Indian Cl', 3200)




-- Exepct : Exepct returns the rows from right side table which are not present in other table.


	-- from two different table

	SELECT * FROM Books1
	Except
	SELECT * FROM Books2


	-- from single table

	SELECT * FROM Books1
	Except
	SELECT * FROM Books1 WHERE id BETWEEN 1 AND 5




-- Intersect : Intersect returns the rows present in both table.


	-- from two different table

	SELECT * FROM Books1
	Intersect
	SELECT * FROM Books2


	-- from single table

	SELECT * FROM Books1
	Intersect
	SELECT * FROM Books1 WHERE price > 5000





-- Union : Union returns all unique rows present in both table.


	-- from two different table

	SELECT * FROM Books1
	Union
	SELECT * FROM Books2


	-- from single table

	SELECT * FROM Books1
	Union
	SELECT * FROM Books1 WHERE price > 5000




-- Union : Union All returns all rows including duplicates present in both table.


	-- from two different table

	SELECT * FROM Books1
	Union All
	SELECT * FROM Books2


	-- from single table

	SELECT * FROM Books1
	Union All
	SELECT * FROM Books1 WHERE price > 5000