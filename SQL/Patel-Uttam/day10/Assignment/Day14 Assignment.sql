
USE [Day14 (Cursor)]


-- Assignment

/*

Using cursor implement the following task employee

Update the salary of the employee using following condition

Salary between 30000 and 40000 — 5000 hike

Salary between 40000 and 55000 — 7000 hike

Salary between 55000 and 65000 — 9000 hike

*/


-- Salary between 30000 and 40000 — 5000 hike

SELECT * FROM Employee

DECLARE cursor1 CURSOR 
FOR
SELECT EMPLOYEE_ID , FIRST_NAME , SALARY FROM Employee

DECLARE @id int
DECLARE @sal int
DECLARE @name varchar(20)

OPEN cursor1

FETCH NEXT FROM cursor1 into @id,@name,@sal
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @id
	IF (@sal/12) BETWEEN 30000 AND 40000
	BEGIN

		UPDATE Employee SET Salary = (Salary + 5000) WHERE CURRENT OF cursor1
	END
	FETCH NEXT FROM cursor1 into @id,@name,@sal

END
CLOSE cursor1
DEALLOCATE cursor1
SELECT * FROM Employee

GO



--Salary between 40000 and 55000 — 7000 hike

SELECT * FROM Employee

DECLARE cursor2 CURSOR 
FOR
SELECT EMPLOYEE_ID , FIRST_NAME , SALARY FROM Employee

DECLARE @id int
DECLARE @sal int
DECLARE @name varchar(20)

OPEN cursor2

FETCH NEXT FROM cursor2 into @id,@name,@sal
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @id
	IF (@sal/12) BETWEEN 40000 AND 55000
	BEGIN

		UPDATE Employee SET Salary = (Salary + 7000) WHERE CURRENT OF cursor2
	END
	FETCH NEXT FROM cursor2 into @id,@name,@sal

END
CLOSE cursor2
DEALLOCATE cursor2
SELECT * FROM Employee
GO





-- Salary between 55000 and 65000 — 9000 hike

SELECT * FROM Employee

DECLARE cursor3 CURSOR 
FOR
SELECT EMPLOYEE_ID , FIRST_NAME , SALARY FROM Employee

DECLARE @id int
DECLARE @sal int
DECLARE @name varchar(20)

OPEN cursor3

FETCH NEXT FROM cursor3 into @id,@name,@sal
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @id
	IF (@sal/12) BETWEEN 55000 AND 65000
	BEGIN

		UPDATE Employee SET Salary = (Salary + 9000) WHERE CURRENT OF cursor3
	END
	FETCH NEXT FROM cursor3 into @id,@name,@sal

END
CLOSE cursor3
DEALLOCATE cursor3
SELECT * FROM Employee
GO






/*
DECLARE @sal int
SET @sal = 100000 

IF @sal/100 = 1000
BEGIN
	PRINT 'ok'
END
ELSE
BEGIN
	PRINT 'not'
END
GO