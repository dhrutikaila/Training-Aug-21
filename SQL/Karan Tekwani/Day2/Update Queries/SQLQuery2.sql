--1 Write a SQL statement to change the Email column of Employees table with ‘not available’ for all employees.
alter table Employees
drop constraint ukEmail
UPDATE Employees
set Email='Not Available'
select * from Employees

/* 2. Write a SQL statement to change the Email and CommissionPct column of employees table with 
‘not available’ and 0.10 for all employees.*/

UPDATE Employees
set Email='Not Available', CommissionPct='0.10'
select * from Employees

/* 3. Write a SQL statement to change the Email and CommissionPct column of employees table with 
‘not available’ and 0.10 for those employees whose DepartmentID is 110.*/

UPDATE Employees
set Email='Not Available', CommissionPct='0.10' where DepartmentID=110
select * from Employees

/* 4. Write a SQL statement to change the Email column of employees table with 
‘not available’ for those employees whose DepartmentID is 80 and gets a commission is less than 20%*/

update Employees
set Email='Not Available' where DepartmentID=80 and CommissionPct<'0.20'
select * from Employees

/*5. Write a SQL statement to change the Email column of employees table with ‘not available’ 
for those employees who belongs to the ‘Accouning’ department.  */

update Employees
set Email='Not Available' where DepartmentID='110'
select * from Employees

/* 6. Write a SQL statement to change salary of employee to 8000 whose ID is 105,
if the existing salary is less than 5000.*/

update Employees
set Salary='8000' where DepartmentID='105' and Salary<5000
select * from Employees


/* 7. Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the 
employee belongs to department, which ID is 30 and the existing job ID does not start with SH.  */

update Employees
set JobId='SH_CLERK' where EmployeeID='118' and JobId like 'SH%'
select * from Employees

/* 8. Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that, salary will be increased by 25% for the department 40, 
15% for department 90 and 10% for the department 110 and the rest of the departments will remain same. */

update Employees
set Salary+=0.25*Salary where DepartmentID ='40'
select * from Employees

update Employees
set Salary+=0.15*Salary where DepartmentID ='90'
select * from Employees

update Employees
set Salary+=0.10*Salary where DepartmentID ='110'
select * from Employees
