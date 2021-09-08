USE Day6_August17
GO

-- Procedure for Deposit
CREATE PROCEDURE uspInsertDepositData
	@DepositData NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT OFF
		INSERT INTO Deposit
		SELECT *
		FROM OPENJSON(@DepositData)
		WITH(
			ACTNO VARCHAR(5) 'strict $.ACTNO'
		,	CName VARCHAR(18) 'strict $.Cname'
		,	BName VARCHAR(18) 'strict $.Bname'
		,	Amount INT 'strict $.Amount'
		,	Adate DATE 'strict $.Adate'
		) AS Temp
	SET NOCOUNT ON
END
GO

-- Procedure for Branch

CREATE PROCEDURE uspInsertBranchData
	@BranchData NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT OFF
		INSERT INTO Branch
		SELECT *
		FROM OPENJSON(@BranchData)
		WITH(
			BName VARCHAR(18) 'strict $.BNAME'
		,	City VARCHAR(18) 'strict $.CITY'
		) AS Temp
	SET NOCOUNT ON
END
GO

-- Procedure for Customer
CREATE PROCEDURE uspInsertCustomerData
	@CustomerData NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT OFF
		INSERT INTO Customer
		SELECT *
		FROM OPENJSON(@CustomerData)
		WITH(
			CName VARCHAR(18) 'strict $.CNAME'
		,	City VARCHAR(18) 'strict $.CITY'
		) AS Temp
	SET NOCOUNT ON
END
GO

-- Procedure for Borrow

CREATE PROCEDURE uspInsertBorrowData
	@BorrowData NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT OFF
		INSERT INTO Borrow
		SELECT *
		FROM OPENJSON(@BorrowData)
		WITH(
			LOANNO VARCHAR(5) 'strict $.LOANNO'
		,	CName VARCHAR(18) 'strict $.CNAME'
		,	BName VARCHAR(18) 'strict $.BNAME'
		,	Amount INT 'strict $.AMOUNT'
		) AS Temp
	SET NOCOUNT ON
END
GO

DECLARE @JsonBranch NVARCHAR(MAX) =
'[
 {
   "BNAME": "VRCE",
   "CITY": "NAGPUR"
 },
 {
   "BNAME": "AJNI",
   "CITY": "NAGPUR"
 },
 {
   "BNAME": "KAROLBAGH",
   "CITY": "DELHI"
 },
 {
   "BNAME": "CHANDNI",
   "CITY": "DELHI"
 },
 {
   "BNAME": "DHARAMPETH",
   "CITY": "NAGPUR"
 },
 {
   "BNAME": "M.G.ROAD",
   "CITY": "BANGLORE"
 },
 {
   "BNAME": "ANDHERI",
   "CITY": "MUMBAI"
 },
 {
   "BNAME": "VIRAR",
   "CITY": "MUMBAI"
 },
 {
   "BNAME": "NEHRU PLACE",
   "CITY": "DELHI"
 },
 {
   "BNAME": "POWAI",
   "CITY": "MUMBAI"
 }
]'

EXEC uspInsertBranchData @JsonBranch
GO

DECLARE @JsonCustomer NVARCHAR(MAX) = 
'[
 {
   "CNAME": "ANIL",
   "CITY": "KOLKATA"
 },
 {
   "CNAME": "SUNIL",
   "CITY": "DELHI"
 },
 {
   "CNAME": "MEHUL",
   "CITY": "BARODA"
 },
 {
   "CNAME": "MANDAR",
   "CITY": "PATNA"
 },
 {
   "CNAME": "MADHURI",
   "CITY": "NAGPUR"
 },
 {
   "CNAME": "PRAMOD",
   "CITY": "NAGPUR"
 },
 {
   "CNAME": "SANDIP",
   "CITY": "SURAT"
 },
 {
   "CNAME": "SHIVANI",
   "CITY": "MUMBAI"
 },
 {
   "CNAME": "KRANTI",
   "CITY": "MUMBAI"
 },
 {
   "CNAME": "NAREN",
   "CITY": "MUMBAI"
 }
]'

EXEC uspInsertCustomerData @JsonCustomer
GO


DECLARE @JsonDeposit NVARCHAR(MAX) = 
'[
 {
   "ACTNO": 100,
   "Cname": "ANIL",
   "Bname": "VRCE",
   "Amount": 1000,
   "Adate": "1995-05-01"
 },
 {
   "ACTNO": 101,
   "Cname": "SUNIL",
   "Bname": "AJNI",
   "Amount": 5000,
   "Adate": "1996-01-04"
 },
 {
   "ACTNO": 102,
   "Cname": "MEHUL",
   "Bname": "KAROLBAGH",
   "Amount": 3500,
   "Adate": "1995-11-17"
 },
 {
   "ACTNO": 104,
   "Cname": "MADHURI",
   "Bname": "CHANDNI",
   "Amount": 1200,
   "Adate": "1995-12-17"
 },
 {
   "ACTNO": 105,
   "Cname": "PRAMOD",
   "Bname": "M.G.ROAD",
   "Amount": 3000,
   "Adate": "1996-05-27"
 },
 {
   "ACTNO": 106,
   "Cname": "SANDIP",
   "Bname": "ANDHERI",
   "Amount": 2000,
   "Adate": "1996-05-31"
 },
 {
   "ACTNO": 107,
   "Cname": "SHIVANI",
   "Bname": "VIRAR",
   "Amount": 1000,
   "Adate": "1995-09-05"
 },
 {
   "ACTNO": 108,
   "Cname": "KRANTI",
   "Bname": "NEHRU PLACE",
   "Amount": 5000,
   "Adate": "1995-07-02"
 },
 {
   "ACTNO": 109,
   "Cname": "NAREN",
   "Bname": "POWAI",
   "Amount": 7000,
   "Adate": "1995-08-10"
 }
]'

EXEC uspInsertDepositData @JsonDeposit
GO

DECLARE @JsonBorrow NVARCHAR(MAX) = 
'[
 {
   "LOANNO": 201,
   "CNAME": "ANIL",
   "BNAME": "VRCE",
   "AMOUNT": 1000
 },
 {
   "LOANNO": 206,
   "CNAME": "MEHUL",
   "BNAME": "AJNI",
   "AMOUNT": 5000
 },
 {
   "LOANNO": 311,
   "CNAME": "SUNIL",
   "BNAME": "DHARAMPETH",
   "AMOUNT": 3000
 },
 {
   "LOANNO": 321,
   "CNAME": "MADHURI",
   "BNAME": "ANDHERI",
   "AMOUNT": 2000
 },
 {
   "LOANNO": 375,
   "CNAME": "PRAMOD",
   "BNAME": "VIRAR",
   "AMOUNT": 8000
 },
 {
   "LOANNO": 481,
   "CNAME": "KRANTI",
   "BNAME": "NEHRU PLACE",
   "AMOUNT": 3000
 }
]'

EXEC uspInsertBorrowData @JsonBorrow


