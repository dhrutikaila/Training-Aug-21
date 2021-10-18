-- Display the Bus_Schedule Details: 
-- Bus_Id,Starting_Point,Destination_Point,Departure_Time,Departure_Date,Available_Seats,Ticket_Price,Rating
-- where  Starting_Point='Ahmedabad_Gita Mandir',Destination_Point='Surat_Surat Central Bus station',Departure_Time AT NIGHT

        SELECT Bus_Id,Starting_Point,Destination_Point,Departure_Time,Departure_Date,Available_Seats,Ticket_Price,Rating FROM TRAVEL_SCHEDULE AS TS
        WHERE TS.[Source]=16 
		AND TS.Starting_Point=2
		AND TS.Destination=17
		AND TS.Destination_Point=10
		AND TS.Departure_Time BETWEEN '6:00 PM' AND '11:00 PM'

-- PERTICULAR Day-wise USER Booking And other Information:
-- DISPLAY tHE USER_NAME AS(First_Name,Last_Name) WHO BOOKED TICKET AT 22 AUGUST AND ALSO GET Insurance Details
-- And Also show The how many seat that user book and name of all Pessanger ,their Seat_No and Age,BUS Number Plate.

		SELECT [USER_NAME]=(UR.First_Name+SPACE(1)+UR.Last_Name),PR.Passenger_Name,PR.Age,PR.Gender,PR.Seat_No,BS.Bus_Plate_Number,BS.Bus_Id FROM TICKETS AS T 
		INNER JOIN USER_INFO AS UR ON T.User_Id=UR.User_Id
		INNER JOIN BOOKING_DETAILS AS BK ON BK.User_Id=T.User_Id
		INNER JOIN PASSENGER AS PR ON PR.User_Id=T.User_Id
		INNER JOIN BUS AS BS ON BS.Bus_Id=PR.Bus_Id
		WHERE BK.Booking_Date='2021-08-22' AND T.Insurance=1  
		

-- Display The Driver Name Who drive bus Which NUMBER_PLATE IS GJ04KI4967 
-- and Also Display Their Starting_Point,Destination_Point,BUS_TYPE,AC/NONAC.

		SELECT (DR.First_Name+' '+DR.Last_Name) AS Driver_Name,DR.Contact_No,TS.Starting_Point,TS.Destination_Point,AC_Type,BS.Bus_Plate_Number,BS.Bus_Type AS BUS_TYPE FROM BUS AS BS 
		INNER JOIN DRIVER AS DR ON BS.Bus_Id=DR.Bus_Id
		INNER JOIN TRAVEL_SCHEDULE AS TS ON TS.Bus_Id=BS.Bus_Id
		WHERE BS.Bus_Plate_Number='GJ04KI4967'


-- Display ALL User_Name who succesfully book their Ticket Using through UPI Total Cost is grater than 500 and also Find And Display Their age also give their upi_id.

		SELECT (First_Name+SPACE(1)+Last_Name) 'USER_NAME',T.Booked_Seat,DATEDIFF(YY,UI.Dob,GETDATE()) AS AGE,PT.Payment_Number AS UPI_ID FROM USER_INFO AS UI 
		JOIN TICKETS AS T ON UI.User_Id=T.User_Id
		JOIN BOOKING_DETAILS AS BK ON BK.User_Id=UI.User_Id
		JOIN PAYMENT AS PT ON PT.Payment_ID=BK.Payment_ID
		WHERE BK.Booking_Status=1 AND T.Total_Cost > 500 AND PT.Payment_type=15

-- Display All Gsrtc NonAc Bus and Total seats,Available_Seats,Booked seats,Ticket Price,Departure_DATE,it's rating,And also starting point is Rajkot.

		SELECT BS.Total_Seat,TS.Available_Seats,Booked_Seats=(BS.Total_Seat-TS.Available_Seats),TS.Ticket_Price,TS.Rating,ts.Departure_Date FROM BUS AS BS 
		JOIN TRAVEL_SCHEDULE AS TS ON BS.Bus_Id=TS.Bus_Id 
		WHERE  BS.Bus_Type=9 AND BS.AC_Type='Non-AC' AND TS.Starting_Point=16

