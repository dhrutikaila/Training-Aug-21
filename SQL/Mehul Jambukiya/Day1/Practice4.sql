USE NewOne

CREATE TABLE Departments
(
 DepartmentId int CONSTRAINT pkDepartmentId PRIMARY KEY,
 DepartmentName varchar(25) CONSTRAINT DeptName NOT NULL
);

CREATE TABLE Jobs
(
 JobId int CONSTRAINT pkJobId PRIMARY KEY,
 JobTitle varchar(25) CONSTRAINT JobTitle NOT NULL,
);

CREATE TABLE employees
(
 Employee_Id int CONSTRAINT PkEmpId PRIMARY KEY,
 FirstName varchar(20) CONSTRAINT Fname NOT NULL,
 LastName varchar(20) CONSTRAINT Lname NOT NULL,
 Email varchar(30) CONSTRAINT Email NOT NULL,
 PhoneNumber numeric(10) CONSTRAINT Phone NOT NULL,
 Hire_Date DATE CONSTRAINT Hdate NOT NULL,
 Job_Id int CONSTRAINT FkJobId FOREIGN KEY REFERENCES Jobs(JobId) ON DELETE SET NULL ON UPDATE CASCADE,
 Salary int CONSTRAINT Salary NOT NULL,
 Commission int CONSTRAINT defCommission DEFAULT NULL,
 Manager_Id int CONSTRAINT ManagerId NOT NULL,
 Department_Id int CONSTRAINT FkDepartmentId FOREIGN KEY REFERENCES Departments(DepartmentId) ON DELETE SET NULL ON UPDATE CASCADE,
);

INSERT INTO Departments VALUES (1,'DotNet'),(2,'PHP');

INSERT INTO Jobs VALUES (11,'Jr SE'),(12,'Sr SE');

INSERT INTO employees VALUES (21,'Paresh','Shah','paresh@gmail.com',1234567899,'05/05/2020',11,25000,500,5,1);
INSERT INTO employees VALUES (23,'Haresh','Dave','haresh@gmail.com',2534567899,'05/05/2020',11,24000,200,6,2);
INSERT INTO employees VALUES (25,'Dhaval','Patel','dhaval@gmail.com',3234567899,'05/05/2018',12,25000,900,5,1);

SELECT * FROM employees;
SELECT * FROM Jobs;
SELECT * FROM Departments;

