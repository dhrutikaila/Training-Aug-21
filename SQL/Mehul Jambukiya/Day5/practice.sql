--USE JOINPRACTICE

--Joins
--Inner join

SELECT * FROM Employee e INNER JOIN Incentives i ON e.Employee_Id=i.Employee_Ref_Id
SELECT * FROM Employee e JOIN Incentives i ON e.Employee_Id=i.Employee_Ref_Id

--Outer join
--Left Outer Join

SELECT * FROM Employee e LEFT JOIN Incentives i ON e.Employee_Id=i.Employee_Ref_Id


--Right Outer join

SELECT * FROM Employee e RIGHT JOIN Incentives i ON e.Employee_Id=i.Employee_Ref_Id

--Full Outer Join

SELECT * FROM Employee e FULL OUTER JOIN Incentives i ON e.Employee_Id=i.Employee_Ref_Id
SELECT * FROM Employee e FULL JOIN Incentives i ON e.Employee_Id=i.Employee_Ref_Id


--Self-Join
SELECT * FROM Employee e JOIN Employee m ON e.Employee_Id=m.Employee_Id
SELECT e.Employee_Id AS employee,e.First_Name as employeename,m.Employee_Id as manager,m.First_Name as managername  
FROM Employee e LEFT JOIN Employee m ON e.Manager_Id=m.Employee_Id

--Cross-Join
SELECT * FROM Employee e CROSS JOIN Incentives i
SELECT * FROM Incentives i CROSS JOIN Employee e



