------------Store Procedure----------------------
-------------WITHOUT parameter--------------------
CREATE PROCEDURE spEmployeeDepartmentGet
AS
BEGIN
SELECT * FROM Employees AS EMP
JOIN departments AS DEPT ON DEPT.DEPARTMENT_ID=EMP.DepartmentID
END

-----------Executing Store Procedure------------------------
spEmployeeDepartmentGet
EXEC spEmployeeDepartmentGet
EXECUTE spEmployeeDepartmentGet

---------------ALTER Store Procedure-------------------------
ALTER PROCEDURE spEmployeeDepartmentGet
AS
BEGIN
SELECT Employee_Name=(FirstName+SPACE(1)+LastName),DEPT.DEPARTMENT_NAME,Salary FROM Employees AS EMP
JOIN departments AS DEPT ON DEPT.DEPARTMENT_ID=EMP.DepartmentID
END

---------------DROP Store Procedure------------------------------
DROP PROCEDURE spEmployeeDepartmentGet

-------------Creating Store Procedure with input parameter------------------------

CREATE PROCEDURE spEmployeeGetName
@Job_Id varchar(10),
@Salary DECIMAL(8,2)
AS 
BEGIN

	SELECT Employee_Name=(FirstName+SPACE(1)+LastName) FROM Employees 
	WHERE JobId=@Job_Id AND Salary > @Salary
END

EXECUTE spEmployeeGetName 'SH_CLERK',3000

-------------------------------------------------------------

CREATE PROCEDURE HumanResources.uspGetEmployeesTest2   
    @LastName nvarchar(50),   
    @FirstName nvarchar(50)   
AS   
BEGIN
    SET NOCOUNT ON  
    SELECT FirstName, LastName, Department  
    FROM HumanResources.vEmployeeDepartmentHistory  
    WHERE FirstName = @FirstName AND LastName = @LastName  
END

EXEC HumanResources.uspGetEmployeesTest2 @FirstName='Terri',@LastName='Duffy'

SELECT * FROM HumanResources.vEmployeeDepartmentHistory


----------------Creating Store Procedure with output parameter----------------------
CREATE PROCEDURE spEmployeeGetCount
@Department_Name VARCHAR(15),
@Count INT OUTPUT
AS 
BEGIN
	
	SELECT @Count=COUNT(EMP.EmployeeID) FROM Employees AS EMP
	JOIN departments AS DEPT ON EMP.DepartmentID=DEPT.DEPARTMENT_ID
	WHERE DEPT.DEPARTMENT_NAME=@Department_Name 
END

DECLARE @Count_No INT
EXECUTE spEmployeeGetCount 'IT',@Count_No OUTPUT
PRINT 'Total Employee In IT Department is: '+CAST(@Count_No AS VARCHAR(5))

SELECT * FROM Employees WHERE DepartmentID=60
-------------------------------------------------------------
CREATE PROCEDURE spGetEmployeeDetail 
@Emp_Id INT OUTPUT,
@Emp_Name VARCHAR(20) OUTPUT,
@Dept_Id INT
AS
BEGIN
	SELECT @Emp_Id=EmployeeID,@Emp_Name=(FirstName+SPACE(1)+LastName) FROM Employees
	WHERE DepartmentID=@Dept_Id
END

DECLARE @EmpId INT,@EmpName VARCHAR(20)
EXEC spGetEmployeeDetail @EmpId OUTPUT,@EmpName OUTPUT,50
PRINT ('Employee ID '+CAST(@EmpId AS VARCHAR(5))+SPACE(1)+'Employee_Name '  + @EmpName)

---------------------------------------------------------------
CREATE PROCEDURE prcGetEmployeeDetail 
@Business_ID INT, 
@DepName CHAR(30) OUTPUT,
@ShiftID INT OUTPUT
AS
BEGIN
    IF EXISTS(SELECT * FROM HumanResources.Employee WHERE BusinessEntityID = @Business_ID)
BEGIN
    SELECT @DepName = d.Name , @ShiftID = h.ShiftID
    FROM HumanResources.Department AS d
    INNER JOIN HumanResources.EmployeeDepartmentHistory AS h
    ON d.DepartmentID = h.DepartmentID
    WHERE BusinessEntityID = @Business_ID AND EndDate IS NULL
END
END
GO
--------------Result of Output Parameter-----------------------
DECLARE @Dep_Name CHAR(30), @ShiftId INT
EXEC prcGetEmployeeDetail  32, @Dep_Name OUTPUT, @ShiftID OUTPUT
SELECT @Dep_Name AS 'DepartmentName', @ShiftID AS 'ShiftID'

