-- 1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 

CREATE view depLocation as SELECT * FROM Locations where LocationID in (SELECT LocationID FROM Departments); 

SELECT * FROM depLocation;

-- 2. Write a query to find the names (first_name, last name), department ID and name of all the employees. 

CREATE view depOfEmp as SELECT e.FirstName,e.LastName,e.DepartmentID,d.DepartmentName FROM Employees e join Departments d on e.DepartmentID=d.DepartmentID;

SELECT * FROM depOfEmp

-- 3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London. 

CREATE view EmpDepLondon as SELECT e.FirstName,e.LastName,e.jobId,e.DepartmentID,d.DepartmentName FROM Employees e join Departments d on e.DepartmentID=d.DepartmentID; 

SELECT * FROM EmpDepLondon

-- 4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 

CREATE view EmpWithMan as SELECT e.EmployeeID,e.LastName as EmployeeName,e.ManagerID,m.LastName as ManagerLastName FROM Employees e join Employees m on e.ManagerID=m.EmployeeID;

SELECT * FROM EmpWithMan

-- 5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 

CREATE view EmpHireAfterJhon as SELECT e.EmployeeID,e.FirstName,e.LastName,e.JoiningDate FROM Employees e where e.JoiningDate>(SELECT JoiningDate FROM Employees where FirstName='Jhon');

SELECT * FROM EmpWithMan

-- 6. Write a query to get the department name and number of employees in the department. 

CREATE view NumOfEmpINDept as SELECT d.DepartmentName,Count(e.EmployeeID) as NumberOfEmp FROM Employees e join Departments d on e.DepartmentID=d.DepartmentID group by DepartmentName;

SELECT * FROM NumOfEmpINDept

-- 7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 FROM job history. 

CREATE view Jobview as SELECT EmployeeID,JobID,DateDiff(dd,EndDate,StartDate) as NumberOfDay,DepartmentID FROM JobHistory where DepartmentID=90;

SELECT * FROM Jobview

-- 8. Write a query to display the department ID, department name and manager first name. 

CREATE view DeptViewWithManager as SELECT d.DepartmentID,d.DepartmentName,m.FirstName as ManagerFirstName FROM Departments d join Employees m on m.DepartmentID=d.DepartmentID;

SELECT * FROM DeptViewWithManager

-- 9. Write a query to display the department name, manager name, and city. 

CREATE view DeptView2 as SELECT d.DepartmentName,e.FirstName,l.city FROM Employees e join Departments d on e.DepartmentID=d.DepartmentID join Locations l on d.LocationID=l.LocationID;

SELECT * FROM DeptView2

-- 10. Write a query to display the job title and average salary of employees. 

CREATE view EmpsJobAvgSalary as SELECT JobId,avg(Salary) as AvgSalaryForJob FROM Employees group by JobId; 

SELECT * FROM EmpsJobAvgSalary


-- 11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 

CREATE view jobviewminSly2 as SELECT e.JobId,e.FirstName,(Salary-(SELECT min(Salary) FROM Employees e1 where e1.JobId=e.JobId group by e1.JobId)) as diffSalary FROM Employees e;  

SELECT * FROM jobviewminsly2

-- 12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 

CREATE view jobhistoryview as SELECT * FROM JobHistory where JobID in (SELECT jobId FROM Employees where Salary>10000);

SELECT * FROM jobhistoryview


-- 13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years. 

CREATE view ExpManMoreThen15Yrs as SELECT d.DepartmentName,e.FirstName,e.LastName,e.JoiningDate,e.Salary, DATEDIFF(yy,e.JoiningDate,getDate()) as exp FROM Employees e join Departments d on e.DepartmentID=d.DepartmentID where DATEDIFF(yy,e.JoiningDate,getDate())>15 and e.EmployeeID in (SELECT e1.ManagerID FROM Employees e1 group by e1.ManagerID);

SELECT * FROM ExpManMoreThen15Yrs