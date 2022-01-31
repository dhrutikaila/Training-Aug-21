CREATE DATABASE DB_CAR

USE DB_CAR

CREATE TABLE CAR(
		carid INT CONSTRAINT PK_CAR PRIMARY KEY IDENTITY(1,1)
	,	vin INT NOT NULL
	,	make VARCHAR(20) NOT NULL
	,	model VARCHAR(20) NOT NULL
	,	year DATE NOT NULL
	,	mileage INT NOT NULL
	,	askprice MONEY NOT NULL
	,	invoiceprice MONEY NOT NULL
)

--DROP TABLE CAR

CREATE TABLE Dealership(
		dealershipid INT CONSTRAINT PK_Dealership PRIMARY KEY IDENTITY(1,1)
	,	name VARCHAR(20) NOT NULL
	,	address VARCHAR(255) NOT NULL
	,	city VARCHAR(30) NOT NULL
	,	state VARCHAR(30) NOT NULL
)

CREATE TABLE Salesperson(
		salespersonid INT CONSTRAINT PK_Salesperson PRIMARY KEY IDENTITY(1,1)
	,	name VARCHAR(30) NOT NULL
)

CREATE TABLE Customer(
		customerid INT CONSTRAINT PK_CUST PRIMARY KEY IDENTITY(1,1)
	,	name VARCHAR(20) NOT NULL
	,	address VARCHAR(255) NOT NULL
	,	city VARCHAR(30) NOT NULL
	,	state VARCHAR(30) NOT NULL
)

CREATE TABLE Reportsto(
		reportstoid INT CONSTRAINT PK_REPO PRIMARY KEY IDENTITY(1,1)
	,	salespersonid INT NOT NULL
	,	managingsalespersonid INT NOT NULL
	,	CONSTRAINT FK_SP_REPO_SP FOREIGN KEY(salespersonid) REFERENCES Salesperson(salespersonid)
	,	CONSTRAINT FK_SP_REPO_MGR FOREIGN KEY(managingsalespersonid) REFERENCES Salesperson(salespersonid)
)

CREATE TABLE Worksat(
		worksatid INT CONSTRAINT PK_WORK PRIMARY KEY IDENTITY(1,1)
	,	salespersonid INT NOT NULL
	,	dealershipid INT NOT NULL
	,	monthworked SMALLINT NOT NULL
	,	basesalaryformonth MONEY  NOT NULL
	,	CONSTRAINT FK_SP_WORK FOREIGN KEY(salespersonid) REFERENCES Salesperson(salespersonid)
	,	CONSTRAINT FK_DS_WORK FOREIGN KEY(dealershipid) REFERENCES Dealership(dealershipid)
)

CREATE TABLE Inventory(
		inventoryid INT CONSTRAINT PK_INV PRIMARY KEY IDENTITY(1,1)
	,	vin INT NOT NULL
	,	dealershipid INT NOT NULL
	,	CONSTRAINT FK_DS_INV FOREIGN KEY(dealershipid) REFERENCES Dealership(dealershipid)
)

CREATE TABLE Sale(
		saleid INT CONSTRAINT PK_Sales PRIMARY KEY IDENTITY(1,1)
	,	vin INT NOT NULL
	,	customerid INT NOT NULL
	,	salespersonid INT NOT NULL
	,	dealershipid INT NOT NULL
	,	saleprice MONEY NOT NULL
	,	saledate DATE NOT NULL
	,	CONSTRAINT FK_CUST_SALE FOREIGN KEY(customerid) REFERENCES Customer(customerid)
	,	CONSTRAINT FK_SP_SALE FOREIGN KEY(salespersonid) REFERENCES Salesperson(salespersonid)
	,	CONSTRAINT FK_DS_SALE FOREIGN KEY(dealershipid) REFERENCES Dealership(dealershipid)
)


