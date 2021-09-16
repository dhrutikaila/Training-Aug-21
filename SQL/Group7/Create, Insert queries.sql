CREATE DATABASE BUS_RESERVATION

USE BUS_RESERVATION

--CREATE QUEARY

CREATE TABLE OBJECT_MASTER
(
[Type_Id] INT PRIMARY KEY IDENTITY(1,1),
[Type_Name] VARCHAR(20) NOT NULL
)

INSERT INTO OBJECT_MASTER VALUES ('Gender'),
                                 ('Deck_Type'),
                                 ('Seat_Type'),
                                 ('Bus_Type'),
                                 ('Payment_Type'),
                                 ('Cities')
----------------------------------------------------------------------------------------------------------- 

CREATE TABLE [OBJECT]
(
Obj_Id INT PRIMARY KEY IDENTITY(1,1),
[Type_Id] INT NOT NULL,
Obj_Name VARCHAR(30) NOT NULL,
CONSTRAINT FK_Type_Id FOREIGN KEY([Type_Id]) REFERENCES OBJECT_MASTER([Type_Id])
)


INSERT INTO [OBJECT] VALUES (1,'Male'),
                            (1,'Female'),
                            (1,'Others'),
                            (2,'Upper'),
                            (2,'Lower'),
                            (3,'Sleeper'),
                            (3,'Seat'),
                            (4,'Express'),
                            (4,'Gsrtc'),
                            (4,'Volvo'),
                            (4,'Intercity Express'),
                            (5,'Debit-Card'),
                            (5,'Credit-Card'),
                            (5,'NetBanking'),
                            (5,'UPI'),
                            (6,'Ahmedabad'),
                            (6,'Surat'),
                            (6,'Rajkot'),
                            (6,'Vadodara'),
                            (6,'Bhavnagar'),
                            (6,'Junagadh'),
                            (6,'Bhuj'),
                            (6,'Amreli')

-----------------------------------------------------------------------------------------------------------
CREATE TABLE SUB_LOCATION
(   
    Loc_Id INT PRIMARY KEY IDENTITY(1,1),
    Loc_Obj_Id INT NOT NULL,
    Loc_Name VARCHAR(30) NOT NULL,
    CONSTRAINT Chk_Loc_Obj_Id FOREIGN KEY (Loc_Obj_Id) REFERENCES OBJECT(Obj_Id)
)

INSERT INTO SUB_LOCATION VALUES(16,'Paldi'),
                               (16,'Geeta Mandir Bus Stand'),
                               (16,'CTM Char Rasta'),
                               (16,'Shahi Baug'),
                               (16,'Satellite'),
                               (16,'Iskon'),
			       (16,'Krishnanagar Bus Stand'),
			       (16,'Ranip Bus Stand'),
			       (16,'Bapunagar Bus Stand'),
                               (17,'Surat Central Bus station'),
                               (17,'Udhna Bus Station'),
                               (17,'Palsana Bus Station'),
                               (17,'Kamrej Bus Station'),
                               (17,'Kadodara Bus Station'),
                               (17,'Bardoli Bus Station'),
                               (18,'Rajkot Central Bus Stand'),
                               (18,'Green Land Chokdi'),
                               (18,'Indera Circle'),
                               (18,'Moti Taki Chowk'),
                               (18,'Bigbajar'),
                               (18,'Limda Chowk'),
                               (18,'Hospital Chowk'),
                               (18,'Gondal Bus Station'),
                               (18,'Virpur Bus Station'),
                               (18,'Aatkot Bus Station'),
                               (18,'Chotila Bus Station'),
                               (18,'Jasdan Bus Station'),
                               (19,'Vadodara Central Bus Station'),
                               (19,'Amit Nagar'),
                               (19,'Pandya Bridge'),
                               (19,'Sussen Circle'),
                               (19,'Lalbaug'),
                               (19,'Golden Chokdi'),
                               (20,'Bhavnagar Bus Station'),
                               (20,'Shihor Bus Station'),
                               (20,'Vallabhipur Bus Station'),
                               (20,'Umrala Bus Station'),
                               (20,'Botad Bus Station'),
                               (20,'Mahuva Bus Station'),
                               (20,'Talaja Bus Station'),
                               (21,'Junagadh Bus Station'),
                               (21,'Visavadar Bus Station'),
                               (21,'Mendarda Bus Station'),
                               (21,'Bilkha Bus Station'),
                               (21,'Kutiyana Bus Station'),
                               (21,'Bhayavadar Bus Station'),
                               (22,'Bhuj Bus Station'),
                               (22,'Mandvi Bus Station'),
                               (22,'Mundra Bus Station'),
                               (22,'Bhachu Bus Station'),
                               (22,'Rapar Bus Station'),
                               (22,'Naliya Bus Station'),
                               (22,'Gandhidham Bus Station'),
                               (23,'Amreli Bus Station'),
                               (23,'Babra Bus Station'),
                               (23,'Lathi Bus Station'),
                               (23,'Chalala Bus Station'),
                               (23,'Damnagar Bus Station'),
                               (23,'Dhari Bus Station'),
                               (23,'Girgadhada Bus Station'),
                               (23,'Jafrabad Bus Station')

