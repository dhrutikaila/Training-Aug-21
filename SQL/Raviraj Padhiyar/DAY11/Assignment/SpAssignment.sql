CREATE DATABASE testDB2

USE testDB2

CREATE TABLE Deposit
(
ActNo VARCHAR(5) PRIMARY KEY,
Cname VARCHAR(18) CONSTRAINT fkCnameDep FOREIGN KEY REFERENCES Customer(Cname),
Bname VARCHAR(18) CONSTRAINT fkBnameDep FOREIGN KEY REFERENCES Branch(Bname),
Amount INT,
Adate DATE
)



CREATE TABLE Branch
(
Bname VARCHAR(18) PRIMARY KEY,
City VARCHAR(18)
)




CREATE TABLE Customer
(
Cname VARCHAR(18) PRIMARY KEY,
City VARCHAR(18)
)




CREATE TABLE Borrow
(
LoanNo VARCHAR(5) PRIMARY KEY,
Cname VARCHAR(18) CONSTRAINT fkCnameBorrow FOREIGN KEY REFERENCES Customer(Cname),
Bname VARCHAR(18) CONSTRAINT fkBnameBorrow FOREIGN KEY REFERENCES Branch(Bname),
Amount INT
)

INSERT INTO Branch(Bname,City)
VALUES ('VRCE','NAGPUR'),	
('AJNI','NAGPUR'),	
('KAROLBAGH','DELHI'),	
('CHANDNI','DELHI'),
('DHARAMPETH','NAGPUR'),	
('M.G.ROAD','BANGLORE'),	
('ANDHERI','MUMBAI'),
('VIRAR','MUMBAI'),	
('NEHRU PLACE','DELHI'),	
('POWAI','MUMBAI')

INSERT INTO Customer
VALUES
('ANIL','KOLKATA'),	
('SUNIL','DELHI'),	
('MEHUL','BARODA'),
('MANDAR','PATNA'),	
('MADHURI','NAGPUR'),	
('PRAMOD','NAGPUR'),	
('SANDIP','SURAT'),	
('SHIVANI','MUMBAI'),	
('KRANTI','MUMBAI'),	
('NAREN','MUMBAI')

INSERT INTO Deposit
VALUES
(100,'ANIL','VRCE',1000,'1-Mar-1995'),	
(101,'SUNIL','AJNI',5000,'4-Jan-1996'),	
(102,'MEHUL','KAROLBAGH',3500,'17-Nov-1995'),	
(104,'MADHURI','CHANDNI',1200,'17-Dec-1995'),	
(105,'PRAMOD','M.G.ROAD',3000,'27-Mar-1996'),	
(106,'SANDIP','ANDHERI',2000,'31-Mar-1996'),	
(107,'SHIVANI','VIRAR',1000,'5-Sep-1995'),	
(108,'KRANTI','NEHRU PLACE',5000,'2-Jul-1995'),	
(109,'NAREN','POWAI',7000,'10-Aug-1995')

INSERT INTO Borrow
VALUES
(201,'ANIL','VRCE',1000),
(206,'MEHUL','AJNI',5000),
(311,'SUNIL','DHARAMPETH',3000),
(321,'MADHURI','ANDHERI',2000),
(375,'PRAMOD','VIRAR',8000),
(481,'KRANTI','NEHRU PLACE',3000)


--step 2


/*Q1: Create a Store Procedure which will accept name of the customer as input parameter and product the following output, List Names of Customers who are Depositors and have Same Branch City as that of input parameter customer’s Name.*/


/****** Object:  StoredProcedure [dbo].[uspGetCustomerInfo]    Script Date: 06-09-2021 15:45:01 ******/

