--1
-- =============================================
-- Author:KARAN
-- Create date: 07-09-2021
-- Description:	Below Stored Procedure filters the Actor on basis of Age and Nationality
-- =============================================
Create PROCEDURE Actor_Details @Age int, @Nationality varchar(20)
AS
select aw.Actor_ID,a.FirstName,a.LastName from Collection_of_shows c 
join Actor_Work aw on c.Show_ID=aw.Show_ID
join Actors a on aw.Actor_ID=a.Actor_ID
where 
a.Age=@Age
and
a.Nationality=@Nationality

EXEC Actor_Details @Age=40,@Nationality='Indian'

--2
-- =============================================
-- Author:KARAN
-- Create date: 07-09-2021
-- Description:	Below Stored Procedure filters the show on basis of Episodes and Language and displays
-- show name, Actor name who worked in that show, Age of Actor and Release Date of Show
-- =============================================
Create PROCEDURE Show_Details @Episodes int, @Language varchar(20)
AS
select c.Name,ActorName=concat(a.FirstName,' ' ,a.LastName),a.Age,c.Release_Date from 
Collection_of_shows c join Actor_Work aw on c.Show_ID=aw.Show_ID 
join Actors a on aw.Actor_ID=a.Actor_ID 
where c.Show_ID in(select Show_ID from Web_Shows 
					where Episodes>=@Episodes and Language=(select ov.Object_Id from Object_Type ot 
															join Object_values ov on ot.Type_ID=ov.Type_ID 
															where ov.Object_Id = (SELECT OBJECT_ID FROM Object_values 
															WHERE VALUE=@Language) ))


EXEC Show_Details @Episodes=90,@Language='English'

--3
-- =============================================
-- Author:KARAN
-- Create date: 07-09-2021
-- Description:	Below Stored Procedure rank the show on basis of Release Date and Language and returns
-- in json format.
-- =============================================

CREATE PROCEDURE Rank_Show @ReleaseDate INT=2021,@Language VARCHAR(20)='English'
AS
select dense_rank() over(order by Views desc)Rank,c.Show_ID,s.Views,c.Name,c.Genre,c.Release_Date,c.Language
from Statistic s join Collection_of_shows c on s.Show_ID=c.Show_ID 
where datepart(yyyy,c.Release_Date)=@ReleaseDate and c.Language=(SELECT OBJECT_ID FROM Object_values 
															WHERE VALUE=@Language) for Json Path

EXEC Rank_Show @ReleaseDate=2020 ,@Language='Hindi'


--4
-- =============================================
-- Author:KARAN
-- Create date: 07-09-2021
-- Description:	Below Stored Procedure filter the Shows on basis of Language and takes default value as English
-- =============================================
ALTER PROCEDURE Language_Filter @Language varchar(15)='English'
AS
select * from Statistic s join Collection_of_shows c on s.Show_ID=c.Show_ID 
where c.Language=(SELECT OBJECT_ID FROM Object_values WHERE VALUE=@Language) 

EXEC Language_Filter @Language='Spanish'


--5
-- =============================================
-- Author:KARAN
-- Create date: 07-09-2021
-- Description:	Below Stored Procedure filters the Most Watched Shows of the Year
-- =============================================
Create PROCEDURE Top_Show @Year int 
AS
select  top 1* from Collection_of_shows c join Statistic s on c.Show_ID=s.Show_ID
join Rating r on c.Show_ID=r.Show_ID
where datepart(yyyy, c.Release_Date) = @Year order by s.Views desc

EXEC Top_Show @Year=2020