------------Built in Store Procedure----------------------
EXEC sp_help spEmployeeGetCount
EXEC sp_helptext spEmployeeGetCount   


-----------Returning multiple resultset-------------------
CREATE PROCEDURE spMultipleResultset
AS
BEGIN
SELECT * FROM Employees
SELECT * FROM departments
END

EXEC spMultipleResultset

--------------------------RETURN------------------------------------

CREATE PROCEDURE spEmployeeCountReturn
@Department_Name VARCHAR(15)
AS 
BEGIN
	
	RETURN (SELECT COUNT(EMP.EmployeeID) FROM Employees AS EMP
	JOIN departments AS DEPT ON EMP.DepartmentID=DEPT.DEPARTMENT_ID
	WHERE DEPT.DEPARTMENT_NAME=@Department_Name)
END

DECLARE @COUNT INT
EXECUTE @COUNT=spEmployeeCountReturn 'IT'
PRINT 'Total Employee In IT Department is: '+CAST(@COUNT AS VARCHAR(5))

---------Return JSON output from Store Procedure--------------
CREATE PROCEDURE spEmployeeDepartmentjson
@Json NVARCHAR(MAX) OUTPUT
AS
BEGIN
SET @Json=(SELECT TOP (10) Employee_Name=(FirstName+SPACE(1)+LastName),DEPT.DEPARTMENT_NAME,Salary FROM Employees AS EMP
		JOIN departments AS DEPT ON DEPT.DEPARTMENT_ID=EMP.DepartmentID 
		FOR JSON PATH,WITHOUT_ARRAY_WRAPPER)
END

DECLARE @json NVARCHAR(MAX)
EXEC spEmployeeDepartmentjson @json OUTPUT
PRINT(@json)

------------------JSON INPUT Parameter-------------------------------

CREATE PROCEDURE spEmployeeDetails
@Emp_Details NVARCHAR(MAX)
AS 
BEGIN
INSERT INTO Employee_Detail
SELECT * FROM OPENJSON(@Emp_Details)
WITH
(
	FirstName VARCHAR(15) '$.FirstName',
	LastName VARCHAR(15) '$.LastName',
	Salary DECIMAL(8,2) '$.Salary',
	JobId VARCHAR(10) '$.JobId'
)
END

DECLARE @EmpDetails NVARCHAR(MAX)=(SELECT TOP(3) FirstName,LastName,Salary,JobId FROM Employees FOR JSON PATH)
EXECUTE spEmployeeDetails @EmpDetails

SELECT * FROM Employee_Detail
-----------Use the SET NOCOUNT ON--------------------------
CREATE PROCEDURE spEmployeeDetailsUsingCity
@CITY VARCHAR(10)
AS 
BEGIN
	SET NOCOUNT ON
	SELECT Employee_Name=(FirstName+SPACE(1)+LastName),DEPT.DEPARTMENT_NAME,EMP.Salary,LOC.City FROM Employees AS EMP
	JOIN departments AS DEPT ON DEPT.DEPARTMENT_ID=EMP.DepartmentID
	JOIN Locations AS LOC ON DEPT.LOCATION_ID=LOC.LocationID
	WHERE LOC.City=@CITY
END

EXECUTE spEmployeeDetailsUsingCity 'Seattle'


-----------------WITH ENCRYPTION----------------------------------------
CREATE PROCEDURE spEmployeeDetailsUsingCityDept
@CITY VARCHAR(10),
@DEPARTMENT_Name VARCHAR(10) 
WITH ENCRYPTION
AS 
BEGIN
	SET NOCOUNT ON
	SELECT Employee_Name=(FirstName+SPACE(1)+LastName),DEPT.DEPARTMENT_NAME,EMP.Salary,LOC.City FROM Employees AS EMP
	JOIN departments AS DEPT ON DEPT.DEPARTMENT_ID=EMP.DepartmentID
	JOIN Locations AS LOC ON DEPT.LOCATION_ID=LOC.LocationID
	WHERE LOC.City=@CITY
END

EXECUTE spEmployeeDetailsUsingCityDept 'Seattle','Finance'

sp_helptext spEmployeeDetailsUsingCityDept


--------------------------------SP_Based_on_Project-------------------------------------------------
-- Display the Bus_Schedule Details: 
-- Bus_Id,Starting_Point,Destination_Point,Departure_Time,Departure_Date,Available_Seats,Ticket_Price,Rating
-- where  Starting_Point='Ahmedabad_Gita Mandir',Destination_Point='Surat_Surat Central Bus station',Departure_Time AT NIGHT

