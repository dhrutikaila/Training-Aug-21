CREATE database group_task
use group_task
DROP database group_task
--PRIMARY KEY TABLE 

create table Collection_of_shows
(
	Show_ID int identity(101,1) primary key,
	Name varchar(50) not null,
	Genre numeric(2) not null ,
	Release_Date Date,
	Maturity_Age  numeric(3) not null,
	Subtitles numeric(2),
	Language numeric(2)
)

Create Table Login_Credentials
(
	Email_ID nvarchar(50) primary key CHECK (Email_ID like '%__@_%.com' ) not null,
	Password Char(40) not null
)
 
create table Subscribers
(
	Subscribers_ID int primary key,
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	Email_ID nvarchar(50) UNIQUE foreign key references Login_Credentials(Email_ID) CHECK (Email_ID like '%__@_%.com' ) not null  ,
	Age numeric(3) not null,
	Gender numeric(1) not null,
	Phone_Number numeric(10) check(Phone_Number between 1000000000 and 9999999999) not null,
	Number_of_users numeric(1) check (Number_of_users<6),
	Subscription_Type numeric(1) not null,
	Subscription_Plan numeric(1) not null, --here duration is in months
) 

create table Payment 
(
	Payment_ID int identity(894165,1) primary key,
	Subscribers_ID int foreign key references Subscribers(Subscribers_ID) not null,
	Payment_Type numeric(2) not null,
	Card_Number numeric(16) check(Card_Number>3999999999999999 and Card_Number<7000000000000000) not null,
	Valid_Thru date not null ,
	Name_on_card varchar(30) not null,
	Invoice_Date date not null
)

create table Actors 
(
	Actor_ID int identity(1001,1) primary key,
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	Age numeric(3) not null,
	Gender numeric(1) not null,
	Nationality varchar(15)

)

CREATE TABLE Director 
(
	Director_ID int primary key identity(1,1),
	Director_Name varchar(20) not null
)

--FOREIGN KEY TABLES

create table Production 
(
	Production_ID INT identity(201,1) primary key,
	Production_Name varchar(50)  not null
)

CREATE TABLE Production_show
(
	Show_ID int foreign key references Collection_of_shows(Show_ID) not null,
	Production_ID int foreign key references Production(Production_ID) not null
)

CREATE TABLE Director_show
(
	Show_Id int foreign key references Collection_of_shows(Show_ID) not null,
	Director_ID int foreign key references Director(Director_ID) not null
)


create table Web_Shows 
(
	Show_ID int  foreign key references Collection_of_shows(Show_ID) not null,
	Season numeric(3)  not null,
	Episodes numeric(3)  not null,
	Budget money  not null
)

create table Movies   
(
	Show_ID int foreign key references Collection_of_shows(Show_ID) not null,
	Duration float(20)  not null,
	Budget money not null
)

create table Genre_Preference  
(
	Subscribers_ID int foreign key references Subscribers(Subscribers_ID) not null,
	Genre numeric(2)
)	

create table Language_Preference  
(
	Subscribers_ID int foreign key references Subscribers(Subscribers_ID) not null,
	Language numeric(2)
)	

create table Statistic    
(
	Show_ID int  foreign key references Collection_of_shows(Show_ID) not null,
	Views int  not null,
)	

create table Rating     
(
	Show_ID int  foreign key references Collection_of_shows(Show_ID) not null,
	IMDB_Rating float,
)

create table Actor_Work  
(
	Actor_ID int foreign key references Actors(Actor_ID) not null,
	Show_ID int  foreign key references Collection_of_shows(Show_ID) not null
)	

create table Poster 
(
	Poster_ID int primary key identity(1,1),
	show_ID int constraint post_fk foreign key references collection_of_shows(Show_ID),
	Poster_image varbinary(max)
)

create table Object_Type
(
	Type_ID numeric(2) Primary key,
	Object_Type varchar(20)  not null
)

create table Object_values
(
	Object_Id int Primary key,
	Type_ID numeric(2) Foreign key references Object_Type(Type_ID)  not null,
	Value varchar(20)  not null
)

