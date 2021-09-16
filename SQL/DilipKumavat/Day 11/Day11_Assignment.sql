CREATE DATABASE rxweb_day11

USE rxweb_day11

CREATE TABLE Customer
(
	Cname VARCHAR(19) PRIMARY KEY,
	City VARCHAR(18) not null
)

INSERT INTO Customer VALUES ('Anil','Kolkata'),
							('Sunil','Delhi'),
							('Mehul','Baroda'),
							('Mandar','Patna'),
							('Madhuri','Nagpur'),
							('Pramod','Nagpur'),
							('Sandip','Surat'),
							('Shivani','Mumbai'),
							('Kranti','Mumbai'),
							('Naren','Mumbai')


CREATE TABLE Branch
(
    BName VARCHAR(18) PRIMARY KEY,
    City VARCHAR(18) NOT NULL
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



CREATE TABLE Deposite
(
	ActNo VARCHAR(5) PRIMARY KEY,
	Cname VARCHAR(19) CONSTRAINT FK_Cname FOREIGN KEY (Cname) REFERENCES Customer(Cname),
	Bname VARCHAR(18) CONSTRAINT FK_Bname FOREIGN KEY (Bname) REFERENCES Branch(Bname),
	Amount INT not null,
	Adate DATE DEFAULT GETDATE(),
	CONSTRAINT chk_amount CHECK (Amount > 10)
)	

    INSERT INTO Deposite VALUES
    ('101','Sunil','Ajni',5000,'4-Jan-1996'),
    ('102','Mehul','Karolbagh',3500,'17-Nov-1995'),
    ('104','Madhuri','Chandni',1200,'17-Dec-1995'),
    ('105','Pramod','M.G.Road',3000,'27-Mar-1996'),
    ('106','Sandip','Andheri',2000,'31-Mar-1996'),
    ('107','Shivani','Virar',1000,'5-Sep-1995'),
    ('108','Kranti','Nehru Place',5000,'2-Jul-1995'),
    ('109','Naren','Powai',7000,'10-Aug-1995')



CREATE TABLE Borrow
(
    LoanNo VARCHAR(5) PRIMARY KEY,
    CName VARCHAR(19) CONSTRAINT chk_cname_borrow FOREIGN KEY(CName) REFERENCES Customer(CName),
    BName VARCHAR(18) CONSTRAINT chk_bname_borrow FOREIGN KEY(BName) REFERENCES Branch(BName),
    Amount INT NOT NULL
)

 

INSERT INTO Borrow VALUES
    ('201','Anil','Vrce',1000),
    ('206','Mehul','Ajni',5000),
    ('311','Sunil','Dharampeth',3000),
    ('321','Madhuri','Andheri',2000),
    ('375','Pramod','Virar',8000),
    ('481','Kranti','Nehru Place',3000)

SELECT * FROM Customer
SELECT * FROM Deposite
SELECT * FROM Branch


--- Query 1 Create a Store Procedure which will accept name of the customer as input parameter and product the following output
--- List Names of Customers who are Depositors and have Same Branch City as that of input parameter customer’s Name. ---
ALTER PROCEDURE Query1
@CustomerName VARCHAR(20)
AS 
BEGIN
	SELECT dep.Cname FROM Deposite dep JOIN Branch br ON br.BName = dep.Bname WHERE br.City = (Select DISTINCT br.City FROM Deposite dep JOIN Branch br ON dep.Bname = br.BName WHERE dep.Cname = @CustomerName)
END

EXEC Query1 'Sunil'

TRUNCATE TABLE Deposite 

DELETE FROM Deposite WHERE Adate = NULL




--- Query 2 Create a Store Procedure which will accept name of the customer as input parameter and produce the following 
--- output List in JSON format, All the Depositors Having Depositors Having Deposit in All the Branches where 
---- input parameter customer is Having an Account

CREATE PROCEDURE Query2
@CustomerName VARCHAR(20)
AS 
BEGIN
	SELECT * FROM Deposite dep WHERE dep.Bname = (SELECT dep.Bname FROM Deposite dep WHERE dep.Cname = @CustomerName) 
	OR dep.Bname = (SELECT  br.BName FROM  Borrow br WHERE br.CName = @CustomerName) FOR JSON PATH --- FOR JSON AUTO ---
END


EXEC Query2 'Madhuri'

--- Query 3  Create a Store Procedure that will accept city nam)e and returns the number of customers in that city. ---

