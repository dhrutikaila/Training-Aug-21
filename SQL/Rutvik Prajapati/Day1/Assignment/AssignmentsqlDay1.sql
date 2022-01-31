-- Assignment:

-- 1.You have been hired to create a relational database to support a car sales business. You need to store information on the business’s employees, inventory, and completed sales. You also need to account for the fact that each salesperson receives a different percentage of their sales in commission. What tables and columns would you create in your relational database, and how would you link the tables?
-- DB for car sales business:

-- Tables:
--  -Employees
--  -CarInformation
--  -EmpCommission


-- Employees:
--  -EmpId           primary key
--  -EmpPassword
--  -EmpName
--  -EmpType
--  -EmpPostion
--  -EmpSalary
 

-- CarInformation:
--  -CarId           primary key
--  -ModelNumber
--  -Color
--  -IsSales


-- EmpCommission:
--  -EmpCommissionId           primary key
--  -Emp_Id                     FK references Employees 
--  -Car_Id                     FK references CarInformation
--  -CommissionPercentage


Query:
create database CarSalesBusiness;

create table Employees(
EmpId int primary key,
EmpPassword varchar(50),
EmpName varchar(50),
EmpType varchar(50),
EmpPostion varchar(50),
EmpSalary  varchar(30)
);

create table CarInformation(
CarId  int  primary key,
ModelNumber varchar(30),
Color varchar(20),
IsSales binary
);

create table EmpCommission(
EmpCommissionId  int  primary key,
Emp_Id  int constraint fk_emp_id foreign key (Emp_Id) references Employees(EmpId),
Car_Id  int constraint fk_car_id foreign key (Car_Id) references CarInformation(CarId),
CommissionPercentage int,
);
