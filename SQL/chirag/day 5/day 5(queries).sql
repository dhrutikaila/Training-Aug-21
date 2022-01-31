/*SELECT * FROM Employees

create table Incentive
(
Incentives_ID int,
Incentives_Date date,
Incentives_Amount int,

EmployeeID decimal(6,0) cONstraint fk foreign key references Employees(EmployeeID) 
)

create table Manager
(
ManagerID decimal(6,0),
ManagerName varchar(23)
)
Insert into manager values('100','karan')
Insert into manager values('103','mukesh')
Insert into manager values('108','meet')

EmployeeID decimal(6,0) cONstraint fk foreign key references Employees(EmployeeID) 
)
drop table Incentive
delete  table 
seleIncentive 
Insert into Incentive values(2,'1990-08-17','12000','102')
Insert into Incentive values(3,'1987-09-18','500','103')

Insert into Incentive values(5,'1989-12-14','3500','104')
Insert into Incentive values(4,'1989-06-14','5000','108')
Insert into Incentive values(1,'1991-11-14','3500','101')

	
delete FROM Incentive

	
SELECT  * FROM Employees e 
INNER JOIN Incentive i 
ON e.EmployeeID = i.EmployeeID
*/

--Q1  Get difference between JOINING_DATE and INCENTIVE_DATE FROM employee and incentives table


SELECT * ,datediff(dd,E.Hiredate,I.Incentive_Date) FROM Incentive I INNER JOIN Employees E ON I.EmployeeID = E.EmployeeID 

--Q2SELECT first_name, incentive amount FROM employee and incentives table for those employees who have incentives and incentive amount greater than 3000

SELECT E.FirstName,I.Incentive_Amount FROM Incentive I LEFT JOIN Employees E ON I.EmployeeID=E.EmployeeID where I.Incentive_Amount>3000

--q3 SELECT first_name, incentive amount FROM employee and incentives table for all employees even if they didn�t get incentives.
 
SELECT E.FirstName, I.Incentive_Amount   FROM  Incentive I RIGHT JOIN  Employees E ON I.EmployeeID=E.EmployeeID  

--q4 SELECT EmployeeName, ManagerName FROM the employee table.
SELECT E.FirstName,M.ManagerName FROM  Manager M LEFT JOIN Employees E ON M.ManagerID=E.ManagerID  








