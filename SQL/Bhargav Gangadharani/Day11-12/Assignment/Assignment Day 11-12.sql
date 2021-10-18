
-- Q1: Create a Store Procedure which will accept name of the customer as input parameter and product the following output, List Names of Customers who are Depositors and have Same Branch City as that of input parameter customer’s Name.
IF OBJECT_ID('Same_Branch_City') IS NOT NULL  
    DROP PROCEDURE Same_Branch_City
GO
Create Procedure Same_Branch_City
			@name varchar(10)
As
	Select * From DepositeTable D JOIN BranchTable B on D.Bname = B.Bname
	Where B.City = (Select B.CITY from DepositeTable D JOIN BranchTable B on D.Bname = B.Bname Where D.Cname = @Name)
Go

Execute Same_Branch_City N'SUNIL'


-- Q2: Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format, All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account
IF OBJECT_ID('Depositors') IS NOT NULL  
    DROP PROCEDURE Depositors
GO
Create Procedure Depositors @Cname varchar(20)
As
	Select * from DepositeTable where Bname=(select Bname from DepositeTable where Cname=@Cname) 
	for Json Path
Go

Execute Depositors 'ANIL'


-- Q3: Create a Store Procedure that will accept city name and returns the number of customers in that city.
IF OBJECT_ID('Count_Customers') IS NOT NULL  
    DROP PROCEDURE Count_Customers
GO
Create Procedure Count_Customers @City varchar(20)
As
	Select COUNT(Cname)Customers FROM CustomerTable WHERE CITY = @City
Go

Execute Count_Customers 'Mumbai'


-- Q4: Create a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON format List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI
IF OBJECT_ID('Customer_in_city') IS NOT NULL  
    DROP PROCEDURE Customer_in_city
GO
Create Procedure Customer_in_city @City varchar(20)
As
	Select * from (Select Cname , Bname from DepositeTable UNION  Select Cname, Bname from BorrowTable)temp
	Where Bname IN (Select Bname from BranchTable where City IN ('MUMBAI' , 'DELHI'))
	And Cname in (Select Cname from CustomerTable where City = @City) For Json Path
Go

Execute Customer_in_city 'Nagpur'


-- Q5: Count the Number of Customers Living in the City where Branch is Located
IF OBJECT_ID('City_Branch') IS NOT NULL  
    DROP PROCEDURE City_Branch
GO
Create Procedure City_Branch
As
SELECT COUNT(c.Cname) As Customers
FROM CustomerTable c JOIN BranchTable b ON c.CITY = b.CITY 
Go

Execute City_Branch


-- Q6: Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount And insert these record in the Deposit table. Before inserting some validation should be done like amount should be greater than 10Rs. and date should always be current date.
Alter Table Deposit
	ADD CONSTRAINT amount_C CHECK (Amount >10) 
Alter Table Deposit
	ADD CONSTRAINT date_cons DEFAULT CONVERT(DATE, GETDATE()) FOR Adate

IF OBJECT_ID('Add_Depositor') IS NOT NULL  
    DROP PROCEDURE Add_Depositor
GO
Create Procedure Add_Depositor
	@json nvarchar(MAX)
As
BEGIN
Insert into Deposit
SELECT * FROM OPENJSON(@json)
			WITH(
				ActNo VARCHAR(12) '$.ActNo',
				CName VARCHAR(18) '$.CName',
				BName VARCHAR(18) '$.BName',
				Amount INT '$.Amount',
				ADate DATE '$.ADate'
			)
End
Go

	DECLARE @json NVARCHAR(MAX)
SET @json = '[
	{
		"ActNo":1545,
		"CName":"kartik",
		"BName":"Karolbaug",
		"Amount":8000,
		"ADate":"2021-07-08"
	}
]'
Execute Add_Depositor @json = @json

Select * from Deposit


-- Another Way ----
IF OBJECT_ID('Insert_Depositor') IS NOT NULL  
    DROP PROCEDURE Insert_Depositor
GO
Create Procedure Insert_Depositor
	@json nvarchar(MAX)
As
BEGIN
Insert into temp
SELECT * FROM OPENJSON(@json)
			WITH(
				ActNo VARCHAR(12) '$.ActNo',
				CName VARCHAR(18) '$.CName',
				BName VARCHAR(18) '$.BName',
				Amount INT '$.Amount',
				ADate DATE '$.ADate'
			)
			
			Insert into Deposit 
			Select * from temp where (Amount > 10) and (Adate = CONVERT(DATE, GETDATE()))
			Insert into TrashTable
			Select * from temp where (Amount <= 10) or (Adate != CONVERT(DATE, GETDATE()))
			Delete from temp
End
Go

	DECLARE @json NVARCHAR(MAX)
SET @json = '[
	{
		"ActNo":1545,
		"CName":"kartik",
		"BName":"Karolbaug",
		"Amount":8000,
		"ADate":"2021-09-08"
	}
]'
Execute Insert_Depositor @json = @json

Select * from temp
Select * from TrashTable 
Select * from Deposit


---- By using cursor --
IF OBJECT_ID('Insert_Depositor_detail') IS NOT NULL  
    DROP PROCEDURE Insert_Depositor_detail
GO
Create Procedure Insert_Depositor_detail
	@json nvarchar(MAX)
As
BEGIN
SET NOCOUNT ON
DECLARE @actno VARCHAR(12), @cname VARCHAR(18), @bname VARCHAR(18), @amount INT, @adate DATE
		DECLARE ReadJson Cursor
		FOR
			SELECT * FROM OPENJSON(@json)
			WITH(
				ActNo VARCHAR(12) '$.ActNo',
				CName VARCHAR(18) '$.CName',
				BName VARCHAR(18) '$.BName',
				Amount INT '$.Amount',
				ADate DATE '$.ADate'
			)
		OPEN ReadJson
		FETCH NEXT FROM ReadJson INTO @actno,@cname,@bname,@amount,@adate
			BEGIN
			 If ( @amount > 10 ) And (@adate = CONVERT(DATE,GETDATE()))
			 INSERT INTO Deposit VALUES(@actno,@cname,@bname,@amount,CONVERT(DATE,@adate))
			END
		CLOSE ReadJson
		DEALLOCATE ReadJson
SET NOCOUNT OFF
End


	DECLARE @json NVARCHAR(MAX)
SET @json = '[
	{
		"ActNo":1545,
		"CName":"kartik",
		"BName":"Karolbaug",
		"Amount":8000,
		"ADate":"2021-09-07"
	}
]'
Execute Insert_Depositor_detail @json = @json

Select * from Deposit
