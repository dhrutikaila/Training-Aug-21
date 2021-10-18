-- In our Project OTT Platform, Data is expected to be coming in Json Format from front-end.
-- We have created a table to open json data in it.
-- As Json data is stored in that temporary table, A trigger will be executed and Insertion will be performed to all the other related tables automatically.

Select  * from Collection_of_shows
Select  * from Actor_Work
Select  * from Director_show
Select  * from Production_show
Select  * from Web_Shows
Select  * from Movies
Select  * from Rating

Select * from NewRelease

Create TABLE NewRelease
(
	Name varchar(50) not null,
	Genre numeric(2) not null ,
	Release_Date Date,
	Maturity_Age  numeric(3) not null,
	Subtitles numeric(2),
	Language numeric(2),
	Season numeric(3) ,
	Episodes numeric(3) ,
	WebShow_Budget money  ,
	Duration float(20)  ,
	Movie_Budget money ,
	Actor_ID int foreign key references Actors(Actor_ID) not null,
	Production_ID int foreign key references Production(Production_ID) not null,
	Director_ID int foreign key references Director(Director_ID) not null,
	IMDB_Rating float
) 


-- Creating Trigger for insertion in every related tables
Create Trigger Trg_NewRelease on NewRelease 
for Insert 
As 
Begin 
	Declare @Name varchar(50), @Show_ID int , @Season int , @Duration float 

	Insert into Collection_of_shows  
	Select Distinct Name, Genre, Release_Date, Maturity_Age, Subtitles, Language from inserted 
	Set @Name =(Select Distinct Name from inserted)
	Set @Show_ID = (Select Show_ID from Collection_of_shows where Name= @Name)
	Set @Season = (Select Distinct Season from inserted)
	Set @Duration = ( Select Distinct Duration from inserted) 

	If @Season is not null
	Begin
		Insert into Web_Shows 
		Select Distinct @Show_ID, Season,Episodes,WebShow_Budget from inserted 
	End
	
	If @Duration is not null
	Begin
		Insert into Movies 
		Select Distinct @Show_ID, Duration, Movie_Budget from inserted 
	End
		
	Insert into Actor_Work
	Select Distinct Actor_ID, @Show_ID from inserted 

	Insert into Production_show
	Select Distinct @Show_ID, Production_ID from inserted 

	Insert into Director_show
	Select Distinct @Show_ID, Director_ID from inserted 

	Insert into Rating 
	Select Distinct @Show_ID , IMDB_Rating from inserted

	Delete from NewRelease
End

--Execute trigger

Declare @json nvarchar(max)
Set @json = '[
{
"Name":"Movie", 
"Genre":20,
"Release_Date":"2010-07-16",
"Maturity_Age":16,
"Subtitles":25,
"Language":25,
"Season":null,
"Episodes":null,
"WebShow_Budget":null,
"Duration":2.05,
"Movie_Budget":50000.00,
"Actor_ID":["1001", "1002", "1003" ],
"Production_ID":["201", "202"],
"Director_ID":["1", "2"],
"IMDB_Rating":8.8
}
]'

Insert into NewRelease 
Select Name,Genre, Release_Date, Maturity_Age, Subtitles, Language, 
Season, Episodes, WebShow_Budget, Duration, Movie_Budget, 
Actor_ID, Production_ID, Director_ID, IMDB_Rating
from openjson (@json)
with( 
	Name varchar(50) '$.Name',
	Genre numeric(2) '$.Genre', 
	Release_Date Date '$.Release_Date',
	Maturity_Age  numeric(3) '$.Maturity_Age',
	Subtitles numeric(2) '$.Subtitles',
	Language numeric(2) '$.Language',
	Season numeric(3) '$.Season',
	Episodes numeric(3) '$.Episodes', 
	WebShow_Budget money '$.WebShow_Budget', 
	Duration float(20) '$.Duration',
	Movie_Budget money '$.Movie_Budget',
	Actor_ID_Array nvarchar(max) '$.Actor_ID' as json,
	Production_ID_Array nvarchar(max) '$.Production_ID' as json,
	Director_ID_Array nvarchar(max) '$.Director_ID' as json,
	IMDB_Rating float '$.IMDB_Rating'
	)
	outer apply openjson (Actor_ID_Array) 
		with(
			Actor_ID int '$'
			)
	outer apply openjson (Production_ID_Array) 
		with(
			Production_ID int '$'
			)
	outer apply openjson (Director_ID_Array) 
		with(
			Director_ID int '$'
			)