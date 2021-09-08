select * from HumanResources.Employee


--SCALER FUNCTION
create function Gender(@BusinessEntityID int)
RETURNS varchar(10)
as
BEGIN
DECLARE @Gender varchar(10);
select @Gender=Gender from HumanResources.Employee where BusinessEntityID=@BusinessEntityID
RETURN @Gender
END
GO

SELECT DBO.Gender(100)


--------------------------------------------------------------------------------

create function NationalIDNumber(@BusinessEntityID int)
RETURNS INT
as
BEGIN
DECLARE @NationalIDNumber int;
select @NationalIDNumber=NationalIDNumber from HumanResources.Employee where BusinessEntityID=@BusinessEntityID
RETURN @NationalIDNumber
END
GO

SELECT DBO.NationalIDNumber(100)


--TABLE-VALUED FUNCTION
Create function Details(@BusinessEntityID int)
RETURNS TABLE
as
RETURN
(
	SELECT * FROM HumanResources.Employee where BusinessEntityID=@BusinessEntityID
)
GO

SELECT * FROM  DBO.DETAILS(100)

---Modify/Alter Function
Alter function Details(@BusinessEntityID int)
RETURNS TABLE
as
RETURN
(
	SELECT e.BusinessEntityID,p.FirstName,p.MiddleName,p.LastName,e.JobTitle,e.HireDate,e.Gender 
	FROM HumanResources.Employee e join Person.Person p on e.BusinessEntityID=p.BusinessEntityID 
	where e.BusinessEntityID=@BusinessEntityID
)
GO

SELECT * FROM  DBO.DETAILS(110)

--DELETE FUNCTION
IF OBJECT_ID('Details') IS NOT NULL
	DROP FUNCTION Details
GO


--EXECUTE FUNCTION
Create function HireDate(@BusinessEntityID int)
RETURNS DATE
AS
BEGIN
	DECLARE @HireDate DATE
	SELECT @HireDate=HireDate FROM HumanResources.Employee where BusinessEntityID=@BusinessEntityID
RETURN @HireDate
END
GO

DECLARE @HireDate DATE
EXEC @HireDate=DBO.HireDate
	 @BusinessEntityID=105
PRINT @HireDate