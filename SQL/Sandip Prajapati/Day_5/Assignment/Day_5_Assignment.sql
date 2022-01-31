-----------DAY-5-----------
SELECT EmployeeID,(Salary*5/100) AS INCEPTIVE_SALARY,DATEADD(DAY,1,EOMONTH(HireDate,0))AS INCEPTIVE_DATE INTO INCEPTIVE_TABLE FROM Employees;
SELECT * FROM INCEPTIVE_TABLE;
UPDATE INCEPTIVE_TABLE
SET INCEPTIVE_SALARY = INCEPTIVE_SALARY * 3;
UPDATE INCEPTIVE_TABLE
SET INCEPTIVE_SALARY = NULL
WHERE DATENAME(MONTH,INCEPTIVE_DATE) = 'aUGUST';
--Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
SELECT FirstName,INCEPTIVE_DATE,HireDate,DATEDIFF(DAY,EMP.HireDate,INP.INCEPTIVE_DATE) AS DIFF_INCEPTIVE FROM Employees AS EMP, INCEPTIVE_TABLE AS INP
WHERE EMP.EmployeeID = INP.EmployeeID

SELECT FirstName,INCEPTIVE_DATE,HireDate,DATEDIFF(DAY,EMP.HireDate,INP.INCEPTIVE_DATE) AS DIFF_INCEPTIVE FROM Employees AS EMP JOIN INCEPTIVE_TABLE AS INP
ON EMP.EmployeeID = INP.EmployeeID

--Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

SELECT FirstName,INCEPTIVE_SALARY FROM Employees AS EMP JOIN INCEPTIVE_TABLE AS INP
ON EMP.EmployeeID = INP.EmployeeID
WHERE INCEPTIVE_SALARY> 3000;

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
SELECT FirstName,INCEPTIVE_SALARY FROM Employees AS EMP RIGHT OUTER JOIN INCEPTIVE_TABLE AS INP
ON EMP.EmployeeID = INP.EmployeeID;

--Select EmployeeName, ManagerName from the employee table.
SELECT (EMP1.FirstName+' '+EMP1.LastName) AS EMPLOYEES_NAME,(EMP2.FirstName+' '+EMP2.LastName) AS MANAGERS_NAME FROM Employees AS EMP1 , Employees AS EMP2
WHERE EMP2.EmployeeID=EMP1.ManagerID;

SELECT EmployeeID,FirstName,ManagerID FROM Employees;

--Select first_name, incentive amount from employee and incentives table for all employees 
--even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

SELECT EMP.FirstName, ISNULL(INC.INCEPTIVE_SALARY,0) FROM Employees AS EMP LEFT JOIN INCEPTIVE_TABLE AS INC
ON EMP.EmployeeID = INC.EmployeeID;

--Assume a hypothetical company that manages multiple automobile dealerships throughout INDIA.
--Following are the data requirements of our company :
--*A "car" is described by a vehicle identification number (VIN), make (e.g., Toyota), model (e.g., Prius), year,
--mileage, and two prices: the asking price (how much the dealership would like to sell the car for) and the
--invoice price (how much the dealership paid for the car). This information is maintained for every car currentl
--in any dealership's inventory, and also for every car that has ever been sold by one of the dealerships. 

--* A dealership is a single location where the company sells cars. The company manages many dealerships, each one
--being described by a unique dealership ID, a name (e.g., Honda Sales, Yamaha World, Concept Hyundai etc.), street
--address, city, and state.

--* The company employs a number of salespeople. Each salesperson is assigned a unique salesperson ID. 

--* Salespeople work at one or more dealerships each month, and are paid a monthly base salary at each, regardless 
--of how many cars they sell. Additionally, they are paid a commission on each car they sell. 

--* Information is maintained about all salespeople who ever worked for any dealership.

--* The following information is kept about each customer : ID, name, street address, city, and state.

--* Salespeople are arranged in a strict hierarchy, with each salesperson reporting to a "managing salesperson."

--* It is necessary to keep track of the inventory of cars currently available at each dealership. Of course, a
--particular car can only be in the inventory of one dealership at any given time.

--* A long-term record of all car sales is maintained. For each sale, the company tracks which car was bought, 
--which customer bought it, which salesperson sold it, which dealership it was sold by, at which price it was sold
--for, and on which date it was sold.

--i. car (carid, vin, make, model, year, mileage, askprice, invoiceprice)
--ii. dealership (dealershipid, name, address, city, state)
--iii. salesperson (salespersonid, name)
--iv. customer (customerid, name, address, city, state)
--v. reportsto (reportstoid, salespersonid, managingsalespersonid)
--vi. worksat (worksatid, salespersonid, dealershipid, monthworked, basesalaryformonth)
--vii. inventory (inventoryid, vin, dealershipid)
--viii. sale (saleid, vin, customerid, salespersonid, dealershipid, saleprice, saledate)

