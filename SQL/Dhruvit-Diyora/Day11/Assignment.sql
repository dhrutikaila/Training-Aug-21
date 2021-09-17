CREATE TABLE Deposit (
	ActNo VARCHAR (5) NOT NULL PRIMARY KEY, 
	Cname VARCHAR (19) FOREIGN KEY REFERENCES Customer(Cname), 
	Bname VARCHAR(18) FOREIGN KEY REFERENCES Branch(Bname), 
	Amount INT, 
	Adate DATE) 

INSERT INTO Deposit VALUES
	(100,'ANIL','VRCE',1000,'1-Mar-1995'),
	(101,'SUNIL','AJNI',5000,'4-Jan-1996'),
	(102,'MEHUL','KAROLBAGH',3500,'17-Nov-1995'),
	(104,'MADHURI','CHANDNI',1200,'17-Dec-1995'),
	(105,'PRAMOD','M.G.ROAD',3000,'27-Mar-1996'),
	(106,'SANDIP','ANDHERI',2000,'31-Mar-1996'),
	(107,'SHIVANI','VIRAR',1000,'5-Sep-1995'),
	(108,'KRANTI','NEHRU PLACE',5000,'2-Jul-1995'),
	(109,'NAREN','POWAI',7000,'10-Aug-1995')


CREATE TABLE Branch (
	Bname VARCHAR(18) PRIMARY KEY NOT NULL, 
	City VARCHAR(18))

INSERT INTO Branch VALUES 
	('VRCE','Nagpur'),
	('AJNI', 'Nagpur'),
	('KAROLBAGH', 'Delhi'),
	('CHANDNI', 'Delhi'),
	('DHARAMPETH', 'Nagpur'),
	('M.G.ROAD', 'Banglore'),
	('ANDHERI', 'Mumbai'),
	('VIRAR', 'Mumbai'),
	('NEHRU PLACE', 'Delhi'),
	('POWAI', 'Mumbai')


CREATE TABLE  Customer(
	Cname VARCHAR(19) NOT NULL PRIMARY KEY, 
	City VARCHAR(18))

INSERT INTO Customer VALUES 
	('Anil', 'Kolkata'),
	('Sunil', 'Delhi'),
	('Mehul', 'Baroa'),
	('Mandar', 'Patna'),
	('Madhuri', 'Nagpur'),
	('Pramod', 'Nagpur'),
	('Sandip', 'Surat'),
	('Shivani', 'Mumbai'),
	('Kranti', 'Mumbai'),
	('Naren', 'Mumbai')


CREATE TABLE Borrow(
	LoanNo VARCHAR (5) NOT NULL PRIMARY KEY, 
	Cname VARCHAR(19) FOREIGN KEY REFERENCES Customer(Cname), 
	Bname VARCHAR(18) FOREIGN KEY REFERENCES Branch(Bname), 
	Amount INT)

INSERT INTO Borrow VALUES 
(201,'ANIL','VRCE',1000),
(206,'MEHUL','AJNI',5000),
(311,'SUNIL','DHARAMPETH',3000),
(321,'MADHURI','ANDHERI',2000),
(375,'PRAMOD','VIRAR',8000),
(481,'KRANTI','NEHRU PLACE',3000)

--Q1: Create a Store Procedure which will accept name of the customer as input parameter and product the following output, List Names of Customers who are Depositors and have Same Branch City as that of input parameter customer’s Name.
CREATE PROCEDURE Depositers (@FirstName NVARCHAR(50) )
AS   
    SELECT D.CName AS 'Customer Name', D.Bname  AS 'Branch', City AS 'Branch City' FROM Deposit D JOIN Branch B ON D.Bname=B.Bname WHERE B.City IN 
		(SELECT BR.City FROM Deposit DE JOIN Branch BR ON DE.Bname=BR.Bname WHERE CName = @FirstName)
EXECUTE Depositers @FirstName=N'ANIL'

--Q2: Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format, All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account
CREATE PROCEDURE Depositors
	@CustomerName NVARCHAR(50)
