
INSERT INTO Countries
VALUES ('India')
	,	('Canada')
	,	('Japan')
	,	('United States')
	,	('United Kingdom')
	,	('Germany')
	,	('Ireland')
	,	('South Korea')
	,	('Mexico')
	,	('Italy')

SELECT *
FROM Countries

-- 2.Languages

INSERT INTO languages 
VALUES ('English')
	,	('Hindi')
	,	('Punjabi')
	,	('Gujarati')
	,	('Korean')
	,	('French')
	,	('Spanish')
	,	('Tamil')
	,	('Malayalam')
	,	('Telugu')

SELECT *
FROM Languages

-- 3. ROLES 
INSERT INTO Roles
VAlUES ('User')
	,	('Artist')
	,	('Admin')

SELECT *
FROM Roles

-- 4. USERS

INSERT INTO Users (
		RoleID
	,	FirstName
	,	LastName
	,	UserName
	,	Email
	,	Password
)
VALUES (3,'Sebastian','Chapman','Mr. Sebastian Chapman','Sebastian_Chapman2940@ovock.tech','220-20-7728')
	,	(1,'Clint','Hudson','Mr. Clint Hudson','Clint_Hudson2817@vetan.org','385-76-0520')
	,	(2,'Doris','Jarrett','Mrs. Doris Jarrett','Doris_Jarrett6832@extex.org','816-83-1053')
	,	(1,'Rufus','Stark','Mr. Rufus Stark','Rufus_Stark5338@famism.biz','212-16-2044')
	,	(1,'Johnathan','Quinnell','Mr. Johnathan Quinnell','Johnathan_Quinnell6634@bulaffy.com','735-83-3487')
	,	(1,'Callie','Clarke','Ms. Callie Clarke','Callie_Clarke6519@jiman.org','456-83-8528')
	,	(1,'Nicole','Funnell','Ms. Nicole Funnell','Nicole_Funnell25@deavo.com','008-42-0001')
	,	(1,'Beatrice','Emmott','Mrs. Beatrice Emmott','Beatrice_Emmott6820@supunk.biz','077-24-1202')
	,	(2,'Alexia','Miller','Mrs. Alexia Miller','Alexia_Miller3243@supunk.biz','628-13-2262')
	,	(1,'Russel','Owen','Mr. Russel Owen','Russel_Owen2509@iatim.tech','625-45-1704')
	,	(1,'Enoch','Preston','Mr. Enoch Preston','Enoch_Preston5587@twace.org','836-78-4322')
	,	(1,'Danny','Webster','Mr. Danny Webster','Danny_Webster818@extex.org','577-52-8505')
	,	(1,'Marina','Ianson','Mrs. Marina Ianson','Marina_Ianson6024@gompie.com','351-12-0662')
	,	(1,'Nicholas','Vallins','Mr. Nicholas Vallins','Nicholas_Vallins4752@infotech44.tech','028-58-8002')
	,	(2,'Janice','Wigley','Ms. Janice Wigley','Janice_Wigley5460@deons.tech','205-65-0827')
	,	(1,'Josh','Gilmour','Mr. Josh Gilmour','Josh_Gilmour5201@bungar.biz','835-61-5276')
	,	(2,'Ada','Morris','Miss Ada Morris','Ada_Morris19@bungar.biz','661-17-2347')
	,	(1,'Rylee','Jarrett','Ms. Rylee Jarrett','Rylee_Jarrett6357@famism.biz','745-32-8633')
	,	(1,'Payton','Plant','Miss Payton Plant','Payton_Plant1318@ubusive.com','502-81-1836')
	,	(2,'Naomi','Jefferson','Miss Naomi Jefferson','Naomi_Jefferson8480@yahoo.com','611-56-7846')

SELECT *
FROM Users

SELECT * FROM Users

--  5. GENDER

INSERT INTO Gender
VALUES ('Male')
	,	('Female')
	,	('Others')

SELECT *
FROM Gender

-- 6. PROFILE

