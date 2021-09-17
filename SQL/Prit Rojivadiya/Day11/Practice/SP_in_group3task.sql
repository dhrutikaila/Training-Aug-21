-- Stored Procedure to see chat between friends

CREATE PROCEDURE chatBetweenFriends
@Sender int,
@Receiver int
AS
SELECT
	(SELECT u.Name FROM Users u WHERE u.Uid = c.Sender) as 'Sender', 
	(SELECT u.Name FROM Users u WHERE u.Uid = c.Receiver) as 'Receiver', 
	c.Msg
FROM Chat c
WHERE (Sender = @Sender AND Receiver = @Receiver) OR (Sender = @Receiver AND Receiver = @Sender)
ORDER BY msg_time

EXEC chatBetweenFriends 2,4



-- Stored Procedure to see mutual friends

CREATE PROCEDURE mutual_friends
@friend1 int,
@friend2 int
AS
SELECT u.Name FROM Users u WHERE u.Uid IN 
(
(SELECT fa.FriendRequest_Frid FROM FriendRequest fa
WHERE fa.FriendRequest_Uid = @friend1
UNION
SELECT fa.FriendRequest_Uid FROM FriendRequest fa
WHERE fa.FriendRequest_Frid = @friend1)

INTERSECT

(SELECT fa.FriendRequest_Frid FROM FriendRequest fa
WHERE fa.FriendRequest_Uid = @friend2
UNION
SELECT fa.FriendRequest_Uid FROM FriendRequest fa
WHERE fa.FriendRequest_Frid = @friend2)
)

EXEC mutual_friends 2,5



-- Stored procedure to see total friends of user

CREATE PROCEDURE totalFriends
@name varchar(20)
AS
SELECT COUNT(*) as 'TotalFriends' FROM 
(SELECT f.FriendRequest_Uid,f.FriendRequest_Frid,f.FriendStatus FROM FriendRequest f
	JOIN Users u ON f.FriendRequest_Uid = u.Uid
WHERE u.Name = @name
UNION
SELECT f.FriendRequest_Uid,f.FriendRequest_Frid,f.FriendStatus FROM FriendRequest f
	JOIN Users u ON f.FriendRequest_Frid = u.Uid
WHERE u.Name = @name) temp
WHERE FriendStatus = 1

EXEC totalFriends 'Prit'



-- Stored procedure to see the chat of any group

CREATE PROCEDURE grpChat
@groupid int
AS
SELECT m.Message,u.Name FROM GroupMessage m
	JOIN Users u ON u.Uid = m.GroupMessage_Uid
WHERE m.grp_id = @groupid

EXEC grpChat 2



-- Stored procedure to get number of members of any group

CREATE PROCEDURE grpMembers
@groupId int
AS 
SELECT gm.GroupMember_Uid,u.Name FROM GroupMember gm
	JOIN Users u ON u.Uid = gm.GroupMember_Uid
WHERE gm.Group_id = @groupId

EXEC grpMembers 5



-- Stored procedure to retrieve	all comments of particular users post

CREATE PROCEDURE commentsOnUserPost
@user varchar(20)
AS
SELECT c.Comment_Uid,u.Name FROM Comment c
	JOIN Users u ON u.Uid = c.Comment_Uid
WHERE c.Comment_Pid IN (SELECT p.Pid FROM Post p WHERE p.Post_Uid = (SELECT Uid FROM Users WHERE Name = @user))

EXEC commentsOnUserPost 'Neel'



-- Store procedure to get list of all users with their total friends

CREATE PROCEDURE userFriends
AS
SELECT FriendRequest_Uid as 'userID',COUNT(FriendRequest_Frid) as 'totalFriends' FROM  FriendRequest
WHERE friendstatus = 1
GROUP BY FriendRequest_Uid
UNION
SELECT FriendRequest_Frid as 'userID',COUNT(FriendRequest_Uid) as 'totalFriends' FROM  FriendRequest
WHERE friendstatus = 1
GROUP BY FriendRequest_Frid

EXEC userFriends



-- Stored procedure to unfriend

CREATE PROCEDURE unfriend
@friend1 varchar(20),
@friend2 varchar(20)
AS
UPDATE FriendRequest 
SET FriendStatus=0  
WHERE (FriendRequest_Uid = (SELECT Uid FROM Users WHERE Name=@friend1) AND FriendRequest_Frid = (SELECT uid FROM Users WHERE Name=@friend2))
OR (FriendRequest_Frid = (SELECT Uid FROM Users WHERE Name=@friend1) AND FriendRequest_Uid = (SELECT uid FROM Users WHERE Name=@friend2))

EXEC unfriend 'Neel','Jay'



-- display name of all friends of user

CREATE PROCEDURE FriendsName
@name varchar(20)
AS
SELECT name FROM Users WHERE Uid IN
(SELECT FriendRequest_Frid FROM FriendRequest WHERE FriendStatus = 1 AND FriendRequest_Uid = 
(SELECT uid FROM users WHERE name = @name))
OR
Uid IN
(SELECT FriendRequest_Uid FROM FriendRequest WHERE FriendStatus = 1 AND FriendRequest_Frid = 
(SELECT uid FROM users WHERE name = @name))

EXEC FriendsName 'Romish'
EXEC FriendsName 'Prit'



-- Stored procedure to display name of users who are tagged in particular post

CREATE PROCEDURE taggedUsers
@postid int
AS
 SELECT name FROM Users WHERE Uid in 
(SELECT Tags_Uid FROM Tags WHERE Tags_Pid = 2)

EXEC taggedUsers 2

/*
SELECT u.Name FROM Users u
	JOIN Post p ON p.Post_Uid = u.Uid
WHERE p.Pid = 2
*/



-- stored procedure to display users from particular state

CREATE PROCEDURE userFromState
@state varchar(20)
AS
SELECT Name,State
FROM Users
JOIN Location
ON Users.Users_Locationid = Location.Locationid
WHERE Location.State = @state

EXEC userFromState 'Gujarat'