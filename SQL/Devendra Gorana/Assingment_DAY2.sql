SELECT * FROM Employees

SELECT FirstName, LastName from Employees

SELECT FirstName AS Employee_Name FROM Employees

SELECT * FROM Employees Where FirstName = 'Steven'

SELECT * FROM Employees Where FirstName = 'Neena' OR FirstName = 'Lex'

SELECT * FROM Employees Where NOT FirstName = 'Neena' AND NOT FirstName = 'Lex'

SELECT * FROM Employees Where Salary BETWEEN 5000 AND 8000

SELECT CONCAT(FirstName,' ',LastName) AS Names, Salary, PF=0.12*Salary FROM Employees

SELECT * FROM Employees WHERE FirstName LIKE 'N%'

SELECT DISTINCT DepartmentID FROM Employees

SELECT * FROM Employees ORDER BY FirstName DESC

SELECT EmployeeID, CONCAT(FirstName,' ',LastName) AS Names, Salary FROM Employees ORDER BY Salary

SELECT TOP(2) Salary FROM Employees


SELECT * FROM Employees

ALTER TABLE Employees DROP CONSTRAINT ukEmail
UPDATE Employees SET Email= 'Not Available'
SELECT * FROM Employees


UPDATE Employees SET CommissionPct= 0.10 
SELECT * FROM Employees


UPDATE Employees SET Email = 'Dont have',CommissionPct= 0.20 WHERE DepartmentID = 110
SELECT * FROM Employees


UPDATE Employees SET Email = 'Not Available TASk4' WHERE DepartmentID = 80 AND CommissionPct < 0.20
SELECT * FROM Employees


UPDATE Employees SET Email='Not Available TASK5' WHERE DepartmentID=(SELECT DepartmentID FROM Departments WHERE DepartmentName= 'Accounting')
SELECT * FROM Employees



UPDATE Employees SET Salary = 8000 WHERE EmployeeID = 105 AND Salary < 5000
SELECT * FROM Employees


UPDATE Employees SET JobId='SH_CLERK' WHERE EmployeeID = 118 AND DepartmentID = 30 AND JobId NOT LIKE 'SH%'
SELECT * FROM Employees

UPDATE Employees SET Salary+= Salary*0.25 WHERE DepartmentID = 40
SELECT * FROM Employees

UPDATE Employees SET Salary+= Salary*0.15 WHERE DepartmentID = 90
SELECT * FROM Employees

UPDATE Employees SET Salary+= Salary*0.10 WHERE DepartmentID = 110
SELECT * FROM Employees

SELECT * FROM Employees Where JobId ='PU_CLERK' 

SELECT * FROM Jobs

--UPDATE Jobs,Employees SET Jobs.MinSalary = Jobs.MinSalary+2000, Jobs.MaxSalary = Jobs.MaxSalary+2000,Employees.Salary = Employees.Salary+(Employees.Salary*0.20),Employees.CommissionPct = Employees.CommissionPct+0.10  WHERE Jobs.JobId = 'PU_CLERK' AND Employees.JobId = 'PU_CLERK'; 

SELECT * FROM Employees Where JobId ='PU_CLERK'