INSERT INTO Profile(
		UserID 
	,	DOB 
	,	Bio 
	,	Picture 
	,	GenderID  
	,	CountryID 
)
VALUES (1,'1991-03-07','3BBFboncX9pxGk63ER5rnBUGctWQOxho58R3MM9FtuCZGlgASPlEwRU2r4nsSXNkbB1ISDq2S0828490MW79Ld2noYLRiQxWhc7F','tYrPitv5Tb4w4wg6ZNY8IOe31YTCCm',1,1)
	,	(2,'2008-12-23','ZXvt16TE96f4yYJZs2rFZzApsRrw5QM3RZbBiSLpBb78l40URD9DmGEjWGBjPhItulmY6I1arCD81BDybXe2RIRKU1obRmZeSOOA','RbXJMjWkCGsVCNH2CPbmUcDEdZIEmj',1,2)
	,	(3,'2001-04-20','TZDehcCwlpzXSpwaR7dbEh8qI3qju0nUz4KAFkFHm0LYrlqq3RdsnwEvaWWovdCvBehXewVr2WyOWk9gMApdW4qD0ZjsNbWJyZWM','ESLH5w0R80ZzXzbuyjZHxehFMndbAp',2,4)
	,	(4,'1992-12-28','tUY9lUPAPYjuF4SSYQTadlkXh4QCyCYahGcSFbYUK58Y2JumORpIvjgItAbrDNMMAJN9c9M728PhnMeYKoxgXPo8jUiFAqQ7tvXt','5uKPFsQwU9fhfDhZZpzveOaHaH7LrR',1,1)
	,	(5,'2006-11-24','Bj6J1hE6lPrUCz7vEECKnsvkH52NKwlkzSYiAB0tu5NfvEbse34xlZLTyWC5p0vznGftaYuCOTaseQyDeJsQ1y9aGFun94E3JX1p','jrSFI2jS9dyih9bfIe8zGEnUoHDTPg',1,6)
	,	(6,'2001-05-25','MGAdivpYBieE7aByQDd4rIXfpoeW9lZo9EcADzqu3sXl9r4MGK8n7siDsey4QSYaIzF38AvaWsB9vwg7uSQzmwrRfZSiBwekT7cJ','mAOFYhRPqjS580K8CixWIxXjsMZkNa',2,8)
	,	(7,'1994-01-05','WkKlgivKGAynoXLIqBQ4elkgb32Hr0rNcbVmO8r24mMWfGZwP6yaUAmu9oKmqncPTlKNCj3rUXA1ZOAVdF1uCQ3bzkmkxEMQK6D4','5MupDGG69vVvozJkvrNCstXb7S4PLu',1,4)
	,	(8,'2009-03-12','0685lectBMMySsuM0uPD3kiZ1QjAS1vRTNGW5UkPOtJ3NcBd7tTMLAVPYiDV5cbJb4fFmXQgKAyJboMZOGDihiFS108XQOUwS9cS','660jcxBLLLytVnGyZ2m2yMNwZ3P5qC',2,5)
	,	(9,'2007-09-22','PBmIfXaXjdusEJihFfJUVhcLxj4v1V4FhtK2nxLpbEmZskKUiNbY8WqsjbU5cpfOipKU9q4SUd2R4CcNYkMo4gHLDcSLcPMwiX1C','ZzV1TIEedZxh9Hh1c1TCi9RgXt0ERG',2,7)
	,	(10,'1999-05-13','vMVrUUrDyeZiyekSANWqQWjT8nHghl5Sn1mhfW6wBcW5YAZ0vebZU7YYmBtrNKgMjH571CwnRkpx9n48NQvDKf7pcN4dnOj06KWR','Ec9sryIuRlZ8Gue6YcCDKPeoIT9CAy',1,1)
	,	(11,'1986-09-27','5W3umbeHSGz7VjXyGtcujrd0tpVGqq71mzN7FSYXWr8gEx6e8hRd5GOO3DA7GYbmJ8VfVasxVFY1s6v6t1HIYe6fk9ECRaQ8QWXG','baIiydHzsXf6REOOQSNpBz5WWqf4yZ',1,3)
	,	(12,'1983-09-05','HvNMBr7IsEmfvMI8MASvJXlj6fs8SS5Br2O4SswsoO0l1w7WM7KFecUtJnQg99zaIlx27NpeNkH5gAsJiVwVI0hPievocQtoYacQ','8EZ8Rp14VZNJ5G7nNeRSDiUccBB70c',1,3)
	,	(13,'1999-05-20','mtVSGb4IJMau6gPo4E22Gkd6eqZazUanKK0SpotAm8YPus9RyyDiBRLBPZyZCeSzvwkwp78QU2QILOLvqHmBQ2m39zCQ0U7Ipjd7','INm0zxOIACzBNCt51Ri3Kqw05raA5H',2,4)
	,	(14,'1994-11-03','ACxlCQXAjxcbv4HXON3jNQ9YQZFFFQqx005pmY21FlLaLBt1DFZP9WwtCYUnKR4TGok49cuzUCelFjNOpOCA1aydELmNEPqxq2Tg','az2lUj472KodKG76P4cq0H0xzhvFVq',1,6)
	,	(15,'2006-03-22','JC8SuhwanqT8EvxyzlMPbNdSHjyOKK9g7PqexxlIJwmAd2Rp2dqPYnG5ipLKthPdqxByESAC9DGolcyOSIVrdtHTJv5HlbZlgJTq','0cljcnPVhbTG061kLi97pspSX3ainf',2,6)
	,	(16,'2003-11-22','zQpjzZ7JWAIxTMjNrsCS17shCDaUJc3670hmu8xFLSvHQCNipmxDtZl2hIhv9nA3HLzcp6cs46HiLlR9z1ogpzNhPpEmbCGhS29E','Mv3tKEJwRCq60h6I8dNR7RN910Q20j',1,2)
	,	(17,'1993-09-02','Iw4F8jyorG4i31UyQ6rxXUnu1KDHmlgBABtDWw2Aap3G2gDDCxZeiZlyJJNxfrBGj3h2IQbeDqWsag2VH9EzMBdlZ44MiFfsnxg9','8K5vV5a1C2XmR2qgnL3hZ6cNVO58Ln',2,1)
	,	(18,'1999-01-14','S5qY8Fb38jCsraH9bpZxvmYftcUrm6xY5qDTPjMinsBTUOW2WRJ6ItwqhKpgvtQBvnwBWyu1c1KCkEKfFbVVx0PM4XvE4qw3b9iq','bUgihReRitFd9JaUY5O4YkG8Cp7wER',2,5)
	,	(19,'2009-07-23','SEuPcegvnS1Nhg1TrMRJe7fGpZmHsia66qukMgmwDz2LLhXP6MpuVAyVjojD2YDF14R0wRHKkfFoET4IBWLf2pl52YBi6j4pwxUR','PhdpEeK05JRPtbBfNhMMTW8XPiNBla',2,9)
	,	(20,'2003-02-22','wyfhYbPlH73jGZgQJPeSAPGihmqGxriVPPcusdM8mo2p95xG4IVffaHhs79wvIxaYhT07vhpCfqVXajmyjLpVD0yI5BveaNd1bQb','l6JIkqc9uvJRYX7L7IEVresBuwLmSN',2,10)

