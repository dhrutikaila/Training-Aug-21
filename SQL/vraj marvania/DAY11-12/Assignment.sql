use day11

--Q1: Create a Store Procedure which will accept name of the customer as input parameter        and product the following output, List Names of Customers who are Depositors and          have Same Branch City as that of input parameter customer�s Name.
		
		CREATE  PROCEDURE T3
		@customername VARCHAR(50)
		AS
		  SELECT CT.CNAME 
		  FROM CUSTOMER_TABLE CT 
		  JOIN Deposit_Table DT ON DT.Cname =CT.CNAME 
		  JOIN BRANCH_TABLE BT ON BT.BNAME=DT.Bname
		  WHERE BT.CITY =(SELECT CITY FROM CUSTOMER_TABLE WHERE CNAME=@customername)  
	
	     DECLARE @NAME VARCHAR(30)='NAREN'  
         EXEC T3 @NAME


		  

--Q2: Create a Store Procedure which will accept name of the customer as input parameter and    produce the following output List in JSON format, All the Depositors Having Depositors    Having Deposit in All the Branches where input parameter customer is Having an Account

		CREATE  PROCEDURE CKCUSTOMER 
		@NAME VARCHAR(30),
		@IDATA NVARCHAR(MAX) OUTPUT
		AS
			SELECT @IDATA=(SELECT Cname FROM Deposit_Table WHERE Bname in
					   (SELECT BNAME FROM BORROW_TABLE WHERE CNAME=@NAME
						 UNION
						SELECT Bname FROM Deposit_Table   WHERE Cname=@NAME)FOR JSON PATH)

		 DECLARE @NAME VARCHAR(30)='SHIVANI',@IDATA NVARCHAR(MAX)
		 EXEC   CKCUSTOMER @NAME,@IDATA OUTPUT
		 SELECT @IDATA AS [NAME]

		 SELECT * FROM Deposit_Table



--Q3: Create a Store Procedure that will accept city name and returns the number of customers in that city.


		CREATE PROCEDURE COUNTNO 
		@CITYNAME VARCHAR(50),
		@COUNT INT OUTPUT
		AS
			SELECT @COUNT=COUNT(CNAME) 
			FROM CUSTOMER_TABLE 
			WHERE CITY=@CITYNAME


		DECLARE @COUNTA INT
		EXEC COUNTNO 'KOLKATA',@COUNTA OUTPUT 
		SELECT @COUNTA AS NO 

--Q4:Create a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON format List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI


		CREATE  PROCEDURE CUSTOMER_LIST @CITYNAME VARCHAR(40)
		AS
			SELECT c.CNAME FROM CUSTOMER_TABLE c
			JOIN Deposit_Table as de on de.Cname=c.CNAME
			join BRANCH_TABLE AS BR ON  BR.BNAME=de.BNAME
			where c.CITY=@CITYNAME and   br.CITY in('MUMBAI','DELHI')
			FOR JSON PATH

		EXEC CUSTOMER_LIST 'MUMBAI'

--Q5: Count the Number of Customers Living in the City where Branch is Located

		CREATE PROCEDURE Samecity_Customers_Branch
		AS
			SELECT COUNT(c.cName) AS [COUNT] FROM CUSTOMER_TABLE C
			JOIN Deposit_Table AS DE ON DE.Cname=C.CNAME
			join BRANCH_TABLE AS BR ON  BR.BNAME=DE.BNAME
			WHERE C.CITY=BR.CITY

		EXEC Samecity_Customers_Branch 

--Q6: Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount And      insert these record     in the Deposit table. Before inserting some validation should be done like amount        should be greater than 10Rs. and date       should always be current date.


		CREATE PROCEDURE ADD_DATA @DATA NVARCHAR(MAX) 
		AS
			-- INSERT  INTO CUSTOMER_TABLE  CustomerName & CITY
			INSERT INTO CUSTOMER_TABLE(CNAME,CITY)
			SELECT CustomerName,CITY
			FROM OPENJSON(@DATA)
			WITH(
					CustomerName VARCHAR(50),
					CITY VARCHAR(50)
				   )
			--CHECK  CustomerName  IS AVILABEL IN CUSTOMER_TABLE
			WHERE  CustomerName NOT IN (  SELECT CNAME FROM CUSTOMER_TABLE)

			-- INSERT  INTO Deposit_Table  ACTNO,CNAME,Bname,Amount & Adate
			INSERT INTO Deposit_Table(ACTNO,CNAME,Bname,Amount,Adate)
			SELECT ACTNO,CustomerName,Branch,amount,Adate=CAST(getdate() AS date)
			FROM OPENJSON(@DATA)
			WITH(
					ACTNO INT,
					CustomerName VARCHAR(50),
					Branch VARCHAR(50),
					amount MONEY,
					CITY VARCHAR(50)
				   )
			--CHEK AMOUNT IS greater than 10Rs
			WHERE amount>10
	
	  --JSON DATA --ACTNO IS PK
		DECLARE @DATA NVARCHAR(MAX) 
		SET @DATA='[{"ACTNO":"503","CustomerName":"KOMAL","Branch":"VRCE","amount":9,"CITY":"JAMNAGARR"},
		            {"ACTNO":"504","CustomerName":"PARAG","Branch":"VRCE","amount":2019,"CITY":"JAMNAGARR"}]'
		
		EXEC ADD_DATA @DATA
