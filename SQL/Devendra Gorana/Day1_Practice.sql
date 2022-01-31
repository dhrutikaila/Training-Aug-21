CREATE TABLE Countries (
  CountryId int NOT NULL, 
	CountryName varchar(50) NOT NULL CHECK (CountryName IN ('India', 'Italy', 'China')), 
	RegionId int NOT NULL, 
	CONSTRAINT UC_Contries UNIQUE (CountryId,RegionId)
);

INSERT into Countries VALUES (101, 'India', 1)
INSERT into Countries VALUES (102, 'Italy', 2)
INSERT into Countries VALUES (103, 'India', 3)
INSERT into Countries VALUES (104, 'China', 4)
INSERT into Countries VALUES (105, 'Italy', 5)

SELECT * FROM Countries





CREATE TABLE JobHistory (
    EmployeeId int NOT NULL, 
	StartDate date, 
	End_Date date,
	JobId int NOT NULL,
	DepartmentId int NOT NULL
);

INSERT into JobHistory VALUES (101, '2015-06-24','2021-02-17', 1001, 1)
INSERT into JobHistory VALUES (102, '2015-08-21','2020-04-14', 1002, 2)
INSERT into JobHistory VALUES (103, '2012-04-12','2021-03-04', 1003, 2)
INSERT into JobHistory VALUES (104, '2017-02-10','2019-02-10', 1004, 1)
INSERT into JobHistory VALUES (105, '2020-03-19','2021-08-04', 1005, 1)

SELECT *FROM JobHistory



CREATE TABLE Jobs (
    JobId int NOT NULL, 
	JobTitle varchar(50) DEFAULT '  ', 
	MinSalary int DEFAULT 8000, 
	MaxSalary int DEFAULT NULL
);

ALTER TABLE Jobs ADD PRIMARY KEY (JobId)

INSERT into Jobs(JobId) VALUES (1001)
INSERT into Jobs VALUES (1003, 'HR', 9000, 21000)
INSERT into Jobs VALUES (1004, 'web Designer', 10000, 20000)
INSERT into Jobs VALUES (1002, 'Android Developer', 12000, 15000)
INSERT into Jobs VALUES (1005, 'HR', 10000, 17000)

SELECT * FROM Jobs



CREATE TABLE Departments (
	DepartmentId int NOT NULL PRIMARY KEY, 
	DepartmentName varchar(20) 
);

INSERT into Departments VALUES (1, 'HR')
INSERT into Departments VALUES (2, 'IT')

SELECT * FROM Departments




CREATE TABLE Employees (
    Employee_Id int NOT NULL UNIQUE, 
	FirstName varchar(20), 
	LastName varchar(20), 
	Email varchar(50), 
	PhoneNumber numeric(10), 
	Hire_Date date, 
	JobId int NOT NULL, 
	Salary int,
	Commission int, 
	Manager_Id int, 
	DepartmentId int FOREIGN KEY REFERENCES Departments(DepartmentId)
);

ALTER TABLE Employees ADD FOREIGN KEY (JobId) REFERENCES Jobs(JobId)

INSERT into Employees VALUES (101, 'Devendra', 'Gorana', 'dev@gmail.com', 9638427015, '2020-06-30', 1002, 12000, 500, 101, 1)
INSERT into Employees VALUES (102, 'Dev', 'Mehra', 'dev19@gmail.com', 9638422545, '2019-08-10', 1003, 15000, 600, 102, 2)

SELECT * FROM Employees 



