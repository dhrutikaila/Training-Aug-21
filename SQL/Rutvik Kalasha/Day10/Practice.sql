--1
DECLARE Employee_Cursor CURSOR FOR  
SELECT FirstName, Salary FROM Employees;  
OPEN Employee_Cursor;  
FETCH NEXT FROM Employee_Cursor;  
WHILE @@FETCH_STATUS = 0  
   BEGIN  
      FETCH NEXT FROM Employee_Cursor;  
   END;  
CLOSE Employee_Cursor;  
DEALLOCATE Employee_Cursor; 

--2
DECLARE lastname_cursor CURSOR FOR  
SELECT LastName,Salary FROM Employees  
WHERE LastName LIKE 'B%'  
ORDER BY LastName;  
  
OPEN lastname_cursor;  
  
  
FETCH NEXT FROM lastname_cursor;  
  
WHILE @@FETCH_STATUS = 0  
BEGIN  
   FETCH NEXT FROM lastname_cursor;  
END  
  
CLOSE lastname_cursor;  
DEALLOCATE lastname_cursor;  

