USE SampleDB;
--FOR AND AFTER BOTH ARE SAME IN TRIGGER---
CREATE TRIGGER trEmployeeForInsert
ON Employees
AFTER INSERT						--AFTER
AS									
BEGIN 
END
        --OR--
CREATE TRIGGER trEmployeeForInsert
ON Employees						--FOR
FOR INSERT 
AS									
BEGIN 
END

-----CREATE TRIGGER FOR INSERT ------
CREATE TRIGGER trEmployeeForInsert
ON Employees
AFTER INSERT 
AS 
BEGIN 
	SELECT * FROM inserted
END

INSERT INTO Employees (EmployeeID,FirstName,LastName , Email, PhoneNumber, HireDate, JobId, Salary, CommissionPct, ManagerID, DepartmentID) VALUES
('207', 'Parth', 'King', 'SKING', '515.123.4567', '1987-06-17', 'AD_PRES', '24000.00', '0.00', '0', '90')

SELECT * FROM Employees

------- CREATE TRIGGER FOR DELETE -----
CREATE TRIGGER trEmployeeForDelete
ON Employees
AFTER DELETE 
AS 
BEGIN 
	SELECT * FROM deleted
END

DELETE FROM Employees WHERE EmployeeID = 207

SELECT * FROM Employees

--------CREATE TRIGGER FOR UPDATE-----
CREATE TRIGGER trEmployeeForUpdate
ON Employees
AFTER UPDATE 
AS 
BEGIN 
	SELECT * FROM inserted
	SELECT * FROM deleted
END

UPDATE Employees 
SET FirstName = 'ParthPatel' WHERE EmployeeID = 207