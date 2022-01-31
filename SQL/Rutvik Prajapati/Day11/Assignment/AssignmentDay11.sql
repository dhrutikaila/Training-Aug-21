--Create Tables:
CREATE DATABASE CustomerDB

CREATE TABLE CUSTOMER(
CNAME VARCHAR(18) PRIMARY KEY,	
CITY VARCHAR(18)
);

INSERT INTO CUSTOMER VALUES('ANIL','KOLKATA'),	
							('SUNIL','DELHI'),	
							('MEHUL','BARODA'),	
							('MANDAR','PATNA'),	
							('MADHURI','NAGPUR'),	
							('PRAMOD','NAGPUR'),	
							('SANDIP','SURAT'),	
							('SHIVANI','MUMBAI'),	
							('RANTI','MUMBAI'),	
							('NAREN','MUMBAI'),
							('RUTVIK','MODASA')
CREATE TABLE BRANCH (
BNAME VARCHAR(18) PRIMARY KEY,	
CITY VARCHAR(18)
);

INSERT INTO BRANCH VALUES('VRCE','NAGPUR'),	
							('AJNI','NAGPUR'),	
							('KAROLBAGH','DELHI'),	
							('CHANDNI','DELHI'),	
							('DHARAMPETH','NAGPUR'),	
							('M.G.ROAD','BANGLORE'),	
							 ('ANDHERI','MUMBAI'),	
							('VIRAR','MUMBAI'),
							('NEHRU PLACE','DELHI'),	
							('POWAI','MUMBAI')


CREATE TABLE Deposit(
ACTNO VARCHAR(5) PRIMARY KEY,
Cname VARCHAR(18) CONSTRAINT FK_C_NAME  FOREIGN KEY (Cname) REFERENCES CUSTOMER(CNAME),
Bname VARCHAR(18) CONSTRAINT FK_B_NAME  FOREIGN KEY (Bname) REFERENCES BRANCH(BNAME),	
Amount INT,
Adate DATE
);
	
INSERT INTO Deposit VALUES	(100,'ANIL','VRCE',1000,'1-Mar-1995'),
							(101,'SUNIL','AJNI',5000,'4-Jan-1996'),
							(102,'MEHUL','KAROLBAGH',3500,'17-Nov-1995'),
							(104,'MADHURI','CHANDNI',1200,'17-Dec-1995'	),
							(105,'PRAMOD','M.G.ROAD',3000,'27-Mar-1996'),
							(106,'SANDIP','ANDHERI',2000,'31-Mar-1996'),
							(107,'SHIVANI','VIRAR',1000,'5-Sep-1995'),
							(108,'KRANTI','NEHRU PLACE',5000,'2-Jul-1995'),
							(109,'NAREN','POWAI',7000,'10-Aug-1995')

CREATE TABLE BORROW(
LOANNO VARCHAR(5) PRIMARY KEY,
CNAME VARCHAR(18) CONSTRAINT FK_BORROW_C_NAME  FOREIGN KEY (Cname) REFERENCES CUSTOMER(CNAME),
BNAME VARCHAR(18) CONSTRAINT FK_BORROW_B_NAME  FOREIGN KEY (Bname) REFERENCES BRANCH(BNAME),
AMOUNT int
);

INSERT INTO BORROW VALUES ('201','ANIL','VRCE',1000),	
							('206','MEHUL','AJNI',5000),	
							('311','SUNIL','DHARAMPETH',3000),	
							('321','MADHURI','ANDHERI',2000),	
							('375','PRAMOD','VIRAR',8000),	
							('481','KRANTI','NEHRU PLACE',3000)

--Q1: Create a Store Procedure which will accept name of the customer as input parameter 
      --and product the following output, List Names of Customers who are Depositors and 
	  --have Same Branch City as that of input parameter customer’s Name.
	  CREATE PROCEDURE spGetListOfCustomerWhoAreDepositorAndSameBranch
	  @CustomerName VARCHAR(20)
	  AS 
	  BEGIN 
	       SELECT D.Cname,B.CITY 
			FROM Deposit D 
			INNER JOIN Branch B
			ON D.Bname = B.Bname
			WHERE B.City = 
			(SELECT City FROM Branch WHERE Bname = 
			(SELECT Bname FROM Deposit WHERE Cname=@CustomerName))
	  END
	  --EXECUTE spGetListOfCustomerWhoAreDepositorAndSameBranch 'ANIL'


