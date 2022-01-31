use Subqueries

CREATE table Incentive

(
 IncentiveID int constraint IncentiveID primary key not null,
 Incentive_amount int not null,
 Incentive_Date date,
 EmployeeID decimal(6,0) constraint fkemployee foreign key (EmployeeID) references employees(employeeID)



)
SELECT * FROM Incentive 


insert into incentive values(1,'4000','1988-06-18','100')
insert into incentive values(2,'5000','1987-06-21','101')
insert into incentive values(3,'4500','1992-09-24','102')
insert into incentive values(4,'2400','1987-09-29','107')
insert into incentive values(5,'3500','1989-11-21','108')



--CREATE a VIEW to SELECT FirstName,LAStName,Salary,JOINingDate,IncentiveDate and IncentiveAmount

CREATE VIEW demmo 
AS
(	
SELECT Employees.firstname,Employees.LAStName,Employees.Salary,Employees.HireDate,Incentive.Incentive_Date,Incentive.Incentive_amount 
FROM Employees JOIN Incentive on employees.EmployeeID=Incentive.EmployeeID
)


SELECT * FROM demo

drop VIEW demmo
-- CREATE a VIEW to SELECT SELECT first_name, incentive amount FROM employee and incentives table for those 
--employees who have incentives and incentive amount greater than 3000

CREATE VIEW demo
AS
(
	SELECT employees.FirstName,incentive.Incentive_amount FROM Employees JOIN incentive on employees.EmployeeID=Incentive.EmployeeID WHERE Incentive_amount>3000
)

-- CREATE a VIEW to Find the names (first_name, lASt_name), job, department number, and department name of the employees who work in London

CREATE VIEW demo1
AS
(
SELECT Employees.FirstName,Employees.lAStName,Employees.JobId,departments.DepartmentID,Departments.DepartmentName 
FROM Employees JOIN Departments on Employees.DepartmentID=Departments.DepartmentID 
WHERE locationid=(SELECT locationid FROM locations WHERE city='london')

)

--CREATE a VIEW to get the department name and number of employees in the department.


CREATE VIEW demo2
AS
(

SELECT  Departments.DepartmentName,count(*)AS 'number' FROM 
Departments JOIN  Employees on Departments.DepartmentID=Employees.DepartmentID
 group by (Departments.DepartmentName)
)


--Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 FROM job history.

SELECT EmployeeID,jobid,datediff(dd,startdate,enddate)AS'diff' FROM jobhistory WHERE DepartmentID=90

--Write a VIEW to display the department name, manager name, and city.
CREATE VIEW demo3
AS
(

SELECT  departments.DepartmentName,Employees.EmployeeID,Employees.firstname, locations.City FROM Departments JOIN Employees  on Departments.ManagerID=Employees.EmployeeID JOIN Locations on Departments.LocationID=Locations.LocationID


)

--VIEW to display department name, name (first_name, lASt_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
CREATE VIEW demo4
AS
(
SELECT Departments.DepartmentName,CONCAT(Employees.FirstName,Employees.LAStName)AS 'name',Employees.HireDate,employees.salary FROM Departments JOIN Employees
on Departments.ManagerID=Employees.EmployeeID
WHERE datediff(yy,HireDate,GETDATE())>15
)




----ASsignment

--1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 
CREATE VIEW demo5
AS
(
SELECT distinct departments.locationid,departments.departmentname,locations.streetaddress,locations.city,countries.countryname FROM departments JOIN locations
on departments.locationid= locations.locationid JOIN countries on locations.countryid=countries.countryid
)

--2. Write a query to find the names (first_name, lASt name), department ID and name of all the employees. 
CREATE VIEW demo6
AS
(
SELECT distinct departments.departmentid,departments.departmentname,Employees.FirstName,Employees.LAStName FROM employees JOIN departments
on employees.departmentid =departments.departmentid
)


--3. Find the names (first_name, lASt_name), job, department number, and department name of the employees who work in London. 

CREATE VIEW demo7
AS
(

SELECT employees.firstname,employees.lAStname,employees.jobid,employees.departmentid,departments.departmentname FROM employees JOIN departments
on employees.departmentid=departments.departmentid
)


--4. Write a query to find the employee id, name (lASt_name) along with their manager_id, manager name (lASt_name). 
CREATE VIEW demo7
AS
(

SELECT e.employeeid,e.lAStname,m.managerid,m.lAStname FROM employees e JOIN employees m on e.managerid=m.employeeid 
)

--5. Find the names (first_name, lASt_name) and hire date of the employees who were hired after 'Jones'. 
CREATE VIEW demo7
AS
(

SELECT e.employeeid,e.lAStname, e.hiredate FROM employees e WHERE e.hiredate>(SELECT hiredate FROM employees WHERE lAStname='jones' or firstname='jones')
)



--6. Write a query to get the department name and number of employees in the department. 

CREATE VIEW demo7
AS
(

SELECT d.departmentname,count(*)AS'employee number' FROM employees e JOIN departments d on e.departmentid=d.departmentid  
group by d.departmentname
 
)



--7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 FROM job history. 
CREATE VIEW demo7
AS
(

SELECT e.employeeid,datediff(dd,j.startdate,j.enddate) FROM employees e JOIN jobhistory j on e.EmployeeID=j.EmployeeID  
 
)

--8. Write a query to display the department ID, department name and manager first name. 

CREATE VIEW demo7
AS
(

SELECT distinct d.departmentname,d.DepartmentID,m.firstname ,m.employeeid FROM employees e JOIN employees m on e.managerid=m.employeeid JOIN departments d on m.departmentid=d.departmentid   
SELECT * FROM Departments

)



--9. Write a query to display the department name, manager name, and city. 

CREATE VIEW demo7
AS
(
SELECT  d.departmentname,e.managerid ,e.firstname,l.city FROM Departments d JOIN employees e on d.ManagerID=e.EmployeeID JOIN locations l on d.LocationID=l.LocationID

)






--10. Write a query to display the job title and average salary of employees. 
CREATE VIEW deom8
AS
(

SELECT e.employeeid,e.jobid ,(SELECT avg(e.salary) FROM employees e ) FROM employees e 
)



--11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 

CREATE VIEW deom8
AS
(

SELECT e.firstname, totalsalry=e.Salary-(SELECT min(e.salary) FROM employees e ) FROM employees e 
)


--12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 
CREATE VIEW deom8
AS
(

SELECT * FROM jobhistory j left JOIN employees e on j.EmployeeID =e.EmployeeID  WHERE Salary>10000

)



--13. Write a query to display department name, name (first_name, lASt_name), hire date, salary of the manager for all managers whose experience is more than 15 years. 


SELECT d.departmentname,concat(e.firstname,e.lAStname),e.hiredate,e.salary FROM Departments d JOIN Employees e on d.ManagerID=e.employeeid WHERE DATEDIFF(yy,e.HireDate,getdate())>15






SELECT * FROM demo3


SELECT * FROM Employees WHERE EmployeeID in(114,121,145)
SELECT * FROM Departments
SELECT * FROM JobHistory group by DepartmentID

-- 
SELECT count(*) FROM Employees group by DepartmentID
drop VIEW demo1
SELECT * FROM demo2
SELECT * FROM Employees
SELECT * FROM Departments