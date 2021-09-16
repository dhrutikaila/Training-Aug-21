--Write a SQL statement to create a table employees including columns Employee_Id, FirstName, LastName, Email, PhoneNumber, Hire_Date, Job_Id, Salary, Commission, Manager_Id and Department_Id 
--and make sure that, the Employee_Id column does not contain any duplicate value at the time of insertion, 
--and the foreign key column DepartmentId, reference by the column DepartmentId of Departments table, can contain only those values which are exists in the Department table 
--and another foreign key column JobId, referenced by the column JobId of jobs table, can contain only those values which are exists in the jobs table.

CREATE TABLE Department
(
Department_Id INT PRIMARY KEY IDENTITY(1,1),
Dpt_Name VARCHAR(50) NOT NULL,
Location VARCHAR(30)
)

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

INSERT INTO Department VALUES('IT','Ahmedabad'),
                             ('Account','Kalol')


INSERT INTO Employees VALUES('James','Cole','james44@gmail.com','9988776655','2010/09/09',1,20000,0.20,1,2),
                            ('Jane','Cole','jane44@gmail.com','9978776655','2010/09/09',2,20000,0.20,2,1)
	
SELECT * FROM Department							
SELECT * FROM Employees
