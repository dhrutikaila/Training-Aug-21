--1.Create a Store Procedure which will accept name of the customer as input parameter and produce the 
--following output, List Names of Customers who are Depositors and have Same Branch City as that of input 
--parameter customer’s Name.

CREATE PROCEDURE myproc1
	@CustName nvarchar(30)
AS
	SET NOCOUNT ON;
	SELECT Cname 
	FROM Deposit d JOIN Branch b
	ON d.Bname = b.Bname
	WHERE b.City = 
	(SELECT City FROM Branch WHERE Bname = 
	(SELECT Bname FROM Deposit WHERE Cname=@CustName)) FOR JSON PATH
GO

EXECUTE myproc1 'SUNIL'

--2.Create a Store Procedure which will accept name of the customer as input parameter and produce the 
--following output List in JSON format, All the Depositors Having Deposit in All the 
--Branches where input parameter customer is Having an Account


CREATE PROCEDURE myproc2
	@CustName nvarchar(20)
AS
	SET NOCOUNT ON;
	SELECT Cname 
	FROM Deposit d
	WHERE Bname IN (SELECT Bname FROM Deposit WHERE Cname = @CustName)
	FOR JSON PATH
GO

EXEC myproc2 'SUNIL'

--3.Create a Store Procedure that will accept city name and returns the number of customers in that city.

CREATE PROCEDURE myproc3
	@City nvarchar(20)
AS
	SET NOCOUNT ON;
	SELECT COUNT(Cname) AS CustomerCount FROM Customer
	WHERE City = @City
GO

EXEC myproc3 'NAGPUR'

--4.Create a Store Procedure which will accept city of the customer as input parameter and product the 
--following output List in JSON format List All the Customers Living in city provided in input parameter 
--and Having the Branch City as MUMBAI or DELHI

CREATE PROCEDURE myproc4
	@City nvarchar(20)
AS
	SET NOCOUNT ON;
	(SELECT C.Cname FROM Customer C
	JOIN Deposit D ON C.Cname = D.Cname
	JOIN Branch B1 ON D.Bname = B1.Bname 
	WHERE C.City = @City AND B1.City IN ('MUMBAI','DELHI'))

GO

EXEC myproc4 'NAGPUR'

--5.Count the Number of Customers Living in the City where Branch is Located
CREATE PROCEDURE myproc5
	@Count INT OUTPUT
AS
	SET NOCOUNT ON; 
	SELECT  COUNT(C.Cname) FROM Customer C
	WHERE C.City IN (SELECT DISTINCT City FROM BRANCH)
GO

DECLARE @Count1 INT
EXEC myproc5 @Count1 OUTPUT

--6.Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount

CREATE TABLE Deposit1(
	ACTNO varchar(5) NOT NULL,
	Cname varchar(18) NULL,
	Bname varchar(18) NULL,
	Amount int NULL,
	Adate date NULL,
 CONSTRAINT PK_Deposit1 PRIMARY KEY (ACTNO)
)

CREATE PROCEDURE myproc6
	@JSON nvarchar(max)
AS
	SET NOCOUNT ON;
	INSERT INTO Deposit1 (ACTNO,Cname,Bname,Amount,Adate)
	SELECT ACTNO,Cname,Bname,Amount = CASE WHEN Amount>10000 THEN Amount ELSE NULL END,Adate = GETDATE()
	FROM
	OPENJSON(@JSON)
	WITH
	(
		ACTNO INT '$.ACTNO',
		Cname varchar(20) '$.CustomerName' ,
		Bname varchar(20) '$.Branch',
		Amount INT '$.Amount' 
	 )
GO
DECLARE @JSON1 nvarchar(max)
SET @JSON1 = N'{
"CustomerName":"Chitrank",
"ACTNO" : 113,
"Branch" : "Naroda",
"Amount" : 2500
}'


EXEC myproc6 @JSON=@JSON1
GO