insert into Collection_of_shows
(Name,Genre,Maturity_Age,Release_Date,Subtitles,Language) 
values
('Inception',20,16,'2010/07/16',25,25),
('Jab We Met',18,13,'2007/10/26',25,26),
('Annabelle',16,16,'2007/10/26',25,25),
('Enola Holmes',17,13,'2020/09/23',25,25),
('The Karate Kid',21,7,'2010/06/10',25,25),
('Jodha Akbar',18,16,'2008/02/15',25,26),
('Godzilla : The King of the Monsters ',20,13,'2019/05/13',25,26),
('The Social Dilemma',15,13,'2020/01/26',25,25),
('The Girl on the Train',24,16,'2021/02/26',25,26),
('Jurassic World',20,16,'2015/06/09',25,25),
('Sherlock',19,18,'2010/07/25',25,25),
('Friends',23,13,'1994/09/22',26,25),
('Dark',24,18,'2017/12/01',27,27),
('The 100',14,18,'2014/03/19',25,25),
('Greys Anatomy',13,18,'2005/03/27',25,25),
('Elite',14,18,'2018/10/05',28,28),
('Sacred Games ',24,18,'2018/07/05',26,26),
('Emily in Paris',13,16,'2020/10/02',25,26),
('Gilmore Girls',14,18,'2000/10/05',25,25),
('The good place',13,13,'2016/09/19',25,26),
('365 Days',18,18,'2020/02/07',25,25),
('Malang',24,16,'2020/02/07',25,26),
('The Intern',13,13,'2015/09/25',26,25),
('IT Chapter Two',16,18,'2019/08/26',25,25),
('Interstellar',20,13,'2014/11/07',26,25),
('Mimi',14,13,'2021/07/26',26,26),
('Gunjan Saxena : The Kargil  Girl ',14,13,'2020/08/12',25,25),
('A Christmas Prince',18,13,'2017/11/17',25,25),
('The Sky Is Pink',14,13,'2019/10/11',25,25),
('Spider-Man : Homecoming',20,13,'2017/07/07',26,26),
('Money Heist',19,18,'2017/05/02',25,26),
('Lucifer',13,16,'2016/01/25',25,26),
('Stranger things',20,16,'2016/07/15',26,26),
('Never have I ever',13,13,'2020/04/27',25,25),
('Peaky Blinders',22,18,'2013/09/12',25,25),
('The vampire dairies',14,18,'2009/09/10',25,25),
('The originals ',16,18,'2013/10/03',25,25),
('Brooklyn nine nine',23,16,'2013/09/17',25,25),
('Suits',14,16,'2011/06/23',25,25),
('Breaking bad',19,18,'2008/01/20',25,25)

insert into Login_Credentials 
(Email_ID , Password ) 
values 
('vishwasshivnani248@gmail.com','$2y$10$.vGA1O9wmRjr' ),
('karangurnani45@hotmail.com' , 'vGA1O9wmRjrwAVXD98HNOgsNpD' ),
('sahilkhewlani2000@outlook.com','dfdec$10888b72151965a34b4b59031290a' ),
('sanskarpatel56@yahoo.com' ,'3338be694f50c5f338814986c' ),
('neerajbhagchandani487@gmail.com' ,'6cdf0686453a888b84f424d792' ),
('bhaveshpol@gmail.com' ,'cf24dba5fb0a30e26e83b2ac5' ),
('jeslynmartin1@gmail.com' ,'5b9e29e1b161e5c1fa7425e73' ),
('shushantshah88@gmail.com' ,'9e1b161e$105c1fa7425e730' ),
('harshshah12@gmail.com' ,'5d527c368f2efe848ec' ),
('shreyaash188@gmail.com' ,'f6$2b073a36767800805e9eef2b' ),
('bhumikashah@gmail.com' ,'857d5f984f036eb6df891d' ),
('valandhimanshu@gmail.com' ,'75f72d9b154518c1cd58835286'),
('parmarbhavin@gmail.com','d1da9a38deba3$2de98b5a53e5ed78a' ),
('jillsingel@gmail.com' ,'686453a888b84f424dwefae43' ),
('prakrutijoshi@gmail.com' ,'fa7425e7357d5f984f03' ),
('jaypatel@gmail.com' ,'3a36767800805asfesfscACH' ),
('padiadhruv@gmail.com' , 'secQnUYndoewF95ZCsCdcsdc'),
('disha233@gmail.com' ,'5b9e29$2b073a36767800805' ),
('shahanuj277@gmail.com' ,'8HNOgsNpDcQnUYndoewF' ),
('prince345@gmail.com' ,'SDCVDVFVXczdvxfvzsdcc3rdsfe4' )

