USE test1
--1
CREATE TABLE Countrie
(
country_id VARCHAR(2) PRIMARY KEY NOT NULL, 
country_name VARCHAR(30) NOT NULL,
region_id DECIMAL(10,0) DEFAULT NULL

)
--4
CREATE TABLE dup_countries(
country_id VARCHAR(2)  NOT NULL, 
country_name VARCHAR(30)CONSTRAINT PK_COUNTRYID  NULL,
region_id DECIMAL(10,0) NOT NULL

);
INSERT INTO dup_countries VALUES 
(3,'TALY',12),
(3,'INDIA',13),
(3,'TALY',12),
(3,'TALY',12),
(3,'I',13),
(3,'',13)
SELECT*FROM dup_countries

--5
CREATE TABLE jo(
job_id varchar(10) NOT NULL  PRIMARY KEY, 
job_title  varchar(10) NOT NULL, 
min_salary MONEY NOT NULL, 
max_salary MONEY NOT NULL  CHECK (max_salary  BETWEEN 0 AND 25000)
)
--6

CREATE TABLE jo2(
emp_id decimal (6,0) NOT NULL PRIMARY KEY,
start_date date NOT NULL,
end_date date NOT NULL,
job_id varchar(10)NOT NULL CONSTRAINT fkjobid FOREIGN KEY  REFERENCES dbo.jo(job_id),
dept_id decimal (4,0)  DEFAULT  NULL,

)
select*from sys.check_constraints

--7
CREATE TABLE employees ( 
emp_id decimal(6,0) NOT NULL PRIMARY KEY, 
FIRST_NAME varchar(20) DEFAULT NULL, 
LAST_NAME varchar(25) NOT NULL, 
EMAIL varchar(25) NOT NULL, 
PHONE_NUMBER varchar(10) DEFAULT NULL, 
HIRE_DATE date NOT NULL, 
JOB_ID varchar(10) NOT NULL, 
SALARY decimal(8,2) DEFAULT NULL, 
COMMISSION_PCT decimal(2,2) DEFAULT NULL, 
MANAGER_ID decimal(6,0) DEFAULT NULL, 
dept_id decimal(4,0) DEFAULT NULL, 
CONSTRAINT fk_departments
    FOREIGN KEY (emp_id)
    REFERENCES jo2(emp_id)
);
--8
CREATE TABLE  employe ( 
EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY, 
FIRST_NAME varchar(20) DEFAULT NULL, 
LAST_NAME varchar(25) NOT NULL, 
EMAIL varchar(25) NOT NULL, 
PHONE_NUMBER varchar(20) DEFAULT NULL, 
HIRE_DATE date NOT NULL, 
job_id varchar(10) NOT NULL, 
SALARY decimal(8,2) DEFAULT NULL, 
COMMISSION_PCT decimal(2,2) DEFAULT NULL, 
MANAGER_ID decimal(6,0) DEFAULT NULL, 
Department_id int NOT NULL, 
FOREIGN KEY(Department_id) 
REFERENCES  departments(Department_id),
FOREIGN KEY(job_id) 
REFERENCES  jo(job_id)
)




CREATE TABLE coun ( 
COUNTRY_ID int    NOT NULL  PRIMARY KEY,
COUNTRY_NAME varchar(40) NOT NULL DEFAULT 'N/A',
REGION_ID integer NOT NULL
);


CREATE TABLE jobhistor ( 
EMPLOYEE_ID integer NOT NULL PRIMARY KEY, 
JOB_ID varchar(10) NOT NULL, 
DEPARTMENT_ID integer DEFAULT NULL, 
FOREIGN KEY (job_id) REFERENCES jo(job_id)
)

CREATE TABLE Locations
(
   LocationID decimal(4,0) NOT NULL ,
   StreetAddress varchar(40)  NULL,
   PostalCode varchar(12)  NULL,
   City varchar(30) NOT NULL,
   StateProvince varchar(25) DEFAULT NULL,
   CountryID varchar(2)  NOT NULL
 
)