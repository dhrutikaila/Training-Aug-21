-- TRANSACTION

-- COMMIT 

START TRANSACTION;  
SELECT @maxsalary:= MAX(Salary) FROM employees;  
INSERT INTO employees(EmpName,Salary)   
			VALUES ('Alexander',70000); 
INSERT INTO Orders(prod_name, order_num, order_date)   
			VALUES ('Printer', 5654, '2020-01-10');  
COMMIT;  


-- ROLLBACK 

START TRANSACTION;
DELETE FROM orders WHERE order_id = 4;
SELECT * FROM orders;

ROLLBACK;
SELECT * FROM ORDERS;

-- SAVEPOINT....ROLLBACK TO SAVEPOINT 

START TRANSACTION;  
SELECT * FROM Orders;  
  
INSERT INTO Orders(order_id, prod_name, order_num, order_date)   
VALUES (6, 'Printer', 5667, '2020-02-11');  
  
SAVEPOINT my_savepoint;  
  
INSERT INTO Orders(order_id, prod_name, order_num, order_date)   
		VALUES (7, 'Ink', 5894, '2020-03-10');  
  
ROLLBACK TO SAVEPOINT my_savepoint;  
  
INSERT INTO Orders(order_id, prod_name, order_num, order_date)   
		VALUES (8, 'Speaker', 6065, '2020-02-18');  
  
COMMIT;


-- RELEASE SAVEPOINT

START TRANSACTION;  
  
INSERT INTO Orders(order_id, prod_name, order_num, order_date)   
VALUES (7, 'Ink', 5894, '2020-03-10');  
  
SAVEPOINT my_savepoint;  
  
UPDATE Orders SET prod_name='Scanner' WHERE order_id=8;  
  
RELEASE SAVEPOINT my_savepoint;  
  
COMMIT;    