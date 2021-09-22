 
USE CAR_SALES

---You have been hired to create a relational database to support a car sales business. You need to store information on the business’s employees, inventory, and completed sales. You also need to account for the fact that each salesperson receives a different percentage of their sales in commission. What tables and columns would you create in your relational database, and how would you link the tables?

CREATE TABLE Employee
(
 Employee_id INT NOT NULL PRIMARY KEY,
 Employee_firstname VARCHAR (20),
 Employee_lastname VARCHAR (20),
 Employee_managerid INT NOT NULL,
 Employee_Address VARCHAR (80),
 Employee_mobilenumber NUMERIC(10),
 Employee_email VARCHAR(40),
)

CREATE TABLE Account
(
Employee_id INT NOT NULL FOREIGN KEY REFERENCES Employee(Employee_id),
Account_id INT NOT NULL,
Salary NUMERIC(7),
Total_carsales INT,
commission INT, 
)

create TABLE Inventory
(

   Carmodel_id INT PRIMARY KEY,
   Carmodel_name VARCHAR(25) not null,
   carcolor VARCHAR (20),
   car_horsepower NUMERIC(10) not null,
   car_weight NUMERIC(10),
   car_Fueltype VARCHAR(15) not null
)

CREATE TABLE sales
(
   Model_id INT  FOREIGN KEY REFERENCES Inventory(Carmodel_id),
   Employee_id INT not null FOREIGN KEY REFERENCES Employee(Employee_id),
   Total_sales INT,
   Date_of_sales DATE,
   commission INT,
)
