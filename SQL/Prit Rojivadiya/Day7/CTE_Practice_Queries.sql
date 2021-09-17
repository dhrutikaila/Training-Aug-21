use AdventureWorks2012

-- Q1 Count product subcategory id of each product category

WITH products_cte(pid,pname,psid,psname) AS (
SELECT p.ProductCategoryID,p.Name,ps.ProductSubcategoryID,ps.Name FROM Production.ProductCategory p
	JOIN Production.ProductSubcategory ps ON p.ProductCategoryID = ps.ProductCategoryID )

SELECT COUNT(psid),pid FROM products_cte GROUP BY pid


-- Q2 create cte to display contact number of persons

WITH person_phone_cte(id,fname,phone) AS (
SELECT p.BusinessEntityID,p.FirstName,ph.PhoneNumber FROM Person.Person p
	JOIN Person.PersonPhone ph ON ph.BusinessEntityID = p.BusinessEntityID )
SELECT * FROM person_phone_cte ORDER BY fname DESC


-- Q3 create cte to display max,min and average pay rate of employees

WITH emp_salary_cte(id,jobTitle,Gender,PayRate) AS (
SELECT e.BusinessEntityID,e.JobTitle,e.Gender,p.Rate FROM HumanResources.Employee e
	JOIN HumanResources.EmployeePayHistory p ON p.BusinessEntityID = e.BusinessEntityID )
SELECT MIN(PayRate),MAX(PayRate), AVG(PayRate) FROM emp_salary_cte


-- Q4 use of like operator with cte

WITH email_cte(id,fname,lname,mail) AS (
SELECT p.BusinessEntityID,p.FirstName,p.LastName,e.EmailAddress FROM Person.Person p
	JOIN Person.EmailAddress e ON e.BusinessEntityID = p.BusinessEntityID )
SELECT * FROM email_cte WHERE fname LIKE '[^abc]%'



-- Q5 defining multiple cte in a single query

WITH Sales_CTE (SalesPersonID, TotalSales, SalesYear)  
AS  
(  
    SELECT SalesPersonID, SUM(TotalDue) AS TotalSales, YEAR(OrderDate) AS SalesYear  
    FROM Sales.SalesOrderHeader  
    WHERE SalesPersonID IS NOT NULL  
       GROUP BY SalesPersonID, YEAR(OrderDate)  
  
)  
,  
Sales_Quota_CTE (BusinessEntityID, SalesQuota, SalesQuotaYear)  
AS  
(  
       SELECT BusinessEntityID, SUM(SalesQuota)AS SalesQuota, YEAR(QuotaDate) AS SalesQuotaYear  
       FROM Sales.SalesPersonQuotaHistory  
       GROUP BY BusinessEntityID, YEAR(QuotaDate)  
)  

SELECT s.SalesPersonID,s.TotalSales,q.SalesQuota,q.SalesQuotaYear FROM Sales_CTE s
	JOIN Sales_Quota_CTE q ON q.BusinessEntityID = s.SalesPersonID AND q.SalesQuotaYear = s.SalesYear



-- Q6 Multiple level of recursion

use demo

WITH empManager_cte(Empid,Name,Mgrid,EmpLevel) AS (
SELECT EmpID,EmpName,ManagerID,0 AS EmpLevel FROM EmployeeManager
WHERE ManagerID IS NULL
UNION ALL
SELECT e.EmpID,e.EmpName,e.ManagerID,EmpLevel + 1 FROM EmployeeManager e 
	JOIN empManager_cte m ON e.ManagerID = m.Empid )
SELECT * FROM empManager_cte