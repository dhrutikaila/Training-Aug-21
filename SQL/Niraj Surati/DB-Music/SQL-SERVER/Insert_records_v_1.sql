USE DB_MUSIC

-- COUNTRIES

INSERT INTO countries
VALUES ('India')
		,	 ('Canada')
		,	 ('Japan')
		,	 ('United States')
		,	 ('United Kingdom')
		,	 ('Germany')
		,	 ('Ireland')
		,	 ('South Korea')
		,	 ('Mexico')
		,	 ('Italy')


-- STATES

INSERT INTO states 
VALUES	('Punjab', 1)
		,	('Gujarat', 1)
		,	('Gangwon', 8)
		,	('Tokyo', 3)
		,	('California', 4)
		,	('London', 5)
		,	('Trentino', 10)
		,	('Alberta', 2)
		,	('Jalisco', 9)
		,	('Munster', 7)

-- CITIES

INSERT INTO cities 
VALUES ('Amritsar', 1)
		,	('Ahmedabad', 2)
		,	('Wonsan', 3)
		,	('Shibuya', 4)
		,	('Los Angeles', 5)
		,	('Islington', 6)
		,	('Arco', 7)
		,	('Calgary', 8)
		,	('San Sebastian', 9)
		,	('Waterford', 10)

-- Languages

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

-- USERS

INSERT INTO Users (FirstName,LastName,UserName,Email,Password)
VALUES	('Sebastian','Chapman','Mr. Sebastian Chapman','Sebastian_Chapman2940@ovock.tech','220-20-7728')
		,	('Clint','Hudson','Mr. Clint Hudson','Clint_Hudson2817@vetan.org','385-76-0520')
		,	('Doris','Jarrett','Mrs. Doris Jarrett','Doris_Jarrett6832@extex.org','816-83-1053')
		,	('Rufus','Stark','Mr. Rufus Stark','Rufus_Stark5338@famism.biz','212-16-2044')
		,	('Johnathan','Quinnell','Mr. Johnathan Quinnell','Johnathan_Quinnell6634@bulaffy.com','735-83-3487')
		,	('Callie','Clarke','Ms. Callie Clarke','Callie_Clarke6519@jiman.org','456-83-8528')
		,	('Nicole','Funnell','Ms. Nicole Funnell','Nicole_Funnell25@deavo.com','008-42-0001')
		,	('Beatrice','Emmott','Mrs. Beatrice Emmott','Beatrice_Emmott6820@supunk.biz','077-24-1202')
		,	('Alexia','Miller','Mrs. Alexia Miller','Alexia_Miller3243@supunk.biz','628-13-2262')
		,	('Russel','Owen','Mr. Russel Owen','Russel_Owen2509@iatim.tech','625-45-1704')
		,	('Enoch','Preston','Mr. Enoch Preston','Enoch_Preston5587@twace.org','836-78-4322')
		,	('Danny','Webster','Mr. Danny Webster','Danny_Webster818@extex.org','577-52-8505')
		,	('Marina','Ianson','Mrs. Marina Ianson','Marina_Ianson6024@gompie.com','351-12-0662')
		,	('Nicholas','Vallins','Mr. Nicholas Vallins','Nicholas_Vallins4752@infotech44.tech','028-58-8002')
		,	('Janice','Wigley','Ms. Janice Wigley','Janice_Wigley5460@deons.tech','205-65-0827')
		,	('Josh','Gilmour','Mr. Josh Gilmour','Josh_Gilmour5201@bungar.biz','835-61-5276')
		,	('Ada','Morris','Miss Ada Morris','Ada_Morris19@bungar.biz','661-17-2347')
		,	('Rylee','Jarrett','Ms. Rylee Jarrett','Rylee_Jarrett6357@famism.biz','745-32-8633')
		,	('Payton','Plant','Miss Payton Plant','Payton_Plant1318@ubusive.com','502-81-1836')
		,	('Naomi','Jefferson','Miss Naomi Jefferson','Naomi_Jefferson8480@yahoo.com','611-56-7846')

-- PROFILE