insert into Subscribers
(Subscribers_ID,FirstName,LastName,Email_ID,Age,Gender,Phone_Number,Number_of_users,Subscription_Type,Subscription_Plan) 
values
(001,'Vishwas','Shivnani','vishwasshivnani248@gmail.com',25,1,9845782356,4,8,6),
(002,'Karan','Gurnani','karangurnani45@hotmail.com',17,1,8945785645,1,7,4),
(003,'Sahil','Khewlani','sahilkhewlani2000@outlook.com',30,1,7856894578,1,8,6),
(004,'Sanskar','Patel','sanskarpatel56@yahoo.com',25,1,9545123056,2,8,5),
(005,'Neeraj','Bhagchandani','neerajbhagchandani487@gmail.com',29,1,6353427898,1,7,4),
(006,'Bhavesh','Pol','bhaveshpol@gmail.com',24,1,8456922457,4,8,5),
(007,'Jeslyn','Martin','jeslynmartin1@gmail.com',23,1,9548563214,3,8,6),
(008,'Shushant','Shah','shushantshah88@gmail.com',40,1,9756428456,5,8,6),
(009,'Harsh','Shah','harshshah12@gmail.com',13,1,9632174859,5,8,6),
(010,'Shreyash','Soni','shreyaash188@gmail.com',32,1,6351489521,1,7,4),
(011,'Bhumika','Shah','bhumikashah@gmail.com', 34,2,8451221120, 5,8,6),
(012,'Himanshu','valand','valandhimanshu@gmail.com', 22,1,7844962150, 5, 8,5),
(013,'bhavin','parmar','parmarbhavin@gmail.com', 22,1, 4577456655, 4, 7,6),
(014,'jalpa','singel','jillsingel@gmail.com', 26,2, 4575645455, 2, 7,4),
(015,'prakruti','joshi','prakrutijoshi@gmail.com', 21,2, 9874566310, 4, 8,6),
(016,'Jay','Patel','jaypatel@gmail.com',23,1,9876543210,2,8,5),
(017,'Dhruv','Padia','padiadhruv@gmail.com',20,1,9856343812,1,7,4),
(018,'Disha','Shah','disha233@gmail.com',25,2,8765543211,5,8,6),
(019,'Anuj','Shah','shahanuj277@gmail.com',30,1,9815386880,4,8,5),
(020,'Priyam','Doshi','prince345@gmail.com',18,1,9727409210,1,7,4)

insert into Payment (Subscribers_ID,Payment_Type,Card_Number,Valid_Thru,Name_on_card,Invoice_Date)
values 
(001,9,5103477772005858,'2021/07/31','Vishwas Shivnani','2020/12/12'),
(002,10,5462248789652415,'2021/12/31','Karan Gurnani','2021/2/24'),
(003,10,6352147854269845,'2022/02/28','Sahil Khewlani','2021/6/14'),
(004,9,6599412574856325,'2024/07/31','Sanskar Patel','2020/10/07'),
(005,10,6251758545239541,'2020/10/31','Neeraj Bhagchandani','2020/1/17'),
(006,9,4541632795462135,'2027/02/28','Bhavesh Pol','2020/3/03'),
(007,10,4925741258964512,'2024/03/31','Jeslyn Martin','2020/11/05'),
(008,9,6565982314785698,'2029/05/31','Shushant Shah','2020/09/17'),
(009,10,4585693214785632,'2025/09/30','Harsh Shah','2020/07/22'),
(010,10,5103477772005858,'2021/10/31','Shreyash Soni','2020/07/22'),
(011,9,6251758545239541,'2023/09/30','Bhumika Shah','2020/11/05'),
(012,10,4585693214785632,'2028/09/30','Himanshu valand','2020/12/12'),
(013,10,5103477772005858,'2022/04/30','bhavin parmar','2020/12/12'),
(014,9,6547961254789652,'2025/12/31','jalpa singel','2021/6/14'),
(015,10,5462248789652415,'2026/11/30','prakruti joshi','2020/1/17'),
(016,9,5103477772005858,'2021/10/31','Jay Patel','2021/03/15'),
(017,10,4599412574856325,'2023/06/30','Dhruv Padia','2021/08/19'),
(018,9,6325452123658965,'2024/07/31','Disha Shah','2020/08/12'),
(019,10,5632145257896523,'2030/07/31','Anuj Shah','2020/07/07'),
(020,10,6696587452123659,'2020/08/31','Priyam Doshi','2020/07/07')


