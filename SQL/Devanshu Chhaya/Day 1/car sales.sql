CREATE TABLE Employee(
	EmployeeID INT PRIMARY KEY,
	EmployeeFname VARCHAR(20) NOT NULL,
	EmployeeLname VARCHAR(20) NOT NULL,
	Email VARCHAR (50) NOT NULL,
	PhoneNumber VARCHAR (10) CONSTRAINT ph_no CHECK(PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	JoiningDate Date NOT NULL,
	ManagerID INT CONSTRAINT fk_manager FOREIGN KEY REFERENCES Employee(EmployeeID) ON DELETE NO ACTION ,
	SalesManID INT, 
);	
Drop TABLE Employee;
INSERT INTO Employee VALUES 
(1,'dev','chhaya','drchhaya','6546546542','20210523',NULL,NULL),
(2,'RAJ','SHARMA','rajj','3213213225','20200221',1,101),
(3,'Harsh','Varma','harsh','3213253245','20200221',1,102),
(4,'Jay','Sharma','jayyy','3214213245','20200221',1,103);

SELECT * FROM Employee;

CREATE TABLE Products (
	ProductID INT Primary key,
	ProductName VARCHAR(20) NOT NULL,
	ProductCity VARCHAR(20) NOT NULL,
	PoductYear SMALLINT NOT NULL,
	ProductPrice MONEY NOT NULL,
);

INSERT INTO Products VALUES 
(1,'SWIFT','chennai','2018',200000),
(2,'Sonet','mumbai','2008',400000),
(3,'bmw','ahmedabad','2010',1000000),
(4,'alto','rajkot','2012',300000),
(5,'seltoz','Delhi','2013',400000),
(6,'kia','kanpur','2011',500000);

SELECT * FROM Products;

CREATE TABLE Sales (
	SalesID int PRIMARY KEY,
	SalesDate Date NOT NULL,
	ProductID int FOREIGN KEY REFERENCES Products(ProductID) ON DELETE CASCADE ON UPDATE CASCADE,
	EmployeeID int FOREIGN KEY REFERENCES Employee(EmployeeID) ON DELETE CASCADE ON UPDATE CASCADE,
	SellingLocation VARCHAR(20)
);
INSERT INTO Sales VALUES
(1,'20210221',2,3,'dilhi'),
(2,'20210302',3,2,'mumbai'),
(3,'20210412',4,4,'kalkata'),
(4,'20210523',6,2,'kanpur'),
(5,'20210615',5,2,'rajkot'),
(6,'20210718',1,3,'Ahmedabad');

SELECT * FROM Sales;

CREATE TABLE Commission(
	
	TotalSale INT,
);


DECLARE @count int
SET @count=1
WHILE (@count<=4)
	BEGIN 
		INSERT INTO Commission (TotalSale) SELECT COUNT(SalesID) FROM Sales WHERE EmployeeID=@count;

		SET @count=@count+1
	END

SELECT * FROM Commission;
