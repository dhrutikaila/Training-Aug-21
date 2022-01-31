-- create database
CREATE DATABASE socialmedia1

USE socialmedia1


-- Location table
Create Table Location(
Locationid INT PRIMARY KEY IDENTITY(1,1),
City VARCHAR(20) not null,
State VARCHAR(20) not null,
Country VARCHAR(20) not null,
)



-- User table
CREATE TABLE Users
(
Uid int  CONSTRAINT uid_User PRIMARY KEY  IDENTITY(1,1),
Name varchar(50) not null,
Users_Locationid int not null CONSTRAINT Cityid_Users FOREIGN KEY  REFERENCES  Location(Locationid) ON DELETE CASCADE ON UPDATE CASCADE,
Address nvarchar(200) not null,
Email nvarchar(50) not null CONSTRAINT Email_validation CHECK(Email LIKE '%_@__%.__%'),
PhoneNumber varchar(10) not null CONSTRAINT pn CHECK(PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Created_date DATE  DEFAULT GETDATE(),
Dateofbirth DATE not null,
Visible TINYINT DEFAULT 1 CONSTRAINT employees_date CHECK(Visible IN (0,1)), 
Password varbinary(200) not null,
Gender not null nchar(1)  CONSTRAINT employees_Gender check(Gender IN('M','F','O')) 
)



-- Category Table
CREATE TABLE Categories
(
Category_ID smallint constraint PK_Categories_Category_ID PRIMARY KEY IDENTITY(1,1),
Category_Name varchar(20) not null
)



-- Post Table
CREATE TABLE Post
(
Pid int  not null CONSTRAINT pid_Post PRIMARY KEY  IDENTITY(1,1),
Title nvarchar(20) not null,
Description ntext not null,
Likes int DEFAULT 0,
Post_Category_ID smallint not null CONSTRAINT Category_ID_Post FOREIGN KEY  REFERENCES  Categories(Category_ID) ON DELETE CASCADE ON UPDATE CASCADE,
Post_Uid int not null CONSTRAINT uid_Post FOREIGN KEY  REFERENCES  Users(Uid) ON DELETE CASCADE ON UPDATE CASCADE,
Post_Date Date DEFAULT GETDATE()
)




-- FriendRequest Table
CREATE TABLE FriendRequest
(
FriendRequestid int  CONSTRAINT FriendRequestid_Post PRIMARY KEY  IDENTITY(1,1),
FriendRequest_Uid int  not null CONSTRAINT Uid_s_FriendRequest FOREIGN KEY  REFERENCES  Users(Uid) ,
FriendRequest_Frid int not null CONSTRAINT Frid_r_FriendRequest FOREIGN KEY  REFERENCES  Users(Uid),
CONSTRAINT unique_FriendRequest UNIQUE(FriendRequest_Uid,FriendRequest_Frid),
FriendStatus bit not null,
Requested_Date DATE  not null DEFAULT GETDATE(),
 Approved_Date DATE 
)



-- Chat table
CREATE TABLE Chat
(
Chat_id int PRIMARY KEY IDENTITY(1,1),
Sender int not null CONSTRAINT SEND_FK FOREIGN KEY REFERENCES Users(uid),
Receiver int not null CONSTRAINT RECEIVE_FK FOREIGN KEY REFERENCES Users(uid),
Msg ntext not null,
Msg_Time datetime DEFAULT GETDATE()
)




-- Comment Table
Create Table Comment(
Comment_Id INT CONSTRAINT PK_Comment_Comment_Id PRIMARY KEY IDENTITY(1,1),
Comment_Text NVARCHAR(100),
Comment_Uid INT not null Constraint Ufk FOREIGN key REFERENCES USERS(Uid),
Comment_Pid INT not null Constraint Pfk FOREIGN key REFERENCES Post(Pid)
)




-- add Likebyuser Table 
CREATE TABLE Likebyuser
(
Likeid int  not null CONSTRAINT Likeid_Likebyuser PRIMARY KEY  IDENTITY(1,1),
LikebyUser_Pid int not null CONSTRAINT Pid_Likebyuser FOREIGN KEY  REFERENCES  Post(Pid) ON DELETE CASCADE ON UPDATE CASCADE,
LikebyUser_Uid int not null CONSTRAINT Uid_Likebyusers FOREIGN KEY  REFERENCES  Users(Uid) 
)



-- group table
CREATE TABLE Groups
(
GroupId int CONSTRAINT PK_Groups_GroupID PRIMARY KEY IDENTITY(1,1),
Grp_Name varchar(30) not null,
Grp_Description varchar(100) not null,
Created_By int not null CONSTRAINT grp_lead FOREIGN KEY REFERENCES Users(Uid),
CreatedAt datetime default GETDATE()
)




-- group members
CREATE TABLE GroupMember
(
GrpMembar_id int CONSTRAINT PK_GroupMember_GrpMembar_id PRIMARY KEY IDENTITY(1,1),
Group_id int not null CONSTRAINT grp_member FOREIGN KEY REFERENCES Groups(GroupId) ON DELETE CASCADE ON UPDATE CASCADE,
GroupMember_Uid int not null CONSTRAINT grpUid FOREIGN KEY REFERENCES Users(Uid) ON DELETE CASCADE ON UPDATE CASCADE,
Date_joined date DEFAULT GETDATE(),
CONSTRAINT unqMember UNIQUE(Group_id,UserId)
)




-- group message 
CREATE TABLE GroupMessage
(
GroupMessage_Groupid INT NOT NULL CONSTRAINT PK_GroupMessage_Groupid PRIMARY KEY IDENTITY(1,1),
Grp_id INT NOT NULL CONSTRAINT grpid FOREIGN KEY REFERENCES Groups(GroupId),
GroupMessage_Uid INT NOT NULL CONSTRAINT grpMsgUid FOREIGN KEY REFERENCES Users(Uid),
Message NTEXT NOT NULL,
Sendtime Datetime DEFAULT GETDATE()
)




-- GroupMessageSeen Table
CREATE TABLE GroupMessageSeen(
	GroupMessageSeen_Groupid INT NOT NULL CONSTRAINT FKS_GroupMessageSeen_Groupid FOREIGN KEY REFERENCES dbo.GroupMessage(GrpMsg_id),
	User_Uid INT NOT NULL CONSTRAINT FK_GroupMessageSeen_Uid FOREIGN KEY REFERENCES Users(Uid),
	Read_Status INT  DEFAULT 8 CONSTRAINT fk_status_read FOREIGN KEY REFERENCES Master(Master_id),
	CONSTRAINT Read_Status_check CHECK(Read_Status IN (8,9,10)),
)




--Tags Table
CREATE TABLE Tags(
	Tag_ID INT CONSTRAINT PK_Tag_ID PRIMARY KEY IDENTITY(1,1),
	Tags_Pid INT NOT NULL CONSTRAINT FK_Tags_Post_Tags_Pid FOREIGN KEY REFERENCES Post(Pid),
	Tags_Uid INT NOT NULL CONSTRAINT FK_Tags_Users_Tags_Uid FOREIGN KEY REFERENCES Users(Uid),
      CONSTRAINT UNIQUE_Tags UNIQUE(Tags_Pid,Tags_Uid)
)




-- Master table
CREATE TABLE Master
(
Master_id INT NOT NULL CONSTRAINT PK_Master_Master_id PRIMARY KEY IDENTITY(1,1),
Master_Value VARCHAR(20) NOT NULL ,
Master_SubValue VARCHAR(20) NOT NULL
)




/*Added Image Table in database*/
Create table Image
( Imageid int,
  Image nvarchar(MAX) not null CONSTRAINT img CHECK(Image LIKE('%.png')) );

  INSERT INTO Image
  Values
  (1,'img_01.png'),
  (1,'img_02.png'),
  (2,'img_03.png'),
  (2,'img_04.png'),
  (2,'img_05.png'),
  (2,'img_06.png'),
  (3,'img_07.png'),
  (4,'img_08.png'),
  (4,'img_09.png'),
  (5,'img_11.png'),
  (6,'img_12.png'),
  (7,'img_13.png'),
  (8,'img_14.png'),
  (8,'img_15.png'),
  (8,'img_16.png'),
  (9,'img_17.png'),
  (9,'img_18.png')




-- Insert data in master
INSERT INTO Master VALUES
('Visibility','Private'),
('Visibility','Public'),
('Gender','Male'),
('Gender','Female'),
('Gender','Other'),
('Status','Online'),
('Status','Offline'),
 ('Message','Unread'),
('Message','Read'),
('Message','Send')

-- insert into GroupMessageSeen
INSERT INTO [dbo].[GroupMessageSeen]
           ([GroupMessageSeen_Groupid]
           ,[User_Uid]
           ,[Read_Status])
     VALUES
           (1,1,8),
		   (1,3,8),
		   (1,4,8)
GO

--Insert data in Tags
INSERT INTO Tags VALUES 
	(1,2),(2,1),(2,5),(2,4),(3,5),(4,3)

USE [socialmedia]
GO
-- Categories Add,Update,Delete,Display
INSERT INTO [dbo].[Categories]
           ([Category_Name])
     VALUES
           ('Album'),
		   ('Amateur Sports Team'),
		   ('Art'),
		   ('Financial Service'),
		   ('Book'),
		   ('Doctor'),
		   ('Education'),
		   ('Gaming'),
		   ('Hotel'),
		   ('Home Decor'),
		   ('Home Improvement'),
		   ('Internet Company'),
		   ('Kitchen'),
		   ('Library'),
		   ('Movie'),
		   ('Newspaper'),
		    ('Restaurant'),
		   ('School'),
		   ('Song'),
		    ('Traffic School'),
		   ('Visual Arts'),
		   ('Website'),
		   ('Zoo')
GO

INSERT INTO [dbo].[Location]
           ([City]
           ,[State]
           ,[Country])
     VALUES
           ('Bhavnagar'
           ,'Gujarat'
           ,'India'),
		    ('Rajkot'
           ,'Gujarat'
           ,'India'),
		    ('Ahmedabad'
           ,'Gujarat'
           ,'India'),
		    ('Surat'
           ,'Gujarat'
           ,'India'),
		     ('Mumbai'
           ,'Maharashtra'
           ,'India'),
		    ('Pune'
           ,'Maharashtra'
           ,'India')
GO





UPDATE [dbo].[Categories]
   SET [Category_Name] = 'Albums'
 WHERE Category_ID = 26
GO

USE [socialmedia]
GO

DELETE FROM [dbo].[Categories]
      WHERE Category_ID = 27
GO

INSERT INTO [dbo].[Users]
           ([Name]
           ,[Users_Locationid]
           ,[Address]
           ,[Email]
           ,[PhoneNumber]
           ,[Created_date]
           ,[Dateofbirth]
           ,[Visible]
           ,[Password]
           ,[Gender],
           [Status])
     VALUES
('Romish',1,'Address 1','romish@gmail.com',2545874962,GETDATE(),'1999-02-01',0,EncryptByPassPhrase('key', 'romish123' ),3,6),
('Prit',1,'Address 2','prit@gmail.com',7458963215,GETDATE(),'1998-02-01',1,EncryptByPassPhrase('key', 'prit123' ),4,7),
('Vivek',2,'Address 3','Vivek@gmail.com',1205874965,GETDATE(),'1997-02-01',1,EncryptByPassPhrase('key', 'vivek123' ),3,6),
('Neel',2,'Address 4','nell@gmail.com',9657432018,GETDATE(),'1996-02-01',0,EncryptByPassPhrase('key', 'neel135' ),3,6),
('Jay',2,'Address 5','jay@gmail.com',7452013601,GETDATE(),'1995-02-01',0,EncryptByPassPhrase('key', 'jay456' ),3,6),
('Pratik',3,'Address 6','pratik@gmail.com',9658002341,GETDATE(),'1994-02-01',0,EncryptByPassPhrase('key', 'pratik123' ),3,6),
('Karan',4,'Address 7','karan@gmail.com',1234567890,GETDATE(),'1993-02-01',0,EncryptByPassPhrase('key', 'karan147' ),3,6),
('Veera',5,'Address 8','veer@gmail.com',1518960214,GETDATE(),'1992-02-01',0,EncryptByPassPhrase('key', 'veer123' ),3,6),
('Meena',6,'Address 9','meet@gmail.com',7850123604,GETDATE(),'1991-02-01',0,EncryptByPassPhrase('key', 'meet745' ),3,6);
GO



INSERT INTO Chat VALUES
(1,2,'hello','2021-08-19 13:25:52.813'),
(2,1,'hi','2021-08-19 13:26:25.813'),
(2,1,'how are you','2021-08-19 13:26:52.836'),
(1,2,'I am fine','2021-08-19 13:26:53.713'),
(3,4,'HI','2021-08-19 13:27:50.813'),
(3,4,'I am COmputer Engineer','2021-08-19 13:27:55.813'),
(4,3,'Same here','2021-08-19 13:28:32.813'),
(3,4,'I am learning SQL','2021-08-19 13:28:52.813'),
(4,3,'I am learning HTML','2021-08-19 13:29:22.713')




INSERT INTO Chat VALUES
((SELECT DISTINCT FriendRequest_Uid FROM FriendRequest WHERE FriendRequest_Frid = 2) 
,(SELECT DISTINCT FriendRequest_Frid FROM FriendRequest WHERE FriendRequest_Frid = 4),'how are you','2021-08-19 16:22:22.713'),
((SELECT DISTINCT FriendRequest_Frid FROM FriendRequest WHERE FriendRequest_Frid = 4)
 ,(SELECT DISTINCT FriendRequest_Uid FROM FriendRequest WHERE FriendRequest_Uid = 2),'I am fine','2021-08-19 17:22:22.713')


--ADD POST BY FRIEND
	INSERT INTO [dbo].[Post] VALUES
    ('photos','check this post',20,1,1,GETDATE()),
	('like photo','check this post',10,2,3,GETDATE()),
	('educational','post',20,7,4,GETDATE()),
	('pubg','player',31,8,6,GETDATE()),
	('dr.','operation',2,6,5,GETDATE()),
	('new place','check out this post',30,1,4,GETDATE()),
	('sport','fun news',24,2,5,GETDATE()),
	('bajaj','loan work',2,4,5,GETDATE()),
	('decoration','fastival decor',30,23,8,GETDATE())
GO

-- send friend request 
INSERT INTO FriendRequest VALUES 
	(1,5,0,'2021-08-24'),
	(2,6,0,'2021-08-24'),
	(5,4,0,'2021-08-24'),
	(1,2,0,'2020-08-10'),
	(3,4,0,'2020-10-03')

GO




INSERT INTO Groups VALUES
('grp1','this is our college group',2,'2021-01-01'),
('grp2','this is our School group',3,'2021-02-01'),
('grp3','this is our office group',4,'2021-03-01'),
('grp4','this is our Apartment group',5,'2021-04-04'),
('grp5','this is our Friends group',2,'2021-08-05')


INSERT INTO GroupMember VALUES
(1,(SELECT uid FROM Users WHERE Uid = 1),'2021-01-02'),
(1,(SELECT uid FROM Users WHERE Uid = 2),'2021-01-01'),
(1,(SELECT uid FROM Users WHERE Uid = 3),'2021-01-02'),
(1,(SELECT uid FROM Users WHERE Uid = 4),'2021-01-02'),
(2,(SELECT uid FROM Users WHERE Uid = 3),'2021-02-01'),
(2,(SELECT uid FROM Users WHERE Uid = 5),'2021-02-02'),
(2,(SELECT uid FROM Users WHERE Uid = 6),'2021-02-02'),
(5,(SELECT uid FROM Users WHERE Uid = 4),'2021-08-06'),
(5,(SELECT uid FROM Users WHERE Uid = 5),'2021-08-06'),
(5,(SELECT uid FROM Users WHERE Uid = 2),'2021-08-05')

INSERT INTO GroupMessage([GroupMessage_Groupid],GroupMessage_Uid,Message) VALUES
(1,(SELECT [GroupMember_Uid] FROM GroupMember WHERE Group_id = 1 AND [GroupMember_Uid] = 2 ),'hello every one'),
(1,(SELECT [GroupMember_Uid] FROM GroupMember WHERE Group_id = 1 AND [GroupMember_Uid] = 3 ),'hi how are you'),
(2,(SELECT [GroupMember_Uid] FROM GroupMember WHERE Group_id = 2 AND [GroupMember_Uid] = 3 ),'hello'),
(2,(SELECT [GroupMember_Uid] FROM GroupMember WHERE Group_id = 2 AND [GroupMember_Uid] = 5 ),'good morning'),
(2,(SELECT [GroupMember_Uid] FROM GroupMember WHERE Group_id = 2 AND [GroupMember_Uid] = 6 ),'good evening'),
(5,(SELECT [GroupMember_Uid] FROM GroupMember WHERE Group_id = 5 AND [GroupMember_Uid] = 4 ),'happy journey'),
(5,(SELECT [GroupMember_Uid] FROM GroupMember WHERE Group_id = 5 AND [GroupMember_Uid] = 5 ),'take care'),
(5,(SELECT [GroupMember_Uid] FROM GroupMember WHERE Group_id = 5 AND [GroupMember_Uid] = 5 ),'Good night')




/* Comment table */


INSERT INTO Comment
Values
('Nice Pic',1,2),
('Beautifull',2,3),
('Great Picture',2,4),
('Good',5,3),
('Nice Place',3,6)

-- update
update Users
set Visible = 1 
where Uid IN (6,7)
UPDATE Chat
SET Msg = 'I am creating database of Social media'
WHERE msg_time = '2021-08-19 13:29:22.713'

--UPDATE POST LIKE
DECLARE @POSTID INT
SET @POSTID = 1
UPDATE Post SET Likes = Likes + 1 WHERE Pid = @POSTID

--select

SELECT Category_Name 'Categories' FROM Categories ORDER BY Category_Name
select * from Users
--Decrypt
Select Name,City,Email,PhoneNumber,convert(varchar(100),DecryptByPassPhrase('key',Password )) as Password from Users


-- add dob in users
ALTER TABLE Users ADD dateofbirth DATE


-- location
SELECT * FROM dbo.Location

-- added data for user status column
ALTER TABLE Users
ADD Status int CONSTRAINT chk_status FOREIGN KEY REFERENCES Master(Master_id)

ALTER TABLE Users
ADD CONSTRAINT status_check CHECK(Status IN (6,7))

UPDATE Users
SET Status = 6 WHERE Uid = 1

UPDATE Users
SET Status = 6 WHERE Uid IN (2,3,5,8)

UPDATE Users
SET Status = 7 WHERE Uid IN (4,6,7,9)


  /*Deleted image column from post and updated image table*/

Alter table post
DROP constraint post_Image

Alter table post
DROP column Image

ALTER TABLE Image
ADD CONSTRAINT Ipid FOREIGN KEY (Imageid) REFERENCES POST(Pid)


ALTER TABLE Users
DROP CONSTRAINT employees_Gender

UPDATE Users
SET Gender = 3 WHERE Gender = 'M'


UPDATE Users
SET Gender = 4 WHERE Gender = 'F'


UPDATE Users
SET Gender = 5 WHERE Gender = 'O'

ALTER TABLE Users
ADD CONSTRAINT gender_ckh check(Gender IN(3,4,5)) 


ALTER TABLE Users
DROP CONSTRAINT employees_date


UPDATE Users
SET Visible = 2 WHERE Visible = 1

UPDATE Users
SET Visible = 1 WHERE Visible = 0


ALTER TABLE Users
ADD CONSTRAINT visibility_chk check(Visible IN(1,2))
/*Updated Image table*/

ALTER TABLE Image
ALTER COLUMN Imageid INT NOT NULL

Alter table Image
DROP constraint Ipid

ALTER TABLE Image
ADD CONSTRAINT Ipid FOREIGN KEY (Imageid) REFERENCES POST(Pid) ON DELETE CASCADE ON UPDATE CASCADE


--add columns in FriendRequest
 ALTER TABLE FriendRequest ALTER COLUMN FriendStatus bit  not null 
 ALTER TABLE FriendRequest ADD  Requested_Date DATE  not null DEFAULT GETDATE()
 ALTER TABLE FriendRequest ADD  Approved_Date DATE  null

ALTER TABLE Tags
ADD CONSTRAINT UNIQUE_Tags UNIQUE(Tags_Pid,Tags_Uid)