CREATE PROCEDURE spBus_Schedule
@SOURCE TINYINT,
@Starting_Point TINYINT,
@Destination TINYINT,
@Destination_Point TINYINT,
@Departure_Date DATE,
@Duration_START_Time TIME,
@Duration_END_Time TIME
AS
BEGIN
        SELECT Bus_Id,Starting_Point,Destination_Point,Departure_Time,Departure_Date,Available_Seats,Ticket_Price,Rating FROM TRAVEL_SCHEDULE AS TS
        WHERE TS.[Source]=@SOURCE 
		AND TS.Starting_Point=@Starting_Point
		AND TS.Destination=@Destination
		AND TS.Destination_Point=@Destination_Point
		AND Departure_Date=@Departure_Date
		AND TS.Departure_Time BETWEEN @Duration_START_Time AND @Duration_END_Time
		AND Travel_Status=1
END

EXECUTE spBus_Schedule 16,2,17,10,'2021-08-26','6:00 PM','11:00 PM'



-- PERTICULAR Day-wise USER,Pessanger Booking And other Information:
-- DISPLAY tHE USER_NAME AS(First_Name,Last_Name) WHO BOOKED TICKET AT 22 AUGUST AND ALSO GET Insurance Details
-- And Also show The how many seat that user book and name of all Pessanger ,their Seat_No and Age,BUS Number Plate.

CREATE PROCEDURE spUserPassangerBookingDetails
@Date DATE
AS
BEGIN
		SELECT [USER_NAME]=(UR.First_Name+SPACE(1)+UR.Last_Name),PR.Passenger_Name,PR.Age,PR.Gender,PR.Seat_No,BS.Bus_Plate_Number,BS.Bus_Id FROM TICKETS AS T 
		INNER JOIN USER_INFO AS UR ON T.User_Id=UR.User_Id
		INNER JOIN BOOKING_DETAILS AS BK ON BK.User_Id=T.User_Id
		INNER JOIN PASSENGER AS PR ON PR.User_Id=T.User_Id
		INNER JOIN BUS AS BS ON BS.Bus_Id=PR.Bus_Id
		WHERE BK.Booking_Date=@Date AND T.Insurance=1 
END

EXECUTE spUserPassangerBookingDetails '2021-08-22'

-- Display The Driver Name Who drive bus Which NUMBER_PLATE IS GJ04KI4967 
-- and Also Display Their Starting_Point,Destination_Point,BUS_TYPE,AC/NONAC.

CREATE PROCEDURE spBusScheduleDetails
@Number_Plate VARCHAR(15)
AS
BEGIN
		SELECT (DR.First_Name+' '+DR.Last_Name) AS Driver_Name,DR.Contact_No,TS.Starting_Point,TS.Destination_Point,AC_Type,BS.Bus_Plate_Number,BS.Bus_Type AS BUS_TYPE FROM BUS AS BS 
		INNER JOIN DRIVER AS DR ON BS.Bus_Id=DR.Bus_Id
		INNER JOIN TRAVEL_SCHEDULE AS TS ON TS.Bus_Id=BS.Bus_Id
		WHERE BS.Bus_Plate_Number=@Number_Plate
END

EXECUTE spBusScheduleDetails 'GJ04KI4967'


-------------------------------------WHILE LOOP IN SP----------------------------------------------------

SELECT * FROM TRAVEL_SCHEDULE

CREATE PROCEDURE spSchedule_Status
AS
BEGIN
DECLARE @ID TINYINT
DECLARE @DATE DATE
DECLARE @TIME TIME
DECLARE @COUNT TINYINT
SELECT  @COUNT=(SELECT TOP(1) Schedule_Id FROM TRAVEL_SCHEDULE ORDER BY Schedule_Id DESC)
SET @ID=1
WHILE(@COUNT > @ID)
BEGIN
SELECT @DATE=Departure_Date,@TIME=Departure_Time FROM TRAVEL_SCHEDULE WHERE Schedule_Id=@ID

	IF(DATEDIFF(DD,GETDATE(),@DATE) < 0)
	BEGIN
		UPDATE TRAVEL_SCHEDULE SET Travel_Status=0
		WHERE Schedule_Id=@ID		
	END
	ELSE
		IF(DATEDIFF(HOUR,GETDATE(),@TIME) < 0)
		BEGIN
		UPDATE TRAVEL_SCHEDULE SET Travel_Status=0
		WHERE Schedule_Id=@ID
		END
	
	SET @ID=@ID+1
END
END

EXEC spSchedule_Status





