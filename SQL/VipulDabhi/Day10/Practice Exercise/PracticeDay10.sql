
--Without CURSOR Variable

DECLARE MyCursor CURSOR SCROLL FOR SELECT * FROM Employee

OPEN MyCursor
FETCH FIRST FROM MyCursor
FETCH LAST FROM MyCursor
FETCH PRIOR FROM MyCursor
FETCH ABSOLUTE 7 FROM MyCursor
CLOSE MyCursor
Deallocate MyCursor

--With CURSOR Variable
DECLARE MyCursor CURSOR SCROLL FOR SELECT EmployeeID,Salary  FROM Employee
DECLARE @EmployeeId INT ,@Salary INT
OPEN MyCursor
FETCH FIRST FROM MyCursor INTO @EmployeeId,@Salary
PRINT 'Employee Id is'+CAST(@EmployeeId AS VARCHAR(50))+' And Salary Of Employee is'+CAST(@Salary AS VARCHAR(50))
CLOSE MyCursor
Deallocate MyCursor

--Example1

SET NOCOUNT ON  
DECLARE @EmployeeId INT  
DECLARE @FirstName VARCHAR(50)  
DECLARE @Salary INT  
DECLARE @DepartmentId INT 
  
DECLARE EMP_CURSOR CURSOR  
LOCAL  FORWARD_ONLY  FOR  
SELECT EmployeeId ,FirstName,Salary,DepartmentId FROM Employees  
OPEN EMP_CURSOR  
FETCH NEXT FROM EMP_CURSOR INTO  @EmployeeId ,@FirstName,@Salary,@DepartmentId  
WHILE @@FETCH_STATUS = 0  
BEGIN  
PRINT  @EmployeeId 
FETCH NEXT FROM EMP_CURSOR INTO  @EmployeeId ,@FirstName,@Salary,@DepartmentId  
END  
CLOSE EMP_CURSOR  
DEALLOCATE EMP_CURSOR  

--Example2

SET NOCOUNT ON  
DECLARE @EmployeeId INT  
DECLARE @FirstName NVARCHAR(MAX)  
DECLARE @Salary INT  
DECLARE @DepartmentId INT  
  
DECLARE EMP_CURSOR CURSOR  
 SCROLL FOR  
SELECT EmployeeId,FirstName,Salary,DepartmentId FROM Employees
OPEN EMP_CURSOR  
FETCH NEXT FROM EMP_CURSOR INTO  @EmployeeId ,@FirstName,@Salary,@DepartmentId  
WHILE @@FETCH_STATUS = 0  
BEGIN  
If @EmployeeId%2=0  
BEGIN  
UPDATE Employees SET @Salary=15000 WHERE CURRENT OF EMP_CURSOR  
END  
FETCH NEXT FROM EMP_CURSOR INTO  @EmployeeId ,@FirstName,@Salary,@DepartmentId  
END  
CLOSE EMP_CURSOR  
DEALLOCATE EMP_CURSOR  