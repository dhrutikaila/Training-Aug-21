
SELECT * FROM Employee1

--- 1. Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ 
---from employee table

SELECT Employee_Id,First_Name+' '+Last_Name AS Name,Department=
	CASE Department
		WHEN 'Banking' THEN 'Bank Dept'
		WHEN 'insurance' THEN 'Insurance Dept'
		WHEN 'Service' THEN 'Services Dept'
	END
FROM Employee1;