AS
	SELECT D.Cname AS 'Depositors', D.Bname  AS 'Branch', City AS 'City' FROM Deposit D JOIN Branch B ON D.Bname=B.Bname WHERE D.Bname IN (SELECT De.Bname FROM Deposit De JOIN Branch BR ON De.Bname=BR.Bname WHERE De.Cname=@CustomerName) OR D.Bname IN (SELECT Bname FROM Borrow WHERE Cname= @CustomerName) 
EXECUTE Depositors @CustomerName=N'Pramod'
--Q3: Create a Store Procedure that will accept city name and returns the number of customers in that city.
CREATE PROCEDURE City @CityName NVARCHAR(50) AS	SELECT COUNT(DISTINCT Cname) AS 'Customers', City FROM Customer WHERE City = @CityName GROUP BY City 
EXECUTE City @CityName = 'Delhi'

--Q4: Create a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON format List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI
CREATE PROCEDURE Living	@CustCity NVARCHAR(50) AS	SELECT DISTINCT C.Cname AS 'Customer' FROM Customer C CROSS join Branch B WHERE C.City = @CustCity AND B.City IN ('Mumbai','Delhi') FOR JSON AUTO
EXECUTE Living @CustCity = N'Mumbai'

--Q5: Count the Number of Customers Living in the City where Branch is Located
CREATE PROCEDURE Customers
AS	SELECT COUNT(DISTINCT c.Cname) AS 'Customers', c.City FROM Customer c WHERE c.City IN (SELECT b.City FROM Branch b) GROUP BY c.City ORDER BY Customers DESC
EXECUTE Customers

--Q6: Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount  And insert these record in the Deposit table. Before inserting some validation should be done like amount should be greater than 10Rs. and date should always be current date.
CREATE PROCEDURE JSONData (@Json NVARCHAR(MAX))
AS
DECLARE @Jsonsss NVARCHAR(MAX)
SET @Jsonsss=
	N'[{"CustomerName":"Dhruvit","City":"Surat","AccountNumber":"123698","Branch":"Katargam","Amount":"10"},
	{"CustomerName":"Arbazsir","City":"Surat","AccountNumber":"10GOAT10","Branch":"Ved","Amount":"25"}
]';
INSERT INTO Deposit(Name,City,AccountNumber,Branch)
SELECT Name,City,AccountNumber,Branch FROM OPENJSON (@Json)
WITH (Name VARCHAR(200) '$.CustomerName' , City NVARCHAR(MAX) '$.City',AccountNumber VARCHAR(30)'$.AccountNumber',   Branch VARCHAR(50) '$.Branch', Amount INT '$.Amount')


CREATE TABLE Deposits
(
Name VARCHAR(50),
City VARCHAR(60),
Account VARCHAR(20),
Branch VARCHAR(30),
Amount INT CHECK (Amount>10),
Dates DATE
)

GO
CREATE PROCEDURE Banks @Insert NVARCHAR(MAX)
AS
BEGIN TRY
INSERT INTO Deposits(Name,City,Account,Branch,Amount,Dates)
SELECT Name,City,AccountNumber,Branch,Amount,GETDATE() FROM OPENJSON (@Insert)
WITH (
Name VARCHAR(200) '$.CustomerName' ,
City NVARCHAR(60) '$.City',
AccountNumber VARCHAR(30)'$.AccountNumber',
Branch VARCHAR(50) '$.Branch',
Amount INT '$.Amount'
)
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER() AS ErrorNumber,ERROR_STATE() AS ErrorState, ERROR_MESSAGE() AS ErrorMsg,ERROR_PROCEDURE() AS ProcName,ERROR_SEVERITY() AS ErrorSeverity
END CATCH
GO
DECLARE @Json NVARCHAR(MAX)
SET @Json=
	N'[{"CustomerName":"Dhruvit","City":"Surat","AccountNumber":"123698","Branch":"Katargam","Amount":"10"},
	{"CustomerName":"Arbazsir","City":"Surat","AccountNumber":"10GOAT10","Branch":"Ved","Amount":"25"}
]';
EXEC Banks @Json

SELECT * FROM Deposits
