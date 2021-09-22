--Some System Function--
SELECT CURRENT_TRANSACTION_ID()

SELECT host_id() AS [User Host_Id]

SELECT host_name() AS [User HostName]

-------------------------------------------------------------------------------------------------------
--Some Maths Function

--Floor Function
SELECT FLOOR(123.45), FLOOR(-123.45), FLOOR($123.45)

--Ceilting Function
SELECT CEILING(147.98), CEILING(-147.32), CEILING(147.2)

--Abs function
SELECT ABS(-5), ABS(5), ABS(+5)

--Square Function
SELECT SQUARE(5) AS [Square of data]

--Sqrt Function
SELECT SQRT(25) AS [sqrt of data]

--PI Function
SELECT PI() 

-------------------------------------------------------------------------------------------------------
--Some Date Function

--Diff. date function
SELECT SYSDATETIME() AS [datetime2]
SELECT SYSDATETIMEOFFSET() AS [datetimeoffset]
SELECT SYSUTCDATETIME() AS [datetime2]  
SELECT CURRENT_TIMESTAMP AS [datetime]
SELECT GETDATE() AS [datetime]
SELECT GETUTCDATE() AS [UTC datetime]

--DatePart Function
SELECT DATEPART(year, GETDATE()) AS [Year], GETDATE() AS [Current Date] 
SELECT DATEPART(month, GETDATE()) AS [Month], GETDATE() AS [Current Date]   
SELECT DATEPART(day, GETDATE()) AS [Day], GETDATE() AS [Current Date]   


--DateAdd Function
SELECT GETDATE() AS [Current Date], DATEADD(DAY, 3, GETDATE()) AS [Modified date] 
SELECT GETDATE() AS [Current Date], DATEADD(MM, -11, GETDATE()) AS [Modified date] 


--DateDiff Function(Calculate age and exp. with DateDiff Function)
SELECT BusinessEntityID,LoginID,DATEDIFF(YEAR, BirthDate, GETDATE()) AS [Age of Employee], 
	   DATEDIFF(YEAR, HireDate, GETDATE()) AS [Exp. of Employee]
	   FROM HumanResources.Employee
	   ORDER BY [Exp. of Employee] DESC

select * from HumanResources.Employee




 


