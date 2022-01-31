--1. Fetching open post's details
CREATE PROCEDURE Pro1
@PostId INT
AS
	SELECT U.UserName, U.ProfileImage, GETDATE() as 'Today', P.ImageURL, P.Description, P.RequirementTypeId, P.HelpRequiredCount, P.LocationName, C.CityName, P.PincodeId FROM Post P 
	JOIN UserData U ON P.UserId=U.UserId 
	JOIN Cities C ON P.CityId=C.CityId
	WHERE P.IsClosed=0 AND P.PostId=@PostId
GO
EXEC Pro1 3
GO

--2. Fetching Verified Clusters in a City
CREATE PROCEDURE Pro2
@LocationId INT
AS
	SELECT CL.Locations, CL.RequirementTypeId, CL.PeopleCount, P.Pincode, C.CityName FROM ClusterLocations CL
	JOIN Pincode P ON CL.PincodeId=P.PincodeId
	JOIN Cities C ON CL.CityId=C.CityId
	WHERE CL.IsVerified=1 AND CL.ClusterLocationId=@LocationId
GO
EXECUTE Pro2 1
GO

--3. Fetching Verified User Profile
CREATE PROCEDURE Pro3
@UserId INT
AS
	SELECT CONCAT(U.FirstName,' ',U.LastName) AS 'Name', U.UserName, U.UserDescription, P.PostId, P.ImageURL, 
	CASE 
		WHEN P.IsClosed=0 THEN 'Open Post'
		WHEN P.IsClosed=1 THEN 'Requirement Fulfilled'
		ELSE 'No Posts'
		END AS 'Post Status',
	C.CityName
	FROM UserData U 
	RIGHT JOIN Post P ON U.UserId=P.UserId
	JOIN Cities C ON U.CityId=C.CityId
	WHERE U.IsVerified=1 AND U.UserId=@UserId
GO
EXECUTE Pro3 5
GO

--4. Fetching Verified Organisation Details
CREATE PROCEDURE Pro4
@Organisation INT
AS
	SELECT O.OrganisationId, O.OrganisationLogoURL, O.OrganisationName, O.OrganisationAddress, O.OrganisationContactNo, U.UserName AS 'Organiser'
	FROM Organisation O
	JOIN UserData U ON O.OrganisationUserId=U.UserId
	WHERE O.IsVerified=1 AND O.OrganisationId=@Organisation
GO
EXECUTE Pro4 9
GO

--5. Fetching Verified Volunteers associated with Organisations
CREATE PROCEDURE Pro5
@Volunteer INT
AS
	SELECT V.VolunteerId, CONCAT(U.FirstName,' ',U.LastName) AS 'VolunteerName', O.OrganisationName FROM Volunteer V
	JOIN Organisation O ON V.OrganisationId=O.OrganisationId
	JOIN UserData U ON V.VolunteerUserId=U.UserId
	WHERE V.IsVerified=1 AND V.VolunteerUserId=@Volunteer 
	ORDER BY VolunteerName
GO
EXECUTE Pro5 5
GO

--6. Fetching Users living in a city
CREATE PROCEDURE Pro6
@City1 NVARCHAR(50)
AS
	SELECT CONCAT(U.FirstName,' ',U.LastName) AS 'Name', COUNT(P.PostId) AS 'Total Posts'FROM Cities C 
	FULL JOIN UserData U ON C.CityId=U.CityId
	FULL JOIN Post P ON U.UserId=P.UserId
	WHERE C.CityName=@City1
	GROUP BY U.FirstName,U.LastName
GO
EXECUTE Pro6 'Vadodara'
GO

--7. Fetching Verified Charity Events City wise
CREATE PROCEDURE Pro7
@City2 NVARCHAR(50)
AS
	SELECT CE.EventId, CE.EventName, CE.EventDescription, CONCAT(U.FirstName,' ',U.LastName) AS 'Organiser', 
	CASE
		WHEN CE.IsCompleted=0 THEN 'Ongoing Event'
		WHEN CE.IsCompleted=1 THEN 'Closed Event'
		ELSE 'No Events'
		END AS 'Event Status', 
	C.CityName FROM Cities C 
	JOIN CharityEvent CE ON C.CityId=CE.CityId
	JOIN UserData U ON  CE.EventOrganiserId=U.UserId
	WHERE C.CityName=@City2 AND CE.IsVerified=1
	ORDER BY C.CityName
GO
EXECUTE Pro7 'Ahmedabad'

EXEC Pro1 3
EXECUTE Pro2 1
EXECUTE Pro3 5
EXECUTE Pro4 9
EXECUTE Pro5 5
EXECUTE Pro6 'Vadodara'
EXECUTE Pro7 'Ahmedabad'
