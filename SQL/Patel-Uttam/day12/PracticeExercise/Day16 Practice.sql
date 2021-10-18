  USE [Day16 (Function)]

-- Practice Exercise

	--UDF
	--Create User-defined Functions
	--Limitation and restriction of User-defined Functions
	--Scalar Functions
	--Table-Valued Functions
	--Drop Function
	--Alter Function
	--Built-in system functions

-- Self 
	-- UDF Aggregate Function





-- Function OR UDF : Function is block of code , we use function to store frequently used line of code.
				--   Function reduce the redundancy of code.
				--   basically function use to take input values , do some calculation or proccess and return output value.
				--	 Function doesn't allow to return  value with data type 'Text,ntext,image,timestamp'.

	--Functions Limitation : 
		--	UDF accept less number of input parameter then store procedure (approx.	1023)
		--	UDF not allow to use non-deterministic buit-in functions (Like.. GETDATE())
		--	UDF does not return multiple result set like store procedure , return only one result
		--	Temporary Table can't be used in UDF
		--	UDF accept less number of input parameter then store procedure (approx.	1023)




--Create User-defined Functions : To create function 'CREATE FUNCTION' command use and then of name of function with input parameter within parenthesis. 

--///////////////////////////////////////////////////////////////////////////////////////////////////
	--------------------------------------------------------------
	--Function for count number of employee in department

	CREATE FUNCTION count_employee_in_dept(@deptid int)
	RETURNS INT
	AS
	BEGIN
		DECLARE @empcount int

			
			IF (SELECT DISTINCT DepartmentID FROM PracticeExercise.dbo.employees WHERE DepartmentID = @deptid ) > 0 
			BEGIN
			SET @empcount = (SELECT COUNT(EmployeeID) FROM PracticeExercise.dbo.employees WHERE DepartmentID = @deptid)
			END
			ELSE
			BEGIN
			SET @empcount = 0
			END
		RETURN @empcount
	END
	GO

	--Function execution
	Declare @totalemp int
	SELECT @totalemp = [Day16 (Function)].dbo.count_employee_in_dept(50) 
	PRINT @totalemp
	GO

	
	--***********************************************************

	CREATE FUNCTION 

	--------------------------------------------------------------

--///////////////////////////////////////////////////////////////////////////////////////////////////




--Scalar Functions : Scalar Functions can take zero or one or more than one value as input parameter and always return single-value/scalar-value result.
--///////////////////////////////////////////////////////////////////////////////////////////////////
		--------------------------------------------------------------
		-- Scalar function without parameter : 

			ALTER FUNCTION scalar_zero_para()
			RETURNS varchar(50) 
			AS
			BEGIN
			DECLARE @result varchar(50)
			SET @result = 'Staement Line' 
			RETURN @result
			END
			GO

		-- function execution
		DECLARE @result varchar(50)
		SELECT @result = dbo.scalar_zero_para()
		PRINT @result
		GO
		-----------------------------------------------------------


		-----------------------------------------------------------
		-- Scalar function with one parameter : Function to count employee in department

		CREATE FUNCTION scalar_one_para(@deptid int)
		RETURNS INT
		AS
		BEGIN
			DECLARE @empcount int

			
				IF (SELECT DISTINCT DepartmentID FROM PracticeExercise.dbo.employees WHERE DepartmentID = @deptid ) > 0 
				BEGIN
				SET @empcount = (SELECT COUNT(EmployeeID) FROM PracticeExercise.dbo.employees WHERE DepartmentID = @deptid)
				END
				ELSE
				BEGIN
				SET @empcount = 0
				END
			RETURN @empcount
		END
		GO

		--scalar_one_para Function execution
		Declare @totalemployee int
		SELECT @totalemployee = [Day16 (Function)].dbo.scalar_one_para(110) 
		PRINT @totalemployee
		GO

		--***************************************************

		CREATE FUNCTION Employee_fullname(@empid int)
		RETURNS VARCHAR(50)
		AS
		BEGIN
		DECLARE @fullname VARCHAR(50)
		SELECT @fullname = Concat(FirstName,' ',LastName)  FROM PracticeExercise.dbo.Employees WHERE EmployeeID=@empid
		RETURN @fullname

		END
		GO

		--Employee_fullname function execute
		SELECT dbo.Employee_fullname(EmployeeID) AS 'Fullname' , Salary FROM PracticeExercise.dbo.Employees
		-----------------------------------------------------------

		
		
		-----------------------------------------------------------
		-- scalar function with more than one parameter : Function to count employee in department with given jobid.

		ALTER FUNCTION scalar_more_than_one_para(@deptid int,@jobid varchar(20))
		RETURNS INT
		AS
		BEGIN
			DECLARE @emp_jobid_deptid int

			
				IF (SELECT DISTINCT COUNT(EmployeeID) FROM PracticeExercise.dbo.employees WHERE DepartmentID = @deptid AND JobId = @jobid ) > 0 
				BEGIN
				SET @emp_jobid_deptid = (SELECT COUNT(EmployeeID) FROM PracticeExercise.dbo.employees WHERE DepartmentID = @deptid AND JobId = @jobid)
				END
				ELSE
				BEGIN
				SET @emp_jobid_deptid = 0
				END
			RETURN @emp_jobid_deptid
		END
		GO

		--Function execution
		Declare @totalemployee int
		SELECT @totalemployee = dbo.scalar_more_than_one_para(50,'ST_CLERK') --(First para [departmentID] , Second para [JobId])
		PRINT @totalemployee
		GO
		
		-----------------------------------------------------------
	
