--Assignment:

--You have been hired to create a relational database to support a car sales business. You need to store information on the business’s employees, inventory, and completed sales. 
--You also need to account for the fact that each salesperson receives a different percentage of their sales in commission. What tables and columns would you create in your relational database, 
--and how would you link the tables?

CREATE DATABASE carSales

USE carSales

CREATE TABLE business_employees
(
Employee_Id INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
FirstName VARCHAR(20) NOT NULL, 
LastName VARCHAR(20) NOT NULL, 
Age TINYINT NOT NULL CONSTRAINT ChkAge CHECK(Age > 20),                                                              -->>TINY INT DATATYPE USE FOR CONSUME LESS SPACE
Email VARCHAR(25) NOT NULL CONSTRAINT ChkEmail CHECK(Email LIKE '%@gmail.com'), 
PhoneNumber VARCHAR(10) NOT NULL CONSTRAINT ChkPhoneNumber CHECK(PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Emp_Address VARCHAR(15) NOT NULL,
Emp_Address2 VARCHAR(15) CONSTRAINT ChkAddress2 DEFAULT ' ' ,
Commission DECIMAL(2,2)  
)


CREATE TABLE inventory
(
Iteam_Id INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
Iteam_Name VARCHAR(20) NOT NULL, 
Iteam_Price NUMERIC(6) NOT NULL, 
Iteam_Qty SMALLINT NOT NULL
)
--HERE I TRY TO MAKE MANY TO MANY RELATIONSHIP 
CREATE TABLE sales
(
Sr_no INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Emp_No INT,
Item_No INT,
SALEqty SMALLINT,
 FOREIGN KEY (Emp_No) REFERENCES business_employees(Employee_Id),
 FOREIGN KEY (Item_No) REFERENCES inventory(Iteam_Id)
)

-- INSERT QUEARY

INSERT INTO business_employees (FirstName,LastName,Age,Email,PhoneNumber,Emp_Address,Commission)
VALUES
('DEEP','PARMAR',21,'parmardeep2018@gmail.com','8320822426','Ahmedabad',0.2),
('KAMLESH','PARMAR',45,'PARMAR1974@gmail.com','9999084267','Ahmedabad',0.7);

INSERT INTO inventory (Iteam_Name,Iteam_Price,Iteam_Qty)
VALUES('RAM',2500,2),
('PROCESSOR',15000,1)

INSERT INTO sales (Emp_No,Item_No,SALEqty)
VALUES
(1,1,5),
(2,2,4)


--SELECT QUEARY 
SELECT * FROM business_employees
SELECT * FROM inventory
SELECT * FROM sales