SELECT *
FROM Profile

-- 7. USERLANGUAGES

INSERT INTO UserLanguages
VALUES(1 ,1)
	,	(1 , 2)
	,	(2 , 1)
	,	(2 , 5)
	,	(3 , 1)
	,	(3 , 3)
	,	(4 , 2)
	,	(5 , 6)
	,	(5 , 1)
	,	(6 , 9)
	,	(6 , 10)
	,	(7 , 5)
	,	(7 , 6)
	,	(7 , 2)
	,	(8 , 1)
	,	(9 , 3)
	,	(10 , 1)
	,	(11 , 2)
	,	(11 , 1)
	,	(12 , 3)
	,	(13 , 2)
	,	(13 , 4)
	,	(14 , 1)
	,	(14 , 2)
	,	(15 , 1)
	,	(16 , 3)
	,	(17 , 2)
	,	(18 , 6)
	,	(19 , 1)
	,	(19 , 2)
	,	(20 , 2)
	,	(20 , 4)

SELECT *
FROM UserLanguages

-- 8 Albums	

INSERT INTO Albums (UserID,Name ,Picture,Description)
VALUES(3,'Luke','Chocolat.png','')
	,	(3,'Liam','Iron Man.png ','')
	,	(9,'Angela','Brimstone.png','')
	,	(9,'Thea','Pretty Woman.png','hii nice to see you')
	,	(15,'Felicity','Snatch.png','')
	,	(15,'Phillip','Iron Man.png ','')
	,	(15,'Celina','Seven.png','baaghi')
	,	(17,'Carolyn','The Godfather.png','')
	,	(17,'Russel','The Dark Tower.png','sanam re')
	,	(20,'Kurt','Alien.png','love aaj kal')