insert into Actors 
(FirstName,LastName,Age,Gender,Nationality)
values
('Leonardo','DiCaprio',46,1,'American'),
('Joseph','Gordan-Levitt',40,1,'American'),
('Elliot','Page',34,3,'Canadian'),
('Shahid','Kapoor',40,1,'Indian'), 
('Tarun','Arora',42,1,'Indian'), 
('Kareena','Kapoor',40,2,'Indian'), 
('Annabelle','Wallis',36,2,'British'),
('Ward','Horton',45,1,'American'),
('Tony','Amendola',69,1,'American'),
('Millie','Bobby Brown',17,2,'British'),
('Henry','Cavill',38,1,'British'),
('Loius','Partridge',18,1,'British'),
('Jaden','Smith',23,1,'American'),
('Jackie','Chan',67,1,'Hong Kong'),
('Taraji','Henson',50,2,'American'), 
('Hrithik','Roshan',47,1,'Indian'), 
('Aishwariya','Rai Bachchan',47,2,'Indian'), 
('Sonu','Sood',48,1,'Indian'), 
('Kyle','Chandler',55,1,'American'), 
('Vera','Farmiga',48,2,'American'), 
('Skyler','Gisondo',25,1,'American'), 
('Kara','Hayward',22,2,'American'), 
('Vincent','Kartheiser',42,1,'American'), 
('Parineeti','Chopra',32,2,'Indian'), 
('Aditi','Rao Hydari',34,2,'Indian'), 
('Kirti','Kulhari',36,2,'Indian'), 
('Chris','Pratt',42,1,'American'), 
('Byrc','Dallas Howard',40,2,'American'), 
('Vincent','DOnofrio',62,1,'American'),
('Anna-Maria','Sieklucka',29,2,'Polish'), 
('Michele','Morrone',30,1,'Italian'),
('Anil','Kapoor',64,1,'Indian'),
('Aditya','Roy Kapur',35,1,'Indian'),
('Disha','Patani',29,2,'Indian'),
('Robert','De Niro',78,1,'American'),
('Anne','Hathaway',38,2,'American'),
('Rene','Russo',67,2,'American'),
('Jessica','Chastein',44,2,'American'),
('James','McAvoy',42,1,'Scottish'),
('Bill','Hader',43,1,'American'),
('Matthew','McConaughey',51,1,'American'),
('Kriti','Sanon',31,2,'Indian'),
('Pankaj','Tripathi',44,1,'Indian'),
('Sai','Tamhankar',35,2,'Indian'),
('Jahnvi','Kapoor',24,2,'Indian'),
('Angad','Bedi',38,1,'Indian'),
('Rose','McIver',32,2,'New Zealand'),
('Ben','Lamb',32,1,'British'),
('Alice','Krige',67,2,'South African'),
('Honor','Kneafsey',17,2,'British'),
('Priyanka','Chopra Jonas',39,2,'Indian'),
('Farhan','Akhtar',47,1,'Indian'),
('Zaira','Wasim',20,2,'Indian'),
('Rohit','Saraf',24,1,'Indian'),
('Tom','Holland',25,1,'British'),
('Robert','Downey Jr.',56,1,'American'),
('Michael','Keaton',69,1,'American'),
('Ursula','Corbero',32,2,'Spanish'),
('Alvaro','Morte',46,1,'Spanish'),
('Itziar','Ituno',47,2,'Spanish'),
('Tom','Ellis',42,1,'Welsh'),
('Lauren','German',42,2,'American'),
('Kevin','Alejandro',45,1,'American'),
('Winona','Ryder',49,2,'American'),
('David','Harbour',46,1,'American'),
('Finn','Wolfhard',18,1,'Canadian'),
('Maitreyi','Ramakrishnan',19,2,'Canadian'),
('Darren','Barnet',30,1,'American'),
('Richa','Moorjani',32,2,'Indian'),
('Jaren','Lewison',20,1,'American'),
('Cilian','Murphy',45,1,'Irish'),
('Sam','Neill',73,1,'New Zealand'),
('Helen','McCroy',53,2,'British'),
('Nina','Dobrev',32,2,'Canadian'),
('Paul','Wesley',39,1,'American'),
('Ian','Somerhalder',42,1,'American'),
('Candice','King',34,2,'American'),
('Joseph','Morgan',40,1,'British'),
('Daniel','Gillies',45,1,'New Zealand'),
('Claire','Holt',33,2,'Australian'),
('Phoebe','Tonkin',32,2,'Australian'),
('Andy','Samberg',43,1,'American'),
('Stephanie','Beatriz',40,2,'Argentine'),
('Terry','Crews',53,1,'American'),
('Melissa','Fumero',39,2,'American'),
('Gabriel','Macht',49,1,'American'),
('Patrick','Adams',39,1,'Canadian'),
('Rick','Hoffman',51,1,'American'),
('Bryan','Cranston',65,1,'American'),
('Anna','Gunn',53,2,'American'),
('Aaron','Paul',41,1,'American'),
('Benedict','Cumberbatch',45,1,'British'),
('Martin','Freeman',49,1,'British'),
('Jennifer','Aniston',52,2,'American'),
('Courteney','Cox',57,2,'American'),
('Lisa','Kudrow',58,2,'American'),
('Matt','LeBlanc',54,1,'American'),
('Matthew','Perry',53,1,'Canadian'),
('David','Schwimmer',54,1,'American'),
('Loius','Hofmann',24,1,'German'),
('Oliver','Masucci',52,1,'German'),
('Julika','Jenkins',49,2,'German'),
('Eliza','Taylor',31,2,'Australian'),
('Paige','Turco',56,2,'American'),
('Thomas','McDonell',35,1,'American'),
('Ellen','Pompeo',51,2,'American'),
('Sandra','Oh',50,2,'Canadian'),
('Katherine','Heigl',42,2,'American'),
('Justin','Chambers',51,1,'American'),
('Maria','Pedraza',25,2,'Spanish'),
('Itzan','Escamilla',23,1,'Spanish'),
('Miguel','Bernardeau',24,1,'Spanish'),
('Saif','Ali Khan',51,1,'Indian'),
('Nawazuddin','Siddiqui',47,1,'Indian'),
('Radhika','Apte',35,2,'Indian'),
('Kalki','Koechlin',37,2,'Indian'),
('Ranvir','Shorey',49,1,'Indian'),
('Lily','Collins',32,2,'British'),
('Philippine','Leroy-Beaulieu',58,2,'German'),
('Lauren','Graham',54,2,'American'),
('Alexis','Bledel',39,2,'American'),
('Melissa','McCarthy',50,2,'American'),
('Scott','Patterson',62,1,'American'),
('Kristen','Bell',41,2,'American'),
('William','Harper',41,1,'American'),
('Jameela','Jamil',35,2,'British')

