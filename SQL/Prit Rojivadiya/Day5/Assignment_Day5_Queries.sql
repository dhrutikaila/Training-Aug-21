use Demo

CREATE TABLE Employee
(
Emp_id int PRIMARY KEY IDENTITY(1,1),
First_Name varchar(20) not null,
Last_Name varchar(20) not null,
Salary money not null,
Joining_Date date not null,
Department varchar(20) not null
)


INSERT INTO Employee VALUES ('John','Abraham',1000000,'01-JAN-13','Banking'),
							('Michael','Clarke',800000,'01-JAN-13','Insurance'),
							('Roy','Thomas',700000,'01-FEB-13','Banking'),
							('Tom','Jose',600000,'01-FEB-13','Insurance'),
							('Jerry','Pinto',650000,'01-FEB-13','Insurance'),
							('Philip','Mathew',750000,'01-JAN-13','Services'),
							('Prit','Rojivadiya',650000,'01-JAN-13','Services'),
							('Man','Patel',600000,'01-FEB-13','Insurance')
							


ALTER TABLE Employee
ADD Manager_Id int


CREATE TABLE Incentive
(
Emp_Ref_Id int FOREIGN KEY REFERENCES Employee(Emp_id),
Incentive_Date date not null,
Incentive_Amount money not null
)


INSERT INTO Incentive VALUES (1,'01-FEB-13',5000),
							 (2,'01-FEB-13',3000),
							 (3,'01-FEB-13',4000),
							 (1,'01-JAN-13',4500),
							 (2,'01-JAN-13',3500)




SELECT *
FROM Employee as e
	INNER JOIN Incentive i ON e.Emp_id = i.Emp_Ref_Id




-- Q1 Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

SELECT e.Emp_id,
		e.Joining_Date,
		i.Incentive_Date,
		DATEDIFF(DAY,e.Joining_Date,i.Incentive_Date) as 'DayDiff'
FROM Employee as e
		JOIN Incentive i ON e.Emp_id = i.Emp_Ref_Id
ORDER BY i.Incentive_Date



-- Q2 Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

SELECT e.First_Name,i.Incentive_Amount
FROM Employee e
	INNER JOIN Incentive i ON e.Emp_id = i.Emp_Ref_Id
WHERE i.Incentive_Amount>3000



-- Q3 Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

SELECT e.First_Name,i.Incentive_Amount
FROM Employee e
	LEFT OUTER JOIN Incentive i ON e.Emp_id = i.Emp_Ref_Id



/* Q4 Select first_name, incentive amount from employee and incentives table for all employees even 
if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives. */

SELECT e.First_Name,ISNULL(i.Incentive_Amount,0)
FROM Employee e
	LEFT OUTER JOIN Incentive i ON e.Emp_id = i.Emp_Ref_Id


-- Q5 Select EmployeeName, ManagerName from the employee table.

SELECT emp.First_Name as 'Employee',mgr.First_Name as 'Manager'
FROM Employee emp
	JOIN Employee mgr ON emp.Manager_id = mgr.Emp_id

