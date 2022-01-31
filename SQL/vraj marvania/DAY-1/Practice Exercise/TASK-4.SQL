/*Write a SQL statement to create a table employees including columns Employee_Id, FirstName, LastName, Email, PhoneNumber, Hire_Date, Job_Id, Salary, Commission, Manager_Id and Department_Id and make sure that, the Employee_Id column does not contain any duplicate value at the time of insertion, and the foreign key column DepartmentId, reference by the column DepartmentId of Departments table, can contain only those values which are exists in the Department table and another foreign key column JobId, referenced by the column JobId of jobs table, can contain only those values which are exists in the jobs table.*/

CREATE TABLE Jobs 
(
Job_Id INT  not null PRIMARY KEY IDENTITY(1,1) ,
JOB_Type VARCHAR(20),  
)

CREATE TABLE Departments 
(
Department_Id  INT  not null PRIMARY KEY IDENTITY(1,1) ,
Department_Name VARCHAR(20) ,
)

CREATE TABLE employees 
(
 Employee_Id INT  not null  IDENTITY(1,1) ,
 FirstName VARCHAR(20) NOT NULL,
 LastName  VARCHAR(20) NOT NULL,
 Email  VARCHAR(20) NOT NULL,
 PhoneNumber INT NULL,
 Hire_Date  DATE ,
 Salary MONEY NOT NULL,
 CommissioN INT, 
 Manager_Id INT,
 Job_Id int NOT NULL,
 Department_Id  int NOT NULL,
 FOREIGN KEY(Job_Id ) REFERENCES JobS(Job_Id) ,
 FOREIGN KEY(Department_Id ) REFERENCES Departments(Department_Id ),
 CONSTRAINT FKJOB_Department_Id PRIMARY KEY (Job_Id,Department_Id,Employee_Id) ,
 
)