Insert into Director
(Director_Name)
values
('Christopher Nolan'),
('Imtiaz Ali'),
('John R. Leonetti'),
('Harry Bradbeer'),
('Harald Zwart'),
('Ashutosh Gowariker'),
('Michael Dougherty'),
('Jeff Orlawski'),
('Ribhu Dasgupta'),
('Colin Trevorrow'),
('Mark Gatiss'),
('Steven Moffat'),
('David Crane'),
('Marta kauffman'),
('Baran bo Odar'),
('Jantje Friese'),
('Jason Rothernberg'),
('Shonda Rhimes'),
('Carlos Montero'),
('Dario Madrona'),
('Anurag Kashyap'),
('Darren Star'),
('Amy Sherman-Paladino'),
('Michael Schur'),
('Barbara Bialowas'),
('Tomasz Mandes'),
('Mohit Suri'),
('Nancy Meyers'),
('Andy Muschietti'),
('Laxman Utekar'),
('Sharan Sharma'),
('Alex Zamm'),
('Shonali Bose'),
('Jon Watts'),
('Alex Pina'),
('Tom Kapinos'),
('The Duffer Brothers'),
('Mindy Kaling'),
('Lang Fisher'),
('Steven Knight'),
('Kevin Williamson'),
('Julie Plec'),
('Dan Goor'),
('Aaron Korsh'),
('Vince Gilligan')

insert into Production
(Production_Name)
values
('Legendary Pictures'),
('Syncopy'),
('Shree Ashtavinayak Cine Vision Limited'),
('New Line Cinema'),
('RatPac-Dune Entertainment'),
('Atomic Monster Productions'),
('The Safran Company'),
('PCMA Productions'),
('Columbia Pictures'),
('China Film Group'),
('Overbook Entertainment'),
('JW Productions'),
('Ashutosh Gowariker Productions Private Limited'),
('Exposure Labs'),
('Argent Pictures'),
('The Space Program'),
('Reliance Entertainment'),
('Amblin Entertainment'),
('The Kennedy/Marshall Company'),
('Hartswood Films'),
('BBC Wales'),
('WGBH'),
('Bright/Kauffman/Crane Production'),
('Warner Bros.Television'),
('Weidemann & Berg Television'),   
('Alloy Entertainment'),
('CBS Television Studio'),
('Shandaland'),
('The Mark Gordon Company'),
('Entertainment One Television'),
('Zeta Producciones'),
('Phantom Films'),
('Darren Star Productions'),
('Jax Media'),
('MTV Studios'),
('Dorothy Parker Drank Here Productions'),
('fremulon'),
('Dr. goor Productions'),
('3 Arts Entertainment'),
('Universal Television'),
('Ekipa Sp. z o.o. Future Space'),
('Luv Films'),
('T-Series'),
('Northern Lights Entertainment'),
('Waverly Films'),
('Double Dream'),
('Vertigo Entertainment'),
('Rideback'),
('Paramount Pictures'),
('Lynda Obst Productions'),
('Maddock Films'),
('Jio Studios'),
('Dharma Productions'),
('Zee Studios'),
('MPCA'),
('RSVP Movies'),
('Roy Kapur Films'),
('Purple Pebble Pictures'),
('Ivanhoe Pictures'),
('Marvel Studios'),
('Pascal Pictures'),
('Atres media'),
('Vancouver Media'),
('Jerry Bruckheimer Television'),
('DC Entertainment'),
('21 Laps Entertainment'),
('Monkey Massatrc'),
('Kailing International Inc.'),
('Original Langster'),
('BBC Studios'),
('Caryn Mandabach Productions'),
('Tiger Ascept Productions'),
('Screen yorkshire'),
('Outerbanks Entertainment'),
('Untitiled Korsh Company'),
('Hypnotic Films & Television'),
('Universal Cable/Content Productions'),
('high Bridge Entertainment'),
('Gran Via Productions'),
('sony Pictures Television')


