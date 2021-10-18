--Write a SQL statement to create a table named countries including columns CountryId, CountryName and RegionId and make sure that no countries except Italy, India and China will be entered in the table. and combination of columns CountryId and RegionId will be unique.
CREATE TABLE countries (
CountryId varchar(5) PRIMARY KEY,
RegionId INT  UNIQUE ,
CountryName varchar(10) NOT NULL CONSTRAINT check_countries CHECK (CountryName IN ('Chaina','India','Italy') ),
)

--Write a SQL statement to create a table named jobs including columns JobId, JobTitle, MinSalary and MaxSalary, and make sure that, the default value for JobTitle is blank and MinSalary is 8000 and MaxSalary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.

CREATE TABLE Jobs 
(
JobId INT PRIMARY KEY IDENTITY(1000,3),
JobTitle VARCHAR(20) DEFAULT ' ', 
MinSalary MONEY DEFAULT 8000,
MaxSalary INT DEFAULT NULL
)

--Write a SQL statement to create a table named JobHistory including columns EmployeeId, StartDate, End_Eate, Job_Id and Department_Id and make sure that the value against column EndDate will be entered at the time of insertion to the format like ‘–/–/—-‘.

CREATE TABLE JobHisory(
EmployeeId INT  PRIMARY KEY  ,
StartDate DATE NOT NULL,
Job_Id INT NOT NULL,
EndDate VARCHAR(10) CONSTRAINT chkEnddate CHECK (EndDate like '__/__/____') 
)