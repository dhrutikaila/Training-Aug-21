
--DISPLAY ALL POST 
SELECT P.Pid,P.Description,P.Likes,P.Title FROM Post P JOIN Users U ON P.Post_Uid = U.Uid 
WHERE U.Visible = 1


--DISPLAY ALL POST FOR ONLY FRIEND
SELECT P.Pid,P.Description,P.Likes,P.Title FROM Post P JOIN FriendRequest FR ON P.Post_Uid = FR.FriendRequest_Uid
WHERE Post_Uid IN 
(SELECT Uid FROM  Users WHERE  Uid  IN 
(Select DISTINCT FriendRequest_Uid FROM  FriendRequest WHERE FriendRequest_Frid = 1 AND FriendStatus = 1)
OR  Uid  IN (Select DISTINCT FriendRequest_Frid FROM
FriendRequest WHERE FriendRequest_Uid  = 1 AND FriendStatus = 1))


--DISPLAY POST BUT CATAGORIES VISE 
SELECT P.Pid,P.Description,P.Likes,P.Title FROM Post P JOIN Categories C ON 
P.Post_Category_ID = C.Category_ID where C.Category_Name = 'Album'


--UN FRIEND NEEL AND JAY 
UPDATE FriendRequest 
SET FriendStatus=0  WHERE FriendRequest_Uid = (SELECT Uid FROM Users WHERE Name='Neel') AND
  FriendRequest_Frid = (SELECT uid FROM Users WHERE Name='Jay')


--TODAY'S Tranding post like vias
SELECT P.Pid,P.Title,P.Likes,P.Post_Date FROM Post P WHERE P.Post_Date = CONVERT(DATE,GETDATE())  ORDER BY P.Likes DESC


--Display 18+ user name
SELECT Name AS '18+ NAME',DATEDIFF(YY,dateofbirth,getdate()) as age FROM Users WHERE DATEDIFF(YY,dateofbirth,getdate())>18


--Less than 18 to not show album , financial service,home improvement etc. like categories post

SELECT * FROM Post WHERE Post_Category_ID IN 
(SELECT Category_ID FROM Categories WHERE Category_Name NOT IN ('album','financial service','home improvement'))
AND (SELECT DATEDIFF(YY,dateofbirth,GETDATE()) FROM Users WHERE Uid = 9)<18


--Search post by name of user
SELECT P.Pid,P.Title,P.Likes FROM Post P JOIN Users U ON U.Uid = P.Post_Uid WHERE U.Name = 'Jay'


--search post by categories name
SELECT P.Pid,P.Title,P.Likes FROM Post P JOIN Categories C ON C.Category_ID = P.Post_Category_ID
WHERE C.Category_Name = 'Album'


--Count of Tags par post
SELECT Tags_Pid,COUNT(Tags_Pid) AS 'count tag per post' FROM Tags GROUP BY Tags_Pid


--which user how many tags added

SELECT U.Name, SUM([COUNT_C]) FROM (SELECT Tags_Pid,COUNT(Tags_Pid) AS [COUNT_C] FROM Tags GROUP BY Tags_Pid)TAMP JOIN Post P 
ON TAMP.TAGS_PID=P.Pid JOIN Users U ON P.Post_Uid = U.Uid GROUP BY U.Name


-- Dispaly friend request by id
SELECT a.Name,a.Uid FROM Users a JOIN FriendRequest b ON a.Uid = b.FriendRequest_Frid WHERE b.FriendRequest_Uid = 1  


-- change 0 or 1
--  Acceapte Request
update [FriendRequest]
  set FriendStatus =1,Approved_Date=('2020-12-10')
  where FriendRequestid in (5,8)



-- friend suggestions 
SELECT Name,Uid FROM  Users WHERE  Uid <>1  AND Uid  IN (Select DISTINCT FriendRequest_Uid FROM 
FriendRequest WHERE  FriendStatus  =1 AND FriendRequest_Frid  
IN(SELECT FriendRequest_Frid FROM FriendRequest WHERE FriendRequest_Uid  =1 AND FriendStatus  =1)) OR Uid 
IN (Select DISTINCT FriendRequest_Frid FROM  FriendRequest WHERE  FriendStatus  =1 AND FriendRequest_Uid  
IN(SELECT FriendRequest_Frid FROM FriendRequest WHERE FriendRequest_Uid  =1 AND FriendStatus =1)) 



--highest post in categories
SELECT DENSE_RANK() OVER(ORDER BY COUNT(P.PID) DESC) as 'rank',C.Category_Name,COUNT(P.Pid) FROM Categories C  JOIN Post P ON C.Category_ID = P.Post_Category_ID
GROUP BY Category_Name