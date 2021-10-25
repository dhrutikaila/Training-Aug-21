CREATE TABLE employees(
	EmployeeId INT PRIMARY KEY,
	FirtstName VARCHAR(20),
	LastName VARCHAR(20),
	Email VARCHAR(40),
	PhoneNumber VARCHAR(10),
	Hire_Date DATE ,
	Job_Id INT FOREIGN KEY REFERENCES Jobs_ (JobId),
	Salary MONEY,
	Commussion MONEY,
	Manager_Id INT,
	Department_Id INT FOREIGN KEY REFERENCES Departments (DepartmentId)
);

INSERT INTO employees(EmployeeId, Job_Id,Department_Id) VALUES (1,1,2)

SELECT * FROM employees;

CREATE TABLE Departments(
	DepartmentId int PRIMARY KEY,
	DepartmentName VARCHAR(20) NOT NULL,
);

INSERT INTO Departments VALUES (1,'IT'),(2,'SALES');

DROP TABLE Jobs;

INSERT INTO Jobs_ VALUES (1,'Sr.Dev'),(2,'Jr.Dev');

SELECT * FROM Jobs_;

CREATE TABLE Jobs_(
	JobId int PRIMARY KEY ,
	JobTitle VARCHAR(20) NOT NULL,
);
