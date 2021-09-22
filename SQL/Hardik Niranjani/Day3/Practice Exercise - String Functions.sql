
--Some String Function

--Soundex Function
SELECT SOUNDEX('New York') AS [Soundex], SOUNDEX('New Yourk') AS [Soundex]

--Char Function
SELECT CHAR(98) AS [Char of 98], CHAR(99) AS [Char of 99] 

--Ascii Function
SELECT ASCII(5) AS [5], ASCII(10) AS [10], ASCII('h') AS h, ASCII('H') AS H   

--Left And Right Function
SELECT LEFT('This is',3) AS [Left]
SELECT RIGHT('This is',3) AS [Right]

--Len Function
SELECT DepartmentID,[Name],GroupName ,LEN(GroupName) AS [Length of GroupName] 
		FROM HumanResources.Department


--Upper Function
SELECT DepartmentID,UPPER(Name) AS [Upper Name],[Name],GroupName
		FROM HumanResources.Department

--Lower Function
SELECT DepartmentID,LOWER(Name) AS [Lower Name],[Name],GroupName
		FROM HumanResources.Department

--Patindex Function
SELECT position = PATINDEX('%R%', 'NEW YORK IS CITY') AS [Patindex]

--Replace Function
SELECT REPLACE('NEW YOURK','YOURK','YORK') AS [Replace]

--Replicate Function
SELECT REPLICATE('$+',10) AS [Replicate]

--Reverse Function
SELECT REVERSE('New York') AS [Reverse]

--Rtrim Function--
SELECT RTRIM('New York ++    ') AS [Rtrim]
