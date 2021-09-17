/*
1. Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id. make sure 
that the column country_id will be unique and store an auto incremented value.
*/

CREATE TABLE countries
(
CountryId int not null PRIMARY KEY IDENTITY(1,1),
CountryName varchar(20) not null,
RegionId varchar(20) not null
)



/*
2. Write a SQL statement to create a simple table countries including columns country_id, country_name and region_id which is already exists.
*/

IF NOT EXISTS(SELECT * FROM countries)
CREATE TABLE countries
(
CountryId int not null,
CountryName varchar(20) not null,
RegionId varchar(20) not null
)



/*
3. Write a SQL statement to create the structure of a table dup_countries similar to countries.
*/

SELECT * INTO dup_countries FROM countries WHERE 1 = 2



/*
4. Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_data_countries.
*/

SELECT * INTO dup_data_countries FROM countries



/*
5. Write a SQL statement to create a table countries set a constraint NULL.
*/

CREATE TABLE countries
(
CountryId int not null PRIMARY KEY IDENTITY(1,1),
CountryName varchar(20),
RegionId varchar(20)
)



/*
6. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary 
and check whether the max_salary amount exceeding the upper limit 25000.
*/

CREATE TABLE jobs
(
Job_id int PRIMARY KEY IDENTITY(1,1),
Job_title varchar(20) not null,
Min_salary int not null,
Max_salary int not null CONSTRAINT chk_max_salary CHECK(Max_Salary <= 25000)
)



/*
7. Write a SQL statement to create a table named countries including columns country_id, country_name and region_id 
and make sure that no countries except Italy, India and China will be entered in the table. 
and combination of columns country_id and region_id will be unique.
*/



CREATE TABLE countries
(
Country_id int not null PRIMARY KEY IDENTITY(1,1),
Country_name varchar(20) not null CONSTRAINT ckeckCountryName CHECK(Country_name IN ('Italy','India','Chine')),
Region_id varchar(20) not null,
CONSTRAINT unique_region UNIQUE (Country_id,Region_id)
)



/*
8. Write a SQL statement to create a table named job_history including columns employee_id, start_date, end_date, job_id and department_id 
and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'
*/


CREATE TABLE JobHistory
(
Employee_id int not null PRIMARY KEY IDENTITY(1,1),
Start_date date not null,
End_date varchar(10) CONSTRAINT ChkDate CHECK (End_Date LIKE '--/--/----'),
Job_id int not null,
Department_Id varchar(8) not null
)




/*
9. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, 
and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will 
be entered automatically at the time of insertion if no value assigned for the specified columns.
*/


CREATE TABLE Jobs
(
Job_id int PRIMARY KEY IDENTITY(1,1),
Job_title varchar(20) DEFAULT '' not null,
Min_salary int DEFAULT 8000 not null,
Max_salary int DEFAULT NULL
)



/*
10. Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id 
and make sure that, the employee_id column does not contain any duplicate value at the time of insertion 
and the foreign key column job_id contain only those values which are exists in the jobs table.
*/

CREATE TABLE JobHistory
(
Employee_id int not null CONSTRAINT fk_emp_id FOREIGN KEY REFERENCES Employees(Employee_id),
Start_date date not null,
End_date date not null,
Job_id int not null CONSTRAINT job_id_fk FOREIGN KEY REFERENCES Jobs(Job_id),
Department_Id int not null CONSTRAINT dept_id_fk FOREIGN KEY REFERENCES Departments(Department_id)
)




/*
11. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, 
phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id 
column does not contain any duplicate value at the time of insertion and the foreign key columns combined by department_id 
and manager_id columns contain only those unique combination values, which combinations are exists in the departments table.
*/

CREATE TABLE Departments
(
Department_id int PRIMARY KEY IDENTITY(1,1),
Department_name varchar(20) not null,
Manager_id int,
Location_id int
)

ALTER TABLE Departments
ADD CONSTRAINT dept_manager UNIQUE(Department_id,Manager_id)

CREATE TABLE Employees
(
Employee_id int PRIMARY KEY IDENTITY(1,1),
First_name varchar(30) not null,
Last_name varchar(30) not null,
Email varchar(50) not null CONSTRAINT chk_email CHECK (Email like '%_@__%.__%'),
Phone_number Numeric(10) not null,
Hire_date date not null,
Job_id int not null,
Salary int not null,
Commission int,
Manager_id int,
Department_id int not null,
CONSTRAINT fk_dept_manager FOREIGN KEY(Department_id,Manager_id) REFERENCES Departments(Department_id,Manager_id)
)




/*
12. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, 
job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at 
the time of insertion, and the foreign key column department_id, reference by the column department_id of departments table, can contain only 
those values which are exists in the departments table and another foreign key column job_id, referenced by the column job_id of jobs table, 
can contain only those values which are exists in the jobs table.
*/

CREATE TABLE Employees
(
Employee_id int PRIMARY KEY IDENTITY(1,1),
First_name varchar(30) not null,
Last_name varchar(30) not null,
Email varchar(50) not null CONSTRAINT chk_email CHECK (Email like '%_@__%.__%'),
Phone_number Numeric(10) not null,
Hire_date date not null,
Job_id int not null CONSTRAINT fk_job_id FOREIGN KEY REFERENCES Jobs(Job_id),
Salary int not null,
Commission int,
Manager_id int,
Department_id int not null CONSTRAINT fk_dept_id FOREIGN KEY REFERENCES Departments(Department_id)
)

