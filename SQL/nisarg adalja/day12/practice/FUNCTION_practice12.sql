
/* UDF function */

/*vSimilar to stored procedures, you can also CREATE functions to store a set of T-sql statementss permanently*/
/* These functions are also refferred to as user-defined functions */
/*UDF*/
/* Is a database object
contains a set of T-sql statements
Accept Parameters
Performs an action. 
returns the result of that action as a value */

/* Scalar Function */
--define function
CREATE FUNCTION dbo.ufnGetInventoryStk2(@Salary int=2500)  
RETURNS varchar(50)   
AS   
-- Returns the stock level for the product.  
BEGIN  
    DECLARE @ret int;  
    SELECT @ret=Count(*)   
    FROM Employee   
    WHERE Salary=@Salary
     IF (@ret IS NULL)   
        SET @ret = 0;  
    RETURN @ret;  
END; 

--calling function
declare @cnt int
set @cnt= dbo.ufnGetInventoryStk2(2500)
print 'Number Of Employees whose Salary is 2500 :'
print @cnt

/* TABLE-valued functions */

/* A TABLE-value function returns a TABLE as an output in the form of TABLE data type. */
/*The TABLE data type is a special data type used to store a set of rows*/


/* q1 employee name and salary whos manager name is given as function parameter  */
--define the function
SELECT * FROM Employee
ALTER function EmployeesListOfManager
(@ManagerName nvarchar(100))
returns TABLE
as 
return (SELECT e.FirstName,e.LastName,e.Salary,datediff(yyyy,e.HireDate,getdate()) as experience  FROM Employee e join Employee m on e.ManagerID=m.EmployeeID where m.FirstName=@ManagerName)
go

--calling
SELECT * FROM EmployeesListOfManager('Steven');

/* microsft example*/

--define the function
SELECT * FROM product
CREATE FUNCTION ufn_SalesByStore(@productName varchar(100))  
RETURNS TABLE  
AS  
RETURN   
(  
    SELECT P.Product_id, P.product_name,P.category  
    FROM Product AS P where P.product_name=@productName
   
);  

--calling
SELECT * FROM ufn_SalesByStore('camera')

-- TABLE-valued functions

--define function
ALTER FUNCTION FindEmployees_Whose_Manager_has_Dept(@deptName varchar(50))  
RETURNS @retFindReports TABLE   
(  
    EmployeeID int primary key NOT NULL, 
	ManagerID int,
	DepartmentID int, 
	ManagerName varchar(250), 
    FirstName varchar(255),  
    LastName varchar(255),  
    DepartmentName nvarchar(50),  
    Salary int NOT NULL  
)  
AS  
BEGIN  
WITH EMP_cte(EmployeeID,ManagerID,DepartmentID,ManagerName, FirstName, LastName, DepartmentName,Salary) -- CTE name and columns  
    AS (  
        SELECT e.EmployeeID,e.ManagerID,e.DepartmentID,m.FirstName,e.FirstName,e.LastName,d.DepartmentName,e.Salary -- Get the initial list of Employees for Manager n  
        FROM Employee e   
INNER JOIN Employee m   
ON e.ManagerID = m.EmployeeID    
join Departments d on m.DepartmentID=d.DepartmentID where d.DepartmentName=@deptName)  
-- copy the required columns to the result of the function   
   INSERT @retFindReports  
   SELECT EmployeeID,ManagerID,DepartmentID,ManagerName, FirstName, LastName, DepartmentName,Salary  
   FROM EMP_cte  
   return
END;  
GO  

--calling function
SELECT * FROM FindEmployees_Whose_Manager_has_Dept('Executive')

SELECT * FROM FindEmployees_Whose_Manager_has_Dept('IT')


/**/
/* CREATE a Type as TABLE with name TABLEType that will accept a TABLE having one varchar column */
CREATE type TABLEType
as TABLE ([value] varchar(100) null)

/* CREATE a function that will accept above declared TABLEType as TABLE-Valued Parameter and String Value as Separator */
CREATE function dbo.fn_get_string_with_delimeter (@TABLE TABLEType readonly,@Separator varchar(5))
returns varchar(500)
As
begin

    declare @return varchar(500)

    set @return = stuff((SELECT @Separator + value FROM @TABLE for xml path('')),1,1,'')

    return @return

end

declare @tab TABLEType
set @tab=25
SELECT dbo.fn_get_string_with_delimeter(@tab, ',')
