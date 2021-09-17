Select * FROM Likebyuser


--add like by users
DECLARE @POSTID INT
SET @POSTID = 4
UPDATE Post SET Likes = Likes + 1 WHERE Pid = @POSTID
INSERT INTO Likebyuser VALUES(@POSTID,1) 
UPDATE Post SET Likes = Likes + 1 WHERE Pid = 4
INSERT INTO Likebyuser VALUES(4,2) 

-- delete dislike by user
UPDATE Post SET Likes = Likes - 1 WHERE Pid = 4 AND Likes  <>0
DELETE Likebyuser WHERE LikebyUser_Pid = 4 AND LikebyUser_Uid = 1

--display post like by user
SELECT * FROM Post WHERE Pid IN(SELECT LikebyUser_Pid FROM Likebyuser WHERE LikebyUser_Uid = 1)


-- who likes the post 
SELECT a.Name,a.Uid FROM Users a JOIN Likebyuser b ON a.Uid = b.LikebyUser_Uid WHERE LikebyUser_Pid = 3


-- display your post like by  your friends .
   SELECT a.Pid,a.Title,a.Description,c.Image,a.Likes,b.Category_Name,a.Post_Date,a.Post_Uid
   FROM Post a JOIN Categories b ON a.Post_Category_ID = b.Category_ID JOIN Image c ON c.Imageid = a.Pid
   WHERE b.Category_ID IN (SELECT a.Post_Category_ID FROM POST a JOIN
   Likebyuser b ON a.Pid = b.LikebyUser_Pid WHERE b.LikebyUser_Uid = 2) 


-- friends of friends like . display recommended post like by your friend 
 with  friendss(Uid)
  AS
  (SELECT Uid FROM  Users WHERE  Uid  IN 
(Select DISTINCT FriendRequest_Uid FROM  FriendRequest WHERE FriendRequest_Frid = 1 AND FriendStatus = 1)
OR  Uid  IN (Select DISTINCT FriendRequest_Frid FROM 
FriendRequest WHERE FriendRequest_Uid  = 1 AND FriendStatus = 1))
,
friendoffriend(Uid) AS 
(SELECT Uid FROM  Users WHERE  Uid  IN 
(Select DISTINCT FriendRequest_Uid FROM  FriendRequest WHERE FriendRequest_Frid IN (SELECT Uid FROM friendss)
AND FriendStatus = 1 AND FriendRequest_Uid <> 1)
OR  Uid  IN (Select DISTINCT FriendRequest_Frid FROM 
FriendRequest WHERE FriendRequest_Uid  IN (SELECT Uid FROM friendss)
AND FriendStatus = 1 AND FriendRequest_Frid <> 1))

SELECT a.Pid,a.Title,a.Description,c.Image,a.Likes,b.Category_Name,a.Post_Date,a.Post_Uid
FROM Post a JOIN Categories b
ON a.Post_Category_ID = b.Category_ID JOIN Image c ON c.Imageid = a.Pid
WHERE
a.Pid IN(SELECT LikebyUser_Pid FROM Likebyuser WHERE LikebyUser_Uid IN (SELECT Uid FROM friendoffriend))

--
--  acceapt request .
UPDATE FriendRequest SET FriendStatus = 1, Approved_Date = GETDATE() WHERE FriendRequest_Uid = 1 AND FriendRequest_Frid = 5

--  reject request .
UPDATE FriendRequest SET FriendStatus = 0, Approved_Date = GETDATE() WHERE FriendRequest_Uid = 1 AND FriendRequest_Frid = 5

-- request apporoved .
SELECT FriendRequest_Frid  FROM FriendRequest WHERE FriendStatus = 1 AND FriendRequest_Uid = 1

-- requested friend .
SELECT FriendRequest_Frid  FROM FriendRequest WHERE FriendStatus = 0 AND FriendRequest_Uid = 0

-- my all friends .
SELECT Name,Uid FROM  Users WHERE  Uid  IN 
(Select DISTINCT FriendRequest_Uid FROM  FriendRequest WHERE FriendRequest_Frid = 1 AND FriendStatus = 1)
OR  Uid  IN (Select DISTINCT FriendRequest_Frid FROM
FriendRequest WHERE FriendRequest_Uid  = 1 AND FriendStatus = 1)


-- friends of friends .
  with  friends(Uid)
  AS
  (SELECT Uid FROM  Users WHERE  Uid  IN 
(Select DISTINCT FriendRequest_Uid FROM  FriendRequest WHERE FriendRequest_Frid = 1 AND FriendStatus = 1)
OR  Uid  IN (Select DISTINCT FriendRequest_Frid FROM 
FriendRequest WHERE FriendRequest_Uid  = 1 AND FriendStatus = 1))

SELECT Uid FROM  Users WHERE  Uid  IN 
(Select DISTINCT FriendRequest_Uid FROM  FriendRequest WHERE FriendRequest_Frid IN (SELECT Uid FROM friends)
AND FriendStatus = 1 AND FriendRequest_Uid <> 1)
OR  Uid  IN (Select DISTINCT FriendRequest_Frid FROM 
FriendRequest WHERE FriendRequest_Uid  IN (SELECT Uid FROM friends)
AND FriendStatus = 1 AND FriendRequest_Frid <> 1)


-- friend anniversary 
SELECT DATEDIFF(YEAR,Approved_Date,GETDATE()) 'years of friend anniversary' FROM FriendRequest WHERE DATEDIFF(YEAR,Approved_Date,GETDATE()) >=1


-- diffent of friend req. is approved
SELECT DATEDIFF(DAY,Requested_Date,Approved_Date) FROM FriendRequest


-- time of friend req. is approved
SELECT DATEDIFF(DAY,Approved_Date,GETDATE()) FROM FriendRequest


--Today's birthday 
SELECT DATEDIFF(dd,Dateofbirth,GETDATE())/365 as age,  'Happy Birthday ' +
Name as HappyBirth	day  FROM Users WHERE 
DATEPART(mm,GETDATE())-DATEPART(mm,Dateofbirth)=0 
AND DATEPART(dd,GETDATE())-DATEPART(dd,Dateofbirth)=0


-- Your Friend's Birthday (Today)
SELECT DATEDIFF(dd,Dateofbirth,GETDATE())/365 as age, 
Name as HappyBirthday  FROM Users WHERE 
DATEPART(mm,GETDATE())-DATEPART(mm,Dateofbirth)=0 
AND DATEPART(dd,GETDATE())-DATEPART(dd,Dateofbirth)=0 AND Uid
IN(SELECT Uid FROM  Users WHERE  Uid  IN 
(Select DISTINCT FriendRequest_Uid FROM  
FriendRequest WHERE FriendRequest_Frid = 3 AND FriendStatus = 1)
OR  Uid  IN (Select DISTINCT FriendRequest_Frid FROM
FriendRequest WHERE FriendRequest_Uid  = 3 AND FriendStatus = 1))
