/*1. Write a query to display all details of private account */

SELECT * FROM Users WHERE Visible = 1;


/*2. Write query to display total account from perticular city */

SELECT COUNT(uid) "Account",City 
FROM Users 
JOIN Location
ON Users.Users_Locationid = Location.Locationid
GROUP BY city ORDER BY Account DESC


/*3. Write a query to display name and city of users who are from rajkot or Mumbai*/

SELECT Name,city
FROM Users
JOIN Location
ON Users.Users_Locationid = Location.Locationid
WHERE Location.City IN ('Rajkot','Mumbai')


/*4. write a query to display category name start with H*/

SELECT category_name FROM Categories WHERE Category_Name LIKE 'H%'


/*5. Write a query to display title of post and catagary name of user neeel*/

SELECT name,Title,Category_Name 
FROM Users
JOIN Post
ON Users.Uid=post.Post_Uid
JOIN Categories
ON Categories.Category_ID = post.Post_Category_ID
WHERE Users.Name = 'Neel'


/*6. write a query to display friend name of user Romish*/

SELECT name FROM Users WHERE Uid IN
(SELECT FriendRequest_Frid FROM FriendRequest WHERE FriendStatus = 1 AND FriendRequest_Uid = 
(SELECT uid FROM users WHERE name = 'Romish'))
OR
Uid IN
(SELECT FriendRequest_Uid FROM FriendRequest WHERE FriendStatus = 1 AND FriendRequest_Frid = 
(SELECT uid FROM users WHERE name = 'Romish'))


/*7. write a query to display all the message send by prit*/

SELECT Msg FROM Chat
JOIN Users
ON users.Uid = chat.Sender
WHERE name = 'Prit' 


/*8. write a query to display catagory all categories used by user order by category name*/

SELECT Category_Name FROM Categories WHERE Category_ID IN (SELECT Post_Category_ID FROM Post) ORDER BY Category_Name


/*9. write a query display category name which is never possted by any user*/

SELECT category_ID, category_name FROM Categories WHERE Category_ID NOT IN (SELECT Post_Category_ID FROM post)


/*10. Write a query to display comment made by Prit*/

SELECT Comment_Text FROM Comment WHERE Comment_Uid = 
(SELECT Uid FROM users WHERE name = 'Prit')


/*11. Write a query to display comment made on vivek's post*/

SELECT comment_text FROM comment WHERE Comment_Pid IN 
(SELECT pid FROM post WHERE Post_Uid = 
(SELECT uid FROM users WHERE name = 'vivek'))


/*12. Write a query to display comment made on pratik's post with username*/

SELECT comment_text,name FROM comment 
JOIN users 
ON Comment.Comment_Uid = Users.Uid 
WHERE Comment_Pid IN 
(SELECT pid FROM post WHERE Post_Uid = 
(SELECT uid FROM users WHERE name = 'pratik'))


/*13. Write a query to display a name of user with post title on which maximum comments are made*/

SELECT Users.Uid,Users.name,Post.pid,Post.title 
FROM Post 
JOIN Users
ON Post.Post_Uid = Users.Uid
WHERE Post.Pid = 
(SELECT Comment_Pid FROM 
(SELECT TOP 1 COUNT(Comment_Pid) "comment",Comment_Pid 
FROM comment GROUP BY Comment_Pid ORDER BY comment DESC )temp)


/*14. Write a query to display Groupid,Group name and group members name which is created by prit */

SELECT group_id, grp_name,users.Name "GroupMembers" FROM users 
JOIN GroupMember
ON GroupMember.GroupMember_Uid = Users.Uid
JOIN Groups
ON Groups.GroupId = GroupMember.Group_id
WHERE groups.Created_By = (SELECT Uid FROM users WHERE name = 'prit')


/*15. Write a query to display all image of romish's post*/

SELECT * FROM Image WHERE Imageid IN 
(SELECT pid FROM post WHERE Post_Uid = 
(SELECT uid FROM Users WHERE name = 'Romish'))


/*16. write a query to display a name of users who are taged in viveks post*/
 SELECT name FROM Users WHERE Uid in 
(SELECT Tags_Uid FROM Tags WHERE Tags_Pid = 
(SELECT pid FROM post WHERE Post_Uid = (SELECT uid FROM users WHERE name = 'Vivek')))
