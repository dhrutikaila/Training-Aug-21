DECLARE @id DECIMAL(6,0) ;
DECLARE @FirstName VARCHAR(20);
DECLARE @email VARCHAR(25);
DECLARE @salary DECIMAL(8,2);
DECLARE @DeptName VARCHAR(30);

---declare cursor

DECLARE emp_detail CURSOR FOR
  SELECT e.EmployeeID , e.FirstName,e.Email,e.Salary,d.DepartmentName  
  FROM Employees e
  JOIN Departments d ON e.DepartmentID=d.DepartmentID

--OPEN CURSOR

OPEN emp_detail ;

--loop through cursor

FETCH NEXT FROM emp_detail INTO @id,@FirstName,@email,@salary,@DeptName ;
WHILE @@FETCH_STATUS=0
	BEGIN
	PRINT ('EmpId is:'+CONVERT(VARCHAR(10), @id) + ',FirstName:'+@FirstName+',Email:'+@email+',
	salary :'+CONVERT(VARCHAR(20),@salary)+',DepartmentName:'+@DeptName )
	FETCH NEXT FROM emp_detail INTO @id,@FirstName,@email,@salary,@DeptName
	END

CLOSE emp_detail
DEALLOCATE emp_detail

---------------------------

DECLARE @id DECIMAL(6,0) ;
DECLARE @FirstName VARCHAR(20);
DECLARE @email VARCHAR(25);
DECLARE @salary DECIMAL(8,2);
DECLARE @DeptName VARCHAR(30);

---declare cursor

DECLARE emp_detail CURSOR 
LOCAL SCROLL FOR
  SELECT e.EmployeeID , e.FirstName,e.Email,e.Salary,d.DepartmentName  
  FROM Employees e
  JOIN Departments d ON e.DepartmentID=d.DepartmentID

--OPEN CURSOR

OPEN emp_detail ;

--loop through cursor

FETCH NEXT FROM emp_detail INTO @id,@FirstName,@email,@salary,@DeptName ;

PRINT  'EMPID: ' + CONVERT(VARCHAR(10),@id)+  '  EMP_NAME '+@FirstName +'  Email: '  +@email  +  '  salary ' +
CONVERT(VARCHAR(20),@salary)+',DepartmentName:'+@DeptName  
FETCH FIRST FROM emp_detail INTO  @id ,@FirstName,@email,@salary

CLOSE emp_detail
DEALLOCATE emp_detail


------SCROLL PRACTICE----------
/* 
 5 TYPES OF MODE :RELATIVE , ABSLOUTE , FIRST , LAST ,NEXT ,PRIOR
*/
DECLARE @id DECIMAL(6,0) ;
DECLARE @FirstName VARCHAR(20);
DECLARE @email VARCHAR(25);
DECLARE @salary DECIMAL(8,2);
DECLARE @DeptName VARCHAR(30);

---declare cursor

DECLARE emp_detail CURSOR 
LOCAL SCROLL FOR
  SELECT e.EmployeeID , e.FirstName,e.Email,e.Salary,d.DepartmentName  
  FROM Employees e
  JOIN Departments d ON e.DepartmentID=d.DepartmentID

--OPEN CURSOR

OPEN emp_detail ;

--loop through cursor

FETCH NEXT FROM emp_detail INTO @id,@FirstName,@email,@salary,@DeptName ;

FETCH RELATIVE 3 FROM emp_detail INTO @id ,@FirstName,@email,@salary,@DeptName

PRINT  'EMPID: ' + CONVERT(VARCHAR(10),@id)+  '  EMP_NAME '+@FirstName +'  Email: '  +@email  +  '  salary ' +
CONVERT(VARCHAR(20),@salary)+',DepartmentName:'+@DeptName  

FETCH ABSOLUTE 3 FROM emp_detail INTO @id ,@FirstName,@email,@salary,@DeptName

PRINT  'EMPID: ' + CONVERT(VARCHAR(10),@id)+  '  EMP_NAME '+@FirstName +'  Email: '  +@email  +  '  salary ' +
CONVERT(VARCHAR(20),@salary)+',DepartmentName:'+@DeptName 

--RETURN FIRST RAW
FETCH FIRST FROM emp_detail INTO  @id ,@FirstName,@email,@salary,@DeptName
PRINT  'EMPID: ' + CONVERT(VARCHAR(10),@id)+  '  EMP_NAME '+@FirstName +'  Email: '  +@email  +  '  salary ' +
CONVERT(VARCHAR(20),@salary)+',DepartmentName:'+@DeptName  
FETCH LAST FROM emp_detail INTO  @id ,@FirstName,@email,@salary,@DeptName

--RETURN LAST ROW
FETCH LAST FROM emp_detail INTO  @id ,@FirstName,@email,@salary,@DeptName

PRINT  'EMPID: ' + CONVERT(VARCHAR(10),@id)+  '  EMP_NAME '+@FirstName +'  Email: '  +@email  +  '  salary ' +
CONVERT(VARCHAR(20),@salary)+',DepartmentName:'+@DeptName  
FETCH LAST FROM emp_detail INTO  @id ,@FirstName,@email,@salary,@DeptName

FETCH PRIOR FROM emp_detail INTO  @id ,@FirstName,@email,@salary,@DeptName

PRINT  'EMPID: ' + CONVERT(VARCHAR(10),@id)+  '  EMP_NAME '+@FirstName +'  Email: '  +@email  +  '  salary ' +
CONVERT(VARCHAR(20),@salary)+',DepartmentName:'+@DeptName  
FETCH LAST FROM emp_detail INTO  @id ,@FirstName,@email,@salary,@DeptName

FETCH NEXT FROM emp_detail INTO  @id ,@FirstName,@email,@salary,@DeptName

PRINT  'EMPID: ' + CONVERT(VARCHAR(10),@id)+  '  EMP_NAME '+@FirstName +'  Email: '  +@email  +  '  salary ' +
CONVERT(VARCHAR(20),@salary)+',DepartmentName:'+@DeptName  
FETCH LAST FROM emp_detail INTO  @id ,@FirstName,@email,@salary,@DeptName

CLOSE emp_detail
DEALLOCATE emp_detail


--STATIC CURSOR---
/* we can not update the static cursor if we try to update the static cursor it will give an error*/
DECLARE @id DECIMAL(6,0) ;
DECLARE @FirstName VARCHAR(20);
DECLARE @email VARCHAR(25);
DECLARE @salary DECIMAL(8,2);
DECLARE @DeptName VARCHAR(30);

---declare cursor

DECLARE emp_detail CURSOR 
STATIC FOR
  SELECT e.EmployeeID , e.FirstName,e.Email,e.Salary,d.DepartmentName  
  FROM Employees e
  JOIN Departments d ON e.DepartmentID=d.DepartmentID

--OPEN CURSOR

OPEN emp_detail ;

--loop through cursor

FETCH NEXT FROM emp_detail INTO @id,@FirstName,@email,@salary,@DeptName ;
WHILE @@FETCH_STATUS=0
	BEGIN
	IF(@id%2=0)
	BEGIN
	PRINT ('EmpId is:'+CONVERT(VARCHAR(10), @id) + ',FirstName:'+@FirstName+',Email:'+@email+',
	salary :'+CONVERT(VARCHAR(20),@salary)+',DepartmentName:'+@DeptName )
	END
	FETCH NEXT FROM emp_detail INTO @id,@FirstName,@email,@salary,@DeptName
	END

CLOSE emp_detail
DEALLOCATE emp_detail

--Try to update the static cursor --
DECLARE @id DECIMAL(6,0) ;
DECLARE @FirstName VARCHAR(20);
DECLARE @email VARCHAR(25);
DECLARE @salary DECIMAL(8,2);
DECLARE @DeptName VARCHAR(30);

---declare cursor

DECLARE emp_detail CURSOR 
STATIC FOR
  SELECT e.EmployeeID , e.FirstName,e.Email,e.Salary,d.DepartmentName  
  FROM Employees e
  JOIN Departments d ON e.DepartmentID=d.DepartmentID

--OPEN CURSOR

OPEN emp_detail ;

--loop through cursor

FETCH NEXT FROM emp_detail INTO @id,@FirstName,@email,@salary,@DeptName ;
WHILE @@FETCH_STATUS=0
	BEGIN
	IF(@id%2=0)
	BEGIN
	UPDATE Employees SET Email='No available' WHERE CURRENT OF emp_detail
	END
	FETCH NEXT FROM emp_detail INTO @id,@FirstName,@email,@salary,@DeptName
	END

CLOSE emp_detail
DEALLOCATE emp_detail


---DYNAMIC CURSOR--
--IN DYNAMIC CURSOR WE CAN ABLE TO UPDATE THE TABLE VALUE 
DECLARE @id DECIMAL(6,0) ;
DECLARE @FirstName VARCHAR(20);
DECLARE @email VARCHAR(25);
DECLARE @salary DECIMAL(8,2);
DECLARE @DeptName VARCHAR(30);

---declare cursor

DECLARE emp_detail CURSOR 
DYNAMIC FOR
  SELECT e.EmployeeID , e.FirstName,e.Email,e.Salary,d.DepartmentName  
  FROM Employees e
  JOIN Departments d ON e.DepartmentID=d.DepartmentID

--OPEN CURSOR

OPEN emp_detail ;

--loop through cursor

FETCH NEXT FROM emp_detail INTO @id,@FirstName,@email,@salary,@DeptName ;
WHILE @@FETCH_STATUS=0
	BEGIN
	IF(@id%2=0)
	BEGIN
	UPDATE Employees SET Email='No available_CURSOR' WHERE CURRENT OF emp_detail
	END
	FETCH NEXT FROM emp_detail INTO @id,@FirstName,@email,@salary,@DeptName
	END

CLOSE emp_detail
DEALLOCATE emp_detail


---FAST-FORWARD---
--it is also read as a static cursor we can not modify the data in fast-forward cursor

---KEY-SCROLL----
DECLARE @id DECIMAL(6,0) ;
DECLARE @FirstName VARCHAR(20);
DECLARE @email VARCHAR(25);
DECLARE @salary DECIMAL(8,2);
DECLARE @DeptName VARCHAR(30);

---declare cursor

DECLARE emp_detail CURSOR 
KEYSET SCROLL FOR
  SELECT e.EmployeeID , e.FirstName,e.Email,e.Salary,d.DepartmentName  
  FROM Employees e
  JOIN Departments d ON e.DepartmentID=d.DepartmentID

--OPEN CURSOR

OPEN emp_detail ;

--loop through cursor

FETCH NEXT FROM emp_detail INTO @id,@FirstName,@email,@salary,@DeptName ;
WHILE @@FETCH_STATUS=0
	BEGIN
	IF(@id%2=0)
	BEGIN
	UPDATE Employees SET FirstName='=CURSOR' WHERE CURRENT OF emp_detail
	END
	FETCH NEXT FROM emp_detail INTO @id,@FirstName,@email,@salary,@DeptName
	END

CLOSE emp_detail
DEALLOCATE emp_detail