--///////////////////////////////////////////////////////////////////////////////////////////////////




--Table-Valued Functions : In T-SQL, Function can't return multiple result like Store Procedure, That's why Table-valued function use this Function return a table as resultset.
					--     Table structure is define at function create time, and RETURN type should be TABLE. 
--///////////////////////////////////////////////////////////////////////////////////////////////////
	
	--Multi Valued
	----------------------------------------------------------------------------------------------------------------------
		-- Function to return table has employees data of given deptID (employee_name,departmentname,manager_of_dept,location)
		
		CREATE FUNCTION Employee_join_data_multi_valued(@jobid varchar(15))
		RETURNS 
		@Employee_data TABLE
		(Firstname varchar(25),Lastname varchar(25),Department varchar(25),Manager int,LocationID int)
		AS 		
		BEGIN
		     INSERT INTO @Employee_data
			  SELECT e.FirstName 'Firstname' , e.LastName 'Lastname' , d.DepartmentName 'Department' , d.ManagerID 'managerID', d.LocationID as 'location' FROM [PracticeExercise].[dbo].[Employees] as e
								JOIN [PracticeExercise].[dbo].[Departments] as d
								ON e.DepartmentID=d.DepartmentID
								WHERE e.JobId=@jobid
 		
		RETURN
		END
		
		GO

		-- function execute
		SELECT * FROM dbo.Employee_join_data_multi_valued('PU_CLERK')
	----------------------------------------------------------------------------------------------------------------------


	-- Inline value
	----------------------------------------------------------------------------------------------------------------------
		ALTER FUNCTION Employee_join_data(@jobid varchar(15))
		RETURNS TABLE
		
		AS
		
		RETURN
			  (SELECT e.FirstName 'Firstname' , e.LastName 'Lastname' , d.DepartmentName 'Department' , d.ManagerID 'managerID', d.LocationID as 'location' FROM [PracticeExercise].[dbo].[Employees] as e
								JOIN [PracticeExercise].[dbo].[Departments] as d
								ON e.DepartmentID=d.DepartmentID
								WHERE e.JobId=@jobid)
		
		GO

		-- function execute
		SELECT * FROM dbo.Employee_join_data('ST_CLERK')

	----------------------------------------------------------------------------------------------------------------------


--///////////////////////////////////////////////////////////////////////////////////////////////////




-- DROP / ALTER 
--///////////////////////////////////////////////////////////////////////////////////////////////////
	--DROP Function : 'DROP FUNCTION' To delete definition of function
	
	DROP FUNCTION dbo.count_employee_in_dept
	
	--ALTER Function : 'ALTER FUNCTION' To modify the definition of function after create of Function.
	
		-- Here we alter function 'scalar_zero_para' define in (scalar part).
	
			ALTER FUNCTION scalar_zero_para()
			RETURNS varchar(8)	-- we update return value-size 50 to 8. 
			AS
			BEGIN
			DECLARE @result varchar(50)
			SET @result = 'Staement Line' 
			RETURN @result
			END
			GO

	-- execute funcion
	SELECT dbo.scalar_zero_para()	-- function return 'Statement Line' but actual return value is 'Statement'

--///////////////////////////////////////////////////////////////////////////////////////////////////





-- UDF Aggregate function
--///////////////////////////////////////////////////////////////////////////////////////////////////
		GO
		CREATE FUNCTION nth_salary_from_mployee(@n int)
		RETURNS INT
		AS
		BEGIN
				DECLARE @salary int
				SET @salary = (SELECT  TOP 1 SALARY FROM 
			(SELECT DISTINCT TOP (@n) SALARY FROM Employee ORDER BY SALARY DESC) 
			tb1 ORDER BY SALARY ASC)
		RETURN @salary
		END
		GO
	
	-- execute function
	SELECT dbo.nth_salary_from_mployee(2)


--///////////////////////////////////////////////////////////////////////////////////////////////////
