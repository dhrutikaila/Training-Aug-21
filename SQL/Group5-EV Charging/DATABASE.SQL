--TABLE
CREATE DATABASE EVcharging
USE EVCharging


CREATE TABLE ChargingStation
(
	StationID INT CONSTRAINT ChargingStation_StationID_PkAuto PRIMARY KEY IDENTITY(1,1),
	StationName VARCHAR(50) CONSTRAINT ChargingStation_StationName_NotNull NOT NULL,
	[Owner] VARCHAR (50) CONSTRAINT ChargingStation_Owner_NotNull NOT NULL,
	StatusID INT CONSTRAINT ChargingStation_StatusID_FK_NotNull FOREIGN KEY REFERENCES StationStatus(StatusID) ON DELETE SET NULL ON UPDATE CASCADE,
	Timing VARCHAR(50) CONSTRAINT ChargingStation_Timing_NotNull NOT NULL,
	[Address] VARCHAR (100) CONSTRAINT ChargingStation_Address_NotNull NOT NULL,
	Longitude DECIMAL(10,6) CONSTRAINT ChargingStation_Longitude_NotNull NOT NULL,
	Latitude DECIMAL(10,6) CONSTRAINT ChargingStation_Latitude_NotNull NOT NULL,
	CityID INT CONSTRAINT ChargingStation_City_FK_NotNull NOT NULL FOREIGN KEY REFERENCES City(CityID) ON DELETE NO ACTION ON UPDATE NO ACTION,
	IsDeleted BIT CONSTRAINT ChargingStation_IsDeleted_Chk NOT NULL CHECK (IsDeleted IN (0,1)) DEFAULT 0
)      


INSERT INTO  ChargingStation(StationName,Owner,StatusID,Timing,Address,Longitude,Latitude,CityID)
	VALUES
		('KKV','ANIL','2','6:00AM TO 9:30PM','KKV ROAD',22.293784, 70.784986,4),
		('C2','SHREYASH','2','24/7','RING ROAD',22.283909, 70.773710,3),
		('NOVA','Nikhil','3','7:00AM TO 9:00PM','CLUB ROAD',22.340855, 70.915440,2),
		('MG','Vikas','1','24/7','raiya road',22.995020, 72.572489,4),
		('TATA','Raj','5','24/7','university road',22.995022, 72.972489,1)