insert into Production_show
(Show_ID,Production_ID)
values
(101,201),
(101,202),
(102,203),
(104,201),
(104,208),
(105,209),
(105,210),
(105,211),
(105,212),
(106,213),
(107,201),
(108,214),
(108,215),
(108,216),
(109,217),
(110,218),
(110,201),
(110,219),
(111,220),
(111,221),
(111,222),
(112,223),
(112,224),
(113,225),
(114,226),
(114,227),
(114,224),
(115,228),
(115,229),
(115,230),
(116,231),
(117,232),
(117,217),
(118,233),
(118,234),
(118,235),
(119,236),
(119,224),
(120,237),
(120,238),
(120,239),
(120,240),
(121,241),
(122,242),
(122,243),
(122,244),
(123,205),
(123,245),
(124,204),
(124,246),
(124,247),
(124,248),
(125,249),
(125,224),
(125,201),
(125,202),
(125,250),
(126,251),
(126,252),
(127,253),
(127,254),
(128,255),
(129,256),
(129,257),
(129,258),
(129,259),
(130,209),
(130,260),
(130,261),
(131,262),
(131,263),
(132,264),
(132,265),
(132,224),
(133,266),
(133,267),
(134,268),
(134,269),
(134,239),
(134,240),
(135,270),
(135,271),
(135,272),
(135,273),
(136,274),
(136,226),
(136,227),
(136,224),
(137,226),
(137,227),
(137,224),
(138,237),
(138,238),
(138,239),
(138,240),
(139,275),
(139,276),
(139,277),
(140,278),
(140,279),
(140,280)

insert into Director_show
(Show_Id,Director_ID)
values
(101,1),
(102,2),
(103,3),
(104,2),
(105,5),
(106,6),
(107,7),
(108,8),
(109,9),
(110,10),
(111,11),
(111,12),
(112,13),
(112,14),
(113,15),
(113,16),
(114,17),
(115,18),
(116,19),
(116,20),
(117,21),
(118,22),
(119,23),
(120,24),
(121,25),
(121,26),
(122,27),
(123,28),
(124,29),
(125,1),
(126,30),
(127,31),
(128,32),
(129,33),
(130,34),
(131,35),
(132,36),
(133,37),
(134,38),
(134,39),
(135,40),
(136,41),
(136,42),
(137,42),
(138,43),
(138,24),
(139,44),
(140,45)

insert into Web_Shows(Show_ID,Season,Episodes,Budget) values
(111, 4,13,6500000),
(112, 10,236,10000000),
(113, 3,26,5500000),
(114, 7,100,800000),
(115, 17,380,5000000),
(116, 4,32,6000000),
(117, 2,16,77000000),
(118, 1,10,400000),
(119, 7,153,78000000),
(120, 4,53,4000000),
(131, 4, 38,500000000),
(132, 5, 83,700000000),
(133, 3, 25,400000000),
(134, 2, 20,500000000),
(135, 5, 30,300000000),
(136, 8, 171,500000000),
(137, 5, 92,800000000),
(138, 8, 143,600000000),
(139, 9, 134,500000000),
(140, 5, 62,200000000)

insert into Movies(Show_ID,Duration,Budget) values
(101,2.5,1000000000),
(102,2.35,2000000000),
(103,1.6,1500000000),
(104,2.05,2500000000),
(105,2.4,3000000000),
(106,3.5,3500000000),
(107,2.15,100000000),
(108,1.35,11000000000),
(109,2,900000000),
(110,2.04,800000000),
(121,1.54,8500000),
(122,2.11,9500000),
(123,2.01,100000000),
(124,2.49,95000000),
(125,2.49,654000000),
(126,2.12,124000000),
(127,1.52,6000000),
(128,1.32,5000000),
(129,2.23,80000000),
(130,2.13,89000000)

insert into Genre_Preference(Subscribers_ID, Genre) 
values
(001,20),
(001,14),
(001,13),
(002,16),
(002,20),
(002,13),
(003,18),
(003,17),
(004,12),
(004,15),
(004,24),
(004,11),
(005,20),
(005,14),
(005,13),
(006,16),
(006,20),
(006,13),
(006,18),
(007,17),
(007,12),
(007,15),
(008,24),
(008,11),
(009,20),
(009,14),
(009,13),
(010,16),
(010,20),
(010,13),
(011,18),
(011,17),
(012,12),
(012,15),
(012,24),
(012,11),
(013,20),
(013,14),
(013,13),
(014,16),
(014,20),
(014,13),
(014,18),
(015,17),
(015,12),
(016,15),
(016,24),
(016,11),
(017,20),
(017,14),
(017,13),
(018,16),
(018,20),
(018,13),
(018,18),
(019,17),
(019,12),
(020,15),
(020,24),
(020,11)

