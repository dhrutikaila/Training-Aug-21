/*1. Write a query to find the names (first_name, last_name) and salaries
of the employees who have higher salary than the employee whose last_name='Bull'. */

	SELECT CONCAT(FirstName,' ',LastName) AS [Names],Salary 
	FROM Employees 
	WHERE Salary > (SELECT Salary FROM  Employees WHERE LastName='Bull')



/*2. Find the names (first_name, last_name) of all employees who works in the IT department. */

	SELECT  CONCAT(FirstName,' ',LastName) AS [Names]
	FROM Employees 
	WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName='IT')


/*3. Find the names (first_name, last_name) of the employees who 
have a manager who works for a department based in United States. 
Hint : Write single-row and multiple-row subqueries*/


	SELECT CONCAT(FirstName,' ',LastName) AS [Names],Salary 
	FROM  Employees 
	WHERE ManagerID in (SELECT ManagerID FROM Departments WHERE  LocationID 
						IN(SELECT LocationID FROM Locations WHERE CountryID='US')  
						and ManagerID<>0)




/*4. Find the names (first_name, last_name) of the employees who are managers. */

	  SELECT CONCAT(FirstName,' ',LastName) AS [Names]
	  FROM Employees 
	  WHERE EmployeeID IN(SELECT ManagerID FROM Employees)



/*5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. */


   SELECT CONCAT(FirstName,' ',LastName) AS [Names],Salary 
   FROM Employees 
   WHERE Salary>(SELECT avg(Salary) FROM Employees )

   

/*6. Find the names (first_name, last_name), salary of the employees
whose salary is equal to the minimum salary for their job grade. */
  
	 SELECT CONCAT(FirstName,' ',LastName) AS [Names],Salary  
	 FROM Employees 
	 WHERE Salary=(SELECT min(Salary) FROM Employees )


/*7. Find the names (first_name, last_name), salary of the employees who
   earn more than the average salary and who works in any of the IT departments.*/ 
 
   SELECT CONCAT(FirstName,' ',LastName) AS [Names],Salary 
   FROM Employees 
   WHERE DepartmentID =(SELECT DepartmentID FROM Departments WHERE DepartmentName ='IT') 
   AND Salary>(SELECT avg(Salary) FROM Employees )

/*8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell.*/

     SELECT  CONCAT(FirstName,' ',LastName) AS [Names],Salary
	 FROM Employees 
	 WHERE Salary>( SELECT Salary FROM Employees WHERE LastName='bell')
	                            
	                    
/*9. Find the names (first_name, last_name), salary of the employees who earn the same salary AS the minimum salary for all departments. */

	 SELECT CONCAT(FirstName,' ',LastName) AS [Names],Salary
	 FROM Employees 
	 WHERE salary=(SELECT min(Salary)  FROM Employees )

/*10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. */

 	 SELECT CONCAT(FirstName,' ',LastName) AS [Names],Salary 
	 FROM Employees 
	 WHERE salary>=(SELECT avg(Salary)  FROM Employees )

/*11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a
   salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). 
   Sort the results on salary FROM the lowest to highest. */

   SELECT CONCAT(FirstName,' ',LastName) AS [Names],Salary FROM Employees  
   WHERE  Salary>(SELECT max(Salary) FROM Employees WHERE Jobid = 'SH_CLERK')
   ORDER BY Salary asc

/*12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors. */

   SELECT CONCAT(FirstName,' ',LastName) AS [Names]  
   FROM Employees
   WHERE DepartmentID in(SELECT DepartmentID FROM  Departments WHERE DepartmentName<> 'supervisors')


/*13. Write a query to display the employee ID, first name, last names,
    and department names of all employees. */


	SELECT EmployeeID,FirstName,LastName,DepartmentName 
	FROM Employees AS E  
	left outer join Departments AS D 
	on E.DepartmentID=D.DepartmentID



/*14. Write a query to display the employee ID, first name, last names, salary of 
all employees whose salary is above average for their departments. */


	SELECT EmployeeID, FirstName,LastName,Salary FROM  Employees e
	WHERE Salary>(SELECT avg(Salary) AS avg 
				FROM Employees 
				WHERE e.DepartmentID=DepartmentID)





/*15. Write a query to fetch even numbered records FROM employees table. */

	SELECT * FROM Employees 
	WHERE  EmployeeID%2=0

/*16. Write a query to find the 5th maximum salary in the employees table. */

        SELECT DISTINCT  Salary 
	    FROM Employees 
		ORDER BY Salary desc
		OFFSET  4 ROWS 
        FETCH NEXT 1 ROWS ONLY 
	      
/*17. Write a query to find the 4th minimum salary in the employees table. */
   
      SELECT DISTINCT Salary  FROM Employees 
	  ORDER BY Salary  asc
	  OFFSET  3 ROWS 
      FETCH NEXT 1 ROWS ONLY 


/*18. Write a query to SELECT last 10 records FROM a table. */

     SELECT * FROM(SELECT top(10)* FROM Employees 
	 ORDER BY EmployeeID desc)temp
	 ORDER BY EmployeeID asc
 

/*19. Write a query to list department number, name for all the departments in which there are no employees in the department. */
     
	 SELECT DepartmentID,DepartmentName
	 FROM Departments
	 WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Employees group by DepartmentID)

/*20. Write a query to get 3 maximum salaries. */

    SELECT DISTINCT TOP(3)  Salary 
	FROM Employees
	ORDER BY Salary desc


/*21. Write a query to get 3 minimum salaries. */

    SELECT DISTINCT top(3)  Salary 
	FROM Employees
	ORDER BY Salary asc

/*22. Write a query to get nth max salaries of employees. */

    DECLARE @Nth int
	SET @Nth = 4            --<change Nth number here
    SELECT DISTINCT Salary  FROM Employees 
	ORDER BY Salary  desc
	OFFSET  @Nth-1 ROWS 
    FETCH NEXT 1 ROWS ONLY 
	              