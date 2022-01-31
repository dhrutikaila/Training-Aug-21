--Using cursor implement the following task employee

--Update the salary of the employee using following condition

--Salary between 30000 and 40000 — 5000 hike

--Salary between 40000 and 55000 — 7000 hike

--Salary between 55000 and 65000 — 9000 hike
USE NewEmpDB

SELECT * FROM Employee

DECLARE @TempSalary MONEY
DECLARE @TempId INT
DECLARE CUR_EMP CURSOR FOR
SELECT EMPLOYEE_ID,SALARY 
FROM Employee

OPEN CUR_EMP

FETCH NEXT FROM CUR_EMP INTO @TempId,@TempSalary

WHILE @@FETCH_STATUS = 0
BEGIN  
	IF @TempSalary>300000 AND @TempSalary<400000 
   		UPDATE Employee
		SET SALARY = SALARY+5000
		WHERE EMPLOYEE_ID=@TempId

	IF @TempSalary>400000 AND @TempSalary<550000 
   		UPDATE Employee
		SET SALARY = SALARY+7000
		WHERE EMPLOYEE_ID=@TempId

	IF @TempSalary>550000 AND @TempSalary<650000 
   		UPDATE Employee
		SET SALARY = SALARY+9000
		WHERE EMPLOYEE_ID=@TempId

 	FETCH NEXT FROM CUR_EMP INTO @TempId,@TempSalary
END 
CLOSE CUR_EMP  

DEALLOCATE CUR_EMP 

