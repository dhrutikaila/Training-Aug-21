/*
Q1:List Names of Customers who are Depositors and have Same Branch City as that of SUNIL
*/
SELECT Cname,B.Bname,B.City FROM Deposit D JOIN Branch B ON D.Bname= B.Bname WHERE B.City =
(SELECT City FROM Branch WHERE Bname = (Select Bname from Deposit Where Cname='Sunil'))


/*
Q2:List All the Depositors Having Depositors Having Deposit in All the Branches where SUNIL is Having Account
*/
SELECT D1.CNAME FROM DEPOSIT D1 WHERE D1.BNAME IN 
(SELECT D2.BNAME FROM DEPOSIT D2 WHERE D2.CNAME = 'SUNIL' 
UNION
SELECT B.BNAME FROM BORROW B WHERE B.CNAME = 'SUNIL')


/*
Q3:List the Names of Customers Living in the City where the Maximum Number of Depositors are Located
*/
SELECT *
FROM CUSTOMER
WHERE City IN(
        SELECT B.City
        FROM DEPOSIT AS D
        JOIN BRANCH AS B
        ON D.BName = B.BName
        GROUP BY B.City HAVING COUNT(City) = (
                        SELECT TOP 1 COUNT(City) AS 'Count'
                        FROM DEPOSIT AS D
                        JOIN BRANCH AS B
                        ON D.BName = B.BName
                        GROUP BY B.City
                        ORDER BY COUNT(City) DESC
                    )
                )
 

/*
SELECT Cname,City FROM Deposit D JOIN Branch B ON D.Bname = B.Bname WHERE B.City IN (
SELECT CITY FROM TMP WHERE DEPOSIT_COUNT = (SELECT MAX(DEPOSIT_COUNT) FROM TMP)) ORDER BY City


(SELECT * INTO TMP FROM (SELECT COUNT(B.CITY) [DEPOSIT_COUNT],CITY FROM BRANCH B JOIN DEPOSIT D ON D.BNAME=B.BNAME 
GROUP BY B.CITY)abc)

SELECT * FROM TMP ORDER BY DEPOSIT_COUNT DESC
*/

/*
Q4: List Names of Borrowers Having Deposit Amount Greater than 1000 and Loan Amount Greater than 2000
*/
SELECT B.CNAME,B.AMOUNT AS [LOAN AMOUNT],D.AMOUNT AS [DEPOSIT AMOUNT] FROM Borrow B 
JOIN Deposit D
ON B.CNAME = D.CNAME 
WHERE D.AMOUNT > 1000 AND B.Amount>2000


/*
Q5: List All the Customers Living in NAGPUR and Having the Branch City as MUMBAI or DELHI
*/
SELECT C1.CNAME FROM CUSTOMER C1,DEPOSIT D1, BRANCH B1 WHERE C1.CITY = 'NAGPUR' AND C1.CNAME = D1.CNAME 
AND D1.BNAME = B1.BNAME AND B1.CITY IN ('BOMBAY','DELHI');


/*
Q6: Count the Number of Customers Living in the City where Branch is Located
*/
SELECT Count(Cname),City from Customer where City in (select distinct city from branch)
group by City
