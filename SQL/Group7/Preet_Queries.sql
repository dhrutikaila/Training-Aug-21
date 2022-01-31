USE BUS_RESERVATION

--Select male passenger name and seat number who are travelling in 'GJ01NE5936' bus.
SELECT Passenger_Name,Seat_No FROM PASSENGER AS p
INNER JOIN BUS AS b ON p.Bus_Id=b.Bus_Id 
WHERE b.Bus_Plate_Number = 'GJ01NE5936'
AND p.Gender = 1 

--Select user details who booked ticket on 24/08/2021
SELECT * FROM USER_INFO WHERE User_Id IN (SELECT User_Id FROM BOOKING_DETAILS WHERE Booking_Date='2021-08-24')

--Select user details who used debit-card as payment_type and travel in GJ01NE5936 bus
SELECT * FROM USER_INFO AS UI
INNER JOIN PAYMENT AS PAY ON UI.User_Id=PAY.User_Id
INNER JOIN TRAVEL_SCHEDULE AS TS ON TS.User_Id=UI.User_Id
INNER JOIN BUS AS B ON B.Bus_Id=TS.Bus_Id
WHERE PAY.Payment_type=12 AND B.Bus_Plate_Number='GJ01NE5936'
 
--SELECT bus detail which has maximum number of seats--
SELECT * FROM BUS WHERE Total_Seat=(SELECT MAX(Total_Seat) FROM BUS)

--Rank all passenger based on their age low to high--
SELECT ROW_NUMBER() OVER(ORDER BY Age ASC)[RNUMBER],Age FROM PASSENGER

--Select bus_type for that bus which have less ticket_price then avg price of bus ticket--
SELECT DISTINCT o.Obj_Name AS BUS_Type FROM OBJECT AS o
INNER JOIN Bus As b ON o.Obj_Id=b.Bus_Type
INNER JOIN TRAVEL_SCHEDULE AS ts ON b.Bus_Id=ts.Bus_Id
WHERE ts.Ticket_Price <
(SELECT AVG(Ticket_Price) FROM TRAVEL_SCHEDULE)

--Select details of driver who drives volvo bus--
SELECT * FROM DRIVER WHERE Bus_ID IN 
(SELECT Bus_Id FROM BUS WHERE Bus_Type = 10)

--SELECT HOW many male passenger and how many female passenger are there in the bus no GJ01FD5395

SELECT temp.Gender,COUNT(Gender) AS COUNT_GENDER FROM
(SELECT o.Obj_Name AS Gender FROM PASSENGER AS p 
INNER JOIN BUS b ON p.Bus_Id=b.Bus_Id
INNER JOIN Object AS o ON p.Gender=o.Obj_Id
WHERE b.Bus_Plate_Number='GJ01FD5395' AND
(O.Obj_Id=1 OR O.Obj_Id=2))temp
GROUP BY temp.Gender