--Q2: Create a Store Procedure which will accept name of the customer as input parameter 
    --and produce the following output List in JSON format, All the Depositors Having 
	--Depositors Having Deposit in All the Branches where input parameter customer is 
	--Having an Account
	CREATE PROCEDURE spGetListOfCustomerHaveDepositInAllBranch
	  @CustomerName VARCHAR(20)
	  AS 
	  BEGIN 
	       SELECT Cname
		   FROM Deposit D 
		   INNER JOIN BRANCH B ON B.BNAME = D.Bname
		   WHERE Cname = @CustomerName
		   FOR JSON PATH
	   END
		--EXECUTE spGetListOfCustomerHaveDepositInAllBranch 'ANIL'   

--Q3: Create a Store Procedure that will accept city name and returns the number of 
      --customers in that city.
	CREATE PROCEDURE spGetNumberOfCustomer
	@CityName VARCHAR(15)
	AS 
	BEGIN
		SELECT CNAME
		FROM CUSTOMER WHERE CITY=@CityName
	END
	--EXECUTE spGetNumberOfCustomer 'MUMBAI'
	--OR 
	--DECLARE @CityName VARCHAR(15)
	--EXECUTE spGetNumberOfCustomer @CityName = 'MUMBAI'

--Q4: Create a Store Procedure which will accept city of the customer as input parameter 
     --and product the following output List in JSON format List All the Customers 
	 --Living in city provided in input parameter and Having the Branch City as MUMBAI 
	 --or DELHI
	ALTER PROCEDURE spGetNumberOfCustomerWhoHavingBranchCity
	@CityName VARCHAR(15)
	AS 
	BEGIN
		SELECT C.CNAME AS CustomerName,C.CITY AS CustomerCity,B.BNAME AS BranchName,B.CITY AS BranchCity
		FROM CUSTOMER C
		INNER JOIN Deposit D ON D.Cname = C.CNAME
		INNER JOIN BRANCH B ON B.BNAME = D.Bname
		WHERE C.CITY=@CityName AND B.CITY IN ('MUMBAI','DELHI')
		FOR JSON PATH
	END

	--EXECUTE spGetNumberOfCustomerWhoHavingBranchCity 'MUMBAI'
	--OR 
	--DECLARE @CityName VARCHAR(15)
	--EXECUTE spGetNumberOfCustomerWhoHavingBranchCity @CityName = 'MUMBAI'

--Q5: Count the Number of Customers Living in the City where Branch is Located
	CREATE PROCEDURE pra5
	AS 
	BEGIN
		SELECT COUNT(C.CNAME) AS NoOfCustomer
		FROM Deposit D 
		INNER JOIN CUSTOMER C ON D.Cname = C.CNAME
		INNER JOIN BRANCH B ON B.BNAME=D.Bname
		GROUP BY B.CITY,C.CITY
		HAVING B.CITY = C.CITY
	END
	--EXECUTE pra5 

	

--Q6: Create a Procedure which will accept input in JSON parameter CustomerName,City, 
	--ACTNO,Branch,amount  
	--And insert these record in the Deposit table. Before inserting some validation should be 
	--done like amount should be greater than 10Rs. and date should always be current date.
	CREATE PROCEDURE pra6
	@JSON VARCHAR(MAX)
	AS 
	DECLARE @Amount INT
	SET @Amount =JSON_VALUE(@JSON,'$.Amount');
	IF @Amount > 10
		BEGIN
			INSERT INTO Deposit (ACTNO,Cname,Bname,Amount,Adate) 
			SELECT ACTNO,Cname,Bname,Amount,Adate = GETDATE() FROM OPENJSON(@JSON)
			WITH(
				ACTNO INT '$.ACTNO',
				Cname varchar(20) '$.Cname',
				Bname varchar(20) '$.Bname',
				Amount INT '$.Amount'
			)
		END
	ELSE
		PRINT 'ENTER PROPER AMOUNT'

	--DECLARE @jsondata NVARCHAR(MAX)
	--SET @jsondata=N'{"ACTNO":"111","Cname":"RUTVIK","Bname":"POWAI","Amount":5000}';
	--EXECUTE pra6 @JSON = @jsondata

	