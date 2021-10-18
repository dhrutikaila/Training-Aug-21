/* Q3 Write a SQL statement to create a table named jobs including columns 
JobId, JobTitle, MinSalary and MaxSalary, and make sure that, the default value for 
JobTitle is blank and MinSalary is 8000 and MaxSalary is NULL will be entered automatically 
at the time of insertion if no value assigned for the specified columns. */

use db1;

CREATE TABLE jobs
(
JobId int not null PRIMARY KEY identity(1,1),
JobTitle varchar(20) not null DEFAULT ' ',
MinSalary Numeric(10) DEFAULT 8000,
MaxSalary Numeric(10) DEFAULT null,
)