CREATE TABLE CAR(
VIN INT CONSTRAINT c_pk_key PRIMARY KEY,
MAKE VARCHAR(20) NOT NULL,
MODEL VARCHAR(30) NOT NULL,
YEAR VARCHAR(4) NOT NULL,
MILEAGE VARCHAR(10) NOT NULL,
ASKPRICE INT NOT NULL,
INVOICEPRICE INT NODET NULL
)

CREATE TABLE DEALERSHIP
(
DEALERSHIPID INT CONSTRAINT dl_pk_key PRIMARY KEY,
NAME VARCHAR(25),
ADDRESS VARCHAR(25),
CITY VARCHAR(20),
STATE VARCHAR(25)
)

CREATE TABLE SALESPERSON(
SALESPERSONID INT CONSTRAINT sl_pk_key PRIMARY KEY,
NAME VARCHAR(25)
)

CREATE TABLE CUSTOMER (
CUSTOMERID INT CONSTRAINT ci_pk_key PRIMARY KEY,
NAME VARCHAR(25),
ADDRESS VARCHAR(25),
CITY VARCHAR(20),
STATE VARCHAR(25)
)

CREATE TABLE REPORTSTO
(
REPORTSTOID INT CONSTRAINT rrt_pk_key PRIMARY KEY,
SALESPERSONID INT CONSTRAINT ssp_fk_key FOREIGN KEY REFERENCES DBO.SALESPERSON(SALESPERSONID) ,
MANAGINGSALESPERSONID INT NOT NULL UNIQUE
)

CREATE TABLE WORKSAT(
WORKSATID INT CONSTRAINT wk_pk_key PRIMARY KEY,
SALESPERSONID INT CONSTRAINT wsp_fk_key FOREIGN KEY REFERENCES DBO.SALESPERSON(SALESPERSONID),
DEALERSHIPID INT CONSTRAINT wdp_fk_key FOREIGN KEY REFERENCES DBO.DEALERSHIP(DEALERSHIPID),
MONTHWORKED INT,
BASESALARYFORMONTH INT
)

CREATE TABLE INVENTORY(
INVENTORYID INT CONSTRAINT int_pk_key PRIMARY KEY,
VIN INT CONSTRAINT vin_fk_key FOREIGN KEY REFERENCES DBO.CAR(VIN),
DEALERSHIPID INT CONSTRAINT idp_fk_key FOREIGN KEY REFERENCES DBO.DEALERSHIP(DEALERSHIPID)
)

CREATE TABLE SALE(
SALEID INT CONSTRAINT sli_pk_key PRIMARY KEY,
VIN INT CONSTRAINT salevin_fk_key FOREIGN KEY REFERENCES DBO.CAR(VIN),
CUSTOMERID INT CONSTRAINT cid_fk_key FOREIGN KEY REFERENCES DBO.CUSTOMER(CUSTOMERID),
SALESPERSONID INT CONSTRAINT saleslp_fk_key FOREIGN KEY REFERENCES DBO.SALESPERSON(SALESPERSONID),
DEALERSHIPID INT CONSTRAINT saledlr_fk_key FOREIGN KEY REFERENCES DBO.DEALERSHIP(DEALERSHIPID),
SALEPRICE INT ,
SALEDATE DATETIME
)
SELECT * FROM CUSTOMER
INSERT INTO CUSTOMER VALUES
('3002','Nick Rimando','21,Street','New York','NEW YORK'),
('3007','Brad Davis','56,Street','New York','NEW YORK'),
('3005', 'Graham Zusi','98,Street','California','California'),
('3008',  'Julian Green','87,Street' ,'London', 'London'),
('3004',  'Fabian Johnson','97,Street','Paris ','Paris'),
('3009',  'Geoff Cameron' ,'89,Street', 'Berlin', 'Berlin'),
('3003' , 'Jozy Altidor' ,'97,Street' ,'Moscow','Moscow' ),
('3001',  'Brad Guzan' ,'75,Street' ,'London', 'London')

SELECT * FROM SALESPERSON
INSERT INTO SALESPERSON VALUES
('5001', 'James Hoog' ),
('5002', 'Nail Knite' ),
('5005' ,'Pit Alex'   ),
('5006', 'Mc Lyon'   ),
('5007', 'Paul Adam' ),
('5003', 'Lauson Hen')