create table Employee
(
	EMPLOYEE_ID int identity(1,1) PRIMARY KEY,
	FIRST_NAME varchar(15),
	LAST_NAME varchar(15),
	SALARY NUMERIC(8),
	JOINING_DATE DATETIME,
	DEPARTMENT VARCHAR(15),
	MANAGER_ID INT,
)


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

select * from Employee e join Incentives i on e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID

--1. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

select Experience=DATEDIFF(dd,e.JOINING_DATE,i.INCENTIVE_DATE) from Employee e join Incentives i on e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID

/* 2. Select first_name, incentive amount from employee and incentives table for those employees
who have incentives and incentive amount greater than 3000  */


select e.FIRST_NAME,i.INCENTIVE_AMOUNT from Employee e join Incentives i on e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID where i.INCENTIVE_AMOUNT>3000

/* 3. Select first_name, incentive amount from employee and incentives table for all employees 
even if they didn’t get incentives.  */

select e.FIRST_NAME,i.INCENTIVE_AMOUNT from Employee e join Incentives i on e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID

--4. Select EmployeeName, ManagerName from the employee table.
select EmployeeName=concat(a.FIRST_NAME,' ',a.LAST_NAME),ManagerName = b.FIRST_NAME from  Employee a  left join Employee b on a.MANAGER_ID=b.EMPLOYEE_ID
select EmployeeName=concat(a.FIRST_NAME,' ',a.LAST_NAME),ManagerName =concat(b.FIRST_NAME,' ',b.LAST_NAME) from  Employee a  left join Employee b on a.MANAGER_ID=b.EMPLOYEE_ID

/* 5. Select first_name, incentive amount from employee and incentives table for 
all employees even if they didn’t get incentives and set incentive amount as 0 for those employees 
who didn’t get incentives.  */

select e.FIRST_NAME,Incentive_amount=case when i.INCENTIVE_AMOUNT is null then 0 else i.INCENTIVE_AMOUNT end 
from Employee e left join Incentives i on e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID