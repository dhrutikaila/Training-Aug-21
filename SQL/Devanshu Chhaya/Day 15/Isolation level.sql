---- ISOLATION LAVEL FOR COMMITED AND UNCOMMITED

BEGIN TRANSACTION ToUpdate
BEGIN TRY
	UPDATE HumanResources.Employee SET JobTitle='Senior Design Engineer' WHERE BusinessEntityID IN (5,6)
	UPDATE HumanResources.Employee SET HireDate=GETDATE() WHERE BusinessEntityID=3
	WAITFOR DELAY '00:00:20'
	COMMIT TRANSACTION ToUpdate  
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION ToUpdate
END CATCH


SELECT * FROM HumanResources.Employee

----- FOR DIRTY READ

BEGIN TRANSACTION ToUpdate
BEGIN
	UPDATE HumanResources.Employee SET MaritalStatus='M' WHERE BusinessEntityID IN (1,2)
	WAITFOR DELAY '00:00:20'
	ROLLBACK TRANSACTION ToUpdate  
END

select * from HumanResources.Employee