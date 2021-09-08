--1. Write a SQL statement to insert a record with your own value into the table countries against each columns.and region_id.

	 INSERT INTO countries VALUES ('C0001','India',1001) 

--2. Write a SQL statement to insert one row into the table countries against the column country_id and country_name.

	 INSERT INTO countries (country_id,country_name) VALUES ('C0002','USA')

	 SELECT * FROM countries

--3.Write a SQL statement to insert 3 rows by a single insert statement.

	INSERT INTO countries VALUES ('C003','INDIA',1003),
								 ('C004','USA',1004),
								 ('C005','UK',1005)

--4. Write a SQL statement insert rows from country_new table to countries table.

	 INSERT INTO countries
	 SELECT * FROM country_new

--5. Here is the rows to insert for country_new table. Assume that, the countries table is empty.
--+------------+--------------+-----------+
--| COUNTRY_ID | COUNTRY_NAME | REGION_ID |
--+------------+--------------+-----------+
--| C0001 | India | 1001 |
--| C0002 | USA | 1007 |
--| C0003 | UK | 1003 |
--+------------+--------------+-----------+

	 INSERT INTO countries
	 SELECT * FROM country_new

--6. Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.

	 INSERT INTO jobs VALUES ('AC_ACCOUNT','Public Accountant',4200,4800)

--9. Write a SQL statement to insert a record into the table countries to ensure that, a country_id 
--   and region_id combination will be entered once in the table.

	 -- CREATE TABLE countries
  --    (
  --      country_id VARCHAR(10),
		--country_name VARCHAR(50) NOT NULL,
		--region_id VARCHAR(10),
		--PRIMARY KEY(country_id,region_id)
	 -- )

	 INSERT INTO countries VALUES ('C0001','India',1001),
								  ('C0001','INDIA',1003),
								  ('C0004','Italy',1004)
								  --('C0001','INDIA',1001) 
								  

--10. Write a SQL statement to insert rows into the table countries in which the value of country_id column will be unique 
--    and auto incremented.

	 -- CREATE TABLE countries
  --    (
  --      country_id INT PRIMARY KEY IDENTITY(1,1),
		--country_name VARCHAR(50) NOT NULL,
		--region_id VARCHAR(10) NOT NULL
	 -- )

	  INSERT INTO countries VALUES ('India',1001),
								   ('Italy',1003)

--11. Write a SQL statement to insert records into the table countries to ensure that the country_id column will not contain any duplicate data 
--and this will be automatically incremented and the column country_name will be filled up by 'N/A' if no value assigned for that column.

	 -- CREATE TABLE countries
  --    (
  --      country_id INT PRIMARY KEY IDENTITY(1,1),
		--country_name VARCHAR(50) DEFAULT 'N/A',
		--region_id VARCHAR(10) NOT NULL
	 -- )	
	  
	  INSERT INTO countries (region_id) VALUES (12)

	  SELECT * FROM countries

--12. Write a SQL statement to insert rows in the job_history table in which one column job_id
--    is containing those values which are exists in job_id column of jobs table.

	 --   CREATE TABLE jobs
		--(
		--job_id VARCHAR(10) PRIMARY KEY NOT NULL,
		--job_title VARCHAR(35) DEFAULT NULL,
		--min_salary DECIMAL(6,0) DEFAULT NULL,
		--max_salary DECIMAL(6,0) DEFAULT NULL,
		--)

		--INSERT INTO jobs VALUES ('AC_ACCOUNT','Public Accountant',4200,4800)

		--CREATE TABLE job_history
		--(
		--employee_id TINYINT PRIMARY KEY IDENTITY(1,1),
		--[start_date] DATE ,
		--end_date VARCHAR(10),
		--job_id VARCHAR(10) NOT NULL,
		--department_id DECIMAL(4,0),
		--FOREIGN KEY (job_id) REFERENCES jobs(job_id)
		--) 
	
	    INSERT INTO  job_history (job_id) VALUES ('AC_ACCOUNT')

