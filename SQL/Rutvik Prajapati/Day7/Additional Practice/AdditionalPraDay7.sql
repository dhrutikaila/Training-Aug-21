--Except and Intersect Clauses
USE EMPDB
SELECT * FROM Emp WHERE DepartmentId = 2
SELECT * FROM Emp WHERE DepartmentId = 1  OR Name='Kinjal'
--EXCEPT
SELECT * FROM Emp WHERE DepartmentId = 2
except 
SELECT * FROM Emp WHERE DepartmentId = 1  OR Name='Kinjal'

SELECT * FROM Emp WHERE DepartmentId = 2
SELECT * FROM Emp WHERE Name = 'kinjal'  
--INTERSECT 
SELECT * FROM Emp WHERE DepartmentId = 2
INTERSECT   
SELECT * FROM Emp WHERE Name = 'kinjal' 

SELECT * FROM Emp WHERE DepartmentId = 2
SELECT * FROM Emp WHERE Name = 'kinjal'  
--UNION 
SELECT * FROM Emp WHERE DepartmentId = 2
UNION   
SELECT * FROM Emp WHERE Name = 'kinjal' 

SELECT * FROM Emp WHERE DepartmentId = 2
SELECT * FROM Emp WHERE Name = 'kinjal'  
--UNION ALL
SELECT * FROM Emp WHERE DepartmentId = 2
UNION ALL
SELECT * FROM Emp WHERE Name = 'kinjal' 
