CREATE TABLE Employee1(
	Employee_Id int,
	First_Name varchar(20),
	Last_Name varchar(20),
	Salary money,
	Joining_date Datetime,
	Department varchar(20),
	Manager_Id int
)


INSERT INTO Employee1 VALUES
(1,'john','abraham',1000000,'20130101 12:00:00 am','Banking',Null),
(2,'Michale','clark',800000,'20130101 12:00:00 am','insurance',1),
(3,'Roy','thomas',700000,'20130201 12:00:00 am','banking',1),
(4,'Tom','Jose',600000,'20130201 12:00:00 am','insurance',2),
(5,'Jerry','Pinto',650000,'20130201 12:00:00 am','insurance',3),
(6,'Philip','Mathew',750000,'20130101 12:00:00 am','Service',3),
(7,'Testname','123',650000,'20130101 12:00:00 am','Service',2),
(8,'TestName2','Lname',600000,'20130201 12:00:00 am','Insurence',2);

SELECT * FROM Employee1

CREATE TABLE Incentives(
	Employee_ref_Id Int,
	Insentive_Date Date,
	Insentive_Amount money,

)

INSERT INTO Incentives VALUES
(1,'20130201',5000),
(2,'20130201',3000),
(3,'20130201',4000)

select * from Employee1

SELECT * FROM Incentives

-------------------------------------------------------------------------------------------------------------------------------

-----1. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

SELECT CONVERT(NVARCHAR,e.JOINING_DATE,13) ,CONVERT(NVARCHAR, i.Insentive_Date,13) ,DATEDIFF(DAY,e.joining_date,i.Insentive_Date) as difference FROM Employee1 e JOIN Incentives i ON e.Employee_id = i.Employee_ref_Id

 
---2. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

SELECT e.First_name,e.Last_name,i.Insentive_Amount FROM Employee1 e 
JOIN Incentives i ON e.Employee_id = i.Employee_ref_Id 
	WHERE Insentive_Amount>3000


----3. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

SELECT e.First_name,e.Last_Name,i.Insentive_Amount FROM Employee1 e LEFT JOIN Incentives i ON e.Employee_id = i.Employee_ref_Id


----4.Select EmployeeName, ManagerName from the employee table.

SELECT m.First_name,m.Last_name, e.First_Name as 'Manager_Name' FROM Employee1 m JOIN Employee1 e ON m.Manager_Id=e.Employee_Id


----5. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

SELECT e.First_name,e.Last_Name,ISNULL(i.Insentive_Amount,0) FROM Employee1 e LEFT JOIN Incentives i ON e.Employee_id = i.Employee_ref_Id

