-- UDF to get latest order date

CREATE FUNCTION udf_RecentOrderDate(@customerid int)
RETURNS datetime
AS
BEGIN
	DECLARE @maxDate datetime
	SELECT @maxDate = MAX(OrderDate) FROM Sales.SalesOrderHeader
	WHERE CustomerID = @customerid
	RETURN @maxDate
END

SELECT dbo.udf_RecentOrderDate(29734)



-- Inline table valued function

ALTER FUNCTION OrderDates(@customerid int)
RETURNS TABLE
AS
RETURN 
	SELECT OrderDate FROM Sales.SalesOrderHeader
	WHERE CustomerID = @customerid

SELECT * FROM OrderDates(29734)



-- using cross apply

SELECT c.CustomerID,d.OrderDate FROM Sales.Customer c
	CROSS APPLY OrderDates(c.CustomerID) as d


-- Multi Statement table valued function

USE Demo

CREATE FUNCTION udf_InsertEmployeeDetail(@EmployeeId int)
RETURNS @empDetails TABLE (
Emp_id int,
FirstName varchar(20),
LastName varchar(20),
Hiredate date
)
AS
BEGIN
	IF EXISTS(SELECT * FROM Employee WHERE Emp_id = @EmployeeId)
	BEGIN
		INSERT INTO @empDetails
		SELECT Emp_id,First_Name,Last_Name,Joining_Date FROM Employee
		WHERE Emp_id = @EmployeeId
	END
	RETURN
END

SELECT * FROM dbo.udf_InsertEmployeeDetail(1)
SELECT * FROM dbo.udf_InsertEmployeeDetail(2)



-- Returning Json as output

USE db2

CREATE FUNCTION udf_getJSON(@JobId varchar(20))
RETURNS nvarchar(max)
AS
BEGIN
	RETURN (SELECT * FROM Employees WHERE JobId = @JobId FOR JSON PATH)
END

SELECT dbo.udf_getJSON('IT_PROG')

/*
[
{
"EmployeeID":103,
"FirstName":"Alexander",
"LastName":"Hunold",
"Email":"mail@example.com",
"PhoneNumber":"590.423.4567",
"HireDate":"1987-06-20",
"JobId":"IT_PROG",
"Salary":9000.00,
"CommissionPct":0.10,
"ManagerID":102,
"DepartmentID":60
},
{
"EmployeeID":104,
"FirstName":"Bruce",
"LastName":"Ernst",
"Email":"mail@example.com",
"PhoneNumber":"590.423.4568",
"HireDate":"1987-06-21",
"JobId":"IT_PROG",
"Salary":6000.00,
"CommissionPct":0.10,
"ManagerID":103,
"DepartmentID":60
},
{
"EmployeeID":105,
"FirstName":"David",
"LastName":"Austin",
"Email":"mail@example.com",
"PhoneNumber":"590.423.4569",
"HireDate":"1987-06-22",
"JobId":"IT_PROG",
"Salary":8000.00,
"CommissionPct":0.10,
"ManagerID":103,
"DepartmentID":60
},
{
"EmployeeID":106,
"FirstName":"Valli",
"LastName":"Pataballa",
"Email":"mail@example.com",
"PhoneNumber":"590.423.4560",
"HireDate":"1987-06-23",
"JobId":"IT_PROG",
"Salary":4800.00,
"CommissionPct":0.10,
"ManagerID":103,
"DepartmentID":60
},
{
"EmployeeID":107,
"FirstName":"Diana",
"LastName":"Lorentz",
"Email":"mail@example.com",
"PhoneNumber":"590.423.5567",
"HireDate":"1987-06-24",
"JobId":"IT_PROG",
"Salary":4200.00,
"CommissionPct":0.10,
"ManagerID":103,
"DepartmentID":60
}
]
*/



-- Taking JSON data as input

ALTER FUNCTION udf_insertJsonData(@jsonFile nvarchar(max))
RETURNS @empDetail TABLE
(
Emp_id int,
FirstName varchar(20),
LastName varchar(20),
Email varchar(100),
Salary int,
JobId varchar(20),
DepartmentID int
)
AS
BEGIN
	INSERT INTO @empDetail
	SELECT * FROM OPENJSON(@jsonFile)
	WITH
	(
	Emp_id int '$.EmployeeID',
	FirstName varchar(20) '$.FirstName',
	LastName varchar(20) '$.LastName',
	Email varchar(100) '$.Email',
	Salary Decimal '$.Salary',
	JobId varchar(20) '$.JobId',
	DepartmentID int '$.DepartmentID'
	)
	RETURN
END

DECLARE @jsondata nvarchar(MAX) = N'[{"EmployeeID":103,"FirstName":"Alexander","LastName":"Hunold","Email":"mail@example.com","PhoneNumber":"590.423.4567","HireDate":"1987-06-20","JobId":"IT_PROG","Salary":9000.00,"CommissionPct":0.10,"ManagerID":102,"DepartmentID":60},{"EmployeeID":104,"FirstName":"Bruce","LastName":"Ernst","Email":"mail@example.com","PhoneNumber":"590.423.4568","HireDate":"1987-06-21","JobId":"IT_PROG","Salary":6000.00,"CommissionPct":0.10,"ManagerID":103,"DepartmentID":60},{"EmployeeID":105,"FirstName":"David","LastName":"Austin","Email":"mail@example.com","PhoneNumber":"590.423.4569","HireDate":"1987-06-22","JobId":"IT_PROG","Salary":8000.00,"CommissionPct":0.10,"ManagerID":103,"DepartmentID":60},{"EmployeeID":106,"FirstName":"Valli","LastName":"Pataballa","Email":"mail@example.com","PhoneNumber":"590.423.4560","HireDate":"1987-06-23","JobId":"IT_PROG","Salary":4800.00,"CommissionPct":0.10,"ManagerID":103,"DepartmentID":60},{"EmployeeID":107,"FirstName":"Diana","LastName":"Lorentz","Email":"mail@example.com","PhoneNumber":"590.423.5567","HireDate":"1987-06-24","JobId":"IT_PROG","Salary":4200.00,"CommissionPct":0.10,"ManagerID":103,"DepartmentID":60}]'
SELECT * FROM dbo.udf_insertJsonData(@jsondata)



-- Using UDF in SP

USE AdventureWorks2012

CREATE FUNCTION udf_multiplicationOfTwoNum(@num1 int,@num2 int)
RETURNS int
AS
BEGIN
	DECLARE @result int
	SET @result = @num1*@num2
	RETURN @result
END

SELECT dbo.udf_multiplicationOfTwoNum(5,5)

CREATE PROCEDURE usp_multiplication
@num1 int,
@num2 int
AS
BEGIN
	SELECT dbo.udf_multiplicationOfTwoNum(@num1,@num2)
END

EXEC usp_multiplication 5,5



EXEC sp_helptext udf_multiplicationOfTwoNum



-- nested UDF

CREATE FUNCTION udf_sumOfTwoNum(@n1 int, @n2 int)
RETURNS int
AS
BEGIN
	RETURN @n1 + @n2
END

CREATE FUNCTION udf_squareOfSum(@num1 int,@num2 int)
RETURNS int
AS
BEGIN
	DECLARE @result int
	SET @result = (SELECT dbo.udf_sumOfTwoNum(@num1,@num2))
	RETURN @result*@result
END

SELECT dbo.udf_squareOfSum(10,3) AS 'SquareOfSum'