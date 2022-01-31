CREATE TABLE employee (
Employee_Id INT PRIMARY KEY IDENTITY(100,3),
FirstName VARCHAR(10),
LastName VARCHAR(10),
Email VARCHAR(30)  UNIQUE CONSTRAINT chk_Email CHECK (Email LIKE '%@%.___') ,
PhoneNumber NUMERIC(10)  UNIQUE CONSTRAINT chk_Mobile CHECK (PhoneNumber BETWEEN 1000000000 AND 9999999999),
HireDate DATE,
JobId INT CONSTRAINT fkForeig REFERENCES Jobs(JobId) on UPDATE cascade,
Salary MONEY,
Commission INT ,
ManagerId INT ,
DepartmentId INT CONSTRAINT fkkForeig REFERENCES Department(DepartmentId) on UPDATE cascade
)


CREATE TABLE Jobs (
JobId INT PRIMARY KEY IDENTITY(10,2),
JobTitle VARCHAR(20) DEFAULT ' ' NOT NULL,
MinSalary INT DEFAULT 8000,
MaxSalary INT DEFAULT NULL
)

CREATE TABLE Department(
DepartmentId INT PRIMARY KEY IDENTITY(1,1),
DepartmentName VARCHAR(20) NOT NULL
)

INSERT INTO employee 
vALUES('Barkha','Mahajan','barkha@gmail.com',9870087829,'2021-08-02',18,200000,2000,2,3)
('Shreya','Patel','shreya@gmail.com',9884686429,'2017-04-28',14,200000,122000,3,2),
('Ruchika','Sadaiya','ruchika@gmail.com',9812345678,'2018-07-16',16,100000,2000,2,3),
('Seema','Shah','bseema@gmail.com',9887654321,'2020-12-04',10,40000,2000,2,1)

INSERT INTO Jobs (JobTitle) VALUES ('QA')
INSERT INTO Jobs (JobTitle, MinSalary) 
VALUES ('Python Developer', 10000),
('Java Developer', 9000)
('Sr. Python Developer', 50000)
('Sr. Java Developer', 45000)

INSERT INTO Department VALUES ('QA')
('Developer')
('Sr. Developer')


SELECT * FROM employee
SELECT * FROM Jobs
SELECT * FROM Department
