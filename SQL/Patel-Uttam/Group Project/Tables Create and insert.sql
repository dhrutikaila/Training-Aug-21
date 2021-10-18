USE [Group Project]



-- Main Table

CREATE TABLE Society_info

(
	HouseNo int PRIMARY KEY IDENTITY(1,1),
	OwnerName varchar(25) NULL DEFAULT 'N/A',
	ContactNumber bigint NULL DEFAULT 'N/A',
	Number_of_Members int NULL DEFAULT 'N/A',
	CONSTRAINT check_houseno CHECK (HouseNo<=20)
);





-- Member_info

CREATE TABLE Member_info
(
	MemberID int PRIMARY KEY IDENTITY(1,1),
	MemberName varchar(25) NOT NULL ,
	Relation varchar(10) NOT NULL ,
	HouseNo int NOT NULL CONSTRAINT FK_house_member FOREIGN KEY REFERENCES  Society_info(HouseNo) 

);


CREATE TABLE Previous_Member_info
(
	MemberID int NOT NULL UNIQUE,
	MemberName varchar(25) NOT NULL ,
	Relation varchar(10) NOT NULL ,
	HouseNo int NOT NULL  

);


-- Visitor_info

CREATE TABLE Visitor_info

(
	VisitorID int PRIMARY KEY IDENTITY(1,1),
	VisitorName varchar(25) NOT NULL ,
	ContactNumber bigint NOT NULL ,
	HouseNo int NOT NULL CONSTRAINT FK_house FOREIGN KEY REFERENCES Society_info(HouseNo) ,
	VehicalNo varchar(12) NULL,
	No_of_Visitor int NOT NULL DEFAULT 1,
	Purpose varchar(25) NOT NULL,
	EntryTime DATE NOT NULL,
	ExitTime DATE NULL 
);



-- Insert Soceity_info

--INSERT INTO Society_info(OwnerName,ContactNumber,Number_of_Members) VALUES(NULL,NULL,NULL),
--																			('Uttam Patel',9645857456,2),
--																			('Devendra Gorana',8785452515,3),
--																			('Vipul Dabhi',9426587545,5),
--																			('Jinesh Patel',8875456542,2),
--																			('Keyur Shah',8475896545,4)



---- Insert Member_info

--INSERT INTO Member_info(MemberName,Relation,HouseNo) VALUES('Ravi Vyas','Son',10),
--																			('Kunj Patel','Brother',1),
--																			('Shruti Shah','Colleague',3),
--																			('Anirudh Dodiya','Friend',4),
--																			('Rajnikant Patel','Father',5),
--																			('Amit Shah','Uncle',6)




-- Insert Visitor_info

--INSERT INTO Visitor_info(VisitorName,ContactNumber,HouseNo,VehicalNo,No_of_Visitor,Purpose,EntryTime) 

--VALUES('Kuldip Zala',9856254652,4,'GJ01 AB 4567',1,'Service',DATEADD(MM,-5,GETDATE())),
--('Harsh Patel',5698254652,2,'GJ06 CF 2367',5,'Friends',DATEADD(DD,-15,GETDATE())),
--('Bhushan Vagh',6259854652,1,'GJ01 AB 4556',1,'Service',DATEADD(MM,-5,GETDATE())),
--('Jinesh Shah',8596254652,4,'GJ27 AF 4787',2,'Guest',DATEADD(DD,-1,GETDATE())),
--('Jimmy Vagh',9865256254,6,'GJ18 CB 4123',1,'Brother',DATEADD(MM,-2,GETDATE())),
--('Mitali Raj',9825625465,3,'GJ01 CE 1542',1,'Service',DATEADD(MM,-1,GETDATE())),
--('Denish Vora',9854662552,6,'GJ01 AB 4127',1,'Service',DATEADD(DD,-5,GETDATE())),
--('Harsh Prajapati',8562546952,2,'GJ01 AB 4537',1,'Service',DATEADD(MM,-2,GETDATE())),
--('Raj Patel',8856254652,5,'GJ02 FG 4554',3,'FamilyMember',DATEADD(DD,-3,GETDATE()));


--UPDATE Visitor_info SET ExitTime = CASE VisitorID

--									WHEN 2 THEN DATEADD(MINUTE,30,EntryTime)
--									WHEN 3 THEN DATEADD(DD,1,EntryTime)
--									WHEN 4 THEN DATEADD(MINUTE,30,EntryTime)
--									WHEN 5 THEN DATEADD(MINUTE,90,EntryTime)
--									WHEN 6 THEN DATEADD(DD,1,EntryTime)
--									WHEN 7 THEN DATEADD(MINUTE,30,EntryTime)
--									WHEN 8 THEN DATEADD(MINUTE,40,EntryTime)
--									WHEN 9 THEN DATEADD(MINUTE,25,EntryTime)
--									WHEN 10 THEN DATEADD(Day,2,EntryTime)
--									ELSE ExitTime
--									END;


SELECT * FROM Society_info

SELECT * FROM Member_info

SELECT * FROM Visitor_info
