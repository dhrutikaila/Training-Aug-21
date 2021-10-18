-- Create a function which takes id and salary as input and updates the salary in employees table and returns 1 when updated.

DELIMITER &&
CREATE FUNCTION updatesalary(id INT,salary NUMERIC) 
RETURNS INT
BEGIN  
     UPDATE employees SET Salary = salary WHERE EmployeeID = id;
    RETURN (1);  
END &&
DELIMITER ;

SELECT updatesalary(100,5000);

-- DROP function

DROP FUNCTION Customer_Occupation;

 