CREATE DATABASE Practice_Exercise

USE Practice_Exercise

--1. Write a SQL statement to create a simple table countries including columns country_id,country_name and 
--region_id. make sure that the column country_id will be unique and store an auto incremented value.

CREATE TABLE countries
(
country_id INT UNIQUE IDENTITY(1,1),
country_name VARCHAR(50) NOT NULL,
region_id VARCHAR(10) NOT NULL
)

--2. Write a SQL statement to create a simple table countries including columns country_id, country_name and region_id which is already exists.

IF OBJECT_ID('countries','U') IS NOT NULL
BEGIN
PRINT('This Table Already Created In Your Database')
END
ELSE
BEGIN
CREATE TABLE countries
(
country_id INT UNIQUE IDENTITY(1,1),
country_name VARCHAR(50) NOT NULL,
region_id VARCHAR(10) NOT NULL
)
END


--3. Write a SQL statement to create the structure of a table dup_countries similar to countries.

	SELECT * INTO dup_countries FROM countries where 1=2

--4. Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_data_countries.

	SELECT * INTO dup_data_countries FROM countries

--5. Write a SQL statement to create a table countries set a constraint NULL.
	
CREATE TABLE countries_
(
country_id INT NULL,
country_name VARCHAR(50) NULL,
region_id VARCHAR(10) NULL
)

--6. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary 
--and check whether the max_salary amount exceeding the upper limit 25000.

 CREATE TABLE jobs
 (
 job_id INT NOT NULL,
 job_title VARCHAR(50) NOT NULL,
 min_salary DECIMAL(6,0),
 max_salary DECIMAL(10,0),
 CONSTRAINT Chk_max_salary CHECK(max_salary >25000)
 )

 --7. Write a SQL statement to create a table named countries including columns country_id, country_name and region_id 
 --and make sure that no countries except Italy, India and China will be entered in the table. and combination of columns country_id and region_id will be unique.

CREATE TABLE countries
(
country_id TINYINT,
country_name VARCHAR(50) NOT NULL CONSTRAINT Chk_country_name CHECK(country_name IN ('Italy','India','China')) ,
region_id VARCHAR(10) ,
PRIMARY KEY(country_id,region_id)
)
-----------------------------------
--ANOTHER WAY:-
CREATE TABLE countries
(
country_id TINYINT ,
country_name VARCHAR(50) NOT NULL CONSTRAINT Chk_country_name CHECK(country_name IN ('Italy','India','China')) ,
region_id VARCHAR(10),
UNIQUE(country_id,region_id)
)


--8. Write a SQL statement to create a table named job_history including columns employee_id, start_date, end_date, job_id and department_id 
--and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.

CREATE TABLE job_history
(
employee_id TINYINT NOT NULL,
[start_date] DATE NOT NULL,
end_date VARCHAR(10) NOT NULL CONSTRAINT Chk_end_date CHECK(end_date LIKE '__/__/____'),
job_id VARCHAR(10) NOT NULL,
department_id DECIMAL(4,0) NOT NULL
)   

--9. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, 
--and make sure that, the default value for job_title is blank and min_salary is 8000 
--and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.

 CREATE TABLE jobs
 (
 job_id DECIMAL(4,0) PRIMARY KEY NOT NULL,
 job_title VARCHAR(50) DEFAULT ' ',
 min_salary DECIMAL(6,0) DEFAULT 8000,
 max_salary DECIMAL(10,0) DEFAULT NULL,
 )

--10. Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and 
--make sure that, the employee_id column does not contain any duplicate value at the time of insertion and 
--the foreign key column job_id contain only those values which are exists in the jobs table.
 CREATE TABLE jobs
 (
 job_id VARCHAR(10) PRIMARY KEY NOT NULL,
 job_title VARCHAR(35) NOT NULL,
 min_salary DECIMAL(6,0) DEFAULT NULL,
 max_salary DECIMAL(6,0) DEFAULT NULL,
 )

	
CREATE TABLE job_history
(
employee_id TINYINT NOT NULL UNIQUE,
[start_date] DATE NOT NULL,
end_date VARCHAR(10) NOT NULL,
job_id VARCHAR(10) NOT NULL,
department_id DECIMAL(4,0) NOT NULL,
FOREIGN KEY (job_id) REFERENCES jobs(job_id)
) 

--11. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id 
--and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion 
--and the foreign key columns combined by department_id and 
--manager_id columns contain only those unique combination values, which combinations are exists in the departments table.

CREATE TABLE departments
(
DEPARTMENT_ID DECIMAL(4,0) NOT NULL,
DEPARTMENT_NAME VARCHAR(30) NOT NULL,
MANAGER_ID DECIMAL(6,0) NOT NULL,
LOCATION_ID DECIMAL(4,0),
PRIMARY KEY(DEPARTMENT_ID,MANAGER_ID)
)

CREATE TABLE employees
(
employee_id DECIMAL(4,0) UNIQUE NOT NULL,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(25) NOT NULL,
phone_number VARCHAR(25) NOT NULL,
hire_date DATE NOT NULL, 
job_id VARCHAR(10) NOT NULL,
salary DECIMAL(8,2) NOT NULL,
commission DECIMAL(2,2),
manager_id DECIMAL(6,0),
department_id DECIMAL(4,0),
FOREIGN KEY(department_id,manager_id) REFERENCES departments(DEPARTMENT_ID,MANAGER_ID)
)

--12. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id 
--and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, 
--and the foreign key column department_id, reference by the column department_id of departments table, can contain only those values which are exists in 
--the departments table and another foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in 
--the jobs table.

CREATE TABLE departments
(
DEPARTMENT_ID DECIMAL(4,0) DEFAULT 0,
DEPARTMENT_NAME VARCHAR(30) DEFAULT NULL,
MANAGER_ID DECIMAL(6,0) DEFAULT NULL,
LOCATION_ID DECIMAL(4,0) DEFAULT NULL,
PRIMARY KEY(DEPARTMENT_ID)
)

 CREATE TABLE jobs
 (
 job_id VARCHAR(10) PRIMARY KEY NOT NULL,
 job_title VARCHAR(35) DEFAULT NULL,
 min_salary DECIMAL(6,0) DEFAULT NULL,
 max_salary DECIMAL(6,0) DEFAULT NULL,
 )

 CREATE TABLE employees
(
employee_id DECIMAL(4,0) UNIQUE NOT NULL,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(25) NOT NULL,
phone_number VARCHAR(25) NOT NULL,
hire_date DATE NOT NULL, 
job_id VARCHAR(10) NOT NULL,
salary DECIMAL(8,2) NOT NULL,
commission DECIMAL(2,2),
manager_id DECIMAL(6,0),
department_id DECIMAL(4,0),
FOREIGN KEY(department_id) REFERENCES departments(DEPARTMENT_ID),
FOREIGN KEY(job_id) REFERENCES jobs(job_id)
)