CREATE TABLE ConnectionPort   
(
	PortID    INT CONSTRAINT ConnectionPort_PortID_PkAuto PRIMARY KEY IDENTITY(1,1) ,
	StationId INT CONSTRAINT ConnectionPort_StationId_Fk FOREIGN KEY REFERENCES ChargingStation(StationID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	Port_Voltage DECIMAL(6,3)  CONSTRAINT ConnectionPort_Voltage_NotNull NOT NULL,
	ConnectionID INT  CONSTRAINT Connection_Type_Fk_NotNull FOREIGN KEY REFERENCES ConnectionType(TypeID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	[Availability]  BIT  CONSTRAINT ConnectionPort_Availability_Chk NOT NULL CHECK ( [Availability] IN (0,1)),
	ChargesPerKWH SMALLMONEY  CONSTRAINT ConnectionPort_ChargesPerKWH_NotNull NOT NULL,
	IsDeleted BIT CONSTRAINT ConnectionPort_IsDeleted_Chk NOT NULL CHECK (IsDeleted IN (0,1)) DEFAULT 0
)


INSERT INTO ConnectionPort(StationId,Port_Voltage,ConnectionID,Availability,ChargesPerKWH) 
	VALUES
		(1,260,5,1,18.4),
		(1,260,5,1,18.4),
		(1,260,5,1,18.4),
		(1,240,2,1,19),
		(2,240,2,1,19),
		(2,240,2,1,19),
		(2,240,5,1,18.5),
		(2,260,5,1,18.4),
		(3,240,2,1,19),
		(3,240,2,1,19),
		(3,240,2,1,19),
		(3,240,5,1,18.5),
		(3,260,5,0,18.4),
		(3,240,9,0,17.2),
		(4,240,2,1,19),
		(4,240,2,0,19),
		(4,240,5,0,18.5),
		(4,260,5,1,18.4),
		(5,240,2,1,19),
		(5,240,2,1,19),
		(5,240,2,0,19),
		(5,240,5,1,18.5),
		(5,260,5,0,18.4),
		(5,240,9,0,17.2)  
	

CREATE TABLE ConnectionType	
(
	TypeID	INT CONSTRAINT  Connection_TypeID_PkAuto PRIMARY KEY IDENTITY(1,1),
	Type VARCHAR(30) CONSTRAINT Connection_Type_NotNull NOT NULL,
	IsDeleted BIT CONSTRAINT ConnectionType_IsDeleted_Chk NOT NULL CHECK (IsDeleted IN (0,1)) DEFAULT 0
)

INSERT INTO ConnectionType(Type) 
    VALUES
		('CCS-1'),
		('CCS-2'),
		('BG/T'),
		('Tesla Charger'),
		('CHAdeMO'),
		('GB/T'),
		('AC TYPE-1'),
		('AC TYPE-2'),
		('AC0001'),
		('AC PLUG POINT')


CREATE TABLE City
(
	CityID INT CONSTRAINT City_CityID_Pk PRIMARY KEY IDENTITY(1,1),
	CityName VARCHAR (25) CONSTRAINT City_CityName_NotNull NOT NULL,
	StateID INT CONSTRAINT City_StateID_FkNotNull NOT NULL FOREIGN KEY REFERENCES States(StateID) ON DELETE CASCADE ON UPDATE CASCADE,
	IsDeleted BIT CONSTRAINT City_IsDeleted_Chk NOT NULL CHECK (IsDeleted IN (0,1)) DEFAULT 0
)


INSERT INTO City(CityName,StateID) 
	VALUES
		('Ahmedabad',8),
		('Baroda',8),
		('Surat',8),
		('Rajkot',8),
		('Jamnagar',8),
		('Gandhinagar',8),
		('Mumbai',15),
		('Kalkata',28),
		('Chennai',25),
		('Pune',15),
		('Bengaluru',12),
		('Mysore',12),
		('Bhopal',14),
		('Indore',14),
		('Amritsar',21),
		('Jalandhar',21),
		('Chandigarh',21),
		('Jaypur',22),
		('Jaisalmer',22),
		('Jodhpur',22)



CREATE TABLE Customer
(
	CustomerID INT CONSTRAINT Customer_CustomerID_PkAuto PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR (50) CONSTRAINT Customer_NameNull_NotNull NOT NULL,
	Make VARCHAR(25) CONSTRAINT Customer_Make_NotNull NOT NULL,
	Model VARCHAR(25) CONSTRAINT Customer_Model_NotNull NOT NULL,
	ConnectionID INT CONSTRAINT Customer_ConnectionID_FK_NotNull NOT NULL FOREIGN KEY REFERENCES ConnectionType(TypeID) ON DELETE NO ACTION ON UPDATE NO ACTION, 
	VehicalNo VARCHAR(17) CONSTRAINT Customer_VehicalNo_NotNull NOT NULL, 
	PhoneNumber NUMERIC(10) CONSTRAINT Customer_phonenumber_NotNull_Chk NOT NULL CHECK (PhoneNumber BETWEEN 1000000000 AND 9999999999), 
	EmailId VARCHAR(30) CONSTRAINT Customer_Email_Chk CHECK (EmailId LIKE '[a-z,0-9,_,-]%@[a-z]%.[a-z][a-z]%'),
	[Address] VARCHAR(100) CONSTRAINT Customer_Address_NotNull NOT NULL,
	Pincode NUMERIC(6) CONSTRAINT Customer_Pincode_NotNull NOT NULL,
	CityId INT CONSTRAINT Customer_City_FK_NotNull NOT NULL FOREIGN KEY REFERENCES City(CityID) ON DELETE NO ACTION ON UPDATE NO ACTION,
	IsDeleted BIT CONSTRAINT Customer_IsDeleted_Chk NOT NULL CHECK (IsDeleted IN (0,1)) DEFAULT 0
)


INSERT INTO Customer(Name,Make,Model,ConnectionID,VehicalNo,PhoneNumber,EmailId,Address,Pincode,CityId)
	VALUES
		('Harsh','Kia','Sonet',1,'WBA3X5C51ED235114',9998885555,'abcs222@gmail.com','Virat Nagar',520068,12),	
		('Jaydeep','Honada','City',2,'5N3AA08A95N863813',8988956234,'csdv55@gmail.com','M.G. Road',32008,1),
		('Kevin','Tata','Tigor',5,'19XFA1F56BE004421',8787874555,'sdddd455@gmail.com','Market Road',230532,7),
		('Rohit','Suzuki','Shwift',2,'2MEFM74V87X658365',9879875654,'ughgdf33@gmail.com','S.G. Highway',32008,1),
		('John','Renault','Kwid',5,'4T1BD1FK7FU102405',7878956520,'gfydhg222@gmail.com','Hospital Road',335009,3)



CREATE TABLE StationStatus
(
	StatusID INT CONSTRAINT StationStatus_StatusID_PkAuto PRIMARY KEY IDENTITY(1,1),
	StatusName VARCHAR(30) CONSTRAINT StationStatus_StatusName_NotNull NOT NULL,
	IsDeleted BIT CONSTRAINT StationStatus_IsDeleted_Chk NOT NULL CHECK (IsDeleted IN (0,1)) DEFAULT 0
)


INSERT INTO StationStatus(StatusName) 
	VALUES
		('Public'),
		('High power'),
		('Restricted'),
		('In use'),
		('Under Repair')


CREATE TABLE StationHasAminity
(
	StationHasAminityID INT CONSTRAINT StationHasAminity_StationHasAminityID_PkAuto PRIMARY KEY IDENTITY(1,1),
	StationId INT CONSTRAINT StationHasAminity_StationId_FkNotNull NOT NULL FOREIGN KEY REFERENCES ChargingStation(StationID) ON DELETE CASCADE ON UPDATE CASCADE,
	AminityID INT CONSTRAINT StationHasAminity_StatusID_FK_NotNull NOT NULL FOREIGN KEY REFERENCES Aminities(AminityID) ON DELETE CASCADE ON UPDATE CASCADE,
	IsDeleted BIT CONSTRAINT StationHasAminity_IsDeleted_Chk NOT NULL CHECK (IsDeleted IN (0,1)) DEFAULT 0
)


INSERT INTO StationHasAminity(StationId,AminityID)
	VALUES 
		(1,1),(1,2),(1,4),(1,5),(1,7),(2,4),(2,3),(2,1),(3,7),(4,6),(5,2)




CREATE TABLE Employees
(
EmployeeID INT  CONSTRAINT  Employees_EmployeeID_PkAuto PRIMARY KEY IDENTITY(1,1),
[Name] VARCHAR(50) CONSTRAINT Employees_Name_NotNull NOT null,
PhoneNumber NUMERIC(10) CONSTRAINT Employees_phonenumber_NotNull_Chk NOT NULL CHECK (PhoneNumber BETWEEN 1000000000 AND 9999999999), 
EmailId VARCHAR(30) CONSTRAINT Employees_Email_Chk CHECK (EmailId LIKE '[a-z,0-9,_,-]%@[a-z]%.[a-z][a-z]%'),
IsDeleted BIT CONSTRAINT Employees_IsDeleted_Chk NOT NULL CHECK (IsDeleted IN (0,1)) DEFAULT 0
)

INSERT INTO  Employees(Name,PhoneNumber,EmailId)
	VALUES
		('Virat',9824685963,'abd123@gmail.com'),
		('Umesh',8564293846,'jkl421@gmail.com'),
		('Chirag',9654821563,'okm852@gmail.com'),
		('Hardik',9265861573,'asd453@gmail.com'),
		('Ravi',8320046042,'pqr963@gmail.com')



CREATE TABLE EmployeeWorksAt
(
RecordId INT CONSTRAINT EmployeeWorksAt_RecordID_Pk PRIMARY KEY IDENTITY(1,1),
EmployeeID INT CONSTRAINT EmployeeWorksAt_EmployeeID_Fk FOREIGN KEY REFERENCES Employees(EmployeeID) ON DELETE NO ACTION ON UPDATE NO ACTION NOT NULL,
StationID INT CONSTRAINT EmployeeWorksAt_StationID_Fk FOREIGN KEY REFERENCES ChargingStation(StationID) ON DELETE NO ACTION ON UPDATE NO ACTION NOT NULL,
Salary MONEY CONSTRAINT EmployeeWorksAt_Salary_NotNull NOT NULL,
Date DATETIME CONSTRAINT EmployeeWorksAt_Date_def DEFAULT GETDATE() NOT NULL,
IsDeleted BIT CONSTRAINT EmployeeWorksAt_IsDeleted_def NOT NULL CHECK (IsDeleted IN (0,1)) DEFAULT 0
)

INSERT INTO EmployeeWorksAt (EmployeeID,StationID,Salary) 
	VALUES
		(1,3,25000),
		(2,4,25000),
		(3,5,25000),
		(4,1,25000),
		(5,2,25000)
		


CREATE TABLE States 
(
StateID INT  CONSTRAINT  States_StateID_PkAuto PRIMARY KEY IDENTITY(1,1),
[Name] VARCHAR (25) CONSTRAINT States_Name_NotNull NOT NULL,
IsDeleted BIT CONSTRAINT States_IsDeleted_Chk NOT NULL CHECK (IsDeleted IN (0,1)) DEFAULT 0
)


INSERT INTO  States(Name) 
	VALUES
	  ('Andhra Pradesh'),
      ('Arunachal Pradesh'),
	  ('Assam'),
	  ('Bihar'),
	  ('Chhattisgarh'),
	  ('Delhi'),
	  ('Goa'),
	  ('Gujrat'),
	  ('Haryana'),
	  ('Himachal Pradesh'),
	  ('Jharkhand'),
	  ('Karnataka'),
	  ('Kerala'),
	  ('Madhya Pradesh'),
	  ('Maharashtra'),
	  ('Manipur'),
	  ('Meghalaya'),
	  ('Mizoram'),
	  ('Nagaland'),
	  ('Odisha'),
	  ('Punjab'),
	  ('Rajasthan'),
	  ('sikkim'),
	  ('Tamil Nadu'),
	  ('Tripura'),
	  ('Uttar Pradesh'),
	  ('Uttarakhand'),
	  ('West Bengal')



CREATE TABLE Aminities
(
AminityID INT CONSTRAINT Aminities_AminitiesID_PkAuto PRIMARY KEY IDENTITY(1,1),
AminityName VARCHAR(60) CONSTRAINT Aminities_AminityName_NotNull NOT NULL,
IsDeleted BIT CONSTRAINT Aminities_IsDeleted_Chk NOT NULL CHECK (IsDeleted IN (0,1)) DEFAULT 0
)

INSERT INTO Aminities(AminityName)
	VALUES
        ('Public Restroom'),
        ('Cafeteria'),
        ('Salon'),
        ('Chemist Shop'),
        ('Parking'),
        ('Auto Service Center'),
        ('Retail Store'),
        ('Food Court'),
        ('Kids Activity Zone')


CREATE TABLE PaymentMode
(
	ID INT CONSTRAINT PaymentMode_ID_Pk PRIMARY KEY IDENTITY(1,1),
	Mode VARCHAR(20) CONSTRAINT PaymentMode_Mode_NotNull NOT NULL,
	IsDeleted BIT CONSTRAINT PaymentMode_IsDeleted_Chk NOT NULL CHECK (IsDeleted IN (0,1)) DEFAULT 0
)

INSERT INTO PaymentMode(Mode) 
	VALUES 
		('Credit Card'),('Debit Card'),('Net Banking'),('PayTM'),('UPI'),('Cash')

CREATE TABLE SessionRecord
(
	SessionID INT CONSTRAINT SessionRecord_SessionID_PkAuto PRIMARY KEY IDENTITY(1,1),
	CustomerID INT CONSTRAINT SessionRecord_CustomerID_Fk_NotNull NOT NULL FOREIGN KEY REFERENCES Customer(CustomerID) ON DELETE NO ACTION ON UPDATE NO ACTION,
	PortID INT CONSTRAINT SessionRecord_PortID_Fk_NotNull NOT NULL FOREIGN KEY REFERENCES ConnectionPort(PortID) ON DELETE NO ACTION ON UPDATE NO ACTION,
	StartTime DATETIME CONSTRAINT SessionRecord_StartTime_NotNull NOT NULL,
	EndTime DATETIME CONSTRAINT SessionRecord_EndTime_NotNull NOT NULL,
	Amount MONEY CONSTRAINT SessionRecord_Amount_NotNull NOT NULL,
	Units DECIMAL(5,2) CONSTRAINT SessionRecord_Units_NotNull NOT NULL,
	PaymentID VARCHAR(25) CONSTRAINT SessionRecord_PaymentID_DefNull DEFAULT NULL,
	PaymentMode INT CONSTRAINT SessionRecord_PaymentID_Fk_NotNull NOT NULL FOREIGN KEY REFERENCES PaymentMode(ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
	[Date] DATETIME CONSTRAINT SessionRecord_Date_Default NOT NULL DEFAULT GETDATE(),
	IsDeleted BIT CONSTRAINT SessionRecord_IsDeleted_Chk NOT NULL CHECK (IsDeleted IN (0,1)) DEFAULT 0
)


INSERT INTO SessionRecord (CustomerID,PortID,StartTime,EndTime,Amount,Units,PaymentID,PaymentMode,Date)
	VALUES
		(2,4,'08/01/2021 09:30','08/01/2021 10:30',100,5.56,'P134987256LJS',1,'08/01/2021'),
		(5,18,'08/12/2021 05:00','08/12/2021 06:00',75,4.1,'P134987258LJS',1,'08/12/2021'),
		(3,22,'08/14/2021 12:00','08/14/2021 13:30',110,6.1,'P134987259LJS',4,'08/14/2021'),
		(4,14,'08/27/2021 07:30','08/27/2021 08:30',80,4.48,'P134987260LJS',5,'08/27/2021'),
		(4,4,'09/27/2021 07:45','09/27/2021 09:30',80,4.48,'P134987261LJS',5,'09/27/2021'),
		(3,17,'09/14/2021 12:00','09/14/2021 13:45',110,6.1,'P134987262LJS',4,'09/14/2021'),
		(5,12,'09/12/2021 05:50','09/12/2021 06:20',75,4.1,'P134987263LJS',1,'09/12/2021'),
		(2,6,'09/01/2021 011:30','09/01/2021 12:45',100,5.56,'P134987264LJS',1,'09/01/2021')

CREATE TABLE Feedback
(
	FeedbackID INT CONSTRAINT Feedback_FeedbackID_Pk PRIMARY KEY IDENTITY(1,1),
	CustomerID INT CONSTRAINT Feedback_CustomerID_Fk_NotNull NOT NULL FOREIGN KEY REFERENCES Customer(CustomerID) ON DELETE NO ACTION ON UPDATE CASCADE,
	StationId INT CONSTRAINT Feedback_StationId_Fk NOT NULL FOREIGN KEY REFERENCES ChargingStation(StationID) ON DELETE CASCADE ON UPDATE CASCADE,
	Rating TINYINT CONSTRAINT Feedback_Rating_Chk1to5_NotNull NOT NULL CHECK (Rating >= 1 AND Rating <=5),
	Comment VARCHAR(500),
	IsDeleted BIT CONSTRAINT Feedback_IsDeleted_Chk NOT NULL CHECK (IsDeleted IN (0,1)) DEFAULT 0
)

INSERT INTO Feedback(CustomerID,StationId,Rating,Comment)
	VALUES
		(2,3,5,'Fast charging and good facility'),
		(5,2,4,'Good experience'),
		(3,2,5,'Clean campus,fast charge, good facility'),
		(4,5,3,'Good facility but management should be improve')


CREATE TABLE Expenditure
(
	ExpID INT CONSTRAINT Expenditure_ExpID_Pk PRIMARY KEY IDENTITY(1,1),
	StationID INT CONSTRAINT Expenditure_StationID_Fk FOREIGN KEY REFERENCES ChargingStation(StationID) ON DELETE NO ACTION ON UPDATE NO ACTION NOT NULL,
	EnergyCharges MONEY CONSTRAINT Expenditure_EnergyCharges_NotNull NOT NULL,
	Maintainance MONEY CONSTRAINT Expenditure_Maintainance_NotNull NOT NULL,
	Date DATETIME CONSTRAINT Expenditure_Date_def DEFAULT GETDATE() NOT NULL,
	IsDeleted BIT CONSTRAINT Expenditure_IsDeleted_def NOT NULL CHECK (IsDeleted IN (0,1)) DEFAULT 0
)

INSERT INTO Expenditure (StationID,EnergyCharges,Maintainance)
	VALUES
		(1,10000,5000),
		(2,12000,8000),
		(3,10000,11000),
		(4,12000,5000),
		(5,11000,3000)
