/*PRACTICAL EXERCISE 1
Write a SQL statement to create a table named countries including columns CountryId, CountryName and RegionId and make sure that no countries except Italy, India and China will be entered in the table. and combination of columns CountryId and RegionId will be unique.*/

CREATE TABLE countries
(
    CountryId int PRIMARY KEY AUTO_INCREMENT, 
    CountryName varchar(20) NOT NULL CHECK (CountryName IN    ('India','Italy','China')), 
    RegionId int NOT NULL,
    UNIQUE(CountryId,RegionId)
);

INSERT INTO countries(CountryName,RegionId) VALUES('India',201),('Italy',202),('China',203);
INSERT INTO countries(CountryName,RegionId) VALUES('Germany',205);




/*PRACTICAL EXERCISE 2
Write a SQL statement to create a table named JobHistory including columns EmployeeId, StartDate, End_Eate, Job_Id and Department_Id and make sure that the value against column EndDate will be entered at the time of insertion to the format like ‘–/–/—-‘.*/

CREATE TABLE JobHistory
(
    EmployeeId int PRIMARY KEY AUTO_INCREMENT, 
    StartDate date, 
    End_Date varchar(10) CHECK (End_Date LIKE '[0-9][0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9]'), 
    Job_Id int NOT NULL,
    Department_Id int NOT NULL
);

INSERT INTO jobhistory(StartDate,End_Date,Job_Id,Department_Id) VALUES('1999-01-01','31/01/2006',10,101);




/*PRACTICAL EXERCISE 3
Write a SQL statement to create a table named jobs including columns JobId, JobTitle, MinSalary and MaxSalary, and make sure that, the default value for JobTitle is blank and MinSalary is 8000 and MaxSalary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.
*/

CREATE TABLE jobs
(
    JobId int PRIMARY KEY AUTO_INCREMENT, 
    JobTitle varchar(20) DEFAULT ' ', 
    MinSalary int DEFAULT 8000, 
    MaxSalary int DEFAULT NULL
);

INSERT INTO jobs(JobTitle) VALUES('developer');
INSERT INTO jobs(MaxSalary) VALUES(30000);
INSERT INTO jobs(MinSalary) VALUES(9000);


/*PRACTICAL EXERCISE 4
Write a SQL statement to create a table employees including columns Employee_Id, FirstName, LastName, Email, PhoneNumber, Hire_Date, Job_Id, Salary, Commission, Manager_Id and Department_Id and make sure that, the Employee_Id column does not contain any duplicate value at the time of insertion, and the foreign key column DepartmentId, reference by the column DepartmentId of Departments table, can contain only those values which are exists in the Department table and another foreign key column JobId, referenced by the column JobId of jobs table, can contain only those values which are exists in the jobs table.
*/

CREATE TABLE employees
(
    Employee_Id int PRIMARY KEY AUTO_INCREMENT, 
    FirstName varchar(20) NOT NULL, 
    LastName varchar(30) NOT NULL, 
    Email varchar(30) NOT NULL, 
    PhoneNumber numeric NOT NULL, 
    Hire_Date date NOT NULL, 
    Job_Id int , 
    Salary int NOT NULL, 
    Commission int, 
    Manager_Id int, 
    Department_Id int,
    FOREIGN KEY(Job_Id) REFERENCES jobs(JobId),
    FOREIGN KEY(Department_Id) REFERENCES departments(DepartmentId)
);



/* ALTER Statement*/

ALTER TABLE jobhistory ADD CONSTRAINT fk_job_id FOREIGN KEY(Job_Id) REFERENCES jobs(JobId);
ALTER TABLE jobhistory DROP FOREIGN KEY fk_job_id;
ALTER TABLE jobhistory ADD COLUMN location varchar(20);


