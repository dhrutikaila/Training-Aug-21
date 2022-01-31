----DATE FUNCTION ----
SELECT * FROM HumanResources.Employee

SELECT DATEDIFF(DAY,BirthDate,GETDATE()) AS 'daydifference',LoginID FROM HumanResources.Employee

SELECT DATEDIFF(MONTH,BirthDate,GETDATE()) , LoginID FROM HumanResources.Employee

SELECT DATEDIFF(YEAR,BirthDate,GETDATE()) , LoginID FROM HumanResources.Employee

SELECT DATEPART(YEAR,MAX(BirthDate)) , MAX(LoginID) FROM HumanResources.Employee

SELECT DATEADD(DAY,3,BirthDate) FROM HumanResources.Employee


--RETURN LAST DAY OF THIS MONTH 
SELECT EOMONTH(GETDATE())


CREATE PARTITION FUNCTION RangePF1 ( INT )  
AS RANGE FOR VALUES (10, 100, 1000) 

SELECT HOST_ID() AS HOST

SELECT GETANSINULL('AdventureWorks2016')  







SELECT RANK() OVER(PARTITION BY jobtitle ORDER BY VacationHours ) [dRANK],
VacationHours ,jobtitle from HumanResources.Employee 
ORDER BY JobTitle,VacationHours 
 


SELECT JobTitle,NTILE(50) over(order by vacationhours ) [RANK] , VacationHours
from HumanResources.Employee ORDER BY VacationHours 



--it will count only unique vacation hours 
SELECT APPROX_COUNT_DISTINCT(VACATIONHOURS) FROM HumanResources.Employee

--it will count all the rows from the vacation hours column its return type is int
SELECT COUNT( VACATIONHOURS) FROM HumanResources.Employee


SELECT * FROM HumanResources.Employee



--it will same as count but return type is different
SELECT COUNT_BIG( VACATIONHOURS) FROM HumanResources.Employee


SELECT OrganizationLevel,SUM(VACATIONHOURS) 'TOTALVACATIONHOUR', GROUPING(OrganizationLevel) 
FROM HumanResources.Employee
GROUP BY OrganizationLevel WITH ROLLUP




