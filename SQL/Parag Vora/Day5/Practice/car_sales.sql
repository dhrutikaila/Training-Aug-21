-- Created Database
    create database Car_sales

-- Created Table

-- car (carid, vin, make, model, year, mileage, askprice, invoiceprice)
    create table car
    (
    carid int primary key not null identity(1,1),
    vin int not null,
    make varchar(20) not null,
    model varchar(20) not null,
    year int not null,
    mileage float not null,
    askprice money,
    invoiceprice money not null
    )

-- dealership (dealershipid, name, address, city, state)
    create table dealership
    (
    dealershipid int not null primary key identity(1,1),
    name varchar(30) not null,
    address varchar(128) not null,
    city varchar(16) not null,
    state varchar(16) not null, 
    )

-- salesperson (salespersonid, name)
    create table salesperson
    (
    salespersonid int primary key not null identity(1,1),
    name varchar(32) not null
    )

-- customer (customerid, name, address, city, state)
    create table customer
    (
    customerid int primary key not null identity(1,1),
    name varchar(32) not null,
    address varchar(128) not  null,
    city varchar(16) not null,
    state varchar(16) not null
    )

-- reportsto (reportstoid, salespersonid, managingsalespersonid)
    create table reportsto
    (
    reportstoid int primary key not null identity(1,1),
    salespersonid int foreign key references salesperson(salespersonid),
    managingsalespersonid int not null
    )

-- worksat (worksatid, salespersonid, dealershipid, monthworked, basesalaryformonth)
    create table worksat
    (
    worksatid int primary key not null identity(1,1),
    salespersonid int foreign key references salesperson(salespersonid),
    dealershipid int foreign key references dealership (dealershipid),
    monthworked int not null,
    basesalaryformonth money not null
    )   

-- inventory (inventoryid, vin, dealershipid) 
    create table inventory
    (
    inventoryid int primary key not null identity(1,1),
    vin int not null,
    dealershipid int foreign key references dealership (dealershipid)
    )

-- sale (saleid, vin, customerid, salespersonid, dealershipid, saleprice, saledate)
    create table sale
    (
    saleid int primary key not null identity(1,1),
    vin int not null,
    customerid int foreign key references customer (customerid),
    salespersonid int foreign key references salesperson (salespersonid),
    dealershipid int foreign key references dealership (dealershipid),
    saleprice money not null,
    saledate date not null,
    )

-- Inserting values
    -- inserted value using design of table from ssms only

-- 1)Find the names of all salespeople who have ever worked for the company at any dealership.


-- 2)List the Name, Street Address, and City of each customer who lives in Ahmedabad.
    select name,address as streetaddress,city from customer where city = 'AHMEDABAD ;


-- 3) List the VIN, make, model, year, and mileage of all cars in the inventory of the dealership named "Hero Honda Car World".
 


-- 4)List names of all customers who have ever bought cars from the dealership named "Concept Hyundai".
        select c.name from customer as c join sale as s 
    on c.customerid = s.customerid 
    join dealership as d  
    on s.dealershipid = d.dealershipid and d.name = 'Concept Hyundai'

-- 5)For each car in the inventory of any dealership, list the VIN, make, model, and year of the car, along with the name, city, and    state of the dealership whose inventory contains the car.
        select c.vin,c.make,c.model,c.year,d.name,d.city,d.state from 
    sale as s join inventory as i 
    on i.dealershipid = s.dealershipid 
    join car as c
    on s.vin =c.vin
    join dealership as d
    on d.dealershipid = s.dealershipid

-- 6)Find the names of all salespeople who are managed by a salesperson named "Adam Smith".
    
    select s.name from salesperson as s 
    join reportsto as r 
    on s.name = 'Adam Smith'
    join reportsto as k
    on  k.managingsalespersonid = s.salespersonid

-- 7)Find the names of all salespeople who do not have a manager

-- 8)Find the total number of dealerships.
    select count(*) as TotalDealership from dealership

-- 9)List the VIN, year, and mileage of all "Toyota Camrys" in the inventory of the dealership named "Toyota Performance". (Note that a "Toyota Camry" is indicated by the make being "Toyota" and the model being "Camry".)

        select c.vin,c.year,c.mileage from dealership as d
    join inventory as i 
    on i.dealershipid= d.dealershipid and d.name = ' Toyota Performance'
    join car as c
    on c.vin = i.vin
                -- OR 
        select c.vin,c.year,c.mileage from inventory as i 
    join car as c
    on c.vin = i.vin 
    join dealership as d
    on i.dealershipid= d.dealershipid and d.name = ' Toyota Performance'

10)

    