--Find buses available for perticular source and destination entered by user
CREATE PROC spGetTravelDetail
@Source INT,
@StartingPoint INT,
@Destination INT,
@DestinationPoint INT
AS
BEGIN
        SELECT Bus_Id
		     , [Source]
			 , Starting_Point
			 , Destination
			 , Destination_Point
			 , Departure_Time
			 , Departure_Date
			 , Rating
		FROM TRAVEL_SCHEDULE
		WHERE [Source] = @Source
		  AND Starting_Point= @StartingPoint
		  AND Destination = @Destination
		  AND Destination_Point= @DestinationPoint
END

EXEC spGetTravelDetail 16, 2, 17, 10
EXEC spGetTravelDetail 23, 55, 16, 8
EXEC spGetTravelDetail 16, 2, 17, 13

DROP PROCEDURE spGetTravelDetail

--Update details on cancellation
CREATE PROC spCancelUpdates
@Ticket INT,
@BusDetails INT
AS
BEGIN

       INSERT INTO CANCELLATION VALUES (@Ticket,@BusDetails)
       SELECT TOP(1) T.Booked_Seat 
	   FROM CANCELLATION C 
           JOIN TICKETS T
		   ON C.Ticket_Id=T.Ticket_Id
       WHERE @Ticket=T.Booked_Seat
       ORDER BY C.Cancellation_Id DESC

	   UPDATE BOOKING_DETAILS 
	   SET Booking_Status=0 
	   WHERE Bd_Id=@BusDetails

	   UPDATE PAYMENT 
	   SET Payment_Status=0 
	   WHERE Payment_ID=(
	              SELECT Payment_ID 
				  FROM BOOKING_DETAILS 
				  WHERE Bd_Id=@BusDetails)


END

        INSERT INTO TICKETS (Schedule_Id,Booked_Seat,Ticket_Price,Insurance,User_Id) VALUES(1,6,210,1,1)
		INSERT INTO PAYMENT (Payment_type,Ticket_Id,Payment_Number,Payment_Status,User_Id) VALUES (15,11,'MehulJ@ybl',1,1)
		INSERT INTO BOOKING_DETAILS (Booking_Date,Booking_Status,Payment_ID,Schedule_Id,User_Id) VALUES('2021-08-20',1,11,1,1)
   
EXEC spCancelUpdates 11, 11
  



  		SELECT * FROM TICKETS
		SELECT * FROM BOOKING_DETAILS
		SELECT * FROM PAYMENT
		SELECT * FROM CANCELLATION

--Q1: Create a Store Procedure which will accept name of the customer as input parameter and product the following output, 
--List Names of Customers who are Depositors and have Same Branch City as that of input parameter customer’s Name.
CREATE PROC spCustomersWithBranchCity
@CustomerName NVARCHAR(30)
AS
BEGIN
      SELECT C.Cname 
      FROM CUSTOMER C 
      WHERE C.CITY IN (
            SELECT B.CITY 
	        FROM BRANCH B 
	        WHERE B.Bname IN (
	              SELECT D.Bname 
			      FROM Deposit D 
			      WHERE D.Cname= @CustomerName))
END

EXEC spCustomersWithBranchCity 'SUNIL'

--Q2: Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format, 
--All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account
CREATE PROC spCustomerInJson
@CustomerName NVARCHAR(30)
AS
BEGIN
     SELECT D.Cname 
     FROM Deposit D 
          JOIN BRANCH B
	      ON D.Bname = B.Bname
     WHERE D.Bname IN (
           SELECT D.Bname
       	   FROM Deposit D
     	        JOIN BRANCH B 
     			ON D.Bname=B.Bname 
     	   WHERE D.Cname = @CustomerName )
	FOR JSON AUTO
END

EXEC spCustomerInJson 'SUNIL'

--Q3: Create a Store Procedure that will accept city name and returns the number of customers in that city.
CREATE PROC spCityByCustomer
@City NVARCHAR(30),
@Customers INT OUTPUT
AS
BEGIN
     SELECT @Customers = COUNT(Cname)
     FROM CUSTOMER
     WHERE CITY = @City
END

DECLARE @CountOfEmployee INT
EXECUTE spCityByCustomer 'NAGPUR', @CountOfEmployee OUTPUT
IF(@CountOfEmployee IS NULL)
   PRINT 'Count is null '
ELSE
   PRINT @CountOfEmployee
   
--Q4: Create a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON format 
--List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI
CREATE PROC spCustomerInCity
@City NVARCHAR(30)
AS
BEGIN
     SELECT C.Cname 
     FROM CUSTOMER C
          JOIN Deposit D 
          ON C.Cname = D.Cname 
          JOIN BRANCH B
     	 ON D.Bname = B.Bname
     WHERE C.CITY = @City
       AND B.CITY IN ('MUMBAI','DELHI')
     FOR JSON AUTO
END

EXEC spCustomerInCity 'NAGPUR'

--Q5: Count the Number of Customers Living in the City where Branch is Located
CREATE PROC spCustomerByBranch
AS
BEGIN
     SELECT COUNT(C.Cname) 'Customer Count'
     FROM CUSTOMER C 
     JOIN BRANCH B 
     ON C.CITY = B.CITY 
END

EXEC spCustomerByBranch

--Q6: Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount  
--And insert these record in the Deposit table. Before inserting some validation should be done like amount should be greater than 10Rs. and date should always be current date.
CREATE PROC spJsonToDeposit
@Json NVARCHAR(MAX)
AS
BEGIN
     SELECT * INTO DepositTab FROM
	 (
	  SELECT ACTNO,CustomerName,City,Branch,Amount,Date=GETDATE()
	  FROM 
	  OPENJSON(@JSON)
	  WITH
	  (
	   ACTNO INT '$.ACTNO',
	   CustomerName VARCHAR(30) '$.CustomerName',
	   City VARCHAR(30) '$.City',
	   Branch VARCHAR(30) '$.Branch',
	   Amount MONEY '$.Amount'
	  ))D
END


DECLARE @JsonInput NVARCHAR(MAX)
SET @JsonInput=N'{
                   "ACTNO" : 56,
                   "CustomerName" : "Jerry",
				   "City" : "Ahmedabad",
				   "Branch" : "Ranip",
				   "Amount" : 50000
				 }'

EXEC spJsonToDeposit @Json=@JsonInput
