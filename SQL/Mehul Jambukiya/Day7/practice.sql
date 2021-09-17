--USE Practice

SELECT * FROM Demo4
SELECT * FROM Demo6

--Union Clause

SELECT Name,City,State,IsMarried FROM Demo4 UNION SELECT * FROM Demo6
SELECT Name,City,State,IsMarried FROM Demo4 UNION ALL SELECT * FROM Demo6

--Except Clause 

SELECT Name,City,State,IsMarried FROM Demo4 EXCEPT SELECT * FROM Demo6

--Intersect Clauses

SELECT Name,City,State,IsMarried FROM Demo4 INTERSECT SELECT * FROM Demo6

--Derived Tables

SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY Age DESC) AS RowNo,* FROM Demo4)Tmp WHERE RowNo<=3

--CTE

WITH DemoCte
AS
(SELECT Name,Age,IsMarried FROM Demo4)
SELECT * FROM DemoCte WHERE IsMarried=0 ORDER BY Age DESC