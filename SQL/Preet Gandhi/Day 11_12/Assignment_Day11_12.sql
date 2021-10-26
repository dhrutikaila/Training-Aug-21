CREATE DATABASE Day11_SQL


CREATE TABLE Branch
(
	BName VARCHAR(18) PRIMARY KEY,
	City VARCHAR(18) NOT NULL
)

CREATE TABLE Customer
(
    CName VARCHAR(19) PRIMARY KEY,
    City VARCHAR(18) NOT NULL
)

CREATE TABLE Deposit
(
    ActNo VARCHAR(5) PRIMARY KEY,
    CName VARCHAR(19) CONSTRAINT chk_cname_deposit FOREIGN KEY (CName) REFERENCES Customer(CName),
    BName VARCHAR(18) CONSTRAINT chk_bname_deposit FOREIGN KEY (BName) REFERENCES Branch(BName),
    Amount INT CONSTRAINT chk_Amount CHECK(Amount > 10) NOT NULL,
    Adate DATE DEFAULT GETDATE()
)

CREATE TABLE Borrow
(
	LoanNo VARCHAR(5) PRIMARY KEY,
	CName VARCHAR(19) CONSTRAINT chk_cname_borrow FOREIGN KEY(CName) REFERENCES Customer(CName),
	BName VARCHAR(18) CONSTRAINT chk_bname_borrow FOREIGN KEY(BName) REFERENCES Branch(BName),
	Amount INT NOT NULL
)

INSERT INTO Branch VALUES
	('Vrce','Nagpur'),
	('Ajni','Nagpur'),
	('Karolbagh','Delhi'),
	('Chandni','Delhi'),
	('Dharampeth','Nagpur'),
	('M.G.Road','Banglore'),
	('Andheri','Mumbai'),
	('Virar','Mumbai'),
	('Nehru Place','Delhi'),
	('Powai','Mumbai')

INSERT INTO Customer VALUES 
	('Anil','Kolkata') ,
    ('Sunil','Delhi'),
    ('Mehul','Baroda'),
    ('Mandar','Patna'),
    ('Madhuri','Nagpur'),
    ('Pramod','Nagpur'),
    ('Sandip','Surat'),
    ('Shivani','Mumbai'),
    ('Kranti','Mumbai'),
    ('Naren','Mumbai')

INSERT INTO Deposit VALUES 
	('100','Anil','Vrce',1000,'1-MAR-1995'),
	('101','Sunil','Ajni',5000,'4-Jan-1996'),
	('102','Mehul','Karolbagh',3500,'17-Nov-1995'),
    ('104','Madhuri','Chandni',1200,'17-Dec-1995'),
    ('105','Pramod','M.G.Road',3000,'27-Mar-1996'),
    ('106','Sandip','Andheri',2000,'31-Mar-1996'),
    ('107','Shivani','Virar',1000,'5-Sep-1995'),
    ('108','Kranti','Nehru Place',5000,'2-Jul-1995'),
    ('109','Naren','Powai',7000,'10-Aug-1995')

INSERT INTO Borrow VALUES
	('201','Anil','Vrce',1000),
	('206','Mehul','Ajni',5000),
	('311','Sunil','Dharampeth',3000),
	('321','Madhuri','Andheri',2000),
	('375','Pramod','Virar',8000),
	('481','Kranti','Nehru Place',3000)


--1)Create a Store Procedure which will accept name of the customer as input parameter 
--  and product the following output, List Names of Customers who are Depositors 
--  and have Same Branch City as that of input parameter customer’s Name.
-- =============================================
-- Author:		<Preet,Name>
-- Create date: <2021-09-06>
-- Description:	<Description,,>
--EXEC GetuspDepositors @CName = 'Sunil'
-- =============================================
CREATE PROCEDURE GetuspDepositors @CName VARCHAR(20)
AS
BEGIN
SELECT dep2.CName FROM Deposit AS dep2 
INNER JOIN Branch AS br2 ON dep2.BName=br2.BName 
WHERE br2.City IN
(SELECT DISTINCT br1.City FROM Deposit AS dep1 
INNER JOIN Branch AS br1 ON dep1.BName=br1.BName
WHERE dep1.CName=@CName)
END
GO

EXEC GetuspDepositors @CName = 'Sunil'


--2)Create a Store Procedure which will accept name of the customer as input parameter 
--  and produce the following output List in JSON format, All the Depositors Having Depositors 
--  Having Deposit in All the Branches where input parameter customer is Having an Account
-- =============================================
-- Author:		<Preet,Name>
-- Create date: <2021-09-06>
-- Description:	<Description,,>
--EXEC GetuspDepositorsName @CName='Mehul'
-- =============================================
CREATE PROCEDURE GetuspDepositorsName @CName VARCHAR(20)
AS
BEGIN
	SELECT dep2.CName,dep2.BName FROM Deposit AS dep2 WHERE dep2.BName IN
	(SELECT dep1.BName FROM Deposit AS dep1 WHERE dep1.CName=@CName) 
	OR dep2.BName IN
	(SELECT brw1.BName FROM Borrow AS brw1 WHERE brw1.CName=@CName) FOR JSON PATH
