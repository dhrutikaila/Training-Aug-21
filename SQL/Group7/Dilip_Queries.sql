-- DISPLAY all Bus who's rating is 4.0 OR More than 4.0 and show their Ticket_Price,Bus_type and Show All evening buses of 26 Aug 2021

 

        SELECT TS.Rating,T.Ticket_Price,OBJ.Obj_Name AS Bus_type,TS.Departure_Date,TS.Departure_Time FROM TRAVEL_SCHEDULE AS TS
        JOIN BUS AS BS ON BS.Bus_Id=TS.Bus_Id
        JOIN TICKETS AS T ON T.Schedule_Id=TS.Schedule_Id
        JOIN [OBJECT] AS OBJ ON OBJ.Obj_Id=BS.Bus_Type
        WHERE TS.Rating >= 4.0 AND TS.Departure_Date='26 AUG 2021' AND TS.Departure_Time > '06:00 PM'

 

--Write a query to find all the users who have booked tickets 3 days prior to their journy

 

        SELECT U.[User_Id],(U.First_Name +' '+ U.Last_Name) AS NAME, B.Booking_Date, T.Departure_Date 
        FROM USER_INFO U JOIN BOOKING_DETAILS B ON U.[User_Id] = B.[User_Id]
        JOIN TRAVEL_SCHEDULE T ON B.Schedule_Id=T.Schedule_Id
        WHERE DATEDIFF(dd,B.Booking_Date, T.Departure_Date)>2

/*
--(*)--
Get the details about How many users booked more than 1 seats with Insurance
*/

 
SELECT COUNT([User_Id]) as [Number of Users] 
            FROM TICKETS
            WHERE Booked_Seat >= 2 AND Insurance = 1


--Select Bus_Type based on their ticket_price from trave_schedule table where ticket_Price is more than 500
SELECT Obj_Name FROM OBJECT WHERE Obj_Id IN 
(SELECT Bus_Type FROM BUS WHERE Bus_Id IN 
(SELECT Bus_Id FROM TRAVEL_SCHEDULE WHERE Ticket_Price>500))

 

--Count the age of all users with the use of user_info table--
SELECT DATEDIFF(yy,Dob,GETDATE()) AS Age,Dob FROM USER_INFO

 

--Select lower deck seat number from GJ27BH4726 Bus
SELECT Seat_No FROM SEAT AS s JOIN BUS AS b ON s.Bus_Id=b.Bus_Id 
WHERE Deck_Type = 5
AND b.Bus_Plate_Number='GJ27BH4726'