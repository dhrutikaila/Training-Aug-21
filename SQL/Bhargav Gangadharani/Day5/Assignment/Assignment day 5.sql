create database Day5

Create table EMPLOYEE( EMPLOYEE_ID int IDENTITY (1,1) Primary key,
			  FIRST_NAME varchar(20) Not Null,
			  LAST_NAME varchar(20) Not Null,
			  SALARY money Not Null,
			  JOINING_DATE datetime Not Null,
			  DEPARTMENT varchar(20) Not Null,
			  MANAGER_ID numeric(3))


create table Incentives
(
    EMPLOYEE_REF_ID int FOREIGN KEY REFERENCES Employee(EMPLOYEE_ID),
    INCENTIVE_DATE date,
    INCENTIVE_AMOUNT NUMERIC(8),
)

INSERT INTO Employee VALUES('John','Abraham',1000000,'01-01-2013 12:00:00.000','Banking',null),
                           ('Michael','Clarke',800000,'01-01-2013 12:00:00.000','Insurance',1),
                           ('Roy','Thomas',700000,'01-02-2013 12:00:00.000','Banking',1),
                           ('Tom','Jose',600000,'01-02-2013 12:00:00.000','Insurance',2),
                           ('Jerry','Pinto',650000,'01-02-2013 12:00:00.000','Insurance',3),
                           ('Philip','Mathew',750000,'01-01-2013 12:00:00.000','Services',3),
                           ('TestName1','123',650000,'01-01-2013 12:00:00.000','Services',2),
                           ('TestName2','Lanme%',600000,'01-02-2013 12:00:00.000','Insurance',2)

INSERT INTO Incentives values(1,'02/1/13',5000),
                             (2,'02/1/13',3000),
                             (3,'02/1/13',4000)

							 
-- 1. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
select Experience=DATEDIFF(dd,e.JOINING_DATE,i.INCENTIVE_DATE) 
from Employee e join Incentives i on e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID


-- 2. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
select e.FIRST_NAME,i.INCENTIVE_AMOUNT 
from Employee e join Incentives i on e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID 
where i.INCENTIVE_AMOUNT>3000


-- 3. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
select e.FIRST_NAME,i.INCENTIVE_AMOUNT 
from Employee e join Incentives i on e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID


-- 4. Select EmployeeName, ManagerName from the employee table.
select EmplyoeeName = (e.FIRST_NAME+ ' ' + e.LAST_NAME), ManagerName= (f.FIRST_NAME+ ' ' + f.LAST_NAME) 
from EMPLOYEE e left join EMPLOYEE f on e.MANAGER_ID = f.EMPLOYEE_ID


-- 5. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
select e.FIRST_NAME,case when i.INCENTIVE_AMOUNT is null then 0 else i.INCENTIVE_AMOUNT end as Incentive_amount
from Employee e left join Incentives i on e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID



