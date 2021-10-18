CREATE TABLE Customer
(	
	Cname VARCHAR(50) PRIMARY KEY,
	City VARCHAR(50)
)

INSERT INTO Customer
VALUES ('ANIL','KOLKATA'),
	   ('SUNIL','DELHI'),
	   ('MEHUL','BARODA'),		
	   ('MANDAR','PATNA'),	
	   ('MADHURI','NAGPUR'),	
	   ('PRAMOD','NAGPUR'),	
	   ('SANDIP','SURAT'),	
	   ('SHIVANI','MUMBAI'),	
	   ('KRANTI','MUMBAI'),	
	   ('NAREN','MUMBAI')

CREATE TABLE Branch
(
	Bname VARCHAR(50) PRIMARY KEY,
	City VARCHAR(18)
)
 
INSERT INTO Branch
VALUES('VRCE','NAGPUR'),	
	   ('AJNI','NAGPUR'),	
	   ('KAROLBAGH','DELHI'),	
	   ('CHANDNI','DELHI'),	
	   ('DHARAMPETH','NAGPUR'),	
	   ('M.G.ROAD','BANGLORE'),	
	   ('ANDHERI','MUMBAI'),	
	   ('VIRAR','MUMBAI'),	
	   ('NEHRU PLACE','DELHI'),	
	   ('POWAI','MUMBAI')

CREATE TABLE Borrow
(
	LoanNo VARCHAR(5) PRIMARY KEY,
	Cname VARCHAR(50),
	Bname VARCHAR(50),
	Amount INT,
	CONSTRAINT Borrow_fk_Cname FOREIGN KEY (Cname) REFERENCES Customer(Cname),	
	CONSTRAINT Borrow_fk_Bname FOREIGN KEY (Bname) REFERENCES Branch(Bname)
)


INSERT INTO Borrow
VALUES(201,'ANIL','VRCE',1000),
	  (206,'MEHUL','AJNI',5000),
	  (311,'SUNIL','DHARAMPETH',3000),	
	  (321,'MADHURI','ANDHERI',2000),
	  (375,'PRAMOD','VIRAR',8000),	
	  (481,'KRANTI','NEHRU PLACE',3000)

CREATE TABLE Deposit
(
	ACTNO VARCHAR(5) PRIMARY KEY,
	Cname VARCHAR(50),
	Bname VARCHAR(50),
	Amount INT,
	Adate DATE,
	CONSTRAINT Deposite_fk_Cname FOREIGN KEY (Cname) REFERENCES Customer(Cname),
	CONSTRAINT Deposite_fk_Bname FOREIGN KEY (Bname) REFERENCES Branch(Bname)
)

INSERT INTO Deposit

VALUES (100,'ANIL','VRCE',1000,'1-Mar-1995'),
	   (101,'SUNIL','AJNI',5000,'4-Jan-1996'),
	   (102,'MEHUL','KAROLBAGH',3500,'17-Nov-1995'),
	   (104,'MADHURI','CHANDNI',1200,'17-Dec-1995'),
	   (105,'PRAMOD','DHARAMPETH',3000,'27-Mar-1996'),
	   (106,'SANDIP','M.G.ROAD',2000,'31-Mar-1996'),
	   (107,'SHIVANI','ANDHERI',1000,'5-Sep-1995'),
	   (108,'KRANTI','VIRAR',5000,'2-Jul-1995'),	
	   (109,'NAREN','NEHRU PLACE',7000,'10-Aug-1995')

SELECT * FROM Branch
SELECT * FROM Customer
SELECT * FROM Deposit
SELECT * FROM Borrow



						--!**!Assignment Quries!**!
--1.
-- Create a Store Procedure which will accept name of the customer as input parameter and product the 
--following output, List Names of Customers who are Depositors and have Same Branch City as that of input 
--parameter customer’s Name.

