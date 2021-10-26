---1. Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id.
----  make sure that the column country_id will be unique and store an auto incremented value.


CREATE TABLE countries
	(
	country_id INT PRIMARY KEY IDENTITY(1,1),
	country_name VARCHAR (30),
	region_id INT
	)

----2. Write a SQL statement to create a simple table countries including columns country_id, country_name and region_id
----which is already exists.


CREATE TABLE countries
	(
	country_id INT PRIMARY KEY IDENTITY(1,1),
	country_name VARCHAR (30),
	region_id INT
	)

----3. Write a SQL statement to create the structure of a table dup_countries similar to countries.

CREATE TABLE dup_countries
	(
	country_id INT PRIMARY KEY IDENTITY(1,1),
	country_name VARCHAR (30),
	region_id INT
	)

----4. Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_data_countries
CREATE TABLE IF NOT EXISTS countries
AS SELECT * FROM  countries;


----5. Write a SQL statement to create a table countries set a constraint NULL.


CREATE TABLE countries
	(
	country_id INT PRIMARY KEY IDENTITY(1,1) ,
	country_name VARCHAR(30) DEFAULT NULL,
	region_id INT DEFAULT NULL
	)


---6. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary
---  and check whether the max_salary amount exceeding the upper limit 25000.


CREATE TABLE jobs
(
job_id INT PRIMARY KEY IDENTITY(1,1),
job_title VARCHAR(30),
min_salary DECIMAL(6),
max_salary DECIMAL (6)
CHECK (max_salary>=25000)
)


---7. Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make 
---    sure that no countries except Italy, India and China will be entered in the table. and combination of columns country_id 
---    and region_id will be unique.


CREATE TABLE countries
(
country_id INT  PRIMARY KEY IDENTITY(1,1),
country_name VARCHAR(10) NOT NULL UNIQUE CHECK ( country_name in('india','china','italy')),
regional_id INT UNIQUE
)


---8. Write a SQL statement to create a table named job_history including columns employee_id, start_date, end_date, job_id and 
---   department_id and make sure that the value against column end_date will be entered at the time of insertion to the format 
---   like '--/--/----'.
CREATE TABLE job_history
(
employee_id INT PRIMARY KEY IDENTITY(1,1),
job_start_date Date NOT NULL,
job_end_date Date CHECK (end_date LIKE '--/--/----'), 
job_id INT NOT NULL,
department_id INT
);

---9. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and 
---   make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered 
---   automatically at the time of insertion if no value assigned for the specified columns.


CREATE TABLE jobs
(
job_id INT PRIMARY KEY IDENTITY(1,1),
job_title VARCHAR(20) DEFAULT(' '),
min_salary DECIMAL(6) DEFAULT 8000,
max_salary DECIMAL (6) DEFAULT NULL
)


---10. Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id
---	   and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key 
---	   column job_id contain only those values which are exists in the jobs table.


CREATE TABLE job_history
(
employee_id INT PRIMARY KEY IDENTITY(1,1),
job_start_date Date NOT NULL,
job_end_date Date CHECK (end_date LIKE '--/--/----'), 
job_id INT,
department_id INT,
CONSTRAINT job_description FOREIGN KEY (job_id)
REFERENCES jobs (job_id)
)


---11. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number 
---    hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain 
---    any duplicate value at the time of insertion and the foreign key columns combined by department_id and manager_id columns 
---	   contain only those unique combination values, which combinations are exists in the departments table.



CREATE TABLE employees
(
employee_id INT PRIMARY KEY IDENTITY(1,1),
first_name VARCHAR (25),
last_name VARCHAR (25),
email VARCHAR (20),
phone_number VARCHAR (10),
hire_date DATE,
job_id INT,
salary DECIMAL (7),
commission DECIMAL (5),
manager_id INT NOT NULL,
department_id INT NOT NULL

CONSTRAINT dep_name FOREIGN KEY (department_id)
REFERENCES departments (department_id),

CONSTRAINT mgr_name FOREIGN KEY (manager_id)
REFERENCES departments (manager_id),

)

