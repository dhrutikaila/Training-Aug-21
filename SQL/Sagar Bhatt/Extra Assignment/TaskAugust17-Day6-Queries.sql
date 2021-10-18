USE Day6_August17

SELECT *
FROM Customer
SELECT *
FROM Branch
SELECT *
FROM Deposit
SELECT *
FROM Borrow

--Q1: List Names of Customers who are Depositors and have Same Branch City as that of SUNIL
SELECT CName
FROM Deposit Dp
JOIN Branch Br
ON Br.BName = Dp.BName
WHERE Br.City IN
	(
	SELECT City
	FROM Branch
	WHERE BName = 
		(
		SELECT BName
		FROM Deposit
		WHERE CName = 'Sunil'
		)
	)

--Q2: List All the Depositors Having Depositors Having Deposit in All the Branches where SUNIL is Having Account
SELECT *
FROM Deposit
WHERE BName IN
	(
	SELECT BName 
	FROM Deposit
	WHERE CName = 'Sunil'
	UNION
	SELECT BName
	FROM Borrow
	WHERE CName = 'Sunil'
	)

--Q3: List the Names of Customers Living in the City where the Maximum Number of Depositors are Located
SELECT CName, City
FROM Customer
WHERE City IN
	(
	SELECT City FROM
			(
			SELECT DENSE_RANK() OVER(ORDER BY COUNT(Br.City) DESC) 'Rank' ,Br.City
			FROM Deposit Dp
			JOIN Branch Br
			ON Dp.BName = Br.BName
			GROUP BY Br.City
			) Tmp
			WHERE Rank = 1
	)

--Q4: List Names of Borrowers Having Deposit Amount Greater than 1000 and Loan Amount Greater than 2000
SELECT Bo.CName
FROM Borrow Bo
JOIN Deposit Dp
ON Bo.CName = Dp.CName
AND Dp.Amount > 1000
AND Bo.Amount > 2000

--Q5: List All the Customers Living in NAGPUR and Having the Branch City as MUMBAI or DELHI
SELECT *
FROM Customer Ct
JOIN Deposit Dp
ON Ct.CName = Dp.CName
JOIN Branch Br
ON Dp.BName = Br.BName
AND Ct.City = 'Nagpur'
AND Br.City IN ('Mumbai', 'Delhi')

--Q6: Count the Number of Customers Living in the City where Branch is Located
SELECT City, COUNT(*) 'Number of Customers'
FROM Customer
WHERE City IN 
	(
	SELECT City
	FROM Branch
	)
GROUP BY City
