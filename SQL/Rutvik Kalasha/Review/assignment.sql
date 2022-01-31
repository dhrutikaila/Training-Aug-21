--List Name, Designation and Salary of all "officestaff" members.
SELECT Em_Name, Designation, Salary FROM officestaff;

--List Name and Salary of all the people who are working as "Programmer".
SELECT Em_Name, Salary FROM officestaff WHERE Designation = 'Programmer';

--List all the information about those people who are earning less than Rs.10,000/- .
SELECT * FROM officestaff WHERE Salary < 10000;

--List all the information about those staff members who fall in the salary range of     Rs.5000/- to Rs.10,000/- .
SELECT * FROM officestaff WHERE Salary BETWEEN 5000 AND 100000;

--List Name of all the office staff members in Lower Case.
SELECT LOWER(Em_Name) FROM officestaff;

--List Name of all the office staff members in following format: For example, if name is "umeshbhai" then display it in the format "Umeshbhai".
SELECT * FROM officestaff WHERE upper(Em_Name) = 'umeshbhai'

--List all the information about those people who works for "Nileshbhai".
SELECT  * FROM officestaff WHERE boss_name = 'Nileshbhai'

--List all the information about those members with salary greater than or equal to     Rs.3000/- or working directly under "Nileshbhai".
SELECT * FROM officestaff WHERE Salary >= 3000 OR Boss_Name = 'nileshbhai';

--List Name, Salary, Over-time Salary of all the office staff members.
SELECT Em_Name, Salary , Over_Time_Salary FROM officestaff;

--Perform above MySQL statement again, but now 0(Zero) should be substituted for NULL in     Over-time Salary field.
UPDATE officestaff SET Over_Time_Salary=0 WHERE Over_Time_Salary IS NULL;

--List Name and Total Monthly Salary (Salary + Over-time Salary) of all the office staff members.
SELECT Em_Name,SUM(Salary + Over_Time_Salary) AS MonthlySalary  FROM officestaff;

--List Total Annual Salary of all the office staff members.
SELECT SUM(Salary) AS TotalAnnualSalary FROM officestaff GROUP BY ROLLUP(Salary);

--List Name and Total Daily Salary of all the office staff members. (Consider a month is     of 30 days).
SELECT Em_Name,salary/30 AS Daily_Salary FROM officestaff;

--List all the information of the person earning Highest Salary (Salary + Over-time     Salary) in the staff.
SELECT * FROM officestaff WHERE Salary > (SELECT MAX(SUM(Salary + Over_Time_Salary)) FROM officestaff);

--List all the information of the person earning Least Salary (Salary + Over-time Salary)     in the staff.
SELECT Em_Name,Salary,Over_Time_Salary FROM officestaff;

--List all the information about those who earn the Highest Salary (Salary + Over-time     Salary) and those who earn the Least Salary (Salary + Over-time Salary) in the staff.
(SELECT * FROM officestaff WHERE Salary + Over_Time_Salary = (SELECT MAX(Salary + Over_Time_Salary) FROM officestaff));
(SELECT * FROM officestaff WHERE Salary + Over_Time_Salary = (SELECT MIN(Salary + Over_Time_Salary) FROM officestaff));


--List all the information about the person who earns more than his boss.
SELECT * FROM officestaff WHERE Salary > (SELECT Salary from officestaff where Em_Name = 'nileshbhai');

--List Name, Designation, Salary and City of each staff member.
SELECT Em_Name,Designation,Salary,city FROM officestaff INNER JOIN Staff_Address ON officestaff.AddresID = Staff_Address.AddresID;

--List those City Name where 3 or more than 3 people resides.
SELECT M.Em_Name
FROM officestaff M
INNER JOIN Staff_Address E ON E.AddresID = M.AddresID
GROUP BY E.city
HAVING count(E.city) >= 3;