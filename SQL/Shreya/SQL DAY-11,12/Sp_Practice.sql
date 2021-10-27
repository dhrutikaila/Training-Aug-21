--- CREATE SP TO FETCH THE EMPLOYEE DETAIL LIKE EMPNAME , DEPTNAME 
--WITHOUT PARAMETER

CREATE PROCEDURE emp_Detail
AS 
BEGIN 
SET NOCOUNT ON

SELECT e.EmployeeID, e.FirstName , e.LastName ,d.DepartmentName
FROM Employees e 
JOIN Departments d ON e.DepartmentID=d.DepartmentID
SET NOCOUNT OFF
END
---FOR EXECUTING THE SP WE NEED TO WRITE THE EXEC AND THEN SP NAME 
EXEC emp_Detail


--WITH PARAMETER

ALTER PROCEDURE sp_emp_detail
@id INT 
AS 
BEGIN

SELECT h.BusinessEntityID,h.HireDate,h.JobTitle ,he.StartDate , he.EndDate
FROM HumanResources.Employee h 
JOIN HumanResources.EmployeeDepartmentHistory  he ON h.BusinessEntityID=he.BusinessEntityID
WHERE h.BusinessEntityID=@id

END

--FOR EXECUTING THIS SP WE NEED PASS THE PARAMETER VALUE 
EXEC sp_emp_detail 1

----OUTPUT PARAMETER

CREATE PROCEDURE count_Employee
@emp_count INT OUTPUT 
AS 
BEGIN
	SELECT @emp_count = COUNT(BusinessEntityID) FROM HumanResources.Employee
END


--for executing procedure

DECLARE @Total_Emp INT
 EXEC dbo.count_Employee  @Total_Emp OUTPUT
 PRINT @Total_Emp


 SELECT * FROM Production.Product

 --Returning multiple resultset

CREATE PROCEDURE Product_detail 
@ProcName VARCHAR(30),
@FirstResult VARCHAR (MAX) OUT,
@SecondResult VARCHAR(MAX) OUT

AS 
BEGIN
	SELECT @FirstResult =
      (
      SELECT Product.ProductID, Product.Name, Product.ListPrice
        FROM Production.Product
        WHERE Product.Name LIKE @ProcName
      FOR JSON AUTO
      );
    -- Second result set saved as JSON in an output variable  
    SELECT @SecondResult =
      (
      SELECT P.Name, Count(S.ProductID) AS NumberOfOrders
        FROM Production.Product AS P
          JOIN Sales.SalesOrderDetail AS S
            ON P.ProductID = S.ProductID
        WHERE P.Name LIKE @ProcName
        GROUP BY P.Name
      FOR JSON AUTO
      );
END 

--EXECUTE THE SP
DECLARE @ProductAndListPrice NVARCHAR(MAX), @NumberOfOrders NVARCHAR(MAX);
--execute the procedure
EXEC Product_detail '%tire%', @ProductAndListPrice OUTPUT,
  @NumberOfOrders OUTPUT;
 
SELECT * INTO #ProductAndListPrice FROM OpenJson(@ProductAndListPrice)
WITH (ProductID int '$.ProductID', [Name] NVARCHAR(50) '$.Name', ListPrice money '$.ListPrice')

SELECT * FROM #ProductAndListPrice

--INSERT JSON DATA INTO TABLE 
SELECT TOP 5 * FROM Employees FOR JSON PATH
DECLARE @json VARCHAR(MAX) = N'[{"EmployeeID":100,"FirstName":"=CURSOR","LastName":"King","Email":"No available_CURSOR","PhoneNumber":"515.123.4567","HireDate":"1987-06-17","JobId":"AD_PRES","Salary":55501.00,"CommissionPct":0.10,"ManagerID":0,"DepartmentID":90},{"EmployeeID":101,"FirstName":"Neena","LastName":"Kochhar","Email":"not available","PhoneNumber":"515.123.4568","HireDate":"1987-06-18","JobId":"AD_VP","Salary":25854.88,"CommissionPct":0.10,"ManagerID":100,"DepartmentID":90},{"EmployeeID":102,"FirstName":"=CURSOR","LastName":"De Haan","Email":"No available_CURSOR","PhoneNumber":"515.123.4569","HireDate":"1987-06-19","JobId":"AD_VP","Salary":25854.88,"CommissionPct":0.10,"ManagerID":100,"DepartmentID":90},{"EmployeeID":103,"FirstName":"Alexander","LastName":"Hunold","Email":"not available","PhoneNumber":"590.423.4567","HireDate":"1987-06-20","JobId":"IT_PROG","Salary":9000.00,"CommissionPct":0.10,"ManagerID":102,"DepartmentID":60},{"EmployeeID":104,"FirstName":"=CURSOR","LastName":"Ernst","Email":"No available_CURSOR","PhoneNumber":"590.423.4568","HireDate":"1987-06-21","JobId":"IT_PROG","Salary":6000.00,"CommissionPct":0.10,"ManagerID":103,"DepartmentID":60}]'
CREATE PROCEDURE insert_record
@emp_detail VARCHAR(MAX)
AS 
      INSERT INTO Employee 
	  SELECT * 
	  FROM OPENJSON(@emp_detail)
	  with
	  (
	   EmployeeId DECIMAL (6,0) '$.EmployeeID',
	   FirstName VARCHAR(20) '$.FirstName ',
	   LastName VARCHAR(25) '$.LastName',
	   Email VARCHAR(25) '$.Email',
	   PhoneNumber VARCHAR(20) '$.PhoneNumber',
	   HireDate DATE '$.HireDate',
	   JobId VARCHAR(10) '$.JobId',
	   Salary DECIMAL(8,2) '$.Salary',
	   CommissionPct DECIMAL(2,2) '$.CommissionPct',
	   ManagerId DECIMAL(6,0) '$.ManagerID',
	   DepartmentID DECIMAL(4,0) '$.DepartmentID'

	  )

