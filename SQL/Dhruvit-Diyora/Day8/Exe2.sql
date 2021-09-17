--task-1. Write a SQL statement to insert a record with your own value into the table countries against each columns.and region_id.
INSERT INTO Countries (CountryId,CountryName,RegionId) VALUES ('IN','India',2)

--task-2. Write a SQL statement to insert one row into the table countries against the column country_id and country_name.
INSERT INTO Countries (CountryId,CountryName) VALUES ('IND','India')

--task-3.Write a SQL statement to insert 3 rows by a single insert statement.
INSERT INTO Countries VALUES
('US', 'United States',42),
('AU', 'Australia',63),
('CA', 'Canada',11)

--task-4. Write a SQL statement insert rows from country_new table to countries table.
SELECT * INTO Countries FROM (SELECT * FROM Country_New) Ctr


--task-5. Here is the rows to insert for country_new table. Assume that, the countries table is empty.

--+------------+--------------+-----------+
--| COUNTRY_ID | COUNTRY_NAME | REGION_ID |
--+------------+--------------+-----------+
--| C0001      | India        |      1001 |
--| C0002      | USA          |      1007 |
--| C0003      | UK           |      1003 |
--+------------+--------------+-----------+
INSERT INTO CountryNew (CountryId,CountryName,RegionId) VALUES
('C0001', 'India',1001),
('C0002', 'USA',1007),
('C0003', 'UK',1003))

--task-6.Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.
ALTER TABLE Jobs ADD CONSTRAINT UqJob UNIQUE(JobId)


--task-9. Write a SQL statement to insert a record into the table countries to ensure that, a country_id and region_id combination will be entered once in the table.
ALTER TABLE Countries ADD CONSTRAINT UcCountry UNIQUE(CountryID,RegionID)


--task-10. Write a SQL statement to insert rows into the table countries in which the value of country_id column will be unique and auto incremented.
CREATE TABLE Countries
	(
	CountryId INT IDENTITY(1,1) PRIMARY KEY,
	CountryName NVARCHAR(60),
	RegionId INT
	)

--task-11. Write a SQL statement to insert records into the table countries to ensure that the country_id column will not contain any duplicate data and this will be automatically incremented and the column country_name will be filled up by 'N/A' if no value assigned for that column.
CREATE TABLE Countries
	(
	CountryId INT IDENTITY(1,1) PRIMARY KEY,
	CountryName NVARCHAR(60) DEFAULT 'N/A',
	RegionId INT
	)

--task-12. Write a SQL statement to insert rows in the job_history table in which one column job_id is containing those values which are exists in job_id column of jobs table.
ALTER TABLE JobHistory ADD CONSTRAINT FKJobId FOREIGN KEY REFERENCES Jobs(JobId)


--task-13. Write a SQL statement to insert rows into the table employees in which a set of columns department_id and manager_id contains a unique value and that combined values must have exists into the table departments.
ALTER TABLE Employees ADD CONSTRAINT FKDepMgrEmp FOREIGN KEY (department_id,manager_id) REFERENCES departments(department_id,manager_id)

--task-14. Write a SQL statement to insert rows into the table employees in which a set of columns department_id and job_id contains the values which must have exists into the table departments and jobs.
ALTER TABLE Employees ADD CONSTRAINT FKDepEmp FOREIGN KEY (department_id) REFERENCES departments(department_id)
ALTER TABLE Employees ADD CONSTRAINT FKJobEmp FOREIGN KEY (JobId) REFERENCES Jobs(JobId)