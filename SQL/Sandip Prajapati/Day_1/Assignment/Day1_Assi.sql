USE SANDY
----------------------DAY-1----------------------------
--ASSIGNMENT-DAY-1
CREATE TABLE CAR_SALES
(
Employees_Id int CONSTRAINT pk_em_key PRIMARY KEY ,
Inventury_Id int NOT NULL UNIQUE  ,
Salesman_Id int NOT NULL UNIQUE , 
CONSTRAINT fkem_id FOREIGN KEY (Employees_Id) REFERENCES DBO.Employees(Employee_Id)
)
CREATE TABLE Inventury 
(
Inventury_Id int Constraint fjk_inv_key FOREIGN KEY REFERENCES DBO.CAR_SALES(Inventury_Id),
CAR_MODEL VARCHAR(30) NOT NULL,
CAR_TYPE VARCHAR(15) NOT NULL ,
CHECK(CAR_TYPE IN ('PETROL','DIESEL','CNG','ELECTRIC'))
)
CREATE TABLE SALES
(
Salesman_ID INT Constraint fk_sl_key FOREIGN KEY REFERENCES DBO.CAR_SALES(Salesman_Id),
total_sales INT NOT NULL,
Salesman_name VARCHAR(50) NOT NULL,
DOB DATE NOT NULL
)