CREATE PROCEDURE Query3
@CityName VARCHAR(10)
AS 
BEGIN
	SELECT COUNT(ctmr.Cname) AS 'Number of Customers' FROM Customer ctmr WHERE City = 'Mumbai'
END

EXEC Query3 'Mumbai'


--- Query 4 Create a Store Procedure which will accept city of the customer as input parameter and product the following output List 
--- in JSON format List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI

CREATE PROCEDURE Query4
@CityName VARCHAR(10)
AS 
BEGIN
	SELECT * FROM Customer ctmr JOIN Deposite dep 
	ON dep.Cname = ctmr.Cname Join Branch br 
	ON br.BName = dep.Bname 
	WHERE ctmr.City = @CityName 
	AND br.City IN ('Mumbai','Delhi')
	FOR JSON AUTO
END

EXEC Query4 'Mumbai'

SELECT * FROM Deposite
SELECT * FROM Customer
SELECT * FROM Branch
TRUNCATE TABLE Deposite 

DELETE FROM Deposite WHERE Adate = NULL


--- QUery 5: Count the Number of Customers Living in the City where Branch is Located ----
CREATE PROCEDURE Query5
AS 
BEGIN
	SELECT  COUNT(DISTINCT ctmr.Cname) AS 'Count' FROM Customer ctmr JOIN Branch br ON br.City = ctmr.City 
END 

EXEC Query5



--- Query  6 Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount  
--- And insert these record in the Deposit table. Before inserting some validation should be done like amount should be greater than 10Rs. 
---and date should always be current date. ---


CREATE PROCEDURE GetuspInsertToDeposit
@Json NVARCHAR(MAX)
AS
BEGIN

INSERT INTO Deposite
SELECT * FROM OPENJSON (@Json) 
WITH
(  
    ActNo VARCHAR(5)'$.ACTNO',
    Cname VARCHAR(19) '$.CName' ,
    Bname VARCHAR(18) '$.BName',
    Amount INT '$.Amount',
	Adate DATE
 )
END
GO
DECLARE @JSON NVARCHAR(MAX) = '[
	{
		"CName":"Anil","City":"Kolkata","ACTNO":"200","BName":"Vrce","Amount":1000
	},
	{
		"CName":"Sunil","City":"Delhi","ACTNO":"201","BName":"Ajni","Amount":5000
	},
	{
		"CName":"Mehul","City":"Baroda","ACTNO":"202","BName":"Karolbagh","Amount":3500
	},
	{
		"CName":"Madhuri","City":"Nagpur","ACTNO":"204","BName":"Chandni","Amount":1200
	},
	{
		"CName":"Pramod","City":"Nagpur","ACTNO":"205","BName":"M.G.Road","Amount":3000
	},
	{	
		"CName":"Sandip","City":"Surat","ACTNO":"206","BName":"Andheri","Amount":2000
	},
	{
		"CName":"Shivani","City":"Mumbai","ACTNO":"207","BName":"Virar","Amount":1000
	},
	{
		"CName":"Kranti","City":"Mumbai","ACTNO":"208","BName":"Nehru Place","Amount":5000
	},
	{
		"CName":"Naren","City":"Mumbai","ACTNO":"209","BName":"Powai","Amount":7000
	}]'

EXEC GetuspInsertToDeposit @JSON

SELECT ISJSON(@JSON)
SELECT * FROM Deposite
