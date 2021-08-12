CREATE TABLE EmployeesB
(
	EmployeeID int PRIMARY KEY,
	Department varchar(10) NOT NULL,
	FirstName varchar(15) NOT NULL,
	LastName varchar(15) NOT NULL,
	PhoneNo numeric(10) NOT NULL,
	Email varchar(50) CONSTRAINT ckEmail CHECK(Email LIKE '_%@__%.__%'),
	JoiningDate date NOT NULL,
	Commission int,
)

CREATE TABLE Inventory
(
	CarID int NOT NULL PRIMARY KEY,
	CarCompany varchar(10) NOT NULL,
	CarName varchar(10) NOT NULL,
	Stock int NOT NULL,
	MRP money NOT NULL,
	Discount int,
)

CREATE TABLE Sales
(
	EmployeeID int NOT NULL, 
	CarID int NOT NULL,
	SaleID int NOT NULL PRIMARY KEY,
	SaleDate date NOT NULL,
	SaleAmt int NOT NULL,
	PaymentMethod varchar(10) NOT NULL,
	CustomerName varchar(30) NOT NULL,
	CONSTRAINT fk_CarID FOREIGN KEY (CarID) REFERENCES Inventory(CarID)
)

ALTER TABLE Sales
ADD CONSTRAINT fk_empid FOREIGN KEY (EmployeeID) REFERENCES EmployeesB(EmployeeID)