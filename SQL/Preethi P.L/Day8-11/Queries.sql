-- 1. Find the song which has highest number of downloads

SELECT SongID, Name, Downloads FROM Songs ORDER BY Downloads DESC LIMIT 1; 

-- 2. Find the song which has lowest number of downloads

SELECT SongID,Name,Downloads FROM Songs ORDER BY Downloads ASC LIMIT 1;

-- 3. Display song names and its duration and order by song duration from lowest to highest.

SELECT SongID,Name,Duration FROM Songs ORDER BY Duration ASC;

-- 4. Find the song which has lowest number of views

SELECT SongID,Name,ViewCount FROM Songs ORDER BY ViewCount ASC LIMIT 1;

-- 5. Find the total number of songs for each language. 

SELECT l.LanguageName,s.LanguageID,COUNT(s.SongID) AS TotalSongs FROM Songs s 
INNER JOIN Languages l ON s.LanguageID = l.LanguageID 
GROUP BY s.LanguageID,l.LanguageName WITH ROLLUP;

-- 6. List the name of users who have made payments using credit/debit card along with their payment status. 

SELECT u.UserID,CONCAT(u.FirstName," ",u.LastName) AS Name, p.PaymentID,p.PaymnetStatus FROM users u 
INNER JOIN payment p 
ON u.UserID = p.UserID 
WHERE p.PaymentMethodID = (SELECT PaymentMethodID FROM paymentmethods WHERE Name = 'Credit/debit card');

-- 7. List the id and name of users who have gold subscription

SELECT u.UserID,CONCAT(u.FirstName," ",u.LastName) AS Name FROM users u
INNER JOIN subscription s
ON u.UserID = s.UserID
WHERE s.PlanId = (SELECT PlanID FROM plans WHERE PlanName = 'Gold');

-- 8. List the id and name of users and their subscription details. 

SELECT u.UserID,CONCAT(u.FirstName," ",u.LastName) AS Name,s.SubscriptionID,p.PlanID,p.PlanName FROM users u LEFT JOIN subscription s 
ON u.UserID = s.UserID 
LEFT JOIN plans p 
ON s.PlanId = p.PlanID;


-- 9. List names of users who have uploaded more than one podcast.

SELECT CONCAT(u.FirstName," ",u.LastName) FROM users u 
INNER JOIN podcasts p 
ON u.UserID = p.UserID 
GROUP BY p.UserID 
HAVING COUNT(p.UserID) > 1;


-- 10. List the genre name and song name of each genre. 

SELECT g.Genre,sg.SongID,s.Name FROM genres g 
LEFT JOIN songgenres sg 
ON g.GenreId = sg.GenreId 
LEFT JOIN songs s 
ON sg.SongID = s.SongID;
