CREATE TABLE employees
(
	Employee_id int PRIMARY KEY AUTO_INCREMENT,
	EmployeeName varchar(30) NOT NULL,
	Email varchar(30) NOT NULL,
	MobileNo numeric(10) NOT NULL,
	EmployeeAddress varchar(200) NOT NULL,
	Bdate date NOT NULL,
    	HireDate date NOT NULL,
	Salary int NOT NULL
	
);

CREATE TABLE customers
(
	Customer_id int PRIMARY KEY AUTO_INCREMENT,
	CustomerName varchar(30) NOT NULL,
	CustomerEmail varchar(30) NOT NULL,
	CustomerMobileNo numeric(10) NOT NULL,
	CustomerAddress varchar(200) NOT NULL
);

CREATE TABLE inventory
(
	CarId int PRIMARY KEY AUTO_INCREMENT,
	CarModel varchar(20) NOT NULL,
	Price int NOT NULL
);

CREATE TABLE sales
(
	SalesId int PRIMARY KEY AUTO_INCREMENT,
	Employee_id int, 
	CarId int,
    	Customer_Id int,
    	FOREIGN KEY(Employee_id) REFERENCES employees(Employee_id),
    	FOREIGN KEY(CarId) REFERENCES inventory(CarId),
    	FOREIGN KEY(Customer_Id) REFERENCES customers(Customer_Id)
);

CREATE TABLE commission
(
	CommissionId int PRIMARY KEY AUTO_INCREMENT,
	Employee_id int, 
	Commission int,
    	FOREIGN KEY(Employee_id) REFERENCES employees(Employee_id)
);