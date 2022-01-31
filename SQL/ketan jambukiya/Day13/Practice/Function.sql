--- CREATE TABLE

CREATE FUNCTION DEPART_NAME(@dname VARCHAR(20))
RETURNS TABLE
AS
RETURN(SELECT * FROM Departments WHERE DepartmentName=@dname)


SELECT * FROM DEPART_NAME('Administration')

-----
----

CREATE FUNCTION dbo.discount_price(@price DECIMAL(12,2), @discount DECIMAL(12,2)) 
RETURNS DECIMAL (12,2) AS
BEGIN
  RETURN @price * (1 - @discount);
END


SELECT  dbo.discount_price(128.36,.25) as price


----



CREATE FUNCTION dbo.employeesalary(@ID INT)  
RETURNS INT  
AS   
BEGIN  
    DECLARE @sal int  
    SELECT @sal = Salary * 2   
    FROM Employees   
    WHERE EmployeeID = @ID    
    RETURN @sal 
END

SELECT  dbo.employeesalary(EmployeeID) FROM Employees ORDER BY EmployeeID

select * from Employees

---- DELETE FUNCTION


DROP FUNCTION JKL



-----MODIFY FUNCTION


ALTER FUNCTION DEPART_NAME(@deptname VARCHAR(20))
RETURNS TABLE
AS
RETURN(SELECT * FROM Departments WHERE DepartmentName=@deptname)