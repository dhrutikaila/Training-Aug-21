


-- view 
use wschool

---Create a view to SELECT SELECT suppliername, product , product amount FROM suplier and product
CREATE VIEW productview
AS
(

SELECT suppliers.SupplierName,products.ProductName,products.price FROM products LEFT JOIN suppliers on products.SupplierID=suppliers.SupplierID

)


--creates a view that shows all customers FROM Brazil

CREATE VIEW Brazil_Customers 
AS
(	
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = 'Brazil'
)

---creates a view that SELECTs every product in the "Products" table with a price higher than the average price
CREATE VIEW Productsview AS
(
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products)
)
--SQL Variable declaration
DECLARE @Test VARCHAR(100)='SQL Variable declaration'
PRINT @Test

--SELECT statment using variable

DECLARE @Department decimal(4,0)
SET @Department=90

SELECT * FROM Employees WHERE Departmentid=@Department


--if -else
DECLARE @AVG decimal(8,2),@salary decimal(8,2),@id decimal(6,0)
SET @AVG = (SELECT avg(salary) FROM employees)


SELECT @salary=salary FROM employees WHERE employeeid=@id
if @salary<@avg
	UPDATE employees SET salary =salary+3000 WHERE employeeid=@id
else
	UPDATE employees SET salary =salary+1000 WHERE employeeid=@id

- --case 
use wschool

SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM Order_Details













