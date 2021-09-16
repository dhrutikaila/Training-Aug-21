USE BUS_RESERVATION
-- List all the buses which has a rating higher than 4 and order rating by high to low
SELECT B.Bus_Id, B.Bus_Plate_Number, T.Rating 
FROM BUS B JOIN TRAVEL_SCHEDULE T ON B.Bus_Id=T.Bus_Id 
WHERE T.Rating>4.0 
ORDER BY T.Rating DESC

--Write a query to find users who have booked 3rd highest seats
SELECT * FROM (
SELECT DENSE_RANK() OVER (ORDER BY T.Booked_Seat DESC) SEAT_RANK, U.[User_Id],(U.First_Name +' '+ U.Last_Name) as NAME,T.Booked_Seat 
FROM USER_INFO U JOIN TICKETS T ON U.[User_Id] = T.[User_Id] )seat
WHERE SEAT_RANK =3

--Write a query to find all the users who have booked tickets 3 days prior to their journy
SELECT U.[User_Id],(U.First_Name +' '+ U.Last_Name) AS NAME, B.Booking_Date, T.Departure_Date 
FROM USER_INFO U JOIN BOOKING_DETAILS B ON U.[User_Id] = B.[User_Id]
JOIN TRAVEL_SCHEDULE T ON B.Schedule_Id=T.Schedule_Id
WHERE DATEDIFF(dd,B.Booking_Date, T.Departure_Date)>2

--List the driver name who drive only Volvo or GSRTC bus 

SELECT b.Bus_Id, d.First_Name FROM DRIVER AS d
        RIGHT OUTER JOIN BUS AS b
        ON d.Bus_Id  = b.Bus_Id
        RIGHT OUTER JOIN [OBJECT] AS o
        ON o.Obj_Id = b.Bus_Type
        WHERE o.Obj_Name= 'Volvo' OR o.Obj_Name= 'Gsrtc'

-- Count the number of volvo and gsrtc booked on 26 aug 2021
WITH Bus_Details(Bus_Id,Bus_Plate_Number,Bus_Type,AC_Type,Total_Seat,Date) 
AS 
(
SELECT B.Bus_Id,B.Bus_Plate_Number,B.Bus_Type,B.AC_Type,B.Total_Seat,T.Departure_Date AS 'Date'
FROM BUS B JOIN TRAVEL_SCHEDULE T ON B.Bus_Id=T.Bus_Id 
RIGHT OUTER JOIN [OBJECT] O ON O.Obj_Id = B.Bus_Type
WHERE o.Obj_Name= 'Volvo' OR o.Obj_Name= 'Gsrtc' 
)
SELECT count(Bus_Type) AS Bus_Type,Date 
FROM Bus_Details 
WHERE Date= '2021-08-26' 
GROUP BY Bus_Type, Date
 
