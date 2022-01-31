-- Q1 Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ from employee table

SELECT 'DeptName' = CASE DepartmentName
	WHEN 'Banking' THEN 'Bank Dept'
	WHEN 'Insurance' THEN 'Insurance Dept'
	WHEN 'Services' THEN 'Services Dept'
	ELSE DepartmentName
	END
FROM Departments
GO