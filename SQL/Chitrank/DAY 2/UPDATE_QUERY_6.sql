/*Write a SQL statement to change salary of employee to 8000 whose ID is 105,
if the existing salary is less than 5000.
*/

UPDATE Employees
SET Salary = 8000 
WHERE (EmployeeID = 105 and Salary < 5000)