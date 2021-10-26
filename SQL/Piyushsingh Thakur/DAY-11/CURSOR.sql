DECLARE @Id INT,
 @Salary INT,
 @FName VARCHAR,
 @LName VARCHAR

DECLARE EmpSalary CURSOR FOR 
SELECT EmployeeID,FirstName,LastName,Salary FROM Employees

OPEN EmpSalary

FETCH NEXT FROM EmpSalary INTO  @Id,@FName,@LName,@Salary

WHILE @@FETCH_STATUS=0
BEGIN
	IF @Salary BETWEEN 3000 AND 4000
		BEGIN
			UPDATE Employees SET Salary=Salary+5000 WHERE CURRENT OF EmpSalary
		END

	ELSE IF @Salary BETWEEN 4000 AND 5500
		BEGIN
			UPDATE Employees SET Salary=Salary+7000 WHERE CURRENT OF EmpSalary
		END

	ELSE IF @Salary BETWEEN 5500 AND 6500
		BEGIN
			UPDATE Employees SET Salary=Salary+9000 WHERE CURRENT OF EmpSalary
		END
		
	FETCH NEXT FROM EmpSalary INTO @Salary

END

CLOSE EmpSalary

DEALLOCATE EmpSalary
