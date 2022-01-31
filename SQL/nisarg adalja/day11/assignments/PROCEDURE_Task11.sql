
CREATE Database Task11_12
use Task11_12

CREATE TABLE customer(
CNAME VARCHAR(19) primary key,
CITY VARCHAR(18)
)
CREATE TABLE branch(
BNAME VARCHAR(18) primary key,
CITY VARCHAR(18)
)

CREATE TABLE deposit(
ACTNO VARCHAR(5) primary key,
Cname VARCHAR(19) CONSTRAINT fkcname2 FOREIGN key REFERENCES Customer(CNAME), 
Bname VARCHAR(18) CONSTRAINT fkbname2 foreign key REFERENCES Branch(BNAME), 
Amount int,
Adate DATE
)
CREATE TABLE borrow(
LOANNO VARCHAR(5) primary key,
Cname VARCHAR(19) CONSTRAINT fkcname FOREIGN key REFERENCES Customer(CNAME), 
Bname VARCHAR(18) CONSTRAINT fkbname foreign key REFERENCES Branch(BNAME), 
Amount int,
)

insert INTO customer values ('ANIL','KOLKATA'),	
('SUNIL','DELHI'),
('MEHUL','BARODA'),	
('MANDAR','PATNA'),
('MADHURI','NAGPUR'),	
('PRAMOD','NAGPUR'),
('SANDIP','SURAT'),
('SHIVANI','MUMBAI'),	
('KRANTI','MUMBAI'),
('NAREN','MUMBAI');

insert INTO branch values('VRCE','NAGPUR'),
('AJNI','NAGPUR'),	
('KAROLBAGH','DELHI'),	
('CHANDNI','DELHI'),
('DHARAMPETH','NAGPUR'),	
('M.G.ROAD','BANGLORE'),	
('ANDHERI','MUMBAI'),
('VIRAR',	'MUMBAI'	),
('NEHRU PLACE','DELHI'),	
('POWAI','MUMBAI');

insert INTO borrow values(201,'ANIL','VRCE',1000),
(206	,'MEHUL',	'AJNI',5000),
(311,'SUNIL','DHARAMPETH',3000),	
(321	,'MADHURI','ANDHERI',2000),
(375	,'PRAMOD','VIRAR',8000),
(481,'KRANTI','NEHRU PLACE',3000);

insert INTO deposit values(100,'ANIL','VRCE',1000,'1-Mar-1995'),
(101,'SUNIL','AJNI',5000,'4-Jan-1996'),	
(102,'MEHUL','KAROLBAGH',3500,'17-Nov-1995'),	
(104,'MADHURI','CHANDNI',1200,'17-Dec-1995'),
(105,'PRAMOD','M.G.ROAD',3000,'27-Mar-1996'),
(106,'SANDIP','ANDHERI',2000,'31-Mar-1996'),
(107,'SHIVANI','VIRAR',1000,'5-Sep-1995'),	
(108,'KRANTI','NEHRU PLACE',5000,'2-Jul-1995'),
(109,'NAREN','POWAI',7000,'10-Aug-1995');

/* query1 */
/* CREATE a Store Procedure which will accept name of the customer as input parameter and product the following output, List Names of Customers who are Depositors and have Same Branch City as that of input parameter customer’s Name. */
CREATE procedure CustomerDepositor
@CNAME varchar(19)
as
begin
	SELECT * FROM customer c join deposit d on c.CNAME=d.Cname join branch b on d.Bname=b.BNAME where b.City=(SELECT CITY FROM Customer where CNAME=@CNAME);   
end

exec CustomerDepositor 'SUNIL'

/* Query2 */
/* CREATE a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format, All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account */


CREATE PROCEDURE uspGetCustomerInfo
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

EXEC uspGetCustomerInfo 'SHIVANI',@Cdata OUTPUT;

SELECT @Cdata

DROP PROC uspGetCustomerInfo



/*query 3 */
/*  CREATE a Store Procedure that will accept city name and returns the number of customers in that city. */
CREATE procedure NumberOfCustomerInCity
@city varchar(20)
as
begin
 SELECT Count(CNAME) as NumberOfCustomer FROM customer where City=@city;
 return
 
end

exec NumberOfCustomerInCity 'MUMBAI' 

/* Query4 */
/* CREATE a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON format List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI */

CREATE PROCEDURE proc4
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



/* Query5 */
/*  Count the Number of Customers Living in the City where Branch is Located */


CREATE OR ALTER PROCEDURE Proc5
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

exec Proc5 'POWI'

/* Query 6 */
/*  CREATE a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount */

CREATE procedure proc6 
@json nvarchar(max)
as
begin
	insert INTO Customer 
	SELECT Cname,city FROM openjson(@json)
	with(
		Cname varchar(19) '$.Cname',
		City varchar(18) '$.City',
		ACTNO int '$.actno',
		Bname varchar(18) '$.Bname',
		Amount int '$.amount'
	)
	insert INTO Deposit
		SELECT ActNo,Cname,Bname,Amount,GETDATE() AS Adate FROM OPENJSON(@json)
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
		"Cname":"Deep",
		"City":"DELHI",
		"ActNo":113,
		"Bname":"NEHRU PLACE",
		"Amount":5000
	}
]'

EXEC proc6 @json

SELECT * FROM Deposit
SELECT * FROM Customer

