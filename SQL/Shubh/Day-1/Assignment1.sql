--Assignment-1
--You have been hired to create a relational database to support a car sales business. You need to store information on the business’s employees, inventory, and completed sales. You also need to account for the fact that each salesperson receives a different percentage of their sales in commission. What tables and columns would you create in your relational database, and how would you link the tables?


CREATE TABLE employee(
EmployeeId INT PRIMARY KEY Identity(1,1), 
EmployeeFirstName varchar(30) NOT NULL,
EmployeeLastName varchar(30) NOT NULL,
EmployeeDept varchar(20) NOT NULL,
);

INSERT INTO employee VALUES 
('Leonel', 'Messi', 'SalesManager'),
('Cristiano', 'Ronaldo', 'Sales'),
('NGolo', 'Cante', 'Sales'),
('Jan', 'Oblak', 'Sales'),
('Jim', 'Halpert', 'SalesManager');

CREATE TABLE inventory(
CarId INT PRIMARY KEY Identity(1,1),
CarModel varchar(50) NOT NULL,
CarBrand varchar(50) NOT NULL,
CarPrice money NOT NULL,
);

INSERT INTO inventory VALUES 
('Cheron','Mitsubishi',1000000),
('Hyate','Suzuki',5000),
('C100','Mercedes',50000),
('Sonic','McLaren',9900000),
('E-Mode','MG-Hector',9910000);

CREATE TABLE sales(
SalesId numeric(10) NOT NULL,
SalesPersonId int NOT NULL,
SalesPerson varchar(30) NOT NULL,
CommisionPer decimal(4,2),
CarId int NOT NULL,
CONSTRAINT FK_SalesPersonId FOREIGN KEY (SalesPersonId) REFERENCES employee(EmployeeId),
CONSTRAINT FK_CarId FOREIGN KEY (CarId) REFERENCES inventory(CarId),
);

INSERT INTO sales VALUES 
(12,5,'Jan Oblak', 2.5, 5),
(15,3,'Cristiano Ronaldo', 5.5, 3),
(19,1,'Kevin DeBryne', 7, 5),
(21,6,'Jim Halpert', 6, 1);



SELECT * FROM employee

SELECT * FROM inventory

SELECT * FROM sales



--Alter statement
--1. Write a SQL statement to add a foreign key constraint named fk_job_id on JobId column of JobHistory table referencing to the primary key JobId of jobs table.
ALTER TABLE JobHistory ADD CONSTRAINT fk_job_id FOREIGN KEY (JobId) REFERENCES Jobs(JobId)

--2. Write a SQL statement to drop the existing foreign key fk_job_id from JobHistory table on JobId column which is referencing to the JobId of jobs table.
ALTER TABLE JobHistory DROP CONSTRAINT fk_job_id

--3. Write a SQL statement to add a new column named location to the JobHistory table.
ALTER TABLE JobHistory ADD Location NVARCHAR(100)
