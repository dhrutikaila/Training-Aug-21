use dhruti

SELECT* FROM Emp11
ORDER BY FName DESC;

SELECT FName,LName,salary,salary*.12 PF
  FROM Emp11;

  SELECT SUM(salary)
  FROM Emp11;

  SELECT Id,FName,LName,salary
  FROM Emp11
  ORDER BY Salary;

  SELECT SUBSTRING(FName,1,3)
  FROM Emp11;
  
  SELECT FName AS "EMPLOYEE NAME" FROM Emp11;

  SELECT * FROM  Emp11
  WHERE Salary BETWEEN 5000 and 8000;

  SELECT FName "NAME" 
  FROM Emp11
  WHERE FName LIKE 'd%'
  ORDER BY FName;
   
   SELECT DISTINCT DepartmentId
     FROM Emp11;

	 SELECT MAX(salary) FROM Emp11
	 WHERE Salary NOT IN (SELECT MAX(Salary) FROM Emp11);







