-- 1)Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.

    CREATE FUNCTION COMPUTE_PF(@SALARY INT)
    RETURNS INT
    AS 
    BEGIN
    RETURN (@SALARY * 0.12)
    END

-- executing function
    DECLARE @SALARY INT
    SET @SALARY = dbo.COMPUTE_PF(20000)
    PRINT @SALARY

-- 2)Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.
    -- Monthly Earnings	Profession Tax Payable
    -- Below Rs. 5999	Nil
    -- Rs. 6000 to Rs. 8999	Rs. 80/month
    -- Rs. 9000 to Rs. 11999	Rs. 150/month
    -- Rs 12000 and above	Rs. 200/month

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

    --EXECUTING FUNCTION 
    DECLARE @SALARY INT
    SET @SALARY = dbo.COMPUTE_PT(6000)
    PRINT @SALARY

-- GENERALISED QUERY TO FIND PF AND PT FROM DAY2SQL SUPPORTED FILES EMPLOYEE TABLE
    SELECT CONCAT(FirstName,' ',LastName),SALARY,PF = dbo.COMPUTE_PF(Salary),PT = dbo.COMPUTE_PT(Salary) FROM Employees

-- 3)Create a table valued function which will accept JobTitle which will return new table set based on jobtitle

    CREATE FUNCTION Table_based_on_jobtitle(@JobTitle varchar(50))
        RETURNS TABLE
    AS 
        RETURN(SELECT * FROM Employees WHERE @JobTitle = JobId )

    -- EXECUTING QUERY
    SELECT * from  Table_based_on_jobtitle('SH_CLERK')


