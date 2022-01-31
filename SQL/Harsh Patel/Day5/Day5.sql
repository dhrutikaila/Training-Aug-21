USE JOIN1
SELECT * FROM Employees
SELECT * FROM Incentives 
CREATE DATABASE JOIN1
CREATE TABLE Employees
(
	Employee_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	First_Name VARCHAR(20),
	Last_Name VARCHAR(20),
	Salary INT,
	Department VARCHAR(20),
	Joinning_Date VARCHAR(20),
	Manager_ID INT
)
ALTER TABLE Employees ALTER COLUMN Joinning_Date VARCHAR(30),
INSERT INTO Employees(First_Name,Last_Name,Salary,Joinning_Date,Department,Manager_ID)
VALUES('john','ABRAHAM',1000000,'01-jan-13 12.00.00 AM','BANKING',NULL),
('MICHAEL','CLARKE',800000,'01-jan-13 12.00.00 AM','INSURANCE',1),
('ROY','THOMAS',700000,'01-feb-13 12.00.00 AM','banking',1),
('TOM','JOSE',600000,'01-feb-13 12.00.00 AM','INSURANCE',2),
('JERRY','PINTO',650000,'01-feb-13 12.00.00 AM','INSURANCE',3),
('PHILIP','MATHEW',750000,'01-jan-13 12.00.00 AM','SERVICES',3),
('TESTNAME1','123',650000,'01-jan-13 12.00.00 AM','SERVICES',2),
('TESTNAME2','LNAME%',600000,'01-feb-13 12.00.00 AM','INSURANCE',2)
SELECT * FROM Employees

CREATE TABLE Incentives
(
	Employee_ID INT CONSTRAINT fk FOREIGN KEY REFERENCES Employees(Employee_ID) IDENTITY(1,1),
	Incentive_Date VARCHAR(30),
	IncentiveE_Amount INT
)
ALTER TABLE Incentives ALTER COLUMN EMPLOYEE_ID INT 
INSERT INTO Incentives(Incentive_Date,Incentive_Amount )VALUES('01-FEB-13',5000),
('01-FEB-13',3000),
('01-FEB-13',4000);



--(1)Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

		
		SELECT DATEDIFF(YYYY,CONCAT('20',SUBSTRING(Joinning_date,8,2)),CONCAT('20',SUBSTRING(Incentive_Date,8,2))) 
		FROM Employees e JOIN Incentives i ON e.Employee_ID=i.Employee_Id

--(2)Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

		SELECT e.First_Name,i.Incentive_Amount FROM Employees e JOIN Incentives i ON e.Employee_Id=i.Employee_Id
		WHERE Incentive_Amount > 3000


--(3)Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

		SELECT e.First_Name,i.Incentive_Amount FROM Employees e LEFT JOIN Incentives i ON e.Employee_Id=i.Employee_Id	
	
--(4)Select EmployeeName, ManagerName from the employee table.

		SELECT e.First_Name AS Employee_Name,m.First_Name AS Manager_Name FROM Employees e JOIN 
		Employees m ON e.manager_Id=m.Employee_Id

--(5)Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

		SELECT e.First_Name,ISNULL(i.Incentive_Amount,0) FROM Employees e LEFT JOIN Incentives i ON e.Employee_Id=i.Employee_Id	
		
	