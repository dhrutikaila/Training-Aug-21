/*You have been hired to create a relational database to support a car sales business. 
You need to store information on the business’s employees, inventory, and completed sales.
You also need to account for the fact that each salesperson receives a different percentage of their 
sales in commission. What tables and columns would you create in your relational database, and how would 
you link the tables?*/

create database Assignment1
CREATE TABLE employee
(
	Employee_Id int PRIMARY KEY,
	FirstName char(20),
	LastName char(20),
	Email varchar(70) constraint emailchk check (Email like ('%_@gmail.com%')),
	PhoneNumber numeric(10) constraint phonechk check (PhoneNumber between 100000000 and 999999999),
	Hire_Date date,
	Salary numeric(7),
	Commission int default null
)

CREATE TABLE inventory
(
	chassis_number int PRIMARY KEY,
	brand varchar(20) not null,
	model varchar(20) not null,
	price smallmoney not null,	
)

CREATE TABLE sales
(
	Employee_Id int FOREIGN KEY REFERENCES employee(Employee_Id),
	chassis_number int FOREIGN KEY REFERENCES inventory(chassis_number),	
	date_of_sale date,	
	Commission numeric(7) primary key
)
