USE AdventureWorksLT2012
UPDATE SalesLT.Customer
SET ModifiedDate= GETDATE();

UPDATE SalesLT.Product
SET Color =N'light green'
WHERE Name LIKE N'road-250%' AND Color= N'red' ;


use dhruti

UPDATE Emp11 SET email='not work',
commission_pct=0.10
