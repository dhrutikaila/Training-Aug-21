USE Cursor_DB

CREATE TABLE Employee
(
	Employee_ID INT PRIMARY KEY IDENTITY(1,1),
	First_Name VARCHAR(15) NOT NULL,
	Last_Name VARCHAR(15) NOT NULL,
	Salary MONEY NOT NULL,
	Joining_Date VARCHAR(25) NOT NULL,
	Depaerment VARCHAR(15) NOT NULL,
	Manager_ID INT 
)


INSERT INTO Employee VALUES
	('John','Abraham',42000,'01-JAN-13 12.00.00 AM','Banking',NULL),
	('Michael','Clarke',55000,'01-JAN-13 12.00.00 AM', 'Insurance',1),
	('Roy','Thomas',35000,'01-FEB-13 12.00.00 AM','Banking',1),
	('Tom','Jose',60000,'01-FEB-13 12.00.00 AM','Insurance',2),
	('Jerry','Pinto',40000,'01-FEB-13 12.00.00 AM','Insurance',3),
	('Philip','Mathew',30000,'01-JAN-13 12.00.00 AM','Services',3),
	('TestName1','123',57000,'01-JAN-13 12.00.00 AM','Services',2),
	('TestName2','Lname%',47000,'01-FEB-13 12.00.00 AM','Insurance',2)

TRUNCATE TABLE Employee

/*Using cursor implement the following task employee
  Update the salary of the employee using following condition
  Salary between 30000 and 40000 — 5000 hike
  Salary between 40000 and 55000 — 7000 hike
  Salary between 55000 and 65000 — 9000 hike*/

SET NOCOUNT ON
DECLARE  @ID INT,@Salary MONEY 
DECLARE EmpSalary CURSOR
STATIC FOR
SELECT Employee_ID,Salary FROM Employee
OPEN EmpSalary
IF @@CURSOR_ROWS > 0
BEGIN
	FETCH NEXT FROM EmpSalary INTO @ID,@Salary
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		UPDATE Employee SET Salary += 
		CASE 
		WHEN @Salary BETWEEN 30000 AND 40000 THEN 5000
		WHEN @Salary BETWEEN 40001 AND 55000 THEN 7000
		WHEN @Salary BETWEEN 55001 AND 65000 THEN 9000
		ELSE 0
		END 
		WHERE Employee_ID = @ID
		FETCH NEXT FROM EmpSalary INTO @ID, @Salary
	END
END
CLOSE EmpSalary
DEALLOCATE EmpSalary
SET NOCOUNT OFF



SELECT * FROM Employee