-- =============================================
-- Author:		<VipulDabhi>
-- Create date: <07-09-2021>
-- Description:	<Store Procedure For Customer Who are Depositer And Have Same Branch City as input Parameter Customer have >
-- =============================================
ALTER PROCEDURE CustomerWithSameBranchcity  @Cname VARCHAR(50) 
AS
BEGIN
		
		SELECT d.Cname FROM Deposit d JOIN Branch b ON d.Bname = b.Bname
			WHERE b.City = (SELECT City FROM Branch WHERE 
				Bname = (SELECT Bname FROM Deposit WHERE Cname = @Cname))
END
EXEC CustomerWithSameBranchcity @Cname='MEHUL'

--2.
--Create a Store Procedure which will accept name of the customer as input parameter and produce the
--following output List in JSON format, All the Depositors Having Depositors Having Deposit in All
--the Branches where input parameter customer is Having an Account

-- =============================================
-- Author:		<VipulDabhi>
-- Create date: <07-09-2021>
-- Description:	<Json Value of Depositer who Deposite In Same Account Where Input Parameter Customer Have Account>
-- =============================================
ALTER PROCEDURE CustomerNameInJson @Cname VARCHAR(40)
AS
BEGIN
		
	SELECT * FROM Deposit WHERE Bname = 
		(SELECT Bname FROM Deposit WHERE Cname = @Cname) 
			FOR JSON AUTO

END

--3.
-- Create a Store Procedure that will accept city name and returns the number of customers in that city.

-- =============================================
-- Author:		<VipulDabhi>
-- Create date: <07-09-2021>
-- Description:	<Number Of Customer In given City>
-- =============================================
CREATE PROCEDURE CustomerCountInCity @City VARCHAR(40),@CustomerCount INT OUTPUT
AS
BEGIN

	SELECT @CustomerCount = COUNT(Cname) FROM Customer 
		WHERE City = @City

END

--4.
--Create a Store Procedure which will accept city of the customer as input parameter and product the following output 
--List in JSON format 
--List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI

-- =============================================
-- Author:		<VipulDabhi>
-- Create date: <07-09-2021>
-- Description:	<Customer Living in Same City As input Parameter And Having Branch City 'MUMBAI' And 'DELHI' >
-- =============================================
ALTER PROCEDURE CustomerHavinBranchcityMumbai @City VARCHAR(40)
AS
BEGIN
	
	SELECT d.Cname FROM Customer c JOIN Deposit d ON c.Cname = d.Cname JOIN Branch b ON d.Bname = b.Bname
		WHERE c.City = @City AND b.City IN ('MUMBAI','DELHI')
			FOR JSON AUTO

END

EXEC CustomerHavinBranchcityMumbai 'NAGPUR'

--5.
-- Count the Number of Customers Living in the City where Branch is Located
-- =============================================
-- Author:		<VipulDabhi>
-- Create date: <07-09-2021>
-- Description:	<Customer Count As per City Where Input Parameter Branch Is Located >
-- =============================================

ALTER PROCEDURE usp_CustomerCountAsBranchCity 
AS
BEGIN
	
	SELECT COUNT(c.Cname) AS NoOfCustomer FROM Deposit d JOIN Branch b ON d.Bname = b.Bname JOIN Customer c
	ON d.Cname = c.Cname WHERE c.City = b.City
		
END

EXEC usp_CustomerCountAsBranchCity 


--6.
-- Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount  
--And insert these record in the Deposit table. Before inserting some validation should be done like 
--amount should be greater than 10Rs. and date should always be current date.

ALTER PROCEDURE usp_JsonCustomerDetails @CustomerDetails NVARCHAR(MAX)
AS
BEGIN

	INSERT INTO Deposit 
		SELECT ACTNO,Cname,Bname,Amount,City FROM OPENJSON(@CustomerDetails) 
		WITH(
			ACTNO INT,
			Cname VARCHAR(40),
			Bname VARCHAR(40),
			Amount INT,
			City VARCHAR(40),
			Adate DATE
		) WHERE Amount > 10 AND Adate = GETDATE()

END


DECLARE @CustomerDetails NVARCHAR(MAX)= N'INSERT JSON TEXT'
EXEC usp_JsonCustomerDetails @CustomerDetails



