---------------------------------------------------------------------------------
CREATE TRIGGER TR_CANCELLATION
ON CANCELLATION
AFTER INSERT
AS
BEGIN

	DECLARE @ID INT
	DECLARE @CANCELLED_SEAT TINYINT
	DECLARE @STATUS BIT
	
SELECT @ID=INS.Bd_Id,@STATUS=BD.Booking_Status FROM inserted AS INS
JOIN BOOKING_DETAILS AS BD ON BD.Bd_Id=INS.Bd_Id

IF(@STATUS = 1)
BEGIN
SELECT TOP(1) @CANCELLED_SEAT=T.Booked_Seat FROM CANCELLATION AS CL 
JOIN TICKETS AS T ON CL.Ticket_Id=T.Ticket_Id
ORDER BY CL.Cancellation_Id DESC

UPDATE BOOKING_DETAILS SET Booking_Status=0 WHERE Bd_Id=@ID

UPDATE PAYMENT SET Payment_Status=0 WHERE Payment_ID=(SELECT Payment_ID FROM BOOKING_DETAILS WHERE Bd_Id=@ID)

UPDATE TRAVEL_SCHEDULE SET Available_Seats=Available_Seats + @CANCELLED_SEAT 
WHERE Schedule_Id=(SELECT TOP(1) T.Schedule_Id FROM TICKETS AS T JOIN CANCELLATION AS CL ON T.Ticket_Id=CL.Ticket_Id ORDER BY CL.Cancellation_Id DESC)
END

ELSE
BEGIN
PRINT('THIS TICKET IS Already CANCELLED')
END

END
------------------------------------------------------------------------------------------------------------------------------------------------------ 

CREATE TRIGGER TR_BOOKING
ON BOOKING_DETAILS
AFTER INSERT
AS
BEGIN
DECLARE @BOOKING_SEAT TINYINT

SELECT TOP(1) @BOOKING_SEAT=T.Booked_Seat FROM TICKETS AS T
JOIN BOOKING_DETAILS AS BD ON BD.User_Id=T.User_Id WHERE Booking_Status=1
ORDER BY T.Ticket_Id DESC

UPDATE TRAVEL_SCHEDULE SET Available_Seats=Available_Seats - @BOOKING_SEAT
WHERE Schedule_Id=(SELECT TOP(1) BD.Schedule_Id FROM TICKETS AS T
JOIN BOOKING_DETAILS AS BD ON BD.User_Id=T.User_Id WHERE Booking_Status=1
ORDER BY BD.Bd_Id DESC)                                             

END

-----------------------------------------------------------------------------------------------------------------------------
