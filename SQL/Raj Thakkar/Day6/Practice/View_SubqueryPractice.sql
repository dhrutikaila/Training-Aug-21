--SUBQURIES--
SELECT product_id, supplier_id, product_name  
FROM products  
WHERE supplier_id IN  
   (SELECT supplier_id  
  FROM supplier  
  WHERE (country = 'Sweden')) 

  --VIEW--
  Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 
CREATE VIEW Vw
AS
   SELECT (FirstName+' '+LastName) AS 'Names'
        , HireDate
   FROM Employees
   WHERE HireDate>(
         SELECT HireDate
		 FROM Employees
		 WHERE LastName='Jones')