SELECT *
FROM Albums

-- 9. GENRES

INSERT INTO Genres
VALUES('Dubstep')
	,	('Drum & Bass')
	,	('Jazz')
	,	('Dubstep')
	,	('Reggae')
	,	('Baroque')
	,	('Techno')
	,	('Drum & Bass')
	,	('Soul')
	,	('Opera')

SELECT *
FROM Genres

-- 10. SONGS

INSERT INTO Songs(
		AlbumID
	,	Name
	,	Picture 
	,	LanguageID 
	,	SongFile 
	,	Duration 
	,	PublishedON 
	,	ViewCount 
	,	Downloads
)
VALUES	(1,1,'Faded',1,'fhs',03.32,'2015/12/03',109563,6729)
	,	(1,2,'Friends',2,'get',03.20,'2018/02/09',209830,4533)
	,	(2,3,'Fly',3,'gsj',02.42,'2021/03/05',67900,652)
	,	(2,4,'Closer',4,'hws',04.04,'2016/07/29',157000,8642)
	,	(3,5,'Love yourself',5,'hoa',04.7,'2015/11/09',63533,763)
	,	(3,6,'Sorry',6,'fhd',03.20,'2015/10/22',110500,9876)
	,	(4,7,'Senorita',7,'jtu',03.10,'2019/06/21',54389,3680)
	,	(4,8,'Sugar & Brownies',8,'tou',03.17,'2018/10/24',154670,8656)
	,	(5,9,'Believer',9,'upj',03.24,'2017/02/01',250094,3829)
	,	(5,10,'On my way',10,'ljk',03.13,'2019/03/21',656570,4589);

SELECT *
FROM Songs

-- 11. SONGGENRES

INSERT INTO SongGenres(
		SongID 
	,	 GenreId
)
VALUES	(1,1)
	,	(1,2)
	,	(2,3)
	,	(2,4)
	,	(3,5)
	,	(4,6)
	,	(5,1)
	,	(5,7)
	,	(5,8)
	,	(6,10)
	,	(6,9)
	,	(7,1)
	,	(7,2)
	,	(8,3)
	,	(9,4)
	,	(9,2)
	,	(10,8)
	,	(10,9)						

SELECT *
FROM SongGenres

-- 12. SONGARTISTS

INSERT INTO SongArtists( 
		SongID 
	,	UserID
)
VALUES	(1,3)
	,	(1,9)
	,	(2,3)
	,	(2,15)
	,	(3,3)
	,	(4,3)
	,	(5,9)
	,	(5,3)
	,	(6,9)
	,	(7,9)
	,	(7,15)
	,	(8,9)
	,	(8,15)
	,	(9,15)
	,	(9,3)
	,	(10,15)
	,	(10,9)

SELECT *
FROM SongArtists

-- 13 Podcasts

INSERT INTO Podcasts(UserID ,Name ,LanguageID ,PodcastFile ,StreamedON ,Duration)
VALUES(9,'Chester Rixon',6,'eJGQoz.mp3','2020-09-21 09:52:30.490',30.00)
	,	(9,'Aisha Ellery',4,'6ZClE9.mp3','2021-01-04 22:27:30.460', 45.00)
	,	(17,'Matthew Downing',1,'yO0Dhj.mp3','2019-07-13 16:17:30.170', 20.00)
	,	(17,'Vera Norman',6,'VJV6Gu.mp3','2019-05-29 08:30:30.490', 50.00)
	,	(9,'Ramon Power',5,'ryZpKD.mp3','2021-04-24 08:56:30.130', 40.00)
	,	(17,'Daniel Shea',8,'jSTMcP.mp3','2020-11-17 16:52:30.300', 25.50)
	,	(17,'Ron Gunn',1,'rImZRF.mp3','2020-05-09 05:53:30.490', 55.00)
	,	(9,'Barry Johnson',9,'qCGdbF.mp3','2021-02-26 07:14:30.550', 42.00)
	,	(17,'Emmanuelle Kelly',4,'uRu0D1.mp3','2021-10-19 17:32:30.000', 35.00)
	,	(9,'Elena Williams',2,'xotA7n.mp3','2021-01-20 04:28:30.420', 120.00)

