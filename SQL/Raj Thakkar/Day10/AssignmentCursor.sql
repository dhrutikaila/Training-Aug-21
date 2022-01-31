--Using cursor implement the following task employee

--Update the salary of the employee using following condition

--Salary between 30000 and 40000 — 5000 hike

--Salary between 40000 and 55000 — 7000 hike

--Salary between 55000 and 65000 — 9000 hike

SET NOCOUNT ON  
DECLARE @EmpID INT, @Salary decimal(8, 2)   
  
DECLARE EMPLOYEE_CUR CURSOR  
STATIC FOR  
SELECT EmployeeID, Salary FROM Employees 
OPEN EMPLOYEE_CUR  
IF @@CURSOR_ROWS>0
FETCH NEXT FROM EMPLOYEE_CUR INTO @EmpID, @Salary
WHILE @@FETCH_STATUS = 0  
BEGIN
IF @Salary BETWEEN 5000 AND 10000
   UPDATE Employees 
   SET Salary+=2000 
IF @Salary BETWEEN 10000 AND 20000
   UPDATE Employees 
   SET Salary+=3000 
IF @Salary BETWEEN 20000 AND 30000
   UPDATE Employees 
   SET Salary+=5000 
FETCH NEXT FROM EMPLOYEE_CUR INTO @EmpID, @Salary
END  
CLOSE EMPLOYEE_CUR 
DEALLOCATE EMPLOYEE_CUR 