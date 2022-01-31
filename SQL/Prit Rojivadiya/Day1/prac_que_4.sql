/* Q4 Write a SQL statement to create a table employees including columns Employee_Id, FirstName, LastName, Email, PhoneNumber, Hire_Date, Job_Id, Salary, Commission, Manager_Id and Department_Id 
and make sure that, the Employee_Id column does not contain any duplicate value at the time of insertion, and the foreign key column DepartmentId, reference by the column DepartmentId of Departments table, 
can contain only those values which are exists in the Department table and another foreign key column JobId, referenced by the column JobId of jobs table, can contain only those values which are exists in the jobs table. */

use db1;

CREATE TABLE Departments
(
DepartmentId varchar(20) not null PRIMARY KEY,
DeptName varchar(20) not null,
)

CREATE TABLE employees
(
Employee_Id int not null PRIMARY KEY IDENTITY(1,1),
FirstName varchar(15) not null,
LastName varchar(15) not null,
Email varchar(50) not null constraint chk_email check (Email like '%_@__%.__%'),
phone Numeric(10) not null,
Hire_Date date not null,
JobId int not null,
Salary money not null,
Commission money not null,
Manager_Id varchar(10) not null,
DepartmentId varchar(20) not null,
CONSTRAINT fk_jobs FOREIGN KEY (JobId) REFERENCES jobs(JobId),
CONSTRAINT fk_dept FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId),
)