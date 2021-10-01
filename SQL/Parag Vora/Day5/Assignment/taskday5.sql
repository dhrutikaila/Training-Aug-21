-- database created
    create database Day5join
    use Day5join

-- table creation
    create table Employee
    (
    EMPLOYEE_ID int CONSTRAINT PK_EMPLOYEE_ID PRIMARY KEY NOT NULL,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    SALARY MONEY,
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(50),
    MANAGER_ID INT ,
    )

    CREATE TABLE Incentives
    (
    EMPLOYEE_REF_ID int CONSTRAINT fk_EMPLOYEE_REF_ID foreign key REFERENCES Employee(EMPLOYEE_ID),
    INCENTIVE_DATE DATE ,
    INCENTIVE_AMOUNT MONEY
    )



-- insert values
    insert into Employee values (1,'John','Abraham',1000000,'01-JAN-13 12:00:00 AM','Banking',NULL)
    insert into Employee values (2,'Michael','Clarke',800000,'01-JAN-13 12:00:00 AM','Insurance',1)
    insert into Employee values (3, 'Roy' ,'Thomas',700000,'01-FEB-13 12:00:00 AM','Banking',1)
    insert into Employee values (4, 'Tom' ,'Jose' ,600000,'01-FEB-13 12:00:00 AM','Insurance',2)
    insert into Employee values (5, 'Jerry' ,'Pinto' ,650000,'01-FEB-13 12:00:00 AM','Insurance',3)
    insert into Employee values (6, 'Philip' ,'Mathew' ,750000,'01-JAN-13 12:00:00 AM','Services',3)
    insert into Employee values (7, 'TestName1' ,'123' ,650000,'01-JAN-13 12:00:00 AM','Services',2)
    insert into Employee values (8, 'TestName2' ,'Lname%' ,600000,'01-FEB-13 12:00:00 AM','Insurance',2)

    INSERT INTO Incentives VALUES
    (1,'01-FEB-13',5000),
    (2,'01-FEB-13',3000),
    (3,'01-FEB-13',4000)

-- Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
    select e.FIRST_NAME,DATEDIFF(month,JOINING_DATE,INCENTIVE_DATE) as diffmonth from Employee as e
    inner join Incentives i on e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID

-- Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
    select e.FIRST_NAME,i.INCENTIVE_AMOUNT from Employee as e 
    join  Incentives i on e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID AND i.INCENTIVE_AMOUNT>3000

-- Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
    select e.FIRST_NAME,i.INCENTIVE_AMOUNT from Employee as e 
    join  Incentives i on e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID 

-- Select EmployeeName, ManagerName from the employee table.
    select distinct(e.FIRST_NAME) from Employee as e
    join Employee as k on e.EMPLOYEE_ID = k.MANAGER_ID

-- Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
    Select FIRST_NAME, ISNULL(INCENTIVE_AMOUNT,0) as INCENTIVE_AMOUNT
    from employee a left join incentives B on A.EMPLOYEE_ID = B.EMPLOYEE_REF_ID