------------------------------------------------------------------------------------------------------------

CREATE TABLE USER_INFO
(
[User_Id] INT PRIMARY KEY IDENTITY(1,1),
First_Name VARCHAR(15) NOT NULL,
Last_Name VARCHAR(15) NOT NULL,
Contact_No VARCHAR(10) NOT NULL CONSTRAINT Chk_Contact CHECK(Contact_No like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') UNIQUE,
Email_Address VARCHAR(30) NULL CONSTRAINT Chk_Email CHECK(Email_Address like '%__@_%.com') UNIQUE,
User_Password VARCHAR(12) NOT NULL CONSTRAINT Chk_Password CHECK(LEN(User_Password)>5 AND LEN(User_Password)<=12),
Dob DATE NOT NULL,
Gender TINYINT NOT NULL,
City VARCHAR(15) NOT NULL,
CONSTRAINT Chk_Gender CHECK(Gender BETWEEN 1 AND 3)
)


INSERT INTO USER_INFO VALUES ('Mehul','Jambukiya','9773931957','MehulJambukiya56@gmail.com','Mehul&#89','1998/05/21',1,'Rajkot'),
                            ('Shikhar','Parihar','9995631245','ShikharP@gmail.com','Pshi54*','2000/01/01',1,'Bhavnagar'),
                            ('Smit','Kapadiya','8155839261','Kapdiya@gmai.com','smithyP@78','1999/07/31',1,'Surat'),
                            ('Darshan','Shah','8563214578','darshanshah@gmai.com','darPass&12','1997/03/11',1,'Amreli'),
                            ('Neel','Patel','7496853215','NeelPatel121@gmai.com','ForgotPass87','1999/11/21',1,'Talala'),
                            ('Urvish','Gajjar','8985868487','Urvishg@yahoo.com','Ug44#22','1999/08/18',1,'Ahmedabad'),
                            ('Barkha','Mahajan','6535101585','barkha@gmail.com','bmWorld%$34','1995/05/24',2,'Himmat nagar'),
                            ('Hardik','Niranjani','9856745852','hardikniranjani@gmail.com','Nij^$#098','1991/2/25',1,'Saurashtra'),
                            ('Preet','Gandhi','8125365464','preetgandhi57@gmail.com','preet89$','1992/09/04',1,'Rajkot'),
                            ('Dilip','Kumavat','7043185227','dilipkumavat@gmail.com','Pass@12','1999/07/18',1,'Ahmedabad')
---------------------------------------------------------------------------------------------------------------

CREATE TABLE BUS
(
    Bus_Id INT PRIMARY KEY IDENTITY(1,1),
    Bus_Plate_Number VARCHAR(15) CONSTRAINT chk_plateNumber_bus CHECK(Bus_Plate_Number LIKE 
    '[A-Z][A-Z][0-9][0-9][A-Z][A-Z][0-9][0-9][0-9][0-9]') UNIQUE NOT NULL,
    Bus_Type TINYINT NOT NULL,
    AC_Type VARCHAR(10) DEFAULT 'Non-AC',
    Total_Seat TINYINT NOT NULL,
    CONSTRAINT Chk_Bus_Type CHECK(Bus_Type BETWEEN 8 AND 11)
)


INSERT INTO BUS VALUES
    ('GJ27BH4726',10,'AC',30),
    ('GJ01NE5936',9,'Non-AC',28),
    ('GJ01FD5395',9,'AC',26),
    ('GJ05JW2957',11,'Non-AC',28),
    ('GJ18KE3967',10,'AC',30),
    ('GJ04KI4967',11,'Non-AC',25),
    ('GJ10LE3753',8,'Non-AC',27),
    ('GJ09KE3957',9,'Non-AC',28),
    ('GJ03FW8572',10,'AC',30),
    ('GJ12MN3781',9,'Non-AC',28)
------------------------------------------------------------------------------------------------------------------
CREATE TABLE SEAT
(
Seat_No TINYINT PRIMARY KEY IDENTITY(1,1),
Seat_Type TINYINT NOT NULL ,
Seat_Status BIT NOT NULL DEFAULT 0,
Deck_Type TINYINT NOT NULL, 
Bus_Id INT CONSTRAINT chk_bus_seat FOREIGN KEY(Bus_Id) REFERENCES BUS(Bus_Id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
)
INSERT INTO SEAT VALUES (7,0,5,1),(7,0,5,1),(7,0,5,1),
						(7,0,5,1),(7,0,5,1),(7,0,5,1),
						(7,0,5,1),(7,0,5,1),(7,0,5,1),
						(7,0,5,1),(6,0,5,1),(6,0,5,1),
						(6,0,5,1),(6,0,6,1),(6,0,6,1),
						(6,0,6,1),(6,0,6,1),(6,0,6,1),
						(6,0,6,1),(6,0,6,1),(6,0,6,1),
						(6,0,6,1),(6,0,6,1),(6,0,6,1),
						(6,0,6,1),(6,0,6,1),(6,0,6,1),
						(6,0,6,1),(6,0,6,1),(6,0,6,1),
						(7,0,5,2),(7,0,5,2),(7,0,5,2),(7,0,5,2),(7,0,5,2),
                        			(7,0,5,2),(7,0,5,2),(7,0,5,2),(7,0,5,2),(7,0,5,2),
                       			 	(7,0,5,2),(7,0,5,2),(7,0,5,2),(7,0,5,2),(7,0,5,2),
                        			(7,0,5,2),(7,0,5,2),(7,0,5,2),(7,0,5,2),(7,0,5,2),
                        			(7,0,5,2),(7,0,5,2),(7,0,5,2),(7,0,5,2),(7,0,5,2),
                        			(7,0,5,2),(7,0,5,2),(7,0,5,2),
						(6,0,5,3),(6,0,5,3),(6,0,5,3),
						(6,0,5,3),(6,0,5,3),(6,0,5,3),
						(6,0,5,3),(6,0,5,3),(6,0,5,3),
						(6,0,5,3),(6,0,5,3),(6,0,5,3),
						(6,0,5,3),(6,0,5,3),(6,0,5,3),
						(6,0,5,3),(6,0,5,3),(6,0,5,3),
						(6,0,5,3),(6,0,5,3),(6,0,5,3),
						(6,0,5,3),(6,0,5,3),(6,0,5,3),
						(6,0,5,3),(6,0,5,3)
				
--------------------------------------------------------------------------------------------------------------

CREATE TABLE DRIVER
(
    Driver_Id INT CONSTRAINT DRIVER_DriverId_PK PRIMARY KEY IDENTITY(1,1),
    First_Name varchar(15) NOT NULL,
    Last_Name varchar(15) NOT NULL,
    Contact_No varchar(10) CONSTRAINT  DRIVER_ContactNo CHECK(Contact_No LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
    Bus_Id INT CONSTRAINT BusId_FK FOREIGN KEY REFERENCES BUS(Bus_Id) NOT NULL
)

INSERT INTO DRIVER VALUES   ('Abhijeet', 'Gupta', 9898362520,1),
                            ('Aditya', 'Gupta', 9595632325,2),
                            ('Akshat', 'Acharya', 9656458875,3),
                            ('Amanpreet', 'Agarwal', 9898745652,4),
                            ('Amitava', 'Khatri', 7775648223,5),
                            ('Angad' ,'Ahuja', 5648732001,6),
                            ('Aditya' ,'Anand', 5643321008,7),
                            ('Aniruddh' ,'Laghari', 4585523110,8),
                            ('Anubhav' ,'Patel', 9996533012,9),
                            ('Arjun' ,'Reddy', 6532288774,10)


--------------------------------------------------------------------------------------------------------------

CREATE TABLE TRAVEL_SCHEDULE(
Schedule_Id INT PRIMARY KEY IDENTITY(1,1),
Bus_Id INT NOT NULL,
DRIVER_Id INT NOT NULL,
[Source] TINYINT NOT NULL,
Starting_Point TINYINT NOT NULL,
Destination TINYINT NOT NULL,
Destination_Point TINYINT NOT NULL,
Departure_Time TIME NOT NULL,
Departure_Date DATE NOT NULL,
Ticket_Price DECIMAL(8,2) NOT NULL,
Available_Seats TINYINT,
Rating DECIMAL(2,1),
Travel_Status BIT NOT NULL,
[User_Id] INT NOT NULL,
CONSTRAINT Bus_Id_FK FOREIGN KEY (Bus_Id) REFERENCES BUS(Bus_Id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT Chk_Source CHECK([Source] BETWEEN 16 AND 23),
CONSTRAINT Chk_Starting_Point CHECK(Starting_Point BETWEEN 1 AND 61),
CONSTRAINT Chk_Destination CHECK(Destination BETWEEN 16 AND 23),
CONSTRAINT Chk_Destination_Point CHECK(Destination_Point BETWEEN 1 AND 61),
CONSTRAINT DriverID_FK FOREIGN KEY (DRIVER_Id) REFERENCES DRIVER(Driver_Id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT UserId_FK FOREIGN KEY ([User_Id]) REFERENCES USER_INFO([User_Id])
)


INSERT INTO TRAVEL_SCHEDULE VALUES(1,1,16,2,17,10,'08:00:00 PM','2021-08-26',210,12,4.0,1,1),
                                  (2,2,18,16,16,6,'03:00:00 PM','2021-08-26',250,13,4.3,1,2),
                                  (3,3,21,41,18,19,'05:00:00 AM','2021-08-27',500,10,3.0,1,3),
                                  (4,4,22,48,16,2,'06:00:00 PM','2021-08-26',340,09,2.0,1,4),
                                  (5,5,23,55,16,8,'07:00:00 AM','2021-08-26',270,08,NULL,1,5),
                                  (6,6,16,2,17,13,'08:00:00 AM','2021-08-27',440,16,4.0,1,6),
                                  (7,7,19,28,17,10,'09:00:00 PM','2021-08-26',530,14,4.2,1,7),
                                  (8,8,20,38,16,7,'10:00:00 AM','2021-08-26',670,21,4.5,1,8),
                                  (9,9,16,2,23,54,'09:30:00 AM','2021-08-27',870,20,NULL,1,9),
                                  (10,10,16,2,19,32,'04:00:00 PM','2021-08-26',250,11,4.0,1,10)

-----------------------------------------------------------------------------------------------------------

CREATE TABLE PASSENGER
(
Passenger_Id INT PRIMARY KEY IDENTITY(1,1),
Passenger_Name VARCHAR(25) NOT NULL,
Age TINYINT NOT NULL,
Gender TINYINT NOT NULL,
Seat_No TINYINT UNIQUE NOT NULL,
[User_Id] INT NOT NULL,
Bus_Id INT NOT NULL,
Vaccination_status BIT NOT NULL,
CONSTRAINT FK_Seat_No FOREIGN KEY (Seat_No) REFERENCES SEAT(Seat_No) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT Chk_Gender_ CHECK(Gender BETWEEN 1 AND 3),
CONSTRAINT FK_User_Id FOREIGN KEY ([User_Id]) REFERENCES USER_INFO([User_Id]) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT chk_bus_seat_ FOREIGN KEY(Bus_Id) REFERENCES BUS(Bus_Id)
)

INSERT INTO PASSENGER VALUES ('Mehul Jambukiya',23,1,2,1,2,0),
('Shreya Jambukiya',22,2,3,1,2,1),
('Darshan Shah',26,1,12,4,3,1),
('Honey Shah',20,2,13,4,3,0),
('Paresh Shah',36,1,14,4,3,1),
('Chameli Shah',33,2,15,4,3,1),
('Hardik Niranjani',22,1,8,8,1,0),
('Preet Gandhi',21,1,9,9,1,0),
('Dilip Kumavat',25,1,10,10,1,1),
('Arpan Gajjar',24,1,11,10,1,1)


--------------------------------------------------------------------------------------------------------------

CREATE TABLE TICKETS
(
Ticket_Id INT PRIMARY KEY IDENTITY(1,1),
Schedule_Id INT NOT NULL,
Booked_Seat TINYINT NOT NULL,
Ticket_Price DECIMAL(8,2) NOT NULL,
Insurance Bit DEFAULT 0,
Total_Cost  AS ( (Ticket_Price* Booked_Seat) +(Insurance * Booked_Seat * 5) + 5 ),
[User_Id] INT NOT NULL,
CONSTRAINT Schedule_FK FOREIGN KEY (Schedule_Id) REFERENCES TRAVEL_SCHEDULE(Schedule_Id),
CONSTRAINT User_fk1 FOREIGN KEY ([User_Id]) REFERENCES USER_INFO([User_Id])
)


INSERT INTO TICKETS VALUES (1,4,210,1,1),
                           (2,3,250,0,2),
                           (3,1,500,1,3),
                           (4,1,340,1,4),
                           (5,1,270,0,5),
                           (6,2,440,1,6),
                           (7,6,530,1,7),
                           (8,2,670,1,8),
                           (9,1,870,0,9),
                           (10,1,250,1,10)

-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PAYMENT
(
    Payment_ID INT CONSTRAINT PAYMENT_PymentId_PK PRIMARY KEY IDENTITY(1,1),
    Payment_type TINYINT NOT NULL,
    Ticket_Id INT CONSTRAINT PAYMENT_TicketId_FK FOREIGN KEY REFERENCES TICKETS(Ticket_Id) NOT NULL,
    Payment_Number VARCHAR(30) NOT NULL,
	Payment_Status BIT NOT NULL,
    [User_Id] INT NOT NULL CONSTRAINT PAYMENT_UserId_FK FOREIGN KEY ([User_Id]) REFERENCES USER_INFO([User_Id]),
	CONSTRAINT Chk_Payment_type CHECK(Payment_type BETWEEN 12 AND 15)
)


INSERT INTO PAYMENT VALUES (15,1,'MehulJ@ybl',1,1),
                           (12,2,'4312643737309775',0,2),
                           (15,3,'Kapadiya34@Paytm',0,3),
                           (12,4,'5353257079899009',1,4),
                           (14,5,'9456822415756695',1,5),
                           (13,6,'5137413525823514',1,6),
                           (15,7,'BarkhaM@sbi',0,7),
                           (12,8,'5590567205496915',1,8),
                           (15,9,'gandhi@gpay',1,9),
                           (12,10,'4030861064360473',1,10)

------------------------------------------------------------------------------------------------------------------

 CREATE TABLE BOOKING_DETAILS
(
Bd_Id INT IDENTITY PRIMARY KEY,
Booking_Date DATE NOT NULL,
Booking_Status BIT NOT NULL,
Payment_ID INT NOT NULL UNIQUE CONSTRAINT FK_Payment FOREIGN KEY (Payment_Id) REFERENCES PAYMENT(Payment_Id)  ON DELETE CASCADE ON UPDATE CASCADE,
Schedule_Id INT NOT NULL CONSTRAINT Schedule_FK0 FOREIGN KEY (Schedule_Id) REFERENCES TRAVEL_SCHEDULE(Schedule_Id) ON DELETE CASCADE ON UPDATE CASCADE,
[User_Id] INT NOT NULL CONSTRAINT User_Fk11 FOREIGN KEY ([User_Id]) REFERENCES USER_INFO([User_Id]) ON DELETE CASCADE ON UPDATE CASCADE
)
 
 
INSERT INTO BOOKING_DETAILS VALUES ('2021-08-19',1,1,1,1),
                           ('2021-08-20',0,2,2,2),
                           ('2021-08-21',0,3,3,3),
                           ('2021-08-22',1,4,4,4),
                           ('2021-08-23',1,5,5,5),
                           ('2021-08-25',1,6,6,6),
                           ('2021-08-24',0,7,7,7),
                           ('2021-08-24',1,8,8,8),
                           ('2021-08-25',1,9,9,9),
                           ('2021-08-20',1,10,10,10) 
						   
 
-------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE CANCELLATION
(
    Cancellation_Id INT PRIMARY KEY IDENTITY(1,1),
    Ticket_Id INT CONSTRAINT chk_ticket_cancel UNIQUE FOREIGN KEY (Ticket_Id) REFERENCES TICKETS(Ticket_Id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    Bd_Id INT CONSTRAINT chk_bd_cancel UNIQUE FOREIGN KEY (Bd_Id) REFERENCES BOOKING_DETAILS(Bd_Id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
)
              

INSERT INTO CANCELLATION VALUES (2,2),                                                                                                                                    
				(3,3),
				(7,7)