-- Display all PASSENGER who not get Vaccine and also display bus number and TICKET_id and detail

		SELECT PR.Passenger_Name,B.Bus_Plate_Number,T.Ticket_Id FROM PASSENGER AS PR
		JOIN BUS AS B ON B.Bus_Id=PR.Bus_Id
		JOIN TICKETS AS T ON T.User_Id=PR.User_Id
		WHERE PR.Vaccination_status=0

-- DISPLAY Name of user who book more Than One Seat and Display their Bus number,user_Name who booked that TICKET,Amout,Booking_status is successfully booked ALso

		SELECT B.Bus_Plate_Number,[User_Name]=(UI.First_Name+' '+UI.Last_Name),T.Total_Cost,BK.Booking_Status FROM USER_INFO AS UI
		JOIN TRAVEL_SCHEDULE AS TS ON TS.User_Id=UI.User_Id
		JOIN BUS AS B ON B.Bus_Id=TS.Bus_Id
		JOIN TICKETS AS T ON T.User_Id=UI.User_Id
		JOIN BOOKING_DETAILS AS BK ON BK.Schedule_Id=TS.Schedule_Id
		WHERE T.Booked_Seat > 1 and bk.Booking_Status=1

-- DISPLAY All Buses Droping point'Krishnagar' in Ahmedabad city from Bhavnagar ,show that buses Driver details,TICKET Cost is in low to high manner,available seats,AC Type,BUS_NUMBER

		SELECT DR.First_Name,B.AC_Type,T.Total_Cost,TS.Available_Seats,B.Bus_Plate_Number FROM TRAVEL_SCHEDULE AS TS
		JOIN BUS AS B ON TS.Bus_Id=B.Bus_Id
		JOIN TICKETS AS T ON T.Schedule_Id=TS.Schedule_Id
		JOIN DRIVER AS DR ON DR.Bus_Id=B.Bus_Id
        WHERE TS.[Source]=20 
		AND TS.Destination=16
		AND TS.Destination_Point=7
		ORDER BY T.Total_Cost ASC

-- DISPLAY All user name,Contact Number,Email_id who cancel their TICKETs and Total Cost,Payment Type And There card Number Also.

		SELECT [User_Name]=(UI.First_Name+' '+UI.Last_Name),UI.Contact_No,UI.Email_Address,T.Total_Cost,PY.Payment_type,PY.Payment_Number FROM USER_INFO AS UI
		JOIN BOOKING_DETAILS AS BK ON BK.User_Id=UI.User_Id
		JOIN PAYMENT AS PY ON PY.User_Id=UI.User_Id
		JOIN TICKETS AS T ON T.Ticket_Id=PY.Ticket_Id
		WHERE BK.Bd_Id IN (SELECT CL.Bd_Id FROM CANCELLATION AS CL)


-- IF SOMEONE SUCCESSFULLY BOOKED THEIR TICKETS THEN 
-- Available_Seats=Available_Seats - BOOKED_SEAT

		SELECT * FROM TICKETS
		SELECT * FROM BOOKING_DETAILS
		SELECT * FROM PAYMENT
		SELECT * FROM TRAVEL_SCHEDULE
		SELECT * FROM CANCELLATION

		INSERT INTO TICKETS (Schedule_Id,Booked_Seat,Ticket_Price,Insurance,User_Id) VALUES(1,6,210,1,1)
		INSERT INTO PAYMENT (Payment_type,Ticket_Id,Payment_Number,Payment_Status,User_Id) VALUES (15,11,'MehulJ@ybl',1,1)
		INSERT INTO BOOKING_DETAILS (Booking_Date,Booking_Status,Payment_ID,Schedule_Id,User_Id) VALUES('2021-08-20',1,11,1,1)
   

-- IF SOMEONE CANCEL THEIR TICKET THEN 
-- Available_Seats=Available_Seats + CANCELLED_SEAT 

		INSERT INTO CANCELLATION (Ticket_Id,Bd_Id) VALUES (11,11)

		




		