insert into Language_Preference(Subscribers_ID,Language) 
Values
(001,26),
(001,25),
(001,28),
(001,27),
(001,30),
(001,29),
(001,30),
(002,26),
(002,25),
(003,26),
(003,25),
(003,28),
(004,26),
(004,29),
(004,25),
(005,30),
(005,29),
(006,25),
(006,26),
(007,28),
(007,25),
(007,27),
(008,28),
(008,25),
(008,26),
(008,27),
(009,30),
(009,29),
(010,25),
(011,27),
(012,26),
(012,25),
(012,27),
(013,27),
(013,25),
(013,28),
(014,26),
(014,29),
(014,27),
(015,26),
(015,25),
(015,30),
(016,29),
(016,28),
(017,26),
(017,30),
(017,25),
(018,25),
(018,29),
(019,25),
(019,30),
(020,26),
(020,29)

insert into Statistic(Show_ID,Views) values
(101,5000000),
(102,10000000),
(103,25000000),
(104,500000),
(105,7000000),
(106,6000000),
(107,5500000),
(108,7500000),
(109,6500000),
(110,4500000),
(111,3500000),
(112,70000000),
(113,8000000),
(114,8500000),
(115,9000000),
(116,95000000),
(117,6000000),
(118,4000000),
(119,40000000),
(120,100000000),
(121,30000000),
(122,22000000),
(123,502000000),
(124,65000000),
(125,4200000),
(126,22000000),
(127,55000000),
(128,58000000),
(129,76000000),
(130,7400000),
(131,84000000),
(132,81000000),
(133,87000000),
(134,79000000),
(135,880000),
(136,77000000),
(137,800200),
(138,84000000),
(139,84000000),
(140,94000000)

insert into Rating(Show_ID,IMDB_Rating) values 
(101,8.8),
(102,7.9),
(103,5.4),
(104,6.6),
(105,6.2),
(106,7.6),
(107,6),
(108,7.6),
(109,4.4),
(110,7),
(111,9.1),
(112,8.9),
(113,8.8),
(114,7.6),
(115,7.5),
(116,7.5),
(117,8.3),
(118,7),
(119,8.1),
(120,8.2),
(121,3.3),
(122,6.5),
(123,7.1),
(124,6.5),
(125,8.6),
(126,8.1),
(127,5.3),
(128,5.8),
(129,7.6),
(130,7.4),
(131,8.4),
(132,8.1),
(133,8.7),
(134,7.9),
(135,8.8),
(136,7.7),
(137,8.2),
(138,8.4),
(139,8.4),
(140,9.4)


insert into Actor_Work
(Actor_ID,Show_ID)
values
(1001,101),
(1002,101),
(1003,101),
(1004,102),
(1005,102),
(1006,102),
(1007,103),
(1008,103),
(1009,103),
(1010,104),
(1010,107),
(1011,104),
(1012,104),
(1013,105),
(1014,105),
(1015,105),
(1016,106),
(1017,106),
(1018,106),
(1019,107),
(1020,107),
(1021,108),
(1022,108),
(1023,108),
(1024,109),
(1025,109),
(1026,109),
(1027,110),
(1028,110),
(1029,110),
(1030,121),
(1031,121),
(1032,122),
(1033,122),
(1034,122),
(1035,123),
(1036,123),
(1036,125),
(1037,123),
(1038,124),
(1038,125),
(1039,124),
(1040,124),
(1041,125),
(1042,126),
(1043,126),
(1043,127),
(1043,117),
(1044,126),
(1045,127),
(1046,127),
(1047,128),
(1048,128),
(1049,128),
(1050,128),
(1051,129),
(1052,129),
(1053,129),
(1054,129),
(1055,130),
(1056,130),
(1057,130),
(1058,131),
(1059,131),
(1060,131),
(1061,132),
(1062,132),
(1063,132),
(1064,133),
(1065,133),
(1066,133),
(1067,134),
(1068,134),
(1069,134),
(1070,134),
(1071,135),
(1072,135),
(1073,135),
(1074,136),
(1075,136),
(1076,136),
(1077,136),
(1078,137),
(1079,137),
(1080,137),
(1081,137),
(1077,137),
(1078,136),
(1079,136),
(1080,136),
(1081,136),
(1082,138),
(1083,138),
(1084,138),
(1085,138),
(1086,139),
(1087,139),
(1088,139),
(1089,140),
(1090,140),
(1091,140),
(1092,111),
(1093,111),
(1094,112),
(1095,112),
(1096,112),
(1097,112),
(1098,112),
(1099,112),
(1100,113),
(1101,113),
(1102,113),
(1103,114),
(1104,114),
(1105,114),
(1106,115),
(1107,115),
(1108,115),
(1109,115),
(1110,116),
(1111,116),
(1112,116),
(1113,117),
(1114,117),
(1115,117),
(1116,117),
(1117,117),
(1118,118),
(1119,118),
(1120,119),
(1121,119),
(1122,119),
(1123,119),
(1124,120),
(1125,120),
(1126,120)