INSERT INTO Profile	
VALUES(1,'1991-03-07','3BBFboncX9pxGk63ER5rnBUGctWQOxho58R3MM9FtuCZGlgASPlEwRU2r4nsSXNkbB1ISDq2S0828490MW79Ld2noYLRiQxWhc7F','tYrPitv5Tb4w4wg6ZNY8IOe31YTCCm','M',1)
		,	(2,'2008-12-23','ZXvt16TE96f4yYJZs2rFZzApsRrw5QM3RZbBiSLpBb78l40URD9DmGEjWGBjPhItulmY6I1arCD81BDybXe2RIRKU1obRmZeSOOA','RbXJMjWkCGsVCNH2CPbmUcDEdZIEmj','F',2)
		,	(3,'2001-04-20','TZDehcCwlpzXSpwaR7dbEh8qI3qju0nUz4KAFkFHm0LYrlqq3RdsnwEvaWWovdCvBehXewVr2WyOWk9gMApdW4qD0ZjsNbWJyZWM','ESLH5w0R80ZzXzbuyjZHxehFMndbAp','M',4)
		,	(4,'1992-12-28','tUY9lUPAPYjuF4SSYQTadlkXh4QCyCYahGcSFbYUK58Y2JumORpIvjgItAbrDNMMAJN9c9M728PhnMeYKoxgXPo8jUiFAqQ7tvXt','5uKPFsQwU9fhfDhZZpzveOaHaH7LrR','F',1)
		,	(5,'2006-11-24','Bj6J1hE6lPrUCz7vEECKnsvkH52NKwlkzSYiAB0tu5NfvEbse34xlZLTyWC5p0vznGftaYuCOTaseQyDeJsQ1y9aGFun94E3JX1p','jrSFI2jS9dyih9bfIe8zGEnUoHDTPg','M',6)
		,	(6,'2001-05-25','MGAdivpYBieE7aByQDd4rIXfpoeW9lZo9EcADzqu3sXl9r4MGK8n7siDsey4QSYaIzF38AvaWsB9vwg7uSQzmwrRfZSiBwekT7cJ','mAOFYhRPqjS580K8CixWIxXjsMZkNa','F',8)
		,	(7,'1994-01-05','WkKlgivKGAynoXLIqBQ4elkgb32Hr0rNcbVmO8r24mMWfGZwP6yaUAmu9oKmqncPTlKNCj3rUXA1ZOAVdF1uCQ3bzkmkxEMQK6D4','5MupDGG69vVvozJkvrNCstXb7S4PLu','M',4)
		,	(8,'2009-03-12','0685lectBMMySsuM0uPD3kiZ1QjAS1vRTNGW5UkPOtJ3NcBd7tTMLAVPYiDV5cbJb4fFmXQgKAyJboMZOGDihiFS108XQOUwS9cS','660jcxBLLLytVnGyZ2m2yMNwZ3P5qC','F',5)
		,	(9,'2007-09-22','PBmIfXaXjdusEJihFfJUVhcLxj4v1V4FhtK2nxLpbEmZskKUiNbY8WqsjbU5cpfOipKU9q4SUd2R4CcNYkMo4gHLDcSLcPMwiX1C','ZzV1TIEedZxh9Hh1c1TCi9RgXt0ERG','F',7)
		,	(10,'1999-05-13','vMVrUUrDyeZiyekSANWqQWjT8nHghl5Sn1mhfW6wBcW5YAZ0vebZU7YYmBtrNKgMjH571CwnRkpx9n48NQvDKf7pcN4dnOj06KWR','Ec9sryIuRlZ8Gue6YcCDKPeoIT9CAy','M',1)
		,	(11,'1986-09-27','5W3umbeHSGz7VjXyGtcujrd0tpVGqq71mzN7FSYXWr8gEx6e8hRd5GOO3DA7GYbmJ8VfVasxVFY1s6v6t1HIYe6fk9ECRaQ8QWXG','baIiydHzsXf6REOOQSNpBz5WWqf4yZ','F',3)
		,	(12,'1983-09-05','HvNMBr7IsEmfvMI8MASvJXlj6fs8SS5Br2O4SswsoO0l1w7WM7KFecUtJnQg99zaIlx27NpeNkH5gAsJiVwVI0hPievocQtoYacQ','8EZ8Rp14VZNJ5G7nNeRSDiUccBB70c','M',3)
		,	(13,'1999-05-20','mtVSGb4IJMau6gPo4E22Gkd6eqZazUanKK0SpotAm8YPus9RyyDiBRLBPZyZCeSzvwkwp78QU2QILOLvqHmBQ2m39zCQ0U7Ipjd7','INm0zxOIACzBNCt51Ri3Kqw05raA5H','F',4)
		,	(14,'1994-11-03','ACxlCQXAjxcbv4HXON3jNQ9YQZFFFQqx005pmY21FlLaLBt1DFZP9WwtCYUnKR4TGok49cuzUCelFjNOpOCA1aydELmNEPqxq2Tg','az2lUj472KodKG76P4cq0H0xzhvFVq','F',6)
		,	(15,'2006-03-22','JC8SuhwanqT8EvxyzlMPbNdSHjyOKK9g7PqexxlIJwmAd2Rp2dqPYnG5ipLKthPdqxByESAC9DGolcyOSIVrdtHTJv5HlbZlgJTq','0cljcnPVhbTG061kLi97pspSX3ainf','F',6)
		,	(16,'2003-11-22','zQpjzZ7JWAIxTMjNrsCS17shCDaUJc3670hmu8xFLSvHQCNipmxDtZl2hIhv9nA3HLzcp6cs46HiLlR9z1ogpzNhPpEmbCGhS29E','Mv3tKEJwRCq60h6I8dNR7RN910Q20j','M',2)
		,	(17,'1993-09-02','Iw4F8jyorG4i31UyQ6rxXUnu1KDHmlgBABtDWw2Aap3G2gDDCxZeiZlyJJNxfrBGj3h2IQbeDqWsag2VH9EzMBdlZ44MiFfsnxg9','8K5vV5a1C2XmR2qgnL3hZ6cNVO58Ln','M',1)
		,	(18,'1999-01-14','S5qY8Fb38jCsraH9bpZxvmYftcUrm6xY5qDTPjMinsBTUOW2WRJ6ItwqhKpgvtQBvnwBWyu1c1KCkEKfFbVVx0PM4XvE4qw3b9iq','bUgihReRitFd9JaUY5O4YkG8Cp7wER','F',5)
		,	(19,'2009-07-23','SEuPcegvnS1Nhg1TrMRJe7fGpZmHsia66qukMgmwDz2LLhXP6MpuVAyVjojD2YDF14R0wRHKkfFoET4IBWLf2pl52YBi6j4pwxUR','PhdpEeK05JRPtbBfNhMMTW8XPiNBla','M',9)
		,	(20,'2003-02-22','wyfhYbPlH73jGZgQJPeSAPGihmqGxriVPPcusdM8mo2p95xG4IVffaHhs79wvIxaYhT07vhpCfqVXajmyjLpVD0yI5BveaNd1bQb','l6JIkqc9uvJRYX7L7IEVresBuwLmSN','M',10)

