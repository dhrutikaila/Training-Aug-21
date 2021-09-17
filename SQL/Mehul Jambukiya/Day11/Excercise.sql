USE Practice

/*Q1: Create a Store Procedure which will accept name of the customer as
input parameter and product the following output, List Names of Customers who
are Depositors and have Same Branch City as that of input parameter customer’s Name.*/
--date ceated,spname,author,execution,parameters

/*
SP_NAME : GetRelatedData
AUTHOR : Mehul Jambukiya   CREATED ON : 06/09/2021
EXECUTION : 
	EXEC GetRelatedData 'CustomerName' 
*/


CREATE PROCEDURE GetRelatedData @Customer VARCHAR(18)
	AS
		SET NOCOUNT ON
		SELECT d.Cname AS CustomerName,b.City AS BranchCity
			FROM 
				Deposit d JOIN Branch b ON b.Bname=d.Bname 
					WHERE b.City IN (
						SELECT b.City 
							FROM Deposit d JOIN Branch b ON b.Bname=d.Bname 
								WHERE d.Cname=@Customer)
		SET NOCOUNT OFF

EXEC GetRelatedData 'SUNIL'
EXEC GetRelatedData 'MEHUL'

/*Q2: Create a Store Procedure which will accept name of the customer as input 
parameter and produce the following output List in JSON format, All the Depositors
Having Depositors Having Deposit in All the Branches where input parameter customer 
is Having an Account*/

/*
SP_NAME : GetRelatedInfo
AUTHOR : Mehul Jambukiya   CREATED ON : 06/09/2021
EXECUTION : 
	EXEC GetRelatedInfo 'CustomerName' 
*/

CREATE PROCEDURE GetRelatedInfo @Customer VARCHAR(18)
	AS
		SET NOCOUNT ON
		SELECT d.Cname AS CustomerName,d.Bname AS BranchName 
			FROM 
				Deposit d FULL JOIN Borrow b ON d.Cname=b.Cname 
					WHERE d.Bname IN(
						SELECT Bname 
							FROM Deposit 
								WHERE Cname=@Customer
						UNION
						SELECT Bname 
							FROM Borrow 
								WHERE Cname=@Customer)
		UNION
		SELECT b.Cname AS CustomerName,b.Bname AS BranchName 
			FROM 
				Deposit d FULL JOIN Borrow b ON d.Cname=b.Cname 
					WHERE b.Bname IN(
						SELECT Bname 
							FROM Deposit 
								WHERE Cname=@Customer
						UNION
						SELECT Bname 
							FROM Borrow 
								WHERE Cname=@Customer)
		FOR JSON PATH,INCLUDE_NULL_VALUES
		SET NOCOUNT OFF

EXEC GetRelatedInfo 'SUNIL'

/*Q3: Create a Store Procedure that will accept city name and returns the number of 
customers in that city.*/

/*
SP_NAME : GetCustomerInCity
AUTHOR : Mehul Jambukiya   CREATED ON : 06/09/2021
EXECUTION : 
	DECLARE @CustomersInCity INT
	EXEC @CustomersInCity = GetCustomerInCity 'City'
	SELECT @CustomersInCity
*/

CREATE PROCEDURE GetCustomerInCity @City VARCHAR(20)
	AS
		SET NOCOUNT ON
		DECLARE @NoOfCustomers INT
		SELECT @NoOfCustomers=COUNT(Cname) 
			FROM 
				Customer 
					WHERE City=@City
		RETURN @NoOfCustomers
		SET NOCOUNT OFF


DECLARE @CustomersInCity INT
EXEC @CustomersInCity = GetCustomerInCity 'NAGPUR'
SELECT @CustomersInCity


/*Q4: Create a Store Procedure which will accept city of the customer as input 
parameter and product the following output List in JSON format List All the Customers
Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI*/

/*
SP_NAME : GetCustomerDetails
AUTHOR : Mehul Jambukiya   CREATED ON : 06/09/2021
EXECUTION : 
	EXEC GetCustomerDetails 'City'
*/


CREATE PROCEDURE GetCustomerDetails @City VARCHAR(20)
	AS
		SET NOCOUNT ON
		SELECT c.Cname AS CustomerName, c.City AS CustomerCity,b.City AS BranchCity 
			FROM 
				Customer c JOIN Deposit d ON c.Cname=d.Cname 
				JOIN Branch b ON d.Bname=b.Bname
					WHERE c.City=@City AND b.City IN ('MUMBAI','DELHI')
		UNION
		SELECT c.Cname AS CustomerName,c.City AS CustomerCity,b.City AS BranchCity 
			FROM 
				Customer c FULL JOIN  Borrow br ON br.Cname=c.Cname 
				JOIN Branch b ON br.Bname=b.Bname
					WHERE c.City=@City AND b.City IN ('MUMBAI','DELHI')
		FOR JSON PATH,INCLUDE_NULL_VALUES
		SET NOCOUNT OFF

EXEC GetCustomerDetails 'NAGPUR'
EXEC GetCustomerDetails 'BARODA'
EXEC GetCustomerDetails 'SURAT'


/*Q5: Count the Number of Customers Living in the City where Branch is Located*/

/*
SP_NAME : GetCitywiseCustomers
AUTHOR : Mehul Jambukiya   CREATED ON : 06/09/2021
EXECUTION : 
	EXEC GetCitywiseCustomers 
*/


