
-- Ranking function

SELECT BusinessEntityID, Rate,   
       DENSE_RANK() OVER (ORDER BY Rate ASC) AS RankBySalary  
FROM HumanResources.EmployeePayHistory;


SELECT BusinessEntityID, Rate,   
       DENSE_RANK() OVER (ORDER BY Rate DESC) AS RankBySalary  
FROM HumanResources.EmployeePayHistory;


SELECT BusinessEntityID, Rate,   
	   RANK() OVER (ORDER BY Rate DESC) AS RankBySalary  
FROM HumanResources.EmployeePayHistory;


SELECT BusinessEntityID, Rate,   
	   RANK() OVER (ORDER BY Rate ASC) AS RankBySalary  
FROM HumanResources.EmployeePayHistory;


SELECT BusinessEntityID, Rate,   
	   ROW_NUMBER() OVER (ORDER BY Rate ASC) AS RankBySalary  
FROM HumanResources.EmployeePayHistory;


SELECT BusinessEntityID, Rate,   
	   NTILE(4) OVER (ORDER BY Rate DESC) AS RankBySalary  
FROM HumanResources.EmployeePayHistory;


SELECT BusinessEntityID, Rate, PayFrequency,  
       DENSE_RANK() OVER ( PARTITION BY PayFrequency ORDER BY Rate ASC) AS RankBySalary  
FROM HumanResources.EmployeePayHistory;



SELECT BusinessEntityID, Rate, PayFrequency,  
       RANK() OVER ( PARTITION BY PayFrequency ORDER BY Rate ASC) AS RankBySalary  
FROM HumanResources.EmployeePayHistory;


-- Aggregate function

SELECT COUNT(*) FROM HumanResources.Employee WHERE Gender = 'f'

SELECT COUNT(*),MAX(VacationHours),MIN(VacationHours),AVG(VacationHours),SUM(VacationHours)
FROM HumanResources.Employee WHERE Gender = 'm'


-- Groupby queries

SELECT Gender,SUM(VacationHours),Count(Gender),AVG(VacationHours) FROM HumanResources.Employee 
GROUP BY(Gender)

-- follwing example will not run because businessEntityId is neither in aggregate function nor in Gropy by clause
SELECT Gender,SUM(VacationHours),Count(Gender),AVG(VacationHours),BusinessEntityID 
FROM HumanResources.Employee GROUP BY Gender



-- Having queries

SELECT Gender,SUM(VacationHours) as 'hours',MaritalStatus from HumanResources.Employee  
GROUP BY Gender,MaritalStatus HAVING SUM(VacationHours)>100 ORDER BY Gender DESC;



-- Groupby rollup

SELECT Gender,SUM(VacationHours),Count(Gender) FROM HumanResources.Employee 
GROUP BY Rollup(Gender)



-- GroupBy Cube

SELECT Gender,MaritalStatus FROM HumanResources.Employee 
GROUP BY CUBE (Gender,MaritalStatus)



-- Groupby grouping sets

SELECT Gender,MaritalStatus,SUM(VacationHours) FROM HumanResources.Employee 
GROUP BY GROUPING SETS(Gender,MaritalStatus,(Gender,MaritalStatus),())



