use dhruti

UPDATE Emp11 SET email='not work',

commission_pct=0.10
USE dhruti

UPDATE Emp11 SET email='not work',
commission_pct=0.10
WHERE DepartmentId=80 AND commission_pct<.20;





UPDATE Emp11 SET Salary=8000 WHERE Id=2 AND Salary<5000;
 
 UPDATE Emp11 SET Id='SH_CLERK'
 WHERE Id=2
 AND DepartmentId=3
 AND NOT Id LIKE 'SH%';


 UPDATE Emp11 SET Salary=  CASE Id
            WHEN 40 THEN Salary+(Salary*.25)
			   WHEN 90 THEN Salary+(Salary*.15)
			      WHEN 110 THEN Salary+(Salary*.10)
				  ELSE Salary
				  END 
				  WHERE Id IN (2,3,4,5,6,7);


UPDATE Emp11 SET Id = CASE
			WHEN DepartmentID = 30 AND Id != 'SH%' THEN 'SH_CLERK'
		    ELSE Id
			END
			WHERE ManagerId = 118;