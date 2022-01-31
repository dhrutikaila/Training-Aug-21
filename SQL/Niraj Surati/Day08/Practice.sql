-- Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ from employee table

SELECT * FROM HumanResources.EmployeePayHistory

SELECT * FROM HumanResources.EmployeeDepartmentHistory
WHERE BusinessEntityID = 1
GO

-- PAGING

SELECT *
FROM HumanResources.Employee
ORDER BY BusinessEntityID
	OFFSET 20 ROWS
	FETCH NEXT 10 ROWS ONLY

-- CHOOSE 

SELECT CHOOSE(2,JobTitle,Gender) AS 'CHOOSE'
FROM HumanResources.Employee
WHERE BusinessEntityID BETWEEN 1 AND 100

-- IIF

SELECT IIF(Gender = 'M','Male','Female') AS 'GENDER'
FROM HumanResources.Employee
WHERE BusinessEntityID BETWEEN 1 AND 100


-- OUTPUT

USE Assignment2

SELECT * 
FROM SYS.tables

SELECT *
FROM Employees

UPDATE Employees
SET FirstName = 'Steven'
OUTPUT INSERTED.EmployeeID
	,	DELETED.FirstName AS  'OLD'
	,	INSERTED.FirstName AS 'UPDATED'
WHERE EmployeeID = 100

-- MERGE

SELECT *
FROM SYS.tables

SELECT *
FROM Faculty

SP_HELP Faculty

SELECT * INTO Faculty2
FROM Faculty

SELECT * FROM Faculty2

INSERT INTO Faculty2
VALUES('Niraj')

SELECT *
FROM Trainee

MERGE Faculty AS F1
USING Faculty2 AS F2
	ON F1.F_ID = F2.F_ID
WHEN MATCHED THEN
	UPDATE SET F1.F_Name = F2.F_Name
WHEN NOT MATCHED THEN
	INSERT VALUES(F2.F_Name)
OUTPUT DELETED.F_ID AS 'OLD '
	,	DELETED.F_Name AS 'OLD'
	,	INSERTED.F_ID AS 'NEW'
	,	INSERTED.F_Name AS 'NEW'


-- VIEW

USE AdventureWorks2019

CREATE VIEW Purchasing.PurchaseOrderReject  
WITH ENCRYPTION  
AS  
SELECT PurchaseOrderID, ReceivedQty, RejectedQty,   
    RejectedQty / ReceivedQty AS RejectRatio, DueDate  
FROM Purchasing.PurchaseOrderDetail  
WHERE RejectedQty / ReceivedQty > 0  
AND DueDate > CONVERT(DATETIME,'20010630',101) 

SELECT *
FROM Purchasing.PurchaseOrderReject

-- IF-ELSE - WHILE - CASE

BEGIN
IF(2>0)
PRINT 'True'
ELSE
PRINT 'True'
END

SELECT * 
FROM HumanResources.Employee

SELECT BusinessEntityID	
	,	( CASE GENDER 
		WHEN   'M' THEN 'Male'
		ELSE 'Female'
		END) AS 'Gender'					
FROM HumanResources.Employee
ORDER BY BusinessEntityID

-- Practice

DECLARE @n INT;
DECLARE @flag BIT = 0
DECLARE @temp INT
DECLARE @stop INT
DECLARE @gender VARCHAR(1)
SET @n = (SELECT TOP 1 BusinessEntityID
		FROM HumanResources.Employee
		ORDER BY BusinessEntityID)
SET @stop = (SELECT TOP 1 BusinessEntityID
		FROM HumanResources.Employee
		ORDER BY BusinessEntityID DESC)
WHILE(@flag = 0)
BEGIN
	IF(@n > @stop)
	BEGIN
		BREAK
	END
	SET @temp =(SELECT BusinessEntityID
		FROM HumanResources.Employee
		WHERE BusinessEntityID = @n)
	IF(@temp = NULL)
	BEGIN
		SET @n += 1;
		CONTINUE;
	END
	
	SET @gender = ( SELECT Gender 
					FROM HumanResources.Employee
					WHERE BusinessEntityID = @n
					)
	IF(@gender = 'm')
	BEGIN
		PRINT 'BusinessEntityID:'+SPACE(1) + CAST(@n AS VARCHAR)+ SPACE(2) + '- Male'
	END
	ELSE
	BEGIN
		PRINT 'BusinessEntityID:'+SPACE(1) + CAST(@n AS VARCHAR)+ SPACE(2) + '- Female'
	END
	SET @n += 1
END

SELECT * 
FROM HumanResources.Employee

SELECT *
FROM HumanResources.Employee FOR JSON PATH