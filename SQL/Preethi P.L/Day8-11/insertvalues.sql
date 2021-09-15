-- 1. countries

INSERT INTO countries (CountryID,CountryName) 
VALUES  (1, 'India'), 
	(2, 'Canada'), 
	(3, 'Japan'), 
	(4, 'United States'), 
	(5, 'United Kingdom'), 
	(6, 'Germany'), 
	(7, 'Ireland'), 
	(8, 'South Korea'), 
	(9, 'Mexico'), 
	(10, 'Italy');

-- 2. languages

INSERT INTO languages (LanguageID,LanguageName) 
VALUES  (1, 'English'), 
	(2, 'Hindi'), 
	(3, 'Punjabi'), 
	(4, 'Gujarati'), 
	(5, 'Korean'), 
	(6, 'French'), 
	(7, 'Spanish'), 
	(8, 'Tamil'), 
	(9, 'Malayalam'), 
	(10, 'Telugu');


-- 16. albumlike

INSERT INTO albumlike (UserId, AlbumID) 
VALUES  (1,9),
	(1,10),
	(2,3),
	(2,9),
	(3,6),
	(3,7),
	(3,8),
	(5,5),
	(6,3),
	(6,5),
	(7,5),
	(8,5),
	(9,1),
	(9,2),
	(9,3);

-- 17. playlists

INSERT INTO playlists (`PlaylistID`, `UserID`, `Title`, `CreatedON`, `UpdatedON`) 
VALUES  ('1', '2', 'playlist1', current_timestamp(), '2021-08-24 16:04:24'), 
	('2', '1', 'playlist2', current_timestamp(), '2021-08-26 16:08:51'), 
	('3', '9', 'playlist3', current_timestamp(), '2021-08-25 16:08:51'), 
	('4', '15', 'playlist15', current_timestamp(), '2021-08-31 16:08:51'), 
	('5', '10', 'playlist10', current_timestamp(), '2021-08-30 16:08:51'), 
	('6', '17', 'playlist17', current_timestamp(), '2021-08-24 16:08:51'), 
	('7', '20', 'playlist20', current_timestamp(), '2021-08-29 16:08:51'), 
	('8', '18', 'playlist18', current_timestamp(), '2021-09-01 16:08:51'), 
	('9', '3', 'playlist3', current_timestamp(), '2021-09-02 16:08:51'), 
	('10', '6', 'playlist6', current_timestamp(), '2021-09-16 16:08:51');




-- 18. playlistsongs

INSERT INTO playlistsongs(`PlaylistID`, `SongID`) 
VALUES  ('1', '2'), 
	('1', '3'), 
	('2', '4'), 
	('3', '5'), 
	('4', '5'), 
	('5', '8'), 
	('6', '8'), 
	('7', '8'), 
	('9', '10'), 
	('10', '10');


-- 19. playlistpodcasts
INSERT INTO playlistpodcasts (`PlaylistID`, `PodcastID`) 
VALUES ('1', '1'), 
	('2', '1'), 
	('3', '1'), 
	('4', '2'), 
	('5', '3'), 
	('6', '4'), 
	('6', '5'), 
	('7', '9'), 
	('8', '9'), 
	('10', '8');