CREATE PROCEDURE [dbo].[uspGetCustomerInfo]
@customerName VARCHAR(18)=NULL
AS
BEGIN
	IF @customerName IS NULL
	BEGIN
		PRINT'Provide the customer name'
		RETURN (1)
	END

	SET NOCOUNT ON;

	SELECT d.Cname FROM Deposit d
		INNER JOIN Customer c ON c.Cname = d.Cname
		INNER JOIN Branch b ON b.Bname = d.Bname
	WHERE b.City LIKE (SELECT City FROM Customer WHERE Cname = @customerName)
	
	SET NOCOUNT OFF;
END
GO

EXEC dbo.uspGetCustomerInfo 'PRAMOD'

DROP PROCEDURE dbo.uspGetCustomerInfo


/* 2: Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format, All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account */

ALTER PROCEDURE [dbo].[uspGetCustomerInfo]
@Cname VARCHAR(18) = NULL,
@Cdata NVARCHAR(MAX) OUTPUT
AS
BEGIN
IF @Cname IS NULL
	BEGIN
		PRINT'Provide the customer name'
		RETURN (1)
	END

	SET NOCOUNT ON;

	SET @Cdata = (SELECT Cname 
		FROM Deposit d
		WHERE Bname IN (SELECT Bname FROM Deposit WHERE Cname = @Cname)
		FOR JSON AUTO)

	SET NOCOUNT OFF;
END
GO

DECLARE @Cdata NVARCHAR(MAX);

EXEC dbo.uspGetCustomerInfo 'SHIVANI',@Cdata OUTPUT;

SELECT @Cdata

DROP PROC dbo.uspGetCustomerInfo

/*3.Create a Store Procedure that will accept city name and returns the number of customers in that city.*/
CREATE PROCEDURE dbo.uspCustOfSameCity
@City VARCHAR(18)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT COUNT(Cname)AS CustomerCount
	FROM Customer
	WHERE City=@City
	
	SET NOCOUNT OFF;
END


EXEC dbo.uspCustOfSameCity 'Mumbai'


/*Create a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON format List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI*/

ALTER PROCEDURE proc4
@City VARCHAR(18)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT c.Cname FROM Customer c
	JOIN Deposit d ON d.Cname = c.Cname
	JOIN Branch b ON  b.Bname = d.Bname
	WHERE c.City = @City AND b.City IN('Delhi','Mumbai')
	FOR JSON AUTO

	SET NOCOUNT OFF;
END

EXEC proc4 'Nagpur'

/* Count the Number of Customers Living in the City where Branch is Located */



CREATE OR ALTER PROCEDURE [dbo].[Proc5]
@branchName VARCHAR(18)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @city VARCHAR(18) = (SELECT City FROM Branch WHERE Bname=@branchName)
	SELECT COUNT(Cname) FROM Customer 
	WHERE City = @city
	
	SET NOCOUNT OFF;
END
GO


EXEC Proc5 'POWAI'



/*
Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount  And insert these record in the Deposit table. Before inserting some validation should be done like amount should be greater than 10Rs. and date should always be current date.*/



CREATE PROCEDURE proc6
@jsonData NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Customer
	SELECT Cname,City AS Adate FROM OPENJSON(@jsonData)
		WITH (
			Cname VARCHAR(18) '$.Cname',
			City VARCHAR(18) '$.City',
			ActNo INT '$.ActNo',
			Bname VARCHAR(18) '$.Bname',
			Amount INT '$.Amount'
		)

	INSERT INTO Deposit
		SELECT ActNo,Cname,Bname,Amount,GETDATE() AS Adate FROM OPENJSON(@jsonData)
		WITH (
			Cname VARCHAR(18) '$.Cname',
			City VARCHAR(18) '$.City',
			ActNo INT '$.ActNo',
			Bname VARCHAR(18) '$.Bname',
			Amount INT '$.Amount'
		)
	SET NOCOUNT OFF;
END



DECLARE @json NVARCHAR(MAX)
SET @json = N'[
	{
		"Cname":"AKASH",
		"City":"DELHI",
		"ActNo":110,
		"Bname":"NEHRU PLACE",
		"Amount":4000
	}
]'

EXEC proc6 @json

SELECT * FROM Deposit
SELECT * FROM Customer


