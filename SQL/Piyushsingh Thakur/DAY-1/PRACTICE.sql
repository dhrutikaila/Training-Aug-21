use BikeStores
SELECT * FROM sales.customers
SELECT first_name,last_name FROM sales.customers
SELECT first_name,last_name,phone, email FROM sales.customers
SELECT first_name,last_name,phone, email,state FROM sales.customers

SELECT  * FROM  sales.customers WHERE state = 'CA';


