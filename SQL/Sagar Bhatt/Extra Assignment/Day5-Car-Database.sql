CREATE DATABASE Day5_Car

USE Day5_Car

CREATE TABLE Car (
	CarId INT CONSTRAINT PK_Car_CaId PRIMARY KEY IDENTITY(1,1)
	, Vin INT NOT NULL
	, Make VARCHAR(20) NOT NULL
	, Model VARCHAR(20) NOT NULL
	, Year DATE NOT NULL
	, Mileage INT NOT NULL
	, AskPrice MONEY NOT NULL
	, InvoicePrice MONEY NOT NULL
)

SELECT * 
FROM Car

CREATE TABLE Dealership(
	DealershipId INT CONSTRAINT PK_Dealership_DealershipId PRIMARY KEY IDENTITY(1,1)
	, Name VARCHAR(20) NOT NULL
	, Address VARCHAR(255) NOT NULL
	, City VARCHAR(30) NOT NULL
	, State VARCHAR(30) NOT NULL
)

SELECT *
FROM Dealership

CREATE TABLE SalesPerson(
	SalesPersonId INT CONSTRAINT PK_SalesPerson_SalesPersonId PRIMARY KEY IDENTITY(1,1)
	, Name VARCHAR(30) NOT NULL
)

SELECT *
FROM SalesPerson

CREATE TABLE Customer(
	CustomerId INT CONSTRAINT PK_Customer_CustomerId PRIMARY KEY IDENTITY(1,1)
	, Name VARCHAR(20) NOT NULL
	, Address VARCHAR(255) NOT NULL
	, City VARCHAR(30) NOT NULL
	, State VARCHAR(30) NOT NULL
)

SELECT *
FROM Customer

CREATE TABLE ReportsTo(
	ReportsToId INT CONSTRAINT PK_ReportsTo_ReportsToId PRIMARY KEY IDENTITY(1,1)
	, SalesPersonId INT NOT NULL
	, ManagingSalesPersonId INT NOT NULL
	, CONSTRAINT FK_SalesPerson_ReportsTo FOREIGN KEY (SalesPersonId) REFERENCES SalesPerson(SalesPersonId)
	, CONSTRAINT FK_SalesPerson_ReportsTo_Manager FOREIGN KEY (ManagingSalesPersonId) REFERENCES SalesPerson(SalesPersonId)
)

SELECT *
FROM ReportsTo

CREATE TABLE Worksat(
	WorksatId INT CONSTRAINT PK_Worksat_WorksatId PRIMARY KEY IDENTITY(1,1)
	, SalesPersonId INT NOT NULL
	, DealershipId INT NOT NULL
	, MonthWorked SMALLINT NOT NULL
	, BaseSalaryForMonth MONEY  NOT NULL
	, CONSTRAINT FK_SalesPerson_Worksat FOREIGN KEY (SalesPersonId) REFERENCES SalesPerson(SalesPersonId)
	, CONSTRAINT FK_Dealership_Worksat FOREIGN KEY (DealershipId) REFERENCES Dealership(DealershipId)
)

SELECT *
FROM Worksat

CREATE TABLE Inventory(
	InventoryId INT CONSTRAINT PK_Inventory_InventoryId PRIMARY KEY IDENTITY(1,1)
	, Vin INT NOT NULL
	, DealershipId INT NOT NULL
	, CONSTRAINT FK_Dealership_Inventory FOREIGN KEY(DealershipId) REFERENCES Dealership(DealershipId)
)

SELECT *
FROM Inventory

CREATE TABLE Sale(
	SaleId INT CONSTRAINT PK_Sale_SaleId PRIMARY KEY IDENTITY(1,1)
	, Vin INT NOT NULL
	, CustomerId INT NOT NULL
	, SalesPersonId INT NOT NULL
	, DealershipId INT NOT NULL
	, SalePrice MONEY NOT NULL
	, SaleDate DATE NOT NULL
	, CONSTRAINT FK_Customer_Sale FOREIGN KEY(CustomerId) REFERENCES Customer(CustomerId)
	, CONSTRAINT FK_SalesPerson_Sale FOREIGN KEY(SalesPersonId) REFERENCES SalesPerson(SalesPersonId)
	, CONSTRAINT FK_Dealership_Sale FOREIGN KEY(DealershipId) REFERENCES Dealership(DealershipId)
)

SELECT *
FROM Sale