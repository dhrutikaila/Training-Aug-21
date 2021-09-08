-- Queries Group Task

--1 write a query to rank the shows with highest number of view having subtitles as English
select top 1 s.Views,c.Show_ID from Statistic s join Collection_of_shows c on s.Show_ID=c.Show_ID 
where c.Subtitles=25
order by s.Views desc

--2 List the highest most watched adult shows in the year 2020 but having IMDB Ratings less than 8 	
select  top 1* from Collection_of_shows c join Statistic s on c.Show_ID=s.Show_ID
join Rating r on c.Show_ID=r.Show_ID
where datepart(yyyy, c.Release_Date) = 2020 and r.IMDB_Rating<8 and c.Maturity_Age>13 order by s.Views desc

--3 List the shows with IMDB Ratings more than the average rating of all web shows released in 2013
select c.Show_ID,c.Name,r.IMDB_Rating from 
Collection_of_shows c join Rating r on c.Show_ID=r.Show_ID 
where r.IMDB_Rating>(select avg(IMDB_Rating) from Rating)


--4 Find how many actors are there in ‘FRIENDS’ whose age is greater than 40 and Nationality as ‘American’
select aw.Actor_ID,a.FirstName,a.LastName from Collection_of_shows c join Actor_Work aw on c.Show_ID=aw.Show_ID
join Actors a on aw.Actor_ID=a.Actor_ID
where aw.Actor_ID in 
(select Actor_ID from Actor_Work where Show_ID=(select Show_ID from Collection_of_shows where Name='Friends')) and
a.Age>40
and
a.Nationality='American'

--5 create a view to display name, actor name, age and release date of web show where number of episodes more than 90 and language is hindi and english
create view query5 as 
select c.Name,ActorName=concat(a.FirstName,' ' ,a.LastName),a.Age,c.Release_Date from 
Collection_of_shows c join Actor_Work aw on c.Show_ID=aw.Show_ID 
join Actors a on aw.Actor_ID=a.Actor_ID 
where c.Show_ID in(select Show_ID from Web_Shows 
					where Episodes>90 and Language=(select ov.Object_Id from Object_Type ot join Object_values ov on ot.Type_ID=ov.Type_ID where ov.Object_Id = 25))

select * from query5

--6 create a view to display movies name, actor name, age and release date where duration is less than 2 hours and language is hindi and english
create view query6 as 
select c.Name,ActorName=concat(a.FirstName,' ' ,a.LastName),a.Age,c.Release_Date from 
Collection_of_shows c join Actor_Work aw on c.Show_ID=aw.Show_ID 
join Actors a on aw.Actor_ID=a.Actor_ID where 
c.Show_ID in(select Show_ID from Movies where Duration<2 and Language=(select ov.Object_Id from Object_Type ot join Object_values ov on ot.Type_ID=ov.Type_ID where ov.Object_Id=25))

select * from query6

--7 In which year maximum number of subscribers joined us
select top 1 count=count(Datepart(YYYY,Invoice_Date)), (Datepart(YYYY,Invoice_Date))year 
from Payment group by Datepart(YYYY,Invoice_Date) order by count desc


--8 Which production companies has produced maximum number of shows
Select Production_Name 
from Production p join (select top 1 count=count(Production_ID), Production_ID from 
Production_show group by Production_ID order by count desc)temp on p.Production_ID=temp.Production_ID

--9  List the subscriber name whose subscription plan is active and will get expire till end of current year
Select * from (select (s.FirstName+ ' ' + s.LastName)Name, p.Invoice_Date, Plan_Valid_Till = 
 Case 
	When Subscription_Plan ='4' Then DATEADD(MONTH,1, p.Invoice_Date)
	When Subscription_Plan ='5' Then DATEADD(MONTH,6, p.Invoice_Date)
	when Subscription_Plan ='6' Then DATEADD(MONTH,12, p.Invoice_Date)
  end
   from Payment p join Subscribers s on p.Subscribers_ID=s.Subscribers_ID)temp
where temp.Plan_Valid_Till> GETDATE() and 
(DATEPART(yyyy,temp.Plan_Valid_Till) = DATEPART(yyyy,Getdate()))


-- 10 How many Indian Actors are there working in web shows with views more than 1 million.
Select Total_Actors=count(Nationality) 
from (Select a.Actor_ID, a.FirstName, a.LastName, a.Nationality 
		from Actors a join Actor_Work aw on a.Actor_ID=aw.Actor_ID join Web_Shows w on aw.Show_ID=w.Show_ID  join Statistic s on w.Show_ID=s.Show_ID 
		where a.Nationality='Indian' and s.Views > 1000000 )temp
group by Nationality order by Total_Actors desc



