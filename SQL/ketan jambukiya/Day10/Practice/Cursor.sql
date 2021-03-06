---- DECLARE CURSOR
   DECLARE EMP CURSOR
   FOR 
   SELECT EMPLOYEE_ID,FIRST_NAME,SALARY
   FROM Employee

   CLOSE EMP
   DEALLOCATE EMP




---- FETCH FIRST ROW USING CURSOR FROM EMPLOYEE


    DECLARE EMP CURSOR
   FOR 
   SELECT EMPLOYEE_ID,FIRST_NAME,SALARY
   FROM Employee
   OPEN EMP
   FETCH NEXT FROM EMP

   CLOSE EMP
   DEALLOCATE EMP

--- FETCH ALL DATA USING CURSOR FROM EMPLOYEE

SET NOCOUNT ON
DECLARE EMP CURSOR
STATIC FOR
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY

 FROM Employee
WHERE
SALARY>700000
OPEN EMP
IF @@CURSOR_ROWS>0
BEGIN 
FETCH NEXT FROM EMP
WHILE @@FETCH_STATUS=0
BEGIN
  
   FETCH NEXT FROM EMP
END
END
CLOSE EMP
DEALLOCATE EMP	
SET NOCOUNT OFF


----STORE IN VARIABLE


DECLARE @ID INT,@NAME VARCHAR(20), @DEP VARCHAR(10)
DECLARE EMP CURSOR 
STATIC FOR
SELECT EMPLOYEE_ID,FIRST_NAME,DEPARTMENT FROM Employee
WHERE DEPARTMENT='Insurance'
OPEN EMP

IF @@CURSOR_ROWS>0
BEGIN 
FETCH NEXT FROM EMP INTO @ID,@NAME,@DEP
WHILE @@FETCH_STATUS=0
BEGIN 
PRINT 'ID:'+CONVERT(VARCHAR(50),@ID) 
FETCH NEXT FROM EMP INTO @ID,@NAME,@DEP 
END
END
CLOSE EMP
DEALLOCATE EMP