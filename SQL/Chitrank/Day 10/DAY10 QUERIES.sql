/****** Script for SelectTopNRows command from SSMS  ******/

/*
PRACTICING CURSOR
*/
DECLARE @Fname VARCHAR(10),@Lname VARCHAR(10)
DECLARE cur_chit CURSOR 
STATIC FOR
SELECT FirstName,LastName FROM chitran

OPEN cur_chit
IF @@CURSOR_ROWS>0
BEGIN
FETCH NEXT FROM cur_chit INTO @Fname,@Lname
WHILE @@FETCH_STATUS=0
BEGIN
PRINT @Fname + ' ' +  @Lname
FETCH NEXT FROM cur_chit INTO @Fname,@Lname
END
END
CLOSE cur_chit
DEALLOCATE cur_chit



/*
DAILY TASK  
*/
SET NOCOUNT ON  
DECLARE @EmpID INT
DECLARE @Fname VARCHAR(10)
DECLARE @Lname VARCHAR(15)
DECLARE @Email varchar(25)
DECLARE @PhoneNumber varchar(20)
DECLARE @HireDate date  
DECLARE @JobId varchar(10)  
DECLARE @Salary decimal(8, 2) 
DECLARE @CommissionPct decimal(2, 2) 
DECLARE @ManagerID decimal(6, 0)
DECLARE @DepartmentID decimal(4, 0)  
  
DECLARE EMP_CURSOR CURSOR  
DYNAMIC FOR  
SELECT * FROM EmpTmp 
OPEN EMP_CURSOR  
FETCH NEXT FROM EMP_CURSOR INTO  @EmpID,@Fname,@Lname,@Email,@PhoneNumber,@HireDate,@JobId,@Salary,@CommissionPct,
@ManagerID,@DepartmentID 
WHILE @@FETCH_STATUS = 0  
BEGIN
IF @Salary BETWEEN 5000 AND 10000
UPDATE EmpTmp SET Salary+=2000 WHERE CURRENT OF EMP_CURSOR
IF @Salary BETWEEN 10000 AND 20000
UPDATE EmpTmp SET Salary+=3000 WHERE CURRENT OF EMP_CURSOR
IF @Salary BETWEEN 20000 AND 30000
UPDATE EmpTmp SET Salary+=5000 WHERE CURRENT OF EMP_CURSOR
FETCH NEXT FROM EMP_CURSOR INTO @EmpID,@Fname,@Lname,@Email,@PhoneNumber,@HireDate,@JobId,@Salary,@CommissionPct,
@ManagerID,@DepartmentID  
END  
CLOSE EMP_CURSOR  
DEALLOCATE EMP_CURSOR  
SELECT * FROM EmpTmp 
