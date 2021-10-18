

select * from Departments 
select * from employees where DepartmentID=40
use subqueries


--update salary 5000 where Departments is Human Resources 
DECLARE  @ID decimal(8,0),@NAME varchar(34),@salary DECIMAL(8,0)
DECLARE update_cursor CURSOR 
FOR SELECT e.EmployeeID,e.firstname,e.Salary FROM Employees e join Departments d ON e.DepartmentID=d.DepartmentID  WHERE d.DepartmentName='Human Resources'
OPEN update_cursor
FETCH NEXT FROM update_cursor INTO @ID,@NAME,@SALARY

WHILE @@FETCH_STATUS=0
BEGIN
		
	UPDATE Employees SET Salary=salary+5000 WHERE CURRENT OF update_cursor 	

END
CLOSE update_cursor
DEALLOCATE update_cursor



