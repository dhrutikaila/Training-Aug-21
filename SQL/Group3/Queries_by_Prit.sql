-- chat between two friends

DECLARE @Sender int
SET @Sender = 1

DECLARE @Receiver int
SET @Receiver = 2

SELECT
	(SELECT u.Name FROM Users u WHERE u.Uid = c.Sender) as 'Sender', 
	(SELECT u.Name FROM Users u WHERE u.Uid = c.Receiver) as 'Receiver', 
	c.Msg
FROM Chat c
WHERE (Sender = @Sender AND Receiver = @Receiver) OR (Sender = @Receiver AND Receiver = @Sender)
ORDER BY msg_time




-- Display category name of user post

SELECT c.Category_Name FROM Categories c
	INNER JOIN Post p ON p.Post_Category_ID = c.Category_ID
	INNER JOIN Users u ON u.Uid = p.Post_Uid
WHERE u.Name = 'Vivek'



-- Display mutual friends

SELECT u.Name FROM Users u WHERE u.Uid IN 
(
(SELECT fa.FriendRequest_Frid FROM FriendRequest fa
WHERE fa.FriendRequest_Uid = 2
UNION
SELECT fa.FriendRequest_Uid FROM FriendRequest fa
WHERE fa.FriendRequest_Frid = 2)

INTERSECT

(SELECT fa.FriendRequest_Frid FROM FriendRequest fa
WHERE fa.FriendRequest_Uid = 5
UNION
SELECT fa.FriendRequest_Uid FROM FriendRequest fa
WHERE fa.FriendRequest_Frid = 5)
)



-- All users with its category name of Post

SELECT u.Name,p.Pid,p.Title,c.Category_ID,c.Category_Name FROM Users u
	LEFT JOIN Post p ON p.Post_Uid = u.Uid
	LEFT JOIN Categories c ON c.Category_ID = p.Post_Category_ID



-- List of friends count display

SELECT COUNT(*) FROM 
(SELECT f.FriendRequest_Uid,f.FriendRequest_Frid,f.FriendStatus FROM FriendRequest f
	LEFT JOIN Users u ON f.FriendRequest_Uid = u.Uid
WHERE u.Name = 'Prit'
UNION
SELECT f.FriendRequest_Uid,f.FriendRequest_Frid,f.FriendStatus FROM FriendRequest f
	LEFT JOIN Users u ON f.FriendRequest_Frid = u.Uid
WHERE u.Name = 'Prit') temp
WHERE FriendStatus = 1



-- List of users who have not posted anything

SELECT Name,Uid FROM Users
WHERE uid NOT IN (SELECT Post_uid FROM Post)



-- Number of Post of all users

SELECT COUNT(Pid) as 'no. of post',
		Post_Uid,
		(SELECT Name FROM Users WHERE Uid = Post.Post_Uid) as 'Name' 
FROM Post 
GROUP BY Post_Uid



-- List of users with 0 friends

SELECT Uid FROM Users 
WHERE Uid NOT IN (SELECT FriendRequest_Uid FROM FriendRequest UNION SELECT FriendRequest_Frid FROM FriendRequest)



-- Users with total friends 

SELECT FriendRequest_Uid as 'userID',COUNT(FriendRequest_Frid) FROM 
(SELECT f.FriendRequest_Uid,f.FriendRequest_Frid,f.FriendStatus as 'fs' FROM FriendRequest f) temp
WHERE fs = 1
GROUP BY FriendRequest_Uid
UNION
SELECT FriendRequest_Frid as 'UserID',COUNT(FriendRequest_Uid) FROM 
(SELECT f.FriendRequest_Uid,f.FriendRequest_Frid,f.FriendStatus as 'fs' FROM FriendRequest f) temp
WHERE fs = 1
GROUP BY FriendRequest_Frid


-- OR  
SELECT FriendRequest_Uid as 'userID',COUNT(FriendRequest_Frid) FROM  FriendRequest
WHERE friendstatus = 1
GROUP BY FriendRequest_Uid
UNION
SELECT FriendRequest_Frid as 'userID',COUNT(FriendRequest_Uid) FROM  FriendRequest
WHERE friendstatus = 1
GROUP BY FriendRequest_Frid





-- Display username with max like on photo and users photo belongs to category name starts with A

SELECT TOP 1 u.name as 'name',MAX(p.Likes) as 'max_like' FROM Users u
	JOIN Post p ON p.Post_Uid = u.Uid
	JOIN Categories c ON c.Category_ID = p.Post_Category_ID
WHERE c.Category_Name LIKE 'A%'
GROUP BY u.Name
ORDER BY max_like DESC



-- List of users commented on Neel's post

SELECT c.Comment_Uid,u.Name FROM Comment c
	JOIN Users u ON u.Uid = c.Comment_Uid
WHERE c.Comment_Pid IN (SELECT p.Pid FROM Post p WHERE p.Post_Uid = (SELECT Uid FROM Users WHERE Name = 'Neel'))



-- Name of user on which Romish commented

SELECT u.Name FROM Users u
WHERE u.Uid IN 
( SELECT p.Post_Uid FROM Post p WHERE p.Pid IN 
(SELECT c.Comment_Pid FROM Comment c WHERE c.Comment_Uid = (SELECT Uid FROM Users WHERE Name = 'Romish')))




-- Queries for group chat


-- Query to see names of all groups

SELECT grp_name,GroupId FROM Groups 



-- chat of group 1

SELECT m.Message,u.Name FROM GroupMessage m
	JOIN Users u ON u.Uid = m.GroupMessage_Uid
WHERE m.grp_id = 1



-- Members of groupid 5

SELECT gm.GroupMember_Uid,u.Name FROM GroupMember gm
	JOIN Users u ON u.Uid = gm.GroupMember_Uid
WHERE gm.Group_id = 5



-- name of all members with group name 

SELECT * FROM GroupMember gm
	JOIN Users u ON u.Uid = gm.GroupMember_Uid



-- display user name who is in more than 1 group

SELECT u.Name FROM Users u
	JOIN GroupMember m ON m.GroupMember_Uid = u.Uid
GROUP BY u.Name
HAVING COUNT(m.Group_id) > 1



-- Name of group with no members

SELECT g.grp_name,g.GroupId FROM Groups g
WHERE g.GroupId NOT IN (SELECT gm.Group_id FROM GroupMember gm)



-- Group with max members

SELECT * FROM 
(SELECT DENSE_RANK() OVER(ORDER BY COUNT(g.GroupId) DESC) as 'rank',g.grp_name,COUNT(g.GroupId) as 'totalMember' FROM Groups g
	JOIN GroupMember gm ON gm.Group_id = g.GroupId
GROUP BY g.grp_name) temp
WHERE rank = 1



-- Group message not seen by group memners
SELECT u.Name FROM GroupMessageSeen ms
	JOIN Users u ON u.Uid = ms.User_Uid
WHERE ms.Read_Status = 8