END
GO

EXEC GetuspDepositorsName @CName='Madhuri'


--3)Create a Store Procedure that will accept city name and returns the number of customers in that city.
-- =============================================
-- Author:		<Preet,Name>
-- Create date: <2021-09-06>
-- Description:	<Description,,>
--EXEC GetuspCountCustomer @City = 'Nagpur'
-- =============================================
CREATE PROCEDURE GetuspCountCustomer @City VARCHAR(15)
AS 
BEGIN
	SELECT  City, COUNT(CName) AS 'TotalCustomer' FROM Customer WHERE City = @City GROUP BY City
END
GO

EXEC GetuspCountCustomer @City = 'Nagpur'


--4)Create a Store Procedure which will accept city of the customer as input parameter 
--and product the following output List in JSON format List All the Customers Living in city 
--provided in input parameter and Having the Branch City as MUMBAI or DELHI
-- =============================================
-- Author:		<Preet,Name>
-- Create date: <2021-09-06>
-- Description:	<Description,,>
--EXEC GetuspCustomers @City = 'SURAT'
-- =============================================
CREATE PROCEDURE GetuspCustomers @City VARCHAR(15)
AS
BEGIN
	SELECT DISTINCT cus.CName FROM Customer AS cus 
	INNER JOIN Deposit AS dep ON cus.CName = dep.CName
	INNER JOIN Branch AS br ON dep.BName = br.BName
	WHERE cus.City = @City AND br.City IN ('Mumbai','Delhi') FOR JSON PATH
END
GO

EXEC GetuspCustomers @City = 'SURAT'

--5)Count the Number of Customers Living in the City where Branch is Located
-- =============================================
-- Author:		<Preet,Name>
-- Create date: <2021-09-06>
-- Description:	<Description,,>
--EXEC GetuspCusCount_BranchLocated
-- =============================================
CREATE PROCEDURE GetuspCusCount_BranchLocated
AS
BEGIN
	SELECT COUNT(DISTINCT cus1.CName) AS 'Customers' FROM Customer AS cus1 
	INNER JOIN Branch AS br1 ON cus1.City=br1.City
END
GO

EXEC GetuspCusCount_BranchLocated

--6) Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount  
--And insert these record in the Deposit table. Before inserting some validation should be done like 
--amount should be greater than 10Rs. and date should always be current date.
-- =============================================
-- Author:		<Preet,Name>
-- Create date: <2021-09-06>
-- Description:	<Description,,>
--
-- =============================================
/*SELECT Cus.CName,Cus.City,Dep.ACTNO,Dep.BName,Dep.Amount 
FROM Customer AS Cus INNER JOIN Deposit AS Dep 
ON Cus.CName = Dep.CName FOR JSON PATH*/

CREATE PROCEDURE GetuspInsertToDeposit @JSON NVARCHAR(MAX)
AS
BEGIN 
INSERT INTO Deposit
SELECT * FROM OPENJSON (@JSON)  
WITH 
(   
	ACTNO VARCHAR(5)'$.ACTNO',
	CName VARCHAR(18) '$.CName' , 
    BName VARCHAR(18) '$.BName',  
    Amount INT '$.Amount',
	Adate DATE
	 )
END
GO

DECLARE @JSON NVARCHAR(MAX) = '[{"CName":"Anil","City":"Kolkata","ACTNO":"200","BName":"Vrce","Amount":1000},{"CName":"Sunil","City":"Delhi","ACTNO":"201","BName":"Ajni","Amount":5000},{"CName":"Mehul","City":"Baroda","ACTNO":"202","BName":"Karolbagh","Amount":3500},{"CName":"Madhuri","City":"Nagpur","ACTNO":"204","BName":"Chandni","Amount":1200},{"CName":"Pramod","City":"Nagpur","ACTNO":"205","BName":"M.G.Road","Amount":3000},{"CName":"Sandip","City":"Surat","ACTNO":"206","BName":"Andheri","Amount":2000},{"CName":"Shivani","City":"Mumbai","ACTNO":"207","BName":"Virar","Amount":1000},{"CName":"Kranti","City":"Mumbai","ACTNO":"208","BName":"Nehru Place","Amount":5000},{"CName":"Naren","City":"Mumbai","ACTNO":"209","BName":"Powai","Amount":7000}]'
EXEC GetuspInsertToDeposit @JSON

SELECT * FROM Deposit