--13. Write a SQL statement to insert rows into the table employees in which a set of columns department_id 
--    and manager_id contains a unique value and that combined values must have exists into the table departments.

	  --CREATE TABLE departments
	  --(
	  --DEPARTMENT_ID DECIMAL(4,0) ,
	  --DEPARTMENT_NAME VARCHAR(30) DEFAULT NULL,
	  --MANAGER_ID DECIMAL(6,0),
	  --LOCATION_ID DECIMAL(4,0) DEFAULT NULL,
	  --PRIMARY KEY(DEPARTMENT_ID,MANAGER_ID)
	  --)

	  --INSERT INTO departments VALUES (10,'Administration',200,1700),
		 --                            (20,'Marketing',201,1800)

	  --CREATE TABLE employees
	  --(
	  --employee_id DECIMAL(4,0) UNIQUE NOT NULL,
	  --first_name VARCHAR(20) NOT NULL,
	  --last_name VARCHAR(25) NOT NULL,
	  --phone_number VARCHAR(10) NOT NULL,
	  --hire_date DATE NOT NULL, 
	  --job_id VARCHAR(10) NOT NULL,
	  --salary DECIMAL(8,2) NOT NULL,
	  --commission DECIMAL(2,2),
	  --manager_id DECIMAL(6,0),
	  --department_id DECIMAL(4,0),
	  --FOREIGN KEY(department_id,manager_id) REFERENCES departments(DEPARTMENT_ID,MANAGER_ID)
	  --)

	  INSERT INTO employees VALUES(1,'RAMESH','SHAH','9090909009','12-01-2018','AC_ACCOUNT',18000,NULL,201,20)


--14. Write a SQL statement to insert rows into the table employees in which a set of columns department_id 
--    and job_id contains the values which must have exists into the table departments and jobs.


	 -- CREATE TABLE departments
	 -- (
	 -- DEPARTMENT_ID DECIMAL(4,0),
	 -- DEPARTMENT_NAME VARCHAR(30) DEFAULT NULL,
	 -- MANAGER_ID DECIMAL(6,0) DEFAULT NULL,
	 -- LOCATION_ID DECIMAL(4,0) DEFAULT NULL,
	 -- PRIMARY KEY(DEPARTMENT_ID)
	 -- )

	 -- INSERT INTO departments VALUES (10,'Administration',200,1700),
		--                             (20,'Marketing',201,1800)

	 -- CREATE TABLE jobs
		--(
		--job_id VARCHAR(10) PRIMARY KEY NOT NULL,
		--job_title VARCHAR(35) DEFAULT NULL,
		--min_salary DECIMAL(6,0) DEFAULT NULL,
		--max_salary DECIMAL(6,0) DEFAULT NULL,
		--)

	 -- INSERT INTO jobs VALUES ('AC_ACCOUNT','Public Accountant',4200,4800)
	  
	  
	 -- CREATE TABLE employees
	 -- (
	 -- employee_id DECIMAL(4,0) UNIQUE NOT NULL,
	 -- first_name VARCHAR(20) NOT NULL,
	 -- last_name VARCHAR(25) NOT NULL,
	 -- phone_number VARCHAR(10) NOT NULL,
	 -- hire_date DATE NOT NULL, 
	 -- job_id VARCHAR(10) NOT NULL,
	 -- salary DECIMAL(8,2) NOT NULL,
	 -- commission DECIMAL(2,2),
	 -- manager_id DECIMAL(6,0),
	 -- department_id DECIMAL(4,0),
	 -- FOREIGN KEY(department_id) REFERENCES departments(DEPARTMENT_ID),
	 -- FOREIGN KEY(job_id) REFERENCES jobs(job_id)
	 -- )

	  INSERT INTO employees VALUES(2,'NAREN','SHAH','9090909009','2018-12-08','AC_ACCOUNT',18000,NULL,201,20)


	  


