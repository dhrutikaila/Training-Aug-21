CREATE TABLE Employees
(
	Employee_Id int CONSTRAINT ckEmpId PRIMARY KEY,
	FirstName varchar(15) NOT NULL,
	LastName varchar(15) NOT NULL,
	Email varchar(100) CONSTRAINT ckEmail CHECK(Email LIKE '%_@__%.__%'),
	PhoneNumber Numeric(10) NOT NULL,
	Hire_Date varchar(11) CONSTRAINT ckHireDate CHECK(Hire_Date LIKE '__-__-____'),
	Job_Id int NOT NULL,
	Salary int,
	Commission int NOT NULL,
	Manager_Id int NOT NULL,
	Department_Id int NOT NULL,
	CONSTRAINT fk_DepId FOREIGN KEY (Department_Id) REFERENCES Department(DepartmentId),
	CONSTRAINT fk_JobId FOREIGN KEY (Job_Id) REFERENCES Jobs(JobId)
)

ALTER TABLE Employees 
DROP CONSTRAINT fk_DepID

ALTER TABLE Employees
ADD CONSTRAINT fk_DepId FOREIGN KEY (Department_Id) REFERENCES Department(DepartmentId);