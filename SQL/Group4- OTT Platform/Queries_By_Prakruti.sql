
USE group_task

WITH object_cte (Object_Id,Type_ID,Object_Type,Value)
As
(
SELECT ov.Object_Id,ot.Type_ID,ot.Object_Type,ov.Value
FROM Object_Type ot JOIN Object_values ov
ON ot.Type_ID=ov.Type_ID
)
SELECT * INTO Temp FROM object_cte

--1. List the number of actors in each country (sort the data in high to low)

SELECT Number_of_Actors = Count(Actor_ID), Country = Nationality FROM Actors
GROUP BY Nationality ORDER BY Number_of_actors DESC

--2. List the movies with Genre as Drama and IMDB Rating greater than 8

SELECT c.Name, c.Genre, r.IMDB_Rating
FROM Collection_of_shows c JOIN Movies m
ON c.Show_ID = m.Show_ID
JOIN Rating r ON c.Show_ID=r.Show_ID
WHERE r.IMDB_Rating>8 AND c.Genre IN
(SELECT Object_Id FROM Temp WHERE Object_ID=14)


--3. List the Web_shows Name, showid Creator, where Creator is ‘Julie Plec’

SELECT w.Show_ID, Title=c.Name, d.Director_Name
FROM Collection_of_shows c 
JOIN Web_Shows w ON c.Show_ID = w.Show_ID
JOIN Director_show ds ON c.Show_ID=ds.Show_Id
JOIN Director d ON ds.Director_ID=d.Director_ID
WHERE d.Director_ID=42

--4. List the web shows where Seasons are more than 2 and episodes less than 20 along with the names of creators

SELECT c.Name,d.Director_Name,w.Season,w.Episodes
FROM Collection_of_shows c 
JOIN Web_Shows w ON c.Show_ID = w.Show_ID
JOIN Director_show ds ON c.Show_ID=ds.Show_Id
JOIN Director d ON ds.Director_ID=d.Director_ID
WHERE w.Season>2 OR Episodes<20

--5. List the show id, Title, Director, IMDB Rating of movies where Duration is less than 2 hours 

SELECT c.Show_ID,Title=c.Name,d.Director_Name,r.IMDB_Rating
FROM Collection_of_shows c JOIN Movies m
ON c.Show_ID=m.Show_ID
JOIN Rating r ON c.Show_ID=r.Show_ID
JOIN Director_show ds ON c.Show_ID=ds.Show_Id
JOIN Director d ON ds.Director_ID=d.Director_ID
WHERE m.Duration<2 

--6. List the movies starring a male actor having age less than or equal to 40 , having genre Sci-Fi and Maturity rating of 13+

SELECT Movies=c.Name
FROM Collection_of_shows c JOIN Movies m 
ON c.Show_ID=m.Show_ID
JOIN Actor_Work aw
ON m.Show_ID=aw.Show_ID
JOIN Actors a ON a.Actor_ID=aw.Actor_ID
WHERE Maturity_Age=13 AND a.Age<=40 AND Genre IN
(SELECT Object_Id FROM Temp WHERE Object_ID=20)


--7. List the showid, title, director, production companies, budget of the movies where budget is less than 10 million and IMDB Rating more than 5

SELECT c.Show_ID, c.Name, d.Director_Name,p.Production_Name FROM Collection_of_shows c 
JOIN movies m ON c.Show_ID=m.Show_ID 
JOIN Rating r ON c.Show_ID=r.Show_ID 
JOIN Production_show ps ON ps.Show_ID=c.Show_ID 
JOIN Production p ON p.Production_ID=ps.Production_ID
JOIN Director_show ds ON c.Show_ID=ds.Show_Id
JOIN Director d ON ds.Director_ID=d.Director_ID
WHERE Budget < 10000000 AND IMDB_Rating>5

--8. List the showid, title, duration, subtitles, languages with language as Spanish and Subtitles as English and duration is greater than 1.5 hours
SELECT c.Show_ID,Title=c.Name,c.Subtitles,c.Language,m.Duration
FROM Collection_of_shows c JOIN Movies m
ON c.Show_ID = m.Show_ID
WHERE c.Language IN
(SELECT Object_Id FROM Temp WHERE OBJECT_ID=25)
OR c.Subtitles IN
(SELECT Object_Id FROM Temp WHERE OBJECT_ID=25) 
AND m.Duration>1.5

-- 9. List the Subscribers details who have chosen a 6 monthly subscription and who prefer Hindi language.
SELECT Name=s.FirstName+Space(1)+s.LastName, s.Email_ID, s.Age,s.Phone_Number,lp.Language, s.Subscription_Plan
FROM Subscribers s JOIN Language_Preference lp
ON s.Subscribers_ID = lp.Subscribers_ID
WHERE lp.Language IN
(SELECT Object_Id FROM Temp WHERE Object_ID=26)
AND s.Subscription_plan IN
(SELECT Object_Id FROM Temp WHERE Object_ID=5)


--10.  List the details of subscribers who have a yearly ongoing subscription plan along with their payment type as 'Debit Card'
SELECT * FROM 
(SELECT (s.FirstName+ ' ' + s.LastName)Name,s.Email_ID,s.Age,s.Phone_Number,p.Payment_Type, p.Invoice_Date,
Plan_Valid_Till = CASE 
WHEN Subscription_Plan ='6' THEN DATEADD(MONTH,12, p.Invoice_Date) END
FROM Payment p JOIN Subscribers s 
ON p.Subscribers_ID=s.Subscribers_ID )temp
WHERE (temp.Plan_Valid_Till > GETDATE()) AND Payment_Type IN 
(SELECT OBJECT_ID FROM Temp WHERE OBJECT_ID=10)