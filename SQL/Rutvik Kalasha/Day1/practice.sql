/*Write a SQL statement to create a table named countries including columns CountryId, CountryName and RegionId and make sure that no countries except Italy, India and China will be entered in the table. and combination of columns CountryId and RegionId will be unique.*/

CREATE TABLE country (
CountryId INT NOT NULL UNIQUE DEFAULT '',
Country_Name VARCHAR (50) CHECK (Country_Name IN ('Italy', 'India', 'China')),
Region_Id INT NOT NULL UNIQUE
PRIMARY KEY (CountryId,Region_Id)
);
/*Write a SQL statement to create a table named JobHistory including columns EmployeeId, StartDate, End_Eate, Job_Id and Department_Id and make sure that the value against column EndDate will be entered at the time of insertion to the format like ‘–/–/—-‘.*/

CREATE TABLE Job_History( 
Employee_Id INT PRIMARY KEY IDENTITY (1,1), 
StartDate DATE NOT NULL, 
EndDate VARCHAR(10) CONSTRAINT dt_format CHECK (EndDate LIKE '[0-9][0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9]') NOT NULL,
Job_Id INT NOT NULL, 
Department_Id INT NOT NULL
);

/*Write a SQL statement to create a table named jobs including columns JobId, JobTitle, MinSalary and MaxSalary, and make sure that, the default value for JobTitle is blank and MinSalary is 8000 and MaxSalary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.*/

CREATE TABLE Jobs (
Job_Id INT PRIMARY KEY, 
Job_Title VARCHAR (50) DEFAULT ' ', 
Min_Salary MONEY DEFAULT 8000, 
Max_Salary MONEY DEFAULT NULL
);


/*Write a SQL statement to create a table employees including columns Employee_Id, FirstName, LastName, Email, PhoneNumber, Hire_Date, Job_Id, Salary, Commission, Manager_Id and Department_Id and make sure that, the Employee_Id column does not contain any duplicate value at the time of insertion, and the foreign key column DepartmentId, reference by the column DepartmentId of Departments table, can contain only those values which are exists in the Department table and another foreign key column JobId, referenced by the column JobId of jobs table, can contain only those values which are exists in the jobs table.*/

CREATE TABLE Employees 
(
Employee_Id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
FirstName  VARCHAR (50) ,
LastName VARCHAR (50),
Email VARCHAR (50),
PhoneNumber VARCHAR (10),
Hire_Date DATE ,
Job_Id INT CONSTRAINT fk_job_id FOREIGN KEY REFERENCES Jobs(JobId), 
Salary MONEY,
Commission MONEY,
Manager_Id INT ,
Department_Id INT CONSTRAINT fk_dep_Id FOREIGN KEY REFERENCES Departments(DepartmentId)
);


/*Alter statement*/

/*Write a SQL statement to add a foreign key constraint named fk_job_id on JobId column of JobHistory table referencing to the primary key JobId of jobs table.*/

ALTER TABLE Job_History ADD CONSTRAINT fk_Job_Id FOREIGN KEY (Job_Id) REFERENCES Jobs(Job_Id);

/*Write a SQL statement to drop the existing foreign key fk_job_id from JobHistory table on JobId column which is referencing to the JobId of jobs table.*/

ALTER TABLE Job_History DROP FOREIGN KEY fk_Job_Id;

/*Write a SQL statement to add a new column named location to the JobHistory table.*/

ALTER TABLE Job_History ADD location VARCHAR(50);