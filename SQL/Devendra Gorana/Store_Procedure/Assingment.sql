--Assingment

--Create Tbales
CREATE TABLE Customer (CName Varchar(19) PRIMARY KEY, City Varchar(18))  

INSERT INTO Customer VALUES ('Anil', 'Kolkata')
INSERT INTO Customer VALUES ('Sunil', 'Delhi')
INSERT INTO Customer VALUES ('Mehul', 'Baroda')
INSERT INTO Customer VALUES ('Mandar', 'Patna')
INSERT INTO Customer VALUES ('Madhuri', 'Nagpur')
INSERT INTO Customer VALUES ('Pramod', 'Nagpur')
INSERT INTO Customer VALUES ('Sandip', 'Surat')
INSERT INTO Customer VALUES ('Shivani', 'Mumbai')
INSERT INTO Customer VALUES ('Kranti', 'Mumbai')
INSERT INTO Customer VALUES ('Naren', 'Mumbai')

CREATE TABLE Branch (BName Varchar(18) PRIMARY KEY, City Varchar(18))

INSERT INTO Branch VALUES ('Vrce', 'Nagpur')
INSERT INTO Branch VALUES ('Ajni', 'Nagpur')
INSERT INTO Branch VALUES ('Karolbagh', 'Delhi')
INSERT INTO Branch VALUES ('Chandni', 'Delhi')
INSERT INTO Branch VALUES ('Dharampeth', 'Nagpur')
INSERT INTO Branch VALUES ('M.G.Road', 'Banglore')
INSERT INTO Branch VALUES ('Andheri', 'Mumbai')
INSERT INTO Branch VALUES ('Virar', 'Mumbai')
INSERT INTO Branch VALUES ('Nehru Place', 'Delhi')
INSERT INTO Branch VALUES ('Powai', 'Mumbai')


CREATE TABLE Deposit (ActNo Varchar(5) PRIMARY KEY, 
CName Varchar(19) FOREIGN KEY REFERENCES Customer(CName), 
BName Varchar(18) FOREIGN KEY REFERENCES Branch(BName), 
Amount Int, 
ADate Date)

INSERT INTO Deposit VALUES (100, 'Anil', 'Vrce', 1000, '1-Mar-1995')	
INSERT INTO Deposit VALUES (101, 'Sunil', 'Ajni', 5000, '4-Jan-1996')
INSERT INTO Deposit VALUES (102, 'Mehul', 'Karolbagh', 3500, '17-Nov-1995')	
INSERT INTO Deposit VALUES (104, 'Madhuri', 'Chandni', 1200, '17-Dec-1995')
INSERT INTO Deposit VALUES (105, 'Pramod', 'M.G.Road', 3000, '27-Mar-1996')	
INSERT INTO Deposit VALUES (106, 'Sandip', 'Andheri', 2000, '31-Mar-1996')
INSERT INTO Deposit VALUES (107, 'Shivani', 'Virar', 1000, '5-Sep-1995')
INSERT INTO Deposit VALUES (108, 'Kranti', 'Nehru Place', 5000, '2-Jul-1995')	
INSERT INTO Deposit VALUES (109, 'Naren', 'Powai', 7000, '10-Aug-1995')

CREATE TABLE Borrow (LoanNo Varchar(5) PRIMARY KEY, 
CName Varchar(19) FOREIGN KEY REFERENCES Customer(CName), 
BName Varchar(18) FOREIGN KEY REFERENCES Branch(BName), 
Amount Int)

INSERT INTO Borrow VALUES (201, 'Anil', 'Vrce', 1000)
INSERT INTO Borrow VALUES (206, 'Mehul', 'Ajni', 5000)
INSERT INTO Borrow VALUES (311, 'Sunil', 'Dharampeth', 3000)
INSERT INTO Borrow VALUES (321, 'Madhuri', 'Andheri', 2000)
INSERT INTO Borrow VALUES (375, 'Pramod', 'Virar', 8000)
INSERT INTO Borrow VALUES (481, 'Kranti', 'Nehru Place', 3000)


--Create the queries 
--Q1: Create a Store Procedure which will accept name of the customer as input parameter and product the following output, List Names of Customers who are Depositors and have Same Branch City as that of input parameter customer’s Name.

CREATE PROCEDURE P1
@CName Varchar(19)
AS
SET NOCOUNT ON;
SELECT CName FROM Deposit d JOIN Branch b ON d.BName = b.BName 
WHERE b.City = (SELECT City FROM Branch WHERE BName = 
(SELECT BName FROM Deposit WHERE CName=@CName))
GO

EXECUTE P1 'Madhuri'

--Q2: Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format, All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account
CREATE PROCEDURE P2 
@CName Varchar(19) 
AS 
SET NOCOUNT ON;
SELECT CName FROM Deposit 
WHERE BName IN (SELECT BName FROM Deposit WHERE CName = @CName)
FOR JSON PATH
GO

EXECUTE P2 'Madhuri'


--Q3: Create a Store Procedure that will accept city name and returns the number of customers in that city
CREATE PROCEDURE P3 
@City Varchar(18) 
AS
SET NOCOUNT ON 
SELECT COUNT(CName) AS TotalCustomer FROM Customer
WHERE City = @City
GO

EXEC P3 'Nagpur'

--Q4: Create a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON format List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI
ALTER PROCEDURE P4 
@City Varchar(18) 
AS
SET NOCOUNT ON; 
SELECT d.CName FROM Deposit d 
JOIN Branch b ON d.BName = b.BName
JOIN Customer c ON d.CName = C.CName 
WHERE c.City = @City AND b.City IN ('Mumbai','Delhi')
GO

EXEC P4 'Mumbai'

--Q5: Count the Number of Customers Living in the City where Branch is Located
CREATE PROCEDURE P5  
AS
SET NOCOUNT ON;
SELECT COUNT(Deposit.CName) FROM Deposit   
JOIN Customer c ON Deposit.CName = c.CName 
JOIN Branch b ON Deposit.BName = b.BName 
WHERE c.City = b.City 
GO

EXEC P5

--Q6: Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount  
ALTER PROCEDURE P6
@JSON Nvarchar(Max)
AS
SET NOCOUNT ON;
DECLARE @Amount Int 
SELECT @Amount=Amount FROM OPENJSON(@JSON)
WITH
(
Amount Int '$.Amount'
)
IF @Amount > 10
INSERT INTO Deposit (ActNo,CName,BName,Amount,ADate)
SELECT ActNo,CName,BName,Amount,Adate = GETDATE()
FROM OPENJSON(@JSON)
WITH
(
	ActNo Varchar(5) '$.ActNo',
	CName Varchar(19) '$.CName',
	BName Varchar(18) '$.BName',
	Amount Int '$.Amount'
)
ELSE
BEGIN 
PRINT 'Error!, Amount Should Be Greater Then 10 Rs.' + 'Try Again' 
END
GO

INSERT INTO Customer VALUES ('Dev', 'Ahmedabad')
EXEC P6 N'{"ActNo" : 110,"CName":"Dev","BName" : "M.G.Road","Amount" : 9}'
--DELETE FROM Deposit WHERE ActNo = 110
SELECT * FROM Deposit