insert into Object_Type 
(Type_ID, Object_Type)
values
(1, 'Gender'),
(2, 'Subscription_Plan'),
(3, 'Subscription_Type'),
(4, 'Payment_Type'),
(5, 'Genre'),
(6, 'Language')

insert into Object_values
(Object_Id, Type_ID, Value)
Values 
(1, 1, 'Male'),
(2, 1, 'Female'),
(3, 1, 'Others'),
(7, 3, 'Trial'),
(8, 3, 'Paid'),
(9, 4, 'Credit Card'),
(10, 4, 'Debit Card'),
(11, 5,'Action' ),
(12, 5, 'Adventure'),
(13, 5, 'Comedy'),
(14, 5, 'Drama'),
(15, 5, 'Documentary'),
(16, 5, 'Horror'),
(17, 5, 'Mystery'),
(18, 5, 'Romance'),
(19, 5, 'Crime'),
(20, 5, 'Sci-Fi'),
(21, 5, 'Family'),
(22, 5, 'Fiction'),
(23, 5, 'Sitcom'),
(24, 5, 'Thriller'),
(25, 6, 'English'),
(26, 6, 'Hindi'),
(27, 6, 'German'),
(28, 6, 'Spanish'),
(29, 6, 'Tamil'),
(30, 6, 'Telugu')

insert into Object_values
(Object_Id,Type_ID,Value) Values 
(4, 2, 1),
(5, 2, 6),
(6, 2, 12)


--Database Users
CREATE LOGIN Manager WITH PASSWORD = 'manager123', Default_database = group_task;
CREATE LOGIN CEO WITH PASSWORD = 'ceo123' , Default_database = group_task;
CREATE LOGIN Accountant WITH PASSWORD = 'accountant123' , Default_database = group_task;
CREATE LOGIN Developer WITH PASSWORD = 'developer123', Default_database = group_task;

CREATE USER Manager FOR LOGIN Manager;  --select (all)
CREATE USER CEO FOR LOGIN CEO;  --select (all)
CREATE USER Accountant FOR LOGIN Accountant;  --Insert,update,select (payments, subscribers)
CREATE USER Developer FOR LOGIN Developer;  --all(all)


-- All Access to Developer 
GRANT SELECT, INSERT, UPDATE, DELETE ON Collection_of_shows TO Developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Login_Credentials TO Developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Subscribers TO Developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Payment TO Developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Actors TO Developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Production TO Developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Production_show TO Developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Genre_Preference TO Developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Language_Preference TO Developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Actor_Work TO Developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Movies TO Developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Web_Shows TO Developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Statistic TO Developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Rating TO Developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Object_Type TO Developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON Object_values TO Developer;

--Read-only Access to Manager 
GRANT SELECT ON Collection_of_shows TO Manager;
GRANT SELECT ON Login_Credentials TO Manager;
GRANT SELECT ON Subscribers TO Manager;
GRANT SELECT ON Payment TO Manager;
GRANT SELECT ON Actors TO Manager;
GRANT SELECT ON Production TO Manager;
GRANT SELECT ON Production_show TO Manager;
GRANT SELECT ON Genre_Preference TO Manager;
GRANT SELECT ON Language_Preference TO Manager;
GRANT SELECT ON Actor_Work TO Manager;
GRANT SELECT ON Movies TO Manager;
GRANT SELECT ON Web_Shows TO Manager;
GRANT SELECT ON Statistic TO Manager;
GRANT SELECT ON Rating TO Manager;
GRANT SELECT ON Object_Type TO Manager;
GRANT SELECT ON Object_values TO Manager;

--Read-only Access to CEO
GRANT SELECT ON Collection_of_shows TO CEO;
GRANT SELECT ON Login_Credentials TO CEO;
GRANT SELECT ON Subscribers TO CEO;
GRANT SELECT ON Payment TO CEO;
GRANT SELECT ON Actors TO CEO;
GRANT SELECT ON Production TO CEO;
GRANT SELECT ON Production_show TO CEO;
GRANT SELECT ON Genre_Preference TO CEO;
GRANT SELECT ON Language_Preference TO CEO;
GRANT SELECT ON Actor_Work TO CEO;
GRANT SELECT ON Movies TO CEO;
GRANT SELECT ON Web_Shows TO CEO;
GRANT SELECT ON Statistic TO CEO;
GRANT SELECT ON Rating TO CEO;
GRANT SELECT ON Object_Type TO CEO;
GRANT SELECT ON Object_values TO CEO;

--Limited Access to Accountant to limited tables 
GRANT SELECT, INSERT, UPDATE ON Subscribers TO Accountant;
GRANT SELECT, INSERT, UPDATE ON Payment TO Accountant;

