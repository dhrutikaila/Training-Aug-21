--1. Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id. 
--make sure that the column country_id will be unique and store an auto incremented value.
CREATE TABLE Countries(
   CountryID INT PRIMARY KEY IDENTITY(1,1),
   CountryName VARCHAR(30),
   RegionID INT, 
)

--2. Write a SQL statement to create a simple table countries including columns country_id, country_name and region_id which is already exists.
CREATE TABLE Countries(
   CountryID INT PRIMARY KEY IDENTITY(1,1),
   CountryName VARCHAR(30),
   RegionID INT, 
)

--3. Write a SQL statement to create the structure of a table dup_countries similar to countries.

SELECT * INTO Dup_Countries 
FROM Countries
WHERE 0 = 1


--4. Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_data_countries.

SELECT * INTO Dup_Data_Countries 
FROM Countries


--5. Write a SQL statement to create a table countries set a constraint NULL.

CREATE TABLE Countries(
  CountryID INT PRIMARY KEY IDENTITY(1,1),
  CountryName VARCHAR(30) NOT NULL,
  RegionID INT NULL
)


--6. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.

CREATE TABLE Jobs(
   JobID INT PRIMARY KEY IDENTITY(1,1),
   JobTitle VARCHAR(15),
   MinSalary MONEY,
   MaxSalary MONEY CONSTRAINT Chk_MaxSalary CHECK(Maxsalary <= 25000),
)




--7. Write a SQL statement to create a table named countries including columns country_id, country_name and region_id 
--and make sure that no countries except Italy, India and China will be entered in the table. and combination of columns country_id and region_id will be unique.
CREATE TABLE Countries
(
Country_Id INT PRIMARY KEY IDENTITY(1,1),
Country_Name VARCHAR(20) NOT NULL CONSTRAINT Chk_Country CHECK(Country_Name IN('Italy','India','China')),
Region_Id INT NOT NULL,
CONSTRAINT Unique_Columns UNIQUE(Country_Id,Region_Id )

--8. Write a SQL statement to create a table named job_history including columns employee_id, start_date, end_date, job_id and department_id 
--and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.

CREATE TABLE JobHistory
(
Employee_Id INT PRIMARY KEY IDENTITY(1,1),
StartDate DATE NOT NULL,
End_Date VARCHAR(50) CONSTRAINT chk_Format CHECK(End_Date LIKE '__/__/____') ,
Job_Id INT NOT NULL,
Department_Id INT NOT NULL,
)


--9. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank 
--and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.
REATE TABLE Jobs 
(
Job_Id INT PRIMARY KEY IDENTITY(1,1),
Job_Title VARCHAR(50) DEFAULT ' ',
MinSalary INT DEFAULT'8000',
MaxSalary INT DEFAULT NULL
)


--10. Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that, 
--the employee_id column does not contain any duplicate value at the time of insertion and the foreign key column job_id contain only those values which are exists in the jobs table.
--Here is the structure of the table jobs;

--+------------+--------------+------+-----+---------+-------+
--| Field      | Type         | Null | Key | Default | Extra |
--+------------+--------------+------+-----+---------+-------+
--| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
--| JOB_TITLE  | varchar(35)  | NO   |     | NULL    | |
--| MIN_SALARY | decimal(6,0) | YES  |     | NULL     |
--| MAX_SALARY | decimal(6,0) | YES  |     | NULL    | |
--+------------+--------------+------+-----+---------+-------+
CREATE TABLE JobHistory
(
Employee_Id INT PRIMARY KEY IDENTITY(1,1),
StartDate DATE NOT NULL,
End_Date VARCHAR(50) CONSTRAINT chk_Format CHECK(End_Date LIKE '__/__/____') ,
Job_Id INT NOT NULL CONSTRAINT FK_JobID FOREIGN KEY(Job-ID) REFERENCES Jobs(Job_ID),
Department_Id INT NOT NULL,
)

--11. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id 
--and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key columns combined by department_id and manager_id columns contain only those unique combination values, which combinations are exists in the departments table.
--+-----------------+--------------+------+-----+---------+-------+
--| Field | Type | Null | Key | Default | Extra |
--+-----------------+--------------+------+-----+---------+-------+
--| DEPARTMENT_ID | decimal(4,0) | NO | PRI | 0 | |
--  DEPARTMENT_NAME | varchar(30) | NO | | NULL | |
--| MANAGER_ID | decimal(6,0) | NO | PRI | 0 | |
--| LOCATION_ID | decimal(4,0) | YES | | NULL | |
--+-----------------+--------------+------+-----+---------+-------

CREATE TABLE Employees
(
Employee_Id INT PRIMARY KEY IDENTITY(1,1),
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) NOT NULL,
Email VARCHAR(100) CONSTRAINT Chk_Email CHECK(Email LIKE '%__@_%.com') UNIQUE,
PhoneNumber VARCHAR(10) NOT NULL CONSTRAINT Chk_Number CHECK(PhoneNumber LIKE '[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Hire_Date DATE NOT NULL,
Job_Id INT NOT NULL,
Salary MONEY,
Commission MONEY,
Manager_Id INT,
Department_Id INT CONSTRAINT fk_Department_Id FOREIGN KEY (Department_Id) REFERENCES Department(Department_Id,Manager_Id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
)

--12. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id 
--and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column department_id, reference by the column department_id 
--of departments table, can contain only those values which are exists in the departments table and another foreign key column job_id, referenced by the column job_id of jobs table, 
--can contain only those values which are exists in the jobs table. 


CREATE TABLE Employees
(
Employee_Id INT PRIMARY KEY IDENTITY(1,1),
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) NOT NULL,
Email VARCHAR(100) CONSTRAINT Chk_Email CHECK(Email LIKE '%__@_%.com') UNIQUE,
PhoneNumber VARCHAR(10) NOT NULL CONSTRAINT Chk_Number CHECK(PhoneNumber LIKE '[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Hire_Date DATE NOT NULL,
Job_Id INT CONSTRAINT fk_Job_Id FOREIGN KEY (Job_Id) REFERENCES Jobs(Job_Id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
Salary MONEY,
Commission MONEY,
Manager_Id INT,
Department_Id INT CONSTRAINT fk_Department_Id FOREIGN KEY (Department_Id) REFERENCES Department(Department_Id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
)