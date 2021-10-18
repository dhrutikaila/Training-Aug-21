-- Queries - Group Task

-- 1. list the movie starring senior male actor(age greater than 50) and  also find the Director name and Production Name for the same.
Select Distinct c.Name, d.Director_Name,p.Production_Name  from  Collection_of_shows c 
join Movies m on c.Show_ID=m.Show_ID
join Actor_Work aw on c.Show_ID = aw.Show_ID 
join Actors a on a.Actor_ID=aw.Actor_ID
join Production_show ps on ps.Show_ID = c.Show_ID
join Production p on p.Production_ID=ps.Production_ID
join Director_show ds on ds.Show_Id= c.Show_ID
join Director d on d.Director_ID = ds.Director_ID
where a.Age > 50 and a.Gender = 1

-- 2. List the Subscribers details who have chosen a monthly subscription and who prefer watching Romance and Drama Genres.
Select * from Subscribers 
where Subscription_Plan= 4 
and Subscribers_ID in (select Subscribers_ID from Genre_Preference 
							where Genre = 14 or Genre = 18)
	
-- 3. List the name of subscribers whose subscription plan is active and age greater than 20.
 Select * from (select (s.FirstName+ ' ' + s.LastName)Name, p.Invoice_Date, Plan_Valid_Till = 
 Case 
	When Subscription_Plan ='4' Then DATEADD(MONTH,1, p.Invoice_Date)
	When Subscription_Plan ='5' Then DATEADD(MONTH,6, p.Invoice_Date)
	when Subscription_Plan ='6' Then DATEADD(MONTH,12, p.Invoice_Date)
  end
   from Payment p join Subscribers s on p.Subscribers_ID=s.Subscribers_ID where s.Age>20 )temp
where (temp.Plan_Valid_Till > GETDATE())


-- 4. list the name of show, show id and release date which released in 2017 with highest budget on the year
Select top 1 c.Show_ID, c.Name, c.Release_Date 
from Collection_of_shows c left join Movies m on c.Show_ID=m.Show_ID left join Web_Shows w on c.Show_ID=w.Show_ID
where DATEPART (yyyy, c.Release_Date)=2017 order by m.Budget, w.Budget desc


-- 5. list the name of show, show id and duration which released in 2020 with highest no of views
Select Show_ID, Name, Duration from 
(Select c.Show_ID, c.Name, m.Duration, DENSE_RANK() over (order by s.Views desc)Rank_Views 
  from Collection_of_shows c join Movies m on c.Show_ID= m.Show_ID join Statistic s  on c.Show_ID= s.Show_ID 
  where DATEPART (yyyy, c.Release_Date)=2020)temp 
where Rank_Views=1


-- 6. List the details of shows with IMDB Rating less than or equal to 7 in the year 2021
Select * from Collection_of_shows 
where YEAR(Release_Date)=2021 
and Show_ID in (select Show_ID from Rating where IMDB_Rating <= 7)
 

-- 7. List the details of shows with highest number of views and highest number of episodes
Select *  from Collection_of_shows 
where Show_id in (Select top 1 Show_ID from Statistic order by Views desc) 
or Show_id in (Select top 1 Show_ID from Web_Shows order by Episodes desc)

 
-- 8. List the Subscriber name who have bought subscription by using mastercard and languages preferences as Tamil and Telugu 
Select (FirstName+' '+LastName)Subscriber_Name from Subscribers 
where Subscribers_ID in 
	(Select p.Subscribers_ID from Payment p join Language_Preference l on p.Subscribers_ID = L.Subscribers_ID 
	where p.Card_Number like '5%' and( l.Language =29 or l.Language = 30))


-- 9. List the Subscriber name who have bought subscription by using Visacard with current number of users  are more than 3
Select (FirstName+' '+LastName)Subscriber_Name 
from Subscribers 
where Subscribers_ID in (Select Subscribers_ID from Payment where Card_Number like '4%') and Number_of_users >3


-- 10. List the Movies with No of views more than 1million and supports subtitles as ‘English’ and ‘Hindi’
Select * from Collection_of_shows c join Movies m on c.Show_ID=m.Show_ID join Statistic s on c.Show_ID=s.Show_ID 
where s.Views>10000000 and (c.Subtitles = 25 or c.Subtitles=26 )

							-- By Using CTE --

With Object_CTE ( Object_ID, Value)
As 
(select ov.Object_Id, ov.Value from Object_Type ot join Object_values ov on Ot.Type_ID=ov.Type_ID )
Select * from Collection_of_shows c join Movies m on c.Show_ID=m.Show_ID join Statistic s on c.Show_ID=s.Show_ID join Object_CTE o on c.Subtitles=o.Object_ID
where s.Views>10000000 and (o.Object_ID= 25 or o.Object_ID = 26)