CREATE PROCEDURE GetCitywiseCustomers
	AS
		SET NOCOUNT ON
		SELECT City,COUNT(Cname) AS NoOfCustomers 
			FROM 
				Customer 
					WHERE City IN ( SELECT City FROM Branch ) 
						GROUP BY City
		SET NOCOUNT OFF

EXEC GetCitywiseCustomers

/*Q6: Create a Procedure which will accept input in JSON parameter CustomerName,City, 
ACTNO,Branch,amount And insert these record in the Deposit table. Before inserting some
validation should be done like amount should be greater than 10Rs. and date should always
be current date.*/

/*
SP_NAME : InsertDataFromJson
AUTHOR : Mehul Jambukiya   CREATED ON : 06/09/2021
EXECUTION : 
	 DECLARE @Var NVARCHAR(MAX)    (json variable)
	 EXEC InsertDataFromJson @Var
*/


CREATE PROCEDURE InsertDataFromJson @jsondata NVARCHAR(MAX)
	AS
		SET NOCOUNT ON
		DECLARE @len INT ,@i INT =0 ,@amount money
		SET @len =(SELECT COUNT(*) FROM OPENJSON(JSON_QUERY(@jsondata,'$.Info')))
		WHILE(@len>@i)
			BEGIN
				SET @amount= (SELECT JSON_VALUE(@jsondata,CONCAT('$.Info[',@i,'].Amount')))
				IF(@amount>10)
					BEGIN
						INSERT INTO Deposit
						SELECT ActNo,Cname,Bname,Amount,GETDATE() FROM OPENJSON(@jsondata,CONCAT('$.Info[',@i,']'))
						WITH
						(
							ActNo VARCHAR(5) '$.ActNo',
							Cname VARCHAR(18) '$.Cname',
							Bname VARCHAR(18) '$.Bname',
							Amount INT '$.Amount'
						)
					END
				SET @i = @i + 1
			END
		SET NOCOUNT OFF

 DECLARE @Var NVARCHAR(MAX) = N'{
	"Info": [
			{"ActNo":"123","Cname":"ANIL","Bname":"VRCE","Amount":700,"Adate":"1995-03-01"},
			{"ActNo":"124","Cname":"ANIL","Bname":"VRCE","Amount":5,"Adate":"1995-03-01"},
			{"ActNo":"125","Cname":"SUNIL","Bname":"AJNI","Amount":900,"Adate":"1996-01-04"}
			]
	}'             

EXEC InsertDataFromJson @Var

--SELECT * FROM Deposit





/*
SELECT * FROM Branch
SELECT * FROM Customer
SELECT * FROM Deposit
SELECT * FROM Borrow


CREATE TABLE Deposit(
ActNo VARCHAR(5) CONSTRAINT PkActNo PRIMARY KEY,
Cname VARCHAR(18) CONSTRAINT FkCnameRefCustomer FOREIGN KEY REFERENCES Customer(Cname) ON DELETE SET NULL ON UPDATE CASCADE,
Bname VARCHAR(18) CONSTRAINT FkBnameRefBranch FOREIGN KEY REFERENCES Branch(Bname) ON DELETE SET NULL ON UPDATE CASCADE,
Amount INT CONSTRAINT AmountNotNull NOT NULL,
Adate DATE CONSTRAINT AdateNotNull NOT NULL
)

CREATE TABLE Branch(
Bname VARCHAR(18) CONSTRAINT PkBname PRIMARY KEY,
City VARCHAR(18) CONSTRAINT CityNotNull NOT NULL
)

CREATE TABLE Customer(
Cname VARCHAR(18) CONSTRAINT PkCname PRIMARY KEY,
City VARCHAR(18) CONSTRAINT CityNotNull NOT NULL
)

CREATE TABLE Borrow(
LoanNo VARCHAR(5) CONSTRAINT PkLoanNO PRIMARY KEY,
Cname VARCHAR(18) CONSTRAINT FkCnameRefCustomerTbl FOREIGN KEY REFERENCES Customer(Cname) ON DELETE SET NULL ON UPDATE CASCADE,
Bname VARCHAR(18) CONSTRAINT FkBnameRefBranchTbl FOREIGN KEY REFERENCES Branch(Bname) ON DELETE SET NULL ON UPDATE CASCADE,
Amount INT CONSTRAINT AmountNotNull NOT NULL
)

INSERT INTO Customer VALUES 
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

INSERT INTO Branch VALUES
('VRCE','NAGPUR'),
('AJNI','NAGPUR'),
('KAROLBAGH','DELHI'),
('CHANDNI','DELHI'),
('DHARAMPETH','NAGPUR'),
('M.G.ROAD','BANGLORE'),
 ('ANDHERI','MUMBAI'),
('VIRAR','MUMBAI'),
('NEHRU PLACE','DELHI'),
('POWAI','MUMBAI')

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


INSERT INTO Borrow VALUES
(201,'ANIL','VRCE',1000),
(206,'MEHUL','AJNI',5000),
(311,'SUNIL','DHARAMPETH',3000),
(321,'MADHURI','ANDHERI',2000),
(375,'PRAMOD','VIRAR',8000),
(481,'KRANTI','NEHRU PLACE',3000)

*/