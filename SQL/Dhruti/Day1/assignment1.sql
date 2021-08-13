use dhruti


CREATE TABLE Emp1 (
    Id INT NOT NULL ,
    FName VARCHAR(35) NOT NULL,
    LName VARCHAR(35) NOT NULL,
    PhoneNumber NUMERIC(10) NOT NULL,
    Department VARCHAR(10) NOT NULL,
    HireDate DATE NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY (ManagerId) REFERENCES Emp1(Id),
    );

CREATE TABLE Customers (
    Id INT NOT NULL ,
    FName VARCHAR(35) NOT NULL,
    LName VARCHAR(35) NOT NULL,
    Email varchar(100) NOT NULL,
    PhoneNumber VARCHAR(11),
    PreferredContact VARCHAR(5) NOT NULL,
    PRIMARY KEY(Id)
	CONSTRAINT fk_CarID FOREIGN KEY (CarID) REFERENCES Inventory(CarID)
);

CREATE TABLE Cars (
    Id INT NOT NULL ,
    CustomerId INT NOT NULL,
    EmployeeId INT NOT NULL,
    Model varchar(50) NOT NULL,
    Status varchar(25) NOT NULL,
    TotalCost INT NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id),
    FOREIGN KEY (EmployeeId) REFERENCES Emp1(Id)
);
ALTER TABLE Sales
ADD CONSTRAINT fk_empid FOREIGN KEY (EmployeeID) REFERENCES Emp1(EmployeeID)
