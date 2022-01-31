
select * from customers
select * from orders
--
use wschool

---Create a cte to select Select suppliername, product , product amount from suplier and product


with CTE(SupplierName,ProductName,price)
AS
(

SELECT suppliers.SupplierName AS'SupplierName',products.ProductName AS 'ProductName',products.price AS 'price' from products left join suppliers on products.SupplierID=suppliers.SupplierID

)
SELECT * FROM CTE

--that shows all customers from Brazil


with CTE(CustomerName, ContactName)
AS
(
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = 'Brazil'
)
SELECT * FROM CTE

--derive table
SELECT * FROM (SELECT FirstName,Salary FROM Employees)
	
	