-- ARTISTS

INSERT INTO Artists (UserID,Name,DOJ) 
VALUES(4,'J. R. R. Tolkien','2019-04-25')
		,	(8,'William Shakespeare','2017-04-11')
		,	(14,'Jane Austen','2020-07-12')
		,	(15,'Alexander Pushkin','2015-06-29')
		,	(19,'Jin Yong','2014-05-22')


-- Albums

INSERT INTO Albums (ArtistId,Name ,Picture ,CountryID ,PublishedON )
VALUES(1,'Luke','Chocolat.png',1,'2018-11-12')
	,	(2,'Liam','Iron Man.png ',2,'2021-07-14')
	,	(3,'Angela','Brimstone.png',5,'2017-06-21')
	,	(4,'Thea','Pretty Woman.png',4,'2016-01-25')
	,	(5,'Felicity','Snatch.png',1,'2018-09-09')
	,	(5,'Phillip','Iron Man.png ',6,'2012-08-23')
	,	(4,'Celina','Seven.png',7,'2019-01-22')
	,	(3,'Carolyn','The Godfather.png',5,'2014-10-16')
	,	(2,'Russel','The Dark Tower.png',2,'2013-07-15')
	,	(1,'Kurt','Alien.png', 1,'2012-12-19')

-- Genres

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

-- Songs

INSERT INTO Songs (AlbumID
	,	GenreId
	,	Name
	,	LanguageID
	,	SongFile
	,	SongFileType
	,	Duration
	,	PublishedON
	,	Active
)
VALUES(1,3,'one',3,'gsj','wav','00:04:03','2018-11-12',1)
	,	(1,4,'Closer',4,'hws','mp3','00:01:30','2018-11-12',1)
	,	(2,5,'Welcome',5,'hoa','mp3','00:02:00','2021-07-14',1)
	,	(2,6,'Sorry',6,'fhd','m3u','00:03:00','2021-07-14',1)
	,	(3,7,'Senorita',7,'jtu','mp3','00:02:26','2017-06-21',1)
	,	(3,8,'Sugar & Brownies',8,'tou','wav','00:01:05','2017-06-21',1)
	,	(4,9,'Believer',9,'upj','mp3','00:4:09','2016-01-25',1)
	,	(5,10,'On my way',10,'ljk','wav','00:02:00','2018-09-09',1)

-- Podcasts



INSERT INTO Podcasts (AlbumID
	,	GenreId
	,	Name
	,	LanguageID
	,	PodcastFile
	,	PodcastFileType
	,	StreamedON
	,	Duration
	,	Active
)
VALUES(6,1,'The perfect pod',1,'agd','m3u','2012-08-23','00:20:00',1)
	,	(6,2,'on the issue',2,'rdw','wav','2012-08-23','00:27:26',1)
	,	(7,3,'defiant princess',3,'hsj','wav','2019-01-22','00:30:05',1)
	,	(7,4,'spoken words',4,'khk','mp3','2019/03/04','00:33:00',1)
	,	(8,5,'Morning talk',5,'pte','mp3','2014-10-16','00:25:16',1)
	,	(8,6,'on the air',6,'gon','m3u','2014-10-16','00:34:08',1)
	,	(9,7,'the ineterview',7,'fae','mp3','2013-07-15','00:28:00',1)
	,	(9,8,'knowledge share',8,'ktj','wav','2013-07-15','00:18:03',1)
	,	(10,9,'Band of blue',9,'sho','mp3','2012-12-19','00:23:18',1)
	,	(10,10,'happy host',10,'jua','wav','2012-12-19','00:40:01',1)