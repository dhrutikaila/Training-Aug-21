/*Write a SQL statement to create a simple table countries including columns country_id,
country_name and region_id. make sure that the column country_id will be unique 
and store an auto incremented value.*/

CREATE TABLE countries
(
Country_Id INT PRIMARY KEY IDENTITY (1,1),
Country_Name VARCHAR(10),
Region_Id INT
)

/*Write a SQL statement to create a simple table countries including columns country_id,
country_name and region_id which is already exists.*/


/*Write a SQL statement to create the structure of a table dup_countries similar to 
countries.*/


/*Write a SQL statement to create a duplicate copy of countries table including structure 
and data by name dup_data_countries.*/
 SELECT * INTO dup_data_countries  FROM countries
 SELECT * FROM dup_data_countries

/*Write a SQL statement to create a table countries set a constraint NULL.*/
CREATE TABLE countries
(
Country_Id INT PRIMARY KEY IDENTITY (1,1),
Country_Name VARCHAR(10) NOT NULL,
Region_Id INT NOT NULL
)

/* Write a SQL statement to create a table named jobs including columns job_id, job_title, 
min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.*/
CREATE TABLE jobs(
 Job_Id INT PRIMARY KEY IDENTITY(1,1), 
 Job_Title VARCHAR(15), 
Min_Salary MONEY ,
Max_Salary MONEY CONSTRAINT job_maxsalary_ck CHECK (Max_Salary <= 25000)
)

/*Write a SQL statement to create a table named countries including columns country_id, 
country_name and region_id and make sure that no countries except Italy, India and 
China will be entered in the table. and combination of columns country_id and region_id
will be unique.*/

CREATE TABLE country (
CountryId int NOT NULL,
CountryName varchar(10) NOT NULL CONSTRAINT Restrict_countryname CHECK(CountryName IN ('India','Italy','Chaina') ),
RegionId INT NOT NULL ,
PRIMARY KEY(CountryId,RegionId)
 )


/*Write a SQL statement to create a table named job_history including columns employee_id, 
start_date, end_date, job_id and department_id and make sure that the value against column 
end_date will be entered at the time of insertion to the format like '--/--/----'.*/

CREATE TABLE Job_History (
EmployeeId INT NOT NULL PRIMARY KEY IDENTITY(1,1) , 
StartDate DATE NOT NULL, 
End_Date VARCHAR(10) CONSTRAINT cEnddate CHECK (End_Date like '__/__/____') ,
Job_Id INT NOT NULL,
Department_Id INT NOT NULL 
)


/*Write a SQL statement to create a table named jobs including columns job_id, job_title,
min_salary and max_salary, and make sure that, the default value for job_title is blank and 
min_salary is 8000 and max_salary is NULL will be entered automatically at the time of 
insertion if no value assigned for the specified columns.*/
CREATE TABLE job(
job_id INT PRIMARY KEY IDENTITY(1,1), 
job_title VARCHAR(15) DEFAULT ' ' NOT NULL,
min_salary MONEY DEFAULT 8000 ,
max_salary MONEY DEFAULT NULL 
)


/* Write a SQL statement to create a table job_history including columns employee_id, 
start_date, end_date, job_id and department_id and make sure that, the employee_id 
column does not contain any duplicate value at the time of insertion and the foreign key 
column job_id contain only those values which are exists in the jobs table.

Here is the structure of the table jobs;

+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
| JOB_TITLE  | varchar(35)  | NO   |     | NULL    |       |
| MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+*/

CREATE TABLE JobHistory(
Employee_Id INT PRIMARY KEY IDENTITY(1,1), 
Start_date DATE NOT NULL,
End_Date DATE, 
Job_Id INT CONSTRAINT Job_History_JobId_Fk FOREIGN KEY (Job_Id) REFERENCES Jobs(job_id) on update cascade,
Department_Id INT
)



/*Write a SQL statement to create a table employees including columns employee_id, 
first_name, last_name, email, phone_number hire_date, job_id, salary, commission, 
manager_id and department_id and make sure that, the employee_id column does not 
contain any duplicate value at the time of insertion and the foreign key columns 
combined by department_id and manager_id columns contain only those unique combination 
values, which combinations are exists in the departments table.

Assume the structure of departments table below.

+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
| DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
| MANAGER_ID      | decimal(6,0) | NO   | PRI | 0       |       |
| LOCATION_ID     | decimal(4,0) | YES  |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+*/
CREATE TABLE Departments(
Department_Id DECIMAL(4,0) NOT NULL,
Department_Name  VARCHAR(30),
Manager_Id DECIMAL(6,0) NOT NULL,
Location_Id DECIMAL(4,0)
PRIMARY KEY (Department_Id,Manager_Id)
)


CREATE TABLE Employee(
Employee_Id INT PRIMARY KEY IDENTITY(1,1), 
First_Name VARCHAR(20) NOT NULL, 
Last_Name VARCHAR(20) NOT NULL,
Email VARCHAR(30) NOT NULL, 
Phone_Number VARCHAR(15) ,
Hire_Date DATE NOT NULL, 
Job_Id INT NOT NULL, 
Salary MONEY, 
Commission DECIMAL(2,2), 
Manager_Id DECIMAL(6,0),
Department_Id DECIMAL(4,0)
CONSTRAINT Employee_MgrId_Fk FOREIGN KEY (Manager_Id,Department_Id) 
REFERENCES Departments(Manager_Id,Department_Id)

)


/*Write a SQL statement to create a table employees including columns employee_id, 
first_name, last_name, email, phone_number hire_date, job_id, salary, commission, 
manager_id and department_id and make sure that, the employee_id column does not 
contain any duplicate value at the time of insertion, and the foreign key column 
department_id, reference by the column department_id of departments table, can contain 
only those values which are exists in the departments table and another foreign key column
job_id, referenced by the column job_id of jobs table, can contain only those values which
are exists in the jobs table. 


Assume that the structure of two tables departments and jobs.

+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
| DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
| MANAGER_ID      | decimal(6,0) | YES  |     | NULL    |       |
| LOCATION_ID     | decimal(4,0) | YES  |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+

+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
| JOB_TITLE  | varchar(35)  | NO   |     | NULL    |       |
| MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+*/
CREATE TABLE Department(
Department_Id DECIMAL(4,0) PRIMARY KEY IDENTITY(1,1),
Department_Name  VARCHAR(30) NOT NULL DEFAULT NULL,
Manager_Id DECIMAL(6,0) NULL ,
Location_Id DECIMAL(4,0) NULL
)

CREATE TABLE job(
Job_Id VARCHAR(10) PRIMARY KEY , 
Job_Title VARCHAR(35) NOT NULL DEFAULT NULL,
Min_Salary DECIMAL(6,0) NULL,
Max_Salary DECIMAL(6,0) NULL
)

CREATE TABLE Employees(
Employee_Id INT PRIMARY KEY IDENTITY(1,1), 
First_Name VARCHAR(20) NOT NULL, 
Last_Name VARCHAR(20) NOT NULL,
Email VARCHAR(30) NOT NULL, 
Phone_Number VARCHAR(15),
Hire_Date DATE NOT NULL, 
Job_Id INT NOT NULL, 
Salary MONEY, 
Commission DECIMAL(2,2), 
Manager_Id DECIMAL(6,0),
Department_Id DECIMAL(4,0)
CONSTRAINT Employee_MgrId_Fk FOREIGN KEY (Department_Id) 
REFERENCES Department(Department_Id)
)