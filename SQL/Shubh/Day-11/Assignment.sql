--Q1: Create a Store Procedure which will accept name of the customer as input parameter and product the following output, List Names of Customers who are Depositors and have Same Branch City as that of input parameter customer’s Name.
CREATE PROCEDURE Bank1
    @CName1 NVARCHAR(50) 
AS   
    SELECT D.CName AS 'Customer Name', D.Bname  AS 'Branch', City AS 'Branch City' 
	FROM Deposit D JOIN Branch B ON D.Bname=B.Bname WHERE B.City IN 
		(SELECT BR.City FROM Deposit DE JOIN Branch BR ON DE.Bname=BR.Bname WHERE CName = @CName1)
GO  
EXECUTE Bank1 @CName1=N'ANIL'
GO

--Q2: Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format, All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account
CREATE PROCEDURE Bank2
	@CName2 NVARCHAR(50)
AS
	SELECT D.Cname AS 'Depositors', D.Bname  AS 'Branch', City AS 'Branch City' 
	FROM Deposit D JOIN Branch B ON D.Bname=B.Bname 
		WHERE D.Bname IN
		(SELECT DE.Bname FROM Deposit DE JOIN Branch BR ON DE.Bname=BR.Bname WHERE DE.Cname=@CName2)
			OR D.Bname IN (SELECT Bname FROM Borrow WHERE Cname= @CName2) FOR JSON AUTO
GO
EXECUTE Bank2 @CName2=N'MEHUL'
GO

--Q3: Create a Store Procedure that will accept city name and returns the number of customers in that city.
CREATE PROCEDURE Bank3
	@CityName NVARCHAR(50)
AS
	SELECT COUNT(DISTINCT Cname) AS 'Customers', City 
	FROM Customer WHERE City = @CityName GROUP BY City 
GO
EXECUTE Bank3 @CityName = 'Nagpur'
GO

--Q4: Create a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON format List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI
CREATE PROCEDURE Bank4
	@CustCity NVARCHAR(50)
AS
	SELECT DISTINCT C.Cname AS 'Customer'
	FROM Customer C CROSS join Branch B 
		WHERE C.City = @CustCity
		AND B.City IN ('Mumbai','Delhi') FOR JSON AUTO
GO
EXECUTE Bank4 @CustCity = N'Mumbai'
GO

--Q5: Count the Number of Customers Living in the City where Branch is Located
CREATE PROCEDURE Bank5
AS
	SELECT COUNT(DISTINCT c.Cname) AS 'Customers', c.City 
	FROM Customer c 
		WHERE c.City IN 
			(SELECT b.City FROM Branch b) 
			GROUP BY c.City 
			ORDER BY Customers DESC
GO
EXECUTE Bank5
GO

--Q6: Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount And insert these record in the Deposit table. Before inserting some validation should be done like amount should be greater than 10Rs. and date should always be current date.
CREATE DROP TABLE Deposits
(
	Name VARCHAR(50),
	City VARCHAR(60),
	Account VARCHAR(20),
	Branch VARCHAR(30),
	Amount INT CHECK (Amount > 10)

)
GO

CREATE PROCEDURE Bank6
@Insert NVARCHAR(MAX)
AS
	BEGIN 
		INSERT INTO Deposits
		SELECT * FROM OPENJSON (@Json)  WHERE Amount > 10
		WITH (   
              Name VARCHAR(200) '$.CustomerName' , 
			  City NVARCHAR(60) '$.City',
              AccountNumber VARCHAR(30)'$.AccountNumber',  
              Branch VARCHAR(50) '$.Branch',  
              Amount INT '$.Amount'  
			)
	END
GO

DECLARE @Json NVARCHAR(MAX)
SET @Json=
	N'[{"CustomerName":"Shubh","City":"Ahmedabad","AccountNumber":"648486","Branch":"Baroda","Amount":"10"},
	{"CustomerName":"Messi","City":"Buenos Aires","AccountNumber":"10GOAT10","Branch":"Barcelona","Amount":"101010"}
]';
EXEC Bank6 @Insert=@Json