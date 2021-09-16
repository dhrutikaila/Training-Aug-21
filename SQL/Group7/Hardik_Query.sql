/*
Get details about count the number of bus references with ac or non ac
*/

SELECT COUNT(b1.AC_Type) AS AC, 
			((SELECT COUNT(Bus_Id) FROM BUS)- COUNT(b2.AC_Type)) AS [NON AC] 
			FROM bus AS b1
			JOIN BUS AS b2
			ON b1.Bus_Id = b2.Bus_Id
			WHERE b1.AC_Type = 'AC' 

						
/*
Find the total avalible seat in GSRTC AC bus
*/


SELECT COUNT(s.Seat_No) as [Avalible Seat] FROM BUS as b
		JOIN SEAT as s
		ON b.Bus_Id = s.Bus_Id
		WHERE b.Bus_Type = 10 AND b.AC_Type = 'AC' AND s.Seat_Status = 0 


	
/*
Get the Passenger name Whoes booked on 25th Aug. whith successfull payment
*/

SELECT CONCAT(u.First_Name,' ',u.Last_Name) as [Name] FROM BOOKING_DETAILS as b
			JOIN USER_INFO as u
			ON b.[User_Id] = u.[User_Id]
			WHERE   b.Booking_Status = 1 AND b.Booking_Date = '2021-08-25'


/*
Get the rank of user in the basies of Spend more money with total ticket booked by each user
*/

SELECT CONCAT(u.First_Name,' ',u.Last_Name) as [Name] , t.Total_Cost as [Spend Money], t.Booked_Seat
			FROM TICKETS as t
			JOIN USER_INFO as u
			ON t.[User_Id] = u.[User_Id]
			ORDER BY T.Total_Cost DESC



/*
Get the Passenger Name  who cancel their booking
*/

SELECT CONCAT(u.First_Name,' ',u.Last_Name) as [Passenger Name]  FROM CANCELLATION as c
			JOIN TICKETS as t
			ON c.Ticket_Id = t.Ticket_Id
			JOIN USER_INFO as u
			ON u.[User_Id] = t.[User_Id]



/*
Get the user name where user get vaccine and whose first name start with 'S' or 'N'
*/

SELECT Passenger_Name FROM PASSENGER
				WHERE Vaccination_status = 1 AND 
				Passenger_Name LIKE 'S%' OR Passenger_Name LIKE 'N%' OR Passenger_Name LIKE 'P%'




