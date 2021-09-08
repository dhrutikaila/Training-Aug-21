USE DB_MUSIC
GO

-- PROCEDURE for Artist Songs and Album

CREATE FUNCTION Convert_Min(@min FLOAT)
RETURNS VARCHAR(5)
BEGIN
	DECLARE @minvar VARCHAR(5)
	SET @minvar = CONVERT(VARCHAR,FORMAT(FLOOR(@min)*100 + (@min-FLOOR(@min))*60,'00:00'))
	RETURN @minvar
END
GO

CREATE PROCEDURE ups_ArtistSongs
	@ArtistID INT
AS
BEGIN
	IF EXISTS(	SELECT * 
				FROM Users
				WHERE UserID = @ArtistID 
				AND RoleID = 2 
			)
	BEGIN
		SELECT CONCAT(U.FirstName, SPACE(1), U.LastName) AS 'Full Name'
			,	S.Name AS 'Song Name'
			,	COALESCE(A.Name,'N/A') AS 'Album Name'
			,	dbo.Convert_Min(CONVERT(FLOAT,S.Duration)) AS 'Duration'
			,	S.ViewCount
		FROM Songs AS S
			INNER JOIN SongArtists AS SA
				ON S.SongID = SA.SongID
			LEFT JOIN Albums AS A
				ON S.AlbumID = A.AlbumID
			INNER JOIN Users  As U
				ON SA.UserID = U.UserID
		WHERE SA.UserID = @ArtistID
	END
	ELSE
	BEGIN
		PRINT 'User is not Artist or Doesn''t Exists'
	END
END
GO

EXEC ups_ArtistSongs 3

DROP PROCEDURE ups_ArtistSongs
DROP FUNCTION Convert_Min
GO

