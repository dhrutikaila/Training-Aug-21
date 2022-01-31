CREATE DATABASE Car_Sales


CREATE TABLE Employee 
(
Emp_Id int NOT NULL Primary key IDENTITY (001,1),
Emp_Name varchar(30) NOT NULL ,
Emp_Address varchar(100) NOT NULL,
Emp_Email varchar(80) NOT NULL UNIQUE CONSTRAINT email_validation CHECK(Emp_Email LIKE '%@%.com'),
Emp_Contact varchar(10) NOT NULL 
)

CREATE TABLE Account
(
Account_ID int NOT NULL PRIMARY KEY IDENTITY (001,1),
Emp_Id int NOT NULL FOREIGN KEY REFERENCES Employee(Emp_Id),
Commission int NOT NULL,
Total_Sales int NOT NULL,
Salary money not NULL,
Total_Salary AS ([Salary]+([Commission]*[Total_Sales]))
)

CREATE TABLE Inventory
( 
Model_Id int NOT NULL PRIMARY KEY,
Model_Name varchar(30) NOT NULL ,
Color varchar(20) NOT NULL,
Variant varchar(10) NOT NULL,
Fuel_type varchar(10) NOT NULL CONSTRAINT fuel_type CHECK(Fuel_type IN('Petrol','Diesel','CNG'))
)

CREATE TABLE Sales
(
Emp_Id int NOT NULL FOREIGN KEY REFERENCES Employee(Emp_Id),
Model_Id int NOT NULL FOREIGN KEY REFERENCES Inventory(Model_Id),
Total_quantity_sold int NOT NULL,
Date_of_sales date NOT NULL,
Total_sales int NOT NULL,
)
