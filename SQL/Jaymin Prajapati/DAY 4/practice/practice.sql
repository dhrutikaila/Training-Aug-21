SELECT * FROM employees
use emp

-- NTITLE

SELECT Jobid,
NTILE (4) OVER (
ORDER BY Salary
) EmployeeID
FROM employees;


SELECT Jobid,
NTILE (5) OVER (
ORDER BY Salary
) EmployeeID
FROM employees;

SELECT Jobid,
NTILE (9) OVER (
ORDER BY Salary
) EmployeeID
FROM employees;

-- COUNT

SELECT COUNT(EmployeeID),JobId 
FROM Employees 
GROUP BY JobId
ORDER BY COUNT(EmployeeID) DESC;

--RANKING

SELECT DENSE_RANK() OVER (ORDER BY JobID DESC ) [d_rank]
FROM Employees

SELECT RANK() OVER (ORDER BY JobID ) [d_rank]
FROM Employees

SELECT ROW_NUMBER() OVER (ORDER BY JobID ) [d_rank]
FROM Employees

-- ROW COUNT

USE emp;  
GO  
UPDATE Employees
SET JobID = N'Executive'  
WHERE EmployeeID  = 121 
IF @@ROWCOUNT = 0  
PRINT 'Warning: No rows were updated';  
GO
--TRAN COUNT

PRINT @@TRANCOUNT  
 
BEGIN TRAN  
    PRINT @@TRANCOUNT  
    BEGIN TRAN  
        PRINT @@TRANCOUNT  
ROLLBACK  
PRINT @@TRANCOUNT  

-- BINARY CHECKSUM
USE emp;    
GO  
INSERT INTO Employees VALUES (21,'test');  
GO  
SELECT BINARY_CHECKSUM(*) from Employees;  
GO  
UPDATE Employees set Salary = 'TEST';  
GO  
SELECT BINARY_CHECKSUM(*) from Employees;  
GO

-- CONNECTIONPROPERTY

SELECT   
ConnectionProperty('JobID') AS 'Job_ID',   
ConnectionProperty('EmployeeID') AS 'Employee_ID';


-- CONTEXT INFO

SET CONTEXT_INFO 0x12111111111111;  
GO  
SELECT CONTEXT_INFO();  
GO

-- CURRENT_TRANSACTION_ID();
SELECT CURRENT_TRANSACTION_ID();


SELECT SESSION_USER;

SELECT CONCAT ( 'Happy ', 'Birthday ', 11, '/', '25' ) AS Result;


SELECT * FROM employees
DECLARE @d DATE = GETDATE();  
SELECT FORMAT( @d, 'dd/MM/yyyy', 'en-US' ) AS 'HireDate'  
       ,FORMAT(1246444,'###-##-####') AS 'EmployeeID'; 