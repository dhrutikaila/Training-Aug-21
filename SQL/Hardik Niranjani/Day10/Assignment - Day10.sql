/*
Using cursor implement the following task employee
Update the salary of the employee using following condition
  Salary between 30000 and 40000 — 5000 hike
  Salary between 40000 and 55000 — 7000 hike
  Salary between 55000 and 65000 — 9000 hike
 */


CREATE TABLE Employee_Cursor
(
	EMPLOYEE_ID INT NOT NULL,
	FIRST_NAME VARCHAR(15) NOT NULL,
	LAST_NAME VARCHAR(20) NOT NULL,
	SALARY INT NOT NULL,
	JOINING_DATE DATETIME NOT NULL,
	DEPARTMENT VARCHAR(20) NOT NULL,
	MANAGER_ID INT NULL,
)

INSERT INTO Employee_Cursor VALUES(1,'John', 'Abraham',47000,'2013-01-01 12:00:0 AM', 'Banking', NULL),
						   (2,'Michael', 'Clarke',52000,'2013-01-01 12:00:0 AM', 'Insurance', 1),
						   (3,'Roy', 'Thomas',41000,'2013-FEB-01 12:00:0 AM', 'Banking', 1),
						   (4,'Tom', 'Jose',62000,'2013-FEB-01 12:00:0 AM', 'Insurance', 2),
						   (5,'Jerry', 'Pinto',48000,'2013-FEB-01 12:00:0 AM', 'Insurance', 3),
						   (6,'Phillip', 'Mathew',32000,'2013-JAN-01 12:00:0 AM', 'Service', 3),
						   (7,'TestName1', '123',58000,'2013-JAN-01 12:00:0 AM', 'Service', 2),
						   (8,'TestName2', 'Lname%',38000,'2013-FEB-01 12:00:0 AM', 'Insurance', 2)

SELECT * FROM Employee_Cursor

--------------------------------------------------------------------------------------------------------------------------

SET NOCOUNT ON
DECLARE  @ID INT,@Salary INT
DECLARE Employee_Salary CURSOR
STATIC FOR
SELECT EMPLOYEE_ID,SALARY FROM Employee_Cursor
OPEN Employee_Salary
IF @@CURSOR_ROWS > 0
BEGIN
	FETCH NEXT FROM Employee_Salary INTO @ID, @Salary
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		UPDATE Employee_Cursor SET SALARY = SALARY + 
		CASE 
			WHEN @Salary BETWEEN 30000 AND 40000 THEN 5000
			WHEN @Salary BETWEEN 40001 AND 55000 THEN 7000
			WHEN @Salary BETWEEN 55001 AND 65000 THEN 9000
		ELSE 0
		END 
			WHERE EMPLOYEE_ID = @ID
			FETCH NEXT FROM Employee_Salary INTO @ID, @Salary
	END
END
CLOSE Employee_Salary
DEALLOCATE Employee_Salary
SET NOCOUNT OFF

SELECT * FROM Employee_Cursor