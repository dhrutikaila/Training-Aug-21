USE Practice

--DML

--SELECT

SELECT * FROM Demo4

--INSERT

INSERT INTO Demo4 VALUES ('Jorden','Gandhinagar','Gujarat',24,1)
INSERT INTO Demo4 VALUES ('Steven','Ahmedabad','Gujarat',19,0),
						 ('Richa','Gandhinagar','Gujarat',21,1),
						 ('Devid','Ahmedabad','Gujarat',23,0)


--UPDATE

UPDATE Demo4 SET State = 'GUJARAT' WHERE Id=5
UPDATE Demo4 SET Age=26 WHERE Id=6
UPDATE Demo4 SET IsMarried = NULL WHERE Id=6


--DELETE

DELETE FROM Demo4 WHERE Id=3
DELETE FROM Demo4 WHERE Id=4

--DQL

--Basic Select Statement

SELECT Name,City FROM Demo4
SELECT * INTO Demo6 FROM (SELECT Name,City,State,IsMarried FROM Demo4)TMP
SELECT * FROM Demo6


--Literals & Concatenate

SELECT 'Name:' , Name FROM Demo4
SELECT 'Name:'+Name FROM Demo4
SELECT 'City:'+City + ' ' + 'State:'+State AS Address FROM Demo4

--Calculating Column Values

SELECT Age*0.50 AS Discount FROM Demo4
SELECT Age+2 AS AgeAfter2Years FROM Demo4
	
-- Where clause

SELECT * FROM Demo4 WHERE IsMarried=1

--Comparison & Logical Operator

SELECT * FROM Demo4 WHERE Age>21
SELECT * FROM Demo4 WHERE Age<21
SELECT * FROM Demo4 WHERE Age>21 AND IsMarried=1
SELECT * FROM Demo4 WHERE Age>21 OR IsMarried=1

--Range Operator

SELECT * FROM Demo4 WHERE Age BETWEEN 21 AND 24

--In/not in keyword

SELECT * FROM Demo4 WHERE Name IN ('John','Smith')
SELECT * FROM Demo4 WHERE Name NOT IN ('John','Smith')

--Like, OrderBy, Top, Distinct

SELECT * FROM Demo4 WHERE Name LIKE 'j%'
SELECT * FROM Demo4 ORDER BY Age
SELECT * FROM Demo4 ORDER BY Age DESC
SELECT TOP 1 * FROM Demo4
SELECT DISTINCT City FROM Demo4