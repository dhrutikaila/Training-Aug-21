-- Basic Differences between Stored Procedure and Function in SQL Server

    --1) The function must return a value but in Stored Procedure it is optional. Even a procedure can return zero or n values.

    --2) Functions can have only input parameters for it whereas Procedures can have input or output parameters.

    --3) Functions can be called from Procedure whereas Procedures cannot be called from a Function.

-- Advance Differences between Stored Procedure and Function in SQL Server

    --1) The procedure allows SELECT as well as DML(INSERT/UPDATE/DELETE) statement in it whereas Function allows only SELECT statement in it.

    --2) Procedures cannot be utilized in a SELECT statement whereas Function can be embedded in a SELECT statement.

    --3) Stored Procedures cannot be used in the SQL statements anywhere in the WHERE/HAVING/SELECT section whereas Function can be.

    --4) Functions that return tables can be treated as another rowset. This can be used in JOINs with other tables.

    --5) Inline Function can be though of as views that take parameters and can be used in JOINs and other Rowset operations.

    --6) An exception can be handled by try-catch block in a Procedure whereas try-catch block cannot be used in a Function.

    --7) We can use Transactions in Procedure whereas we can't use Transactions in Function.


-- SCALAR FUNCTIONS
    -- User-defined scalar functions return a single data value of the type defined in the RETURNS clause. For an inline scalar function, the returned scalar value is the result of a single statement. For a multistatement scalar function, the function body can contain a series of Transact-SQL statements that return the single value. The return type can be any data type except text, ntext, image, cursor, and timestamp

    CREATE FUNCTION COMPUTE_PF(@SALARY INT)
    RETURNS INT
    AS 
    BEGIN
    RETURN (@SALARY * 0.12)
    END

    CREATE FUNCTION COMPUTE_PT(@SALARY INT)
    RETURNS INT
    AS 
    BEGIN
        IF(@SALARY < 5999)
        RETURN 0
        ELSE IF(@SALARY BETWEEN  6000 AND 8999)
        RETURN 80
        ELSE IF(@SALARY BETWEEN 9000 AND 11999)
        RETURN 150
        ELSE IF(@SALARY > 12000)
        RETURN 200 
    RETURN NULL
    END

    select *,PF = DBO.COMPUTE_PF(Salary),PT = DBO.COMPUTE_PT(Salary) FROM Employees

-- TABLE-VALUED FUNCTIONS

    CREATE FUNCTION [dbo].[udfGetProductList]
    (@SafetyStockLevel SMALLINT)
    RETURNS TABLE
    AS
    RETURN
    (SELECT Product.ProductID, 
            Product.Name, 
            Product.ProductNumber
    FROM Production.Product
    WHERE SafetyStockLevel >= @SafetyStockLevel)

    
    SELECT * FROM dbo.udfGetProductList( 100 )