USE DEMO

--Write a SQL statement to create a table employees including columns Employee_Id, FirstName, LastName, Email, PhoneNumber, Hire_Date, Job_Id, Salary, Commission, Manager_Id and Department_Id and make sure that, the Employee_Id column does not contain any duplicate value at the time of insertion, and the foreign key column DepartmentId, reference by the column DepartmentId of Departments table, can contain only those values which are exists in the Department table and another foreign key column JobId, referenced by the column JobId of jobs table, can contain only those values which are exists in the jobs table.


CREATE TABLE Department
(
    DepartmentId INT PRIMARY KEY
)

CREATE TABLE Employee
(
  Employee_Id INT PRIMARY KEY,
  FirstName VARCHAR(15) NOT NULL,
  LastName  VARCHAR(15) NOT NULL,
  Email     VARCHAR(30),
  PhoneNumber NUMERIC(10),
  HireDate DATE,
  JobId INT UNIQUE FOREIGN KEY REFERENCES Jobs(JobId),
  Salary NUMERIC(5),
  Commission NUMERIC(5),
  Manager_Id INT NOT NULL,
  DepartmentId int unique FOREIGN KEY REFERENCES Department(DepartmentId)

)