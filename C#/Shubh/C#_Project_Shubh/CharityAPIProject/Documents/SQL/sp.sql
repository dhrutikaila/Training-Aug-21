CREATE PROCEDURE getAllState
AS
BEGIN
    SELECT 
		*
    FROM 
        States
END;

CREATE PROCEDURE getStateByStateId
AS
BEGIN
    SELECT
		*
    FROM 
        States
	WHERE
		StateId=1
END;

ALTER PROCEDURE getStateByStateId(@stateid AS BIGINT)
AS
BEGIN
    SELECT
		*
    FROM 
        States
	WHERE
		StateId=@stateid
END;

CREATE PROCEDURE getStateByStateName
AS
BEGIN
    SELECT
		*
    FROM 
        States
	WHERE
		StateName='Goa'
END;

ALTER PROCEDURE getStateByStateName(@statename AS NVARCHAR(50) )
AS
BEGIN
    SELECT
		*
    FROM 
        States
	WHERE
		StateName=@statename
END;


Exec getAllState; 
Exec getStateByStateId 1;
Exec getStateByStateName 'Gujrat'

-------------------------sp for cities---------------------------------
CREATE PROCEDURE getAllcities
AS
BEGIN
    SELECT 
		*
    FROM 
        Cities
END;

CREATE PROCEDURE getCityByCityId
AS
BEGIN
    SELECT
		*
    FROM 
        Cities
	WHERE
		CityId=1
END;

ALTER PROCEDURE getCityByCityId(@cityId AS BIGINT)
AS
BEGIN
    SELECT
		*
    FROM 
        Cities
	WHERE
		CityId=@cityId
END;

CREATE PROCEDURE getCityByCityName
AS
BEGIN
    SELECT
		*
    FROM 
        Cities
	WHERE
		CityName='panji'
END;

ALTER PROCEDURE getCityByCityName(@cityname AS NVARCHAR(50) )
AS
BEGIN
    SELECT
		*
    FROM 
        Cities
	WHERE
		CityName=@cityname
END;


CREATE PROCEDURE getCityByStateId
AS
BEGIN
    SELECT
		*
    FROM 
        Cities
	WHERE
		StateId=1
END;

ALTER PROCEDURE getCityByStateId(@stateid AS BIGINT)
AS
BEGIN
    SELECT
		*
    FROM 
        Cities
	WHERE
		StateId=@stateid
END;


Exec getAllcities; 
Exec getCityByCityId 1;
Exec getCityByCityName 'panji';
Exec getCityByStateId 2


------------------------------pincode sp------------------------------------------------

CREATE PROCEDURE getAllPincode
AS
BEGIN
    SELECT 
		*
    FROM 
        Pincode
END;

CREATE PROCEDURE getPincodeByPincodeId
AS
BEGIN
    SELECT
		*
    FROM 
        Pincode
	WHERE
		PincodeId=1
END;

ALTER PROCEDURE getPincodeByPincodeId(@pincodeid AS BIGINT)
AS
BEGIN
    SELECT
		*
    FROM 
        Pincode
	WHERE
		PincodeId=@pincodeid
END;

CREATE PROCEDURE getPincodeByPincode
AS
BEGIN
    SELECT
		*
    FROM 
        Pincode
	WHERE
		Pincode=382350;
END;

ALTER PROCEDURE getPincodeByPincode(@pincode AS BIGINT )
AS
BEGIN
    SELECT
		*
    FROM 
        Pincode
	WHERE
		Pincode=@pincode
END;

CREATE PROCEDURE getPincodeByCityId
AS
BEGIN
    SELECT
		*
    FROM 
        Pincode
	WHERE
		CityId=1;
END;

ALTER PROCEDURE getPincodeByCityId(@cityid AS BIGINT )
AS
BEGIN
    SELECT
		*
    FROM 
        Pincode
	WHERE
		CityId=@cityid
END;

CREATE PROCEDURE getPincodeByStateId
AS
BEGIN
    SELECT
		*
    FROM 
        Pincode
	WHERE
		StateId=1;
END;

ALTER PROCEDURE getPincodeByStateId(@stateid AS BIGINT )
AS
BEGIN
    SELECT
		*
    FROM 
        Pincode
	WHERE
		StateId=@stateid
END;

CREATE PROCEDURE getPincodeByPostOfficeName
AS
BEGIN
    SELECT
		*
    FROM 
        Pincode
	WHERE
		PostOfficeName='Nikol';
END;

ALTER PROCEDURE getPincodeByPostOfficeName(@postoffice AS VARCHAR(100) )
AS
BEGIN
    SELECT
		*
    FROM 
        Pincode
	WHERE
		PostOfficeName=@postoffice
END

Exec getAllPincode; 
Exec getPincodeByPincodeId 1;
Exec getPincodeByPincode 744101;
Exec getPincodeByCityId 2 ;
Exec getPincodeByStateId 1;
Exec getPincodeByPostOfficeName 'Nikol';

------------------------------spam sp----------------------------------------

CREATE PROCEDURE getAllSpam
AS
BEGIN
    SELECT 
		*
    FROM 
        Spam
END;

CREATE PROCEDURE getSpamBySpamId
AS
BEGIN
    SELECT
		*
    FROM 
        Spam
	WHERE
		SpamId=1
END;

ALTER PROCEDURE getSpamBySpamId(@spamid AS BIGINT)
AS
BEGIN
    SELECT
		*
    FROM 
        Spam
	WHERE
		SpamId=@spamid
END;

CREATE PROCEDURE getSpamByPostId
AS
BEGIN
    SELECT
		*
    FROM 
        Spam
	WHERE
		PostId=1;
END;

ALTER PROCEDURE getSpamByPostId(@postid AS BIGINT )
AS
BEGIN
    SELECT
		*
    FROM 
        Spam
	WHERE
		PostId=@postid
END;


CREATE PROCEDURE getSpamByUserId
AS
BEGIN
    SELECT
		*
    FROM 
        Spam
	WHERE
		UserId=1;
END;

ALTER PROCEDURE getSpamByUserId(@userid AS BIGINT )
AS
BEGIN
    SELECT
		*
    FROM 
        Spam
	WHERE
		UserId=@userid
END;

Exec getAllSpam; 
Exec getSpamBySpamId 1;
Exec getSpamByPostId 744101;
Exec getSpamByUserId 2 ;


-----------------------------sp for urgency table--------------------------
CREATE PROCEDURE getAllUrgency
AS
BEGIN
    SELECT 
		*
    FROM 
        Urgency
END;

CREATE PROCEDURE getUrgencyByUrgencyId
AS
BEGIN
    SELECT
		*
    FROM 
        Urgency
	WHERE
		UrgencyId=1
END;

ALTER PROCEDURE getUrgencyByUrgencyId(@uid AS BIGINT)
AS
BEGIN
    SELECT
		*
    FROM 
        Urgency
	WHERE
		UrgencyId=@uid
END;

CREATE PROCEDURE getUrgencyByPostID
AS
BEGIN
    SELECT
		*
    FROM 
        Urgency
	WHERE
		PostId=1;
END;

ALTER PROCEDURE getUrgencyByPostId(@postid AS BIGINT )
AS
BEGIN
    SELECT
		*
    FROM 
        Urgency
	WHERE
		PostId=@postid
END;

Exec getAllUrgency; 
Exec getUrgencyByUrgencyId 1;
Exec getUrgencyByPostId 744101;
Exec getSpamByUserId 2 ;



-------------------------sp for CharityEventPostLike-------------------------

CREATE PROCEDURE getAllPostLike
AS
BEGIN
    SELECT
		*
    FROM 
        CharityEventPostLike
END;


CREATE PROCEDURE getAllPostLikeById
AS
BEGIN
    SELECT
		*
    FROM 
        CharityEventPostLike
	WHERE
		CharityEventPostLikeId=1;
END;

ALTER PROCEDURE getAllPostLikeById(@postlikeid AS BIGINT)
AS
BEGIN
    SELECT
		*
    FROM 
        CharityEventPostLike
	WHERE
		CharityEventPostLikeId=@postlikeid;
END;

----
CREATE PROCEDURE getAllPostLikeByUserId
AS
BEGIN
    SELECT
		*
    FROM 
        CharityEventPostLike
	WHERE
		UserId=1;
END;

ALTER PROCEDURE getAllPostLikeByUserId(@userid AS BIGINT)
AS
BEGIN
    SELECT
		*
    FROM 
        CharityEventPostLike
	WHERE
		UserId=@userid;
END;

----

CREATE PROCEDURE getNumberOfLike
AS
BEGIN
	SELECT 
		COUNT(Likes) 
	AS 
		NumberOfLikes
	FROM 
		CharityEventPostLike;
END;

ALTER PROCEDURE getNumberOfLike (@postid AS BIGINT)
AS
BEGIN
	SELECT 
		COUNT(Likes) 
	AS 
		NumberOfLikes
	FROM 
		CharityEventPostLike
	WHERE
		CharityEventPostId=@postid;
END;

---
CREATE PROCEDURE getNumberOfDisLike
AS
BEGIN
	SELECT 
		COUNT(DisLike) 
	AS 
		NumberOfDisLikes
	FROM 
		CharityEventPostLike;
END;

ALTER PROCEDURE getNumberOfDisLike (@postid AS BIGINT)
AS
BEGIN
	SELECT 
		COUNT(DisLike) 
	AS 
		NumberOfDisLikes
	FROM 
		CharityEventPostLike
	WHERE
		CharityEventPostId=@postid;
END;

Exec getAllPostLike;
Exec getAllPostLikeById 1;
Exec getAllPostLikeByUserId 1;
Exec getNumberOfLike 1;
Exec getNumberOfDisLike 1;