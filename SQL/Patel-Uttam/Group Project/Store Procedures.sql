
USE [Group Project]

SELECT * FROM Society_info

SELECT * FROM Member_info

SELECT * FROM Previous_Member_info


SELECT * FROM Visitor_info



--[Store Procedure for Society_info]
-----------------------------------------------------------------------------------------------------------------------------------------------

-- Store Procedure for insert or update new owner in Society_info and transfering data related to previous-owner's in member_info into Previous_Member_info.
	
	GO
	ALTER PROC New_owner
	
	@houseno int ,
	@name varchar(25),
	@number bigint,
	@members int

	AS
	BEGIN

		IF (SELECT TOP 1 MemberID FROM Member_info WHERE HouseNo=@houseno) >0
		BEGIN
			INSERT into Previous_Member_info SELECT * FROM Member_info WHERE HouseNo=@houseno;
			DELETE FROM Member_info WHERE HouseNo=@houseno;
		END

		UPDATE Society_info SET OwnerName=@name , ContactNumber = @number , Number_of_Members = @members WHERE HouseNo = @houseno
		INSERT INTO Member_info VALUES(@name,'Owner',@houseno)
	END
	GO


	-- insert/update
	EXECUTE New_owner 10,'Rutik Patel',8845246585,1
	GO
-----------------------------------------------------------------------------------------------------------------------------------------------

	


--[Store Procedure for Visitor_info]
-----------------------------------------------------------------------------------------------------------------------------------------------


-- Store Procedure for insert visit entry

--////////////////////////////////////////////////////////////////////

	GO
	CREATE PROCEDURE new_visitor
	@name varchar(20),
	@number bigint,
	@House int,
	@vehical varchar(12),
	@visitorno int,
	@purpose varchar(15),
	@entrytime DATE
	AS
	BEGIN
		INSERT INTO Visitor_info(VisitorName,ContactNumber,HouseNo,VehicalNo,No_of_Visitor,Purpose,EntryTime) VALUES(@name,@number,@House,@vehical,@visitorno,@purpose,@entrytime) 
	END
	GO

	-- execute
	EXECUTE new_visitor 'Hardik Zala',7845256532,2,NULL,2,Friend,'2021-09-05'
	GO

--////////////////////////////////////////////////////////////////////




-- Store Procedure for update ExitTime

--////////////////////////////////////////////////////////////////////

		GO
	ALTER PROCEDURE visitor_exit
	@name varchar(20),
	@number bigint,
	@House int

	AS
	BEGIN
		UPDATE Visitor_info SET ExitTime = GetDate()  WHERE VisitorName=@name AND HouseNo=@House AND ContactNumber=@number
	END
	GO

	-- execute
	EXECUTE visitor_exit 'Hardik Zala',7845256532,2
	GO


--////////////////////////////////////////////////////////////////////






-- Store Procedure for fetching details about how many person visit on particular day

--////////////////////////////////////////////////////////////////////

	GO
	CREATE PROCEDURE visit_on_date
	@date DATE
	AS
	BEGIN
		SELECT  EntryTime,No_of_Visitor FROM Visitor_info WHERE EntryTime = @date
	END
	GO

	-- execute
	EXECUTE visit_on_date '2021-07-07'
	GO

--////////////////////////////////////////////////////////////////////




-- Store Procedure for fetching details about How many visitor visit to particular house 

--////////////////////////////////////////////////////////////////////

	GO
	ALTER PROCEDURE visit_to_house
	@no int
	AS
	BEGIN
		SELECT  VisitorName,HouseNo,No_of_Visitor,Purpose FROM Visitor_info WHERE HouseNo = @no
	END
	GO

	-- execute
	EXECUTE visit_to_house 4
	GO

--////////////////////////////////////////////////////////////////////


-----------------------------------------------------------------------------------------------------------------------------------------------
