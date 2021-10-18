USE DB_BANK

-- 1. List Names of Customers who are Depositors and have Same Branch City as that of SUNIL

SELECT CName, BName
FROM DEPOSIT 
WHERE BName IN (
	SELECT BName
	FROM BRANCH
	WHERE CITY IN(
		SELECT  B.City
		FROM BRANCH AS B
		JOIN DEPOSIT AS D
		ON B.BName = D.BName
		WHERE D.CName = 'SUNIL'
	)	
)

-- 2. List All the Depositors Having Deposit in All the Branches where SUNIL is Having Account

SELECT *
FROM DEPOSIT 
WHERE BName IN(
	SELECT BName
	FROM DEPOSIT 
	WHERE CName = 'SUNIL'
	UNION
	SELECT BName
	FROM BORROW
	WHERE CName = 'SUNIL'
)


-- 3. List the Names of Customers Living in the City where the Maximum Number of Depositors are Located

SELECT *
FROM CUSTOMER
WHERE City IN(
		SELECT 	 B.City
		FROM DEPOSIT AS D
		JOIN BRANCH AS B
		ON D.BName = B.BName
		GROUP BY B.City  HAVING COUNT(City) = (
						SELECT TOP 1 COUNT(City) AS 'Count'
						FROM DEPOSIT AS D
						JOIN BRANCH AS B
						ON D.BName = B.BName
						GROUP BY B.City 
						ORDER BY COUNT(City) DESC
					)
				)



-- 4. List Names of Borrowers Having Deposit Amount Greater than 1000 and Loan Amount Greater than 2000

SELECT CName
FROM BORROW AS B
WHERE Amount > 2000 
AND CName IN (
	SELECT CName
	FROM DEPOSIT
	WHERE CName = B.CName
	AND Amount > 1000
)


-- 5. List All the Customers Living in NAGPUR and Having the Branch City as MUMBAI or DELHI

SELECT Cust.CName
FROM CUSTOMER AS Cust
FULL JOIN DEPOSIT AS D
ON Cust.CName = D.CName
FULL JOIN BORROW AS B
ON Cust.CName = B.CName
FULl JOIN BRANCH AS BR
ON BR.BName = D.BName OR BR.City = B.BName
WHERE Cust.City = 'NAGPUR' 
AND (BR.City ='MUMBAI'
OR BR.City = 'DELHI')




-- 6. Count the Number of Customers Living in the City where Branch is Located


SELECT City
	,	COUNT(CName) AS 'Total'
FROM CUSTOMER
WHERE City IN (
	SELECT City 
	FROM BRANCH
	GROUP BY City
)
GROUP BY City

SELECT City 
	,	Total =  (
		SELECT COUNT(CName)
		FROM CUSTOMER
		WHERE City = B.City
		GROUP BY City
		)
FROM BRANCH AS B
GROUP BY City 