SELECT *
FROM Podcasts

-- 14 SongLike

INSERT INTO SongLike (UserID,SongID) 
VALUES	(4,1)
	,	(8,2)
	,	(14,3)
	,	(15,4)
	,	(19,5)
	,   (8,9)
	,	(14,9)
	,	(15,7)
	,	(20,5)

SELECT *
FROM SongLike
    
--15 PodcastLike

INSERT INTO PodcastLike(UserID,PodcastID) 
VALUES	(4,1)
	,	(8,2)
	,	(4,3)
	,	(11,4)
	,	(10,5)
	,   (8,6)
	,	(4,9)
	,	(1,4)
	,	(11,5)
	,	(6,3)

SELECT *
FROM PodcastLike
    
-- 16. albumlike

INSERT INTO albumlike(
		UserId
	,	AlbumID
) 
VALUES  (1,9)
	,	(1,10)
	,	(2,3)
	,	(2,9)
	,	(3,6)
	,	(3,7)
	,	(3,8)
	,	(5,5)
	,	(6,3)
	,	(6,5)
	,	(7,5)
	,	(8,5)
	,	(9,1)
	,	(9,2)
	,	(9,3)

SELECT *
FROM AlbumLike

-- 17. playlists

INSERT INTO playlists (
		UserID
	,	Title
) 
VALUES  ( 2, 'playlist1')
	,	( 1, 'playlist2') 
	,	(9, 'playlist3' )
	,	(15, 'playlist15')
	,	(10, 'playlist10')
	,	(17, 'playlist17')
	,	(20, 'playlist20')
	,	(18, 'playlist18')
	,	(3, 'playlist3' )
	,	(6, 'playlist6')

SELECT *
FROM Playlists

-- 18. playlistsongs

INSERT INTO playlistsongs(
		PlaylistID
	,	SongID
) 
VALUES  (1, 2) 
	,	(1, 3) 
	,	(2, 4) 
	,	(3, 5) 
	,	(4, 5) 
	,	(5, 8) 
	,	(6, 8) 
	,	(9, 10) 
	,	(10,10)

SELECT *
FROM PlaylistSongs

-- 19. playlistpodcasts
INSERT INTO playlistpodcasts(
		PlaylistID
	,	PodcastID
) 
VALUES	(1, 1)
	,	(2, 1) 
	,	(3, 1) 
	,	(4, 2) 
	,	(5, 3) 
	,	(6, 4) 
	,	(6, 5) 
	,	(7, 9) 
	,	(8, 9) 
	,	(10,8)

SELECT *
FROM PlaylistPodcasts

-- 20. PLANS

INSERT INTO Plans(PlanName, PricePerMonth)
VALUES('Gold', 50)
	,	('Platinum', 100)
	,	('Diamond', 150)

SELECT *
FROM Plans

-- 21. SUBSCRIPTION

INSERT INTO Subscription(UserID, PlanId, Months)
VALUES(1, 1, 3)
	,	(2, 2, 6)
	,	(5, 3, 12)
	,	(7, 2, 6)
	,	(9, 1, 3)
	,	(10, 2, 1)
	,	(12, 3, 12)
	,	(13, 2, 6)
	,	(14, 1, 3)
	,	(18, 2, 1)

SELECT *
FROM Subscription

-- 22. PAYMENTMETHODS	

INSERT INTO PaymentMethods(Name)
VALUES('Credit/debit card')
	,	('Paypal')
	,	('Paytm Wallet')
	,	('Netbanking')

SELECT *
FROM PaymentMethods

-- 23. PAYMENT 

INSERT INTO Payment(UserID, SubscriptionID, PaymentMethodID, PaymnetStatus)
VALUES(1, 1, 1, 1)
	,	(2, 2, 2, 1)
	,	(5, 3, 4, 1)
	,	(7, 4, 1, 1)
	,	(9, 5, 3, 1)
	,	(10, 6, 1, 1)
	,	(12, 7, 2, 1)
	,	(13, 8, 1, 1)
	,	(14, 9, 3, 1)
	,	(18, 10, 4, 1)

SELECT *
FROM Payment