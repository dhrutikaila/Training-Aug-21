--CTE (Common Table Expression)
WITH CTE 
AS
(
SELECT Departments.DepartmentID, Employees.FirstName FROM Employees 
JOIN Departments ON Employees.DepartmentID= Departments.DepartmentID)
SELECT * FROM cte

--BATCH

--Declare Variable And Use that variable
DECLARE @Rate int 
SELECT @Rate = MAX(Salary) FROM Employees
PRINT @Rate

SELECT FirstName, (@Rate - Salary) AS Diff_Salary FROM Employees

--IF ELSE STatment 

DECLARE @AvgSalary int
SELECT @AvgSalary = AVG(Salary) FROM Employees
DECLARE @Salary int
SELECT @Salary = Salary FROM Employees WHERE FirstName = 'Devil'

IF @Salary < @AvgSalary
PRINT 'Salary is grater then Avrage salary.'
ELSE
BEGIN
PRINT 'Salary is Less Then Avrage salary.'
PRINT @Salary
PRINT @AvgSalary
END


--CASE Statement
ALTER TABLE Employees
ADD Gender Varchar(10) NULL
SELECT * FROM Employees

UPDATE Employees SET Gender ='M' WHERE EmployeeID =100
UPDATE Employees SET Gender ='M' WHERE EmployeeID =101
UPDATE Employees SET Gender ='F' WHERE EmployeeID =102
UPDATE Employees SET Gender ='M' WHERE EmployeeID =103
UPDATE Employees SET Gender ='F' WHERE EmployeeID =104

SELECT EmployeeID, 'Gender' = 
CASE Gender
	WHEN 'M' THEN 'MALE'
	WHEN 'F' THEN 'FEMALE'
	ELSE 'Not Specifide'
END
FROM Employees

--While LOOP Statement
WHILE (SELECT AVG(Salary) FROM Employees) < 10000 
BEGIN
	UPDATE Employees SET Salary = Salary * 2
	SELECT MAX(Salary) FROM Employees
	IF (SELECT MAX(SALARY) FROM Employees) > 15000
	BREAK
	ELSE
	CONTINUE
END

SELECT * FROM Employees

CREATE VIEW Del_Column
AS
(
SELECT CONCAT(FirstName, ' ', LastName) AS Names, DepartmentID,Gender FROM Employees
)
SELECT * FROM Del_Column

ALTER VIEW Del_Column
AS
(
SELECT CONCAT(FirstName, ' ', LastName) AS Names, DepartmentID FROM Employees
)
SELECT * FROM Del_Column





	


