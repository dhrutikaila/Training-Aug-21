/*
1.Write a SQL statement to create a simple table countries including columns country_id,country_name and 
region_id. make sure that the column country_id will be unique and store an auto incremented value.
*/
CREATE TABLE Countries ( 
CountryID integer NOT NULL IDENTITY(1,1) PRIMARY KEY,
CountryName varchar(40) NOT NULL,
RegionID decimal(10,0) NOT NULL
)

/*
2.Write a SQL statement to create a simple table countries including columns country_id, country_name and 
region_id which is already exists.
*/
CREATE TABLE Countries ( 
CountryID varchar(3),
CountryName varchar(45) ,
RegionID decimal(10,0)
)

/*
3.Write a SQL statement to create the structure of a table dup_countries similar to countries.
*/
SELECT * INTO Dup_Countries FROM Countries WHERE 0 = 1

/*
4.Write a SQL statement to create a duplicate copy of countries table including structure and data by 
name dup_data_countries.
*/
SELECT * INTO Dup_Data_Countries FROM Countries

/*
5.Write a SQL statement to create a table countries set a constraint NULL.
*/
CREATE TABLE Countries ( 
CountryID varchar(3) NOT NULL,
CountryName varchar(45) NOT NULL,
RegionID decimal(10,0) NOT NULL
)


/*
6.Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, 
max_salary and check whether the max_salary amount exceeding the upper limit 25000.
*/
CREATE TABLE jobs ( 
JobID varchar(10) NOT NULL , 
JobTitle varchar(35) NOT NULL, 
MinSalary decimal(6,0), 
MaxSalary decimal(6,0) 
CHECK(MaxSalary<=25000)
);


/*
7.Write a SQL statement to create a table named countries including columns country_id, 
country_name and region_id and make sure that no countries except Italy, India and China 
will be entered in the table. and combination of columns country_id and region_id will be unique.
*/
CREATE TABLE Countries ( 
CountryID varchar(2),
CountryName varchar(40) CHECK(CountryName IN('Italy','India','China')) ,
RegionID decimal(10,0)
CONSTRAINT Countries_CRID_pk PRIMARY KEY(CountryID,RegionID)
);

/*
8.Write a SQL statement to create a table named job_history including columns employee_id, start_date, 
end_date, job_id and department_id and make sure that the value against column end_date will be entered 
at the time of insertion to the format like '--/--/----'.
*/
CREATE TABLE JobHistory ( 
EmployeeID decimal(6,0) NOT NULL, 
StartDate date NOT NULL, 
EndDate date NOT NULL
CHECK (EndDate LIKE '--/--/----'), 
JobID varchar(10) NOT NULL, 
DepartmentID decimal(4,0) NOT NULL 
);


/*
9.Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary 
max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and 
max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the 
specified columns.
*/
CREATE TABLE Jobs ( 
JobID varchar(10) NOT NULL UNIQUE, 
JobTitle varchar(35) NOT NULL DEFAULT ' ', 
MinSalary decimal(6,0) DEFAULT 8000, 
MaxSalary decimal(6,0) DEFAULT NULL
);


/*
10.Write a SQL statement to create a table job_history including columns employee_id, start_date, 
end_date, job_id and department_id and make sure that, the employee_id column does not contain any 
duplicate value at the time of insertion and the foreign key column job_id contain only those values 
which are exists in the jobs table.

Here is the structure of the table jobs;

+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
| JOB_TITLE  | varchar(35)  | NO   |     | NULL    |       |
| MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
*/
CREATE TABLE JobHistory ( 
EmployeeID decimal(6,0) NOT NULL PRIMARY KEY, 
StartDate date NOT NULL, 
EndDate date NOT NULL, 
JobID varchar(10) NOT NULL, 
DepartmentID decimal(4,0) DEFAULT NULL, 
FOREIGN KEY (JobID) REFERENCES Jobs(JobID)
)


/*
11.Write a SQL statement to create a table employees including columns employee_id, first_name, 
last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and 
make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the 
foreign key columns combined by department_id and manager_id columns contain only those unique combination 
values, which combinations are exists in the departments table.

Assume the structure of departments table below.

+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
| DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
| MANAGER_ID      | decimal(6,0) | NO   | PRI | 0       |       |
| LOCATION_ID     | decimal(4,0) | YES  |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+
*/

CREATE TABLE Employees ( 
EmployeeID decimal(6,0) NOT NULL PRIMARY KEY, 
FirstName varchar(20) DEFAULT NULL, 
LastName varchar(25) NOT NULL, 
Email varchar(25) NOT NULL, 
PhoneNumber varchar(20) DEFAULT NULL, 
HireDate date NOT NULL, 
JobID varchar(10) NOT NULL, 
Salary decimal(8,2) DEFAULT NULL, 
CommissionPCT decimal(2,2) DEFAULT NULL, 
ManagerID decimal(6,0) DEFAULT NULL, 
DepartmentID decimal(4,0) DEFAULT NULL, 
FOREIGN KEY(DepartmentID,ManagerID) 
REFERENCES  Departments(DepartmentID,ManagerID)
);


/*
12.Write a SQL statement to create a table employees including columns employee_id, first_name, 
last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id 
and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, 
and the foreign key column department_id, reference by the column department_id of departments table, can
contain only those values which are exists in the departments table and another foreign key column job_id, 
referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. 
*/
CREATE TABLE Employees ( 
EmployeeID decimal(6,0) NOT NULL PRIMARY KEY, 
FirstName varchar(20) DEFAULT NULL, 
LastName varchar(25) NOT NULL, 
Email varchar(25) NOT NULL, 
PhoneNumber varchar(20) DEFAULT NULL, 
HireDate date NOT NULL, 
JobID varchar(10) NOT NULL, 
Salary decimal(8,2) DEFAULT NULL, 
CommissionPCT decimal(2,2) DEFAULT NULL, 
ManagerID decimal(6,0) DEFAULT NULL, 
DepartmentID decimal(4,0) DEFAULT NULL, 
FOREIGN KEY(DepartmentID) 
REFERENCES  Departments(DepartmentID),
FOREIGN KEY(JobID) 
REFERENCES  Jobs(JobID)
);


