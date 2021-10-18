
/*Using cursor implement the following task employee
Update the salary of the employee using following condition
Salary between 30000 and 40000 — 5000 hike
Salary between 40000 and 55000 — 7000 hike
Salary between 55000 and 65000 — 9000 hike*/


USE JOINPRACTICE
SELECT * FROM Employee
INSERT INTO Employee VALUES ('Testname3','Lname3',35000,'2013-01-01','Banking',NULL),
							('Testname4','Lname4',37000,'2013-01-01','Insurance',NULL),
							('Testname5','Lname5',48000,'2013-02-01','Service',NULL),
							('Testname6','Lname6',57000,'2013-02-01','Banking',NULL),
							('Testname7','Lname7',60000,'2013-03-01','Service',NULL)


DECLARE @Sal MONEY
DECLARE UpdateSalary 
	 CURSOR
		 DYNAMIC FOR 
			SELECT Salary FROM Employee
	OPEN UpdateSalary

				FETCH NEXT FROM UpdateSalary
				WHILE(@@FETCH_STATUS=0)
					BEGIN
						UPDATE Employee SET Salary =
							CASE
								WHEN Salary BETWEEN 30000 AND 40000 THEN Salary+5000 
								WHEN Salary BETWEEN 40000 AND 55000 THEN Salary+7000
								WHEN Salary BETWEEN 55000 AND 65000 THEN Salary+9000
								ELSE Salary
							END
							WHERE CURRENT OF UpdateSalary
								FETCH NEXT FROM UpdateSalary
					END
			
	CLOSE UpdateSalary
DEALLOCATE UpdateSalary