DECLARE @json VARCHAR(MAX) = N'[{"EmployeeID":100,"FirstName":"=CURSOR","LastName":"King","Email":"No available_CURSOR","PhoneNumber":"515.123.4567","HireDate":"1987-06-17","JobId":"AD_PRES","Salary":55501.00,"CommissionPct":0.10,"ManagerID":0,"DepartmentID":90},{"EmployeeID":101,"FirstName":"Neena","LastName":"Kochhar","Email":"not available","PhoneNumber":"515.123.4568","HireDate":"1987-06-18","JobId":"AD_VP","Salary":25854.88,"CommissionPct":0.10,"ManagerID":100,"DepartmentID":90},{"EmployeeID":102,"FirstName":"=CURSOR","LastName":"De Haan","Email":"No available_CURSOR","PhoneNumber":"515.123.4569","HireDate":"1987-06-19","JobId":"AD_VP","Salary":25854.88,"CommissionPct":0.10,"ManagerID":100,"DepartmentID":90},{"EmployeeID":103,"FirstName":"Alexander","LastName":"Hunold","Email":"not available","PhoneNumber":"590.423.4567","HireDate":"1987-06-20","JobId":"IT_PROG","Salary":9000.00,"CommissionPct":0.10,"ManagerID":102,"DepartmentID":60},{"EmployeeID":104,"FirstName":"=CURSOR","LastName":"Ernst","Email":"No available_CURSOR","PhoneNumber":"590.423.4568","HireDate":"1987-06-21","JobId":"IT_PROG","Salary":6000.00,"CommissionPct":0.10,"ManagerID":103,"DepartmentID":60}]'
EXEC insert_record @emp_detail = @json

SELECT * FROM Employee


--RETURN JSON OUTPUT FROM SP

ALTER PROCEDURE RetriveJson_FormatData
@jsonout VARCHAR(MAX) OUT
AS 
BEGIN

SET @jsonout = (SELECT TOP (10) * FROM Employees FOR JSON PATH )

END

DECLARE @json VARCHAR(MAX)
EXEC RetriveJson_FormatData @jsonout=@json OUT
SELECT @json


--Execute one SP in another SP

CREATE PROCEDURE sp_emp
AS
BEGIN
EXEC emp_Detail
END

EXEC sp_emp

---creating an encrypted stored procedure 
CREATE PROCEDURE GetEmployees
WITH ENCRYPTION
AS
BEGIN
SET NOCOUNT ON 
 
SELECT EmployeeID,FirstName from Employee
END

EXEC GetEmployees

sp_helptext GetEmployees

--Creating a stored procedure with default parameters values

ALTER PROCEDURE GetEmp_Default 
@id INT = 101
AS
BEGIN
SELECT FirstName  , LastName,Email,HireDate,JobId
FROM Employee WHERE EmployeeID=@id
END


EXEC GetEmp_Default 

select * from Employee


--parse json file 
SELECT * 
FROM OPENROWSET (BULK 'D:\Shreya\RadixWeb\Json.json', SINGLE_CLOB) as JsonFile

--convert json data to relational format 

SELECT * 
FROM OPENROWSET (BULK 'D:\Shreya\RadixWeb\Json.json', SINGLE_CLOB) as JsonFile
CROSS APPLY OPENJSON(BulkColumn)

---------------------------------------------------------------------------------------------------------------------

 CREATE PROCEDURE county_wise_emp_output @country_id VARCHAR(5), @rows INT OUTPUT, @lname VARCHAR(10) OUT
 AS
 SELECT FirstName FROM Employees WHERE DepartmentID IN
 (SELECT DepartmentID from Departments WHERE LocationID IN
 (SELECT LocationID FROM Locations WHERE CountryID=@country_id))
 SELECT @rows=@@ROWCOUNT
 SET @lname=(SELECT LastName FROM Employees WHERE EmployeeID =180)
 
 DECLARE @rows_op INT
 DECLARE @last_name VARCHAR(10)
 EXEC county_wise_emp_output @country_id='US', @rows=@rows_op OUTPUT, @lname=@last_name OUTPUT
 SELECT @rows_op
 SELECT @last_name
