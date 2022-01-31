--1.Select Organisation Creators, Their Name, Organisation Name From Charity Database where Organisation is verified.
SELECT u.CreatedBy, CONCAT(FirstName,' ',LastName) AS Name, OrganisationName FROM UserData u JOIN Organisation o ON u.UserId=o.OrganisationUserId WHERE u.IsVerified='True'


--2.Signup query
INSERT INTO UserData(FirstName, LastName, Gender, ProfileImage, UserDescription, UserName, EmailAddress, PasswordHash, MobileNo, CreatedBy, CreatedAt, UpdatedBy, UpdatedAt, IsOrganisation, IsVerified, CityId, StateId, Pincode) VALUES()


--3.Login(Email)
SELECT EmailAddress FROM UserData WHERE UserData.EmailAddress = LOWER('Quincy.Headley6@nowhere.com') AND UserData.PasswordHash = '0380J96G265Q6MVQRH0FBA4O5C7WWM13SGQ315299EZ26P22O8YE0V90VN8AEUI0978HKJIY1AMHT4RAU10541W9Y'

--4.Clusters IN A City
SELECT CL.ClusterLocationId, CL.Locations, C.CityName AS 'City' FROM Cities C JOIN ClusterLocations CL ON C.CityId=CL.CityId


--5.Charity Events in a City
SELECT CE.EventId, O.OrganisationLogoURL, O.OrganisationName, UD.UserName, CE.EventDescription, C.CityName FROM CharityEvent CE
JOIN UserData UD ON CE.EventOrganiserId = UD.UserId
JOIN Organisation O ON CE.EventOrganiserId=O.OrganisationUserId
JOIN Cities C ON CE.CityId = C.CityId
WHERE C.CityId = 2  AND CE.IsCompleted = 0
ORDER BY CE.CreatedAt DESC


--6.User Profile
SELECT CONCAT(FirstName,' ',LastName) AS 'Full Name', UserName, UserDescription, ProfileImage, TotalPostCount FROM UserData WHERE UserId=5


--7.Updating User Profile
UPDATE UserData
SET
UserDescription='Mimic King: Hemanshu Parmar',
ProfileImage='https://media-exp1.licdn.com/dms/image/C4E0BAQHj-tQ4PuqAsg/company-logo_200_200/0/1621253888873?e=1637798400&v=beta&t=HFMafpTVO_UpkSznvvC06k_I_AaJxgWG00GVlFf-Ia0',
EmailAddress='parmarhemanshu733@gmail.com',
MobileNo= 1043355325
WHERE UserId = 2
   
   
--8.Post Feed
WITH POSTU AS (
SELECT P.PostId, UD.ProfileImage, UD.UserName, P.LocationName, P.ImageURL, CAST(P.Description AS NVARCHAR) AS 'PostDescription', P.HelpRequiredCount, P.PincodeId, P.CityId, P.StateId, P.IsClosed,
CASE WHEN UC.UrgencyCount IS NULL THEN 0 ELSE UC.UrgencyCount END AS 'UrgencyCount', 
CASE WHEN SC.SpamCount IS NULL THEN 0 ELSE SC.SpamCount END AS 'SpamCount'
FROM Post P 
JOIN UserData UD ON P.UserId = UD.UserId
LEFT JOIN (SELECT PostId, COUNT(UserId) AS 'UrgencyCount' FROM Urgency GROUP BY PostId) UC ON P.PostId = UC.PostId
LEFT JOIN (SELECT PostId, COUNT(SpamId) AS 'SpamCount' FROM Spam GROUP BY PostId) SC ON P.PostId = SC.PostId
)
SELECT PostId, ProfileImage, UserName, LocationName, ImageURL, PostDescription, HelpRequiredCount, UrgencyCount, SpamCount FROM POSTU
WHERE PincodeId = 6 AND IsClosed = 0--@User'sPincodeId
UNION
SELECT PostId, ProfileImage, UserName, LocationName, ImageURL, PostDescription, HelpRequiredCount, UrgencyCount, SpamCount FROM POSTU
WHERE CityId = 1 AND IsClosed = 0--@User'sCityId
UNION
SELECT PostId, ProfileImage, UserName, LocationName, ImageURL, PostDescription, HelpRequiredCount, UrgencyCount, SpamCount FROM POSTU
WHERE StateId = 1 AND IsClosed = 0--@User'sStateId
UNION
SELECT PostId, ProfileImage, UserName, LocationName, ImageURL, PostDescription, HelpRequiredCount, UrgencyCount, SpamCount FROM POSTU
WHERE IsClosed = 0


--9.Fetch Urgency Count
SELECT PostId, COUNT(UserId) AS UrgencyCount
FROM Urgency
GROUP BY PostId


--10.Fetch Spam Count
SELECT PostId, COUNT(UserId) AS SpamCount
FROM Spam 
GROUP BY PostId


--11.Fetch Longitude, Latitude to Google Maps API
SELECT Latitude, Longitude FROM Post WHERE PostId IN (1,2,3)


--12.Post on Location Search
SELECT P.PostId, UD.ProfileImage, UD.UserName, P.LocationName, P.ImageURL, P.Description, P.HelpRequiredCount,
CASE WHEN UC.UrgencyCount IS NULL THEN 0 ELSE UC.UrgencyCount END AS 'UrgencyCount',
CASE WHEN SC.SpamCount IS NULL THEN 0 ELSE SC.SpamCount END AS 'SpamCount'
FROM Post P
JOIN UserData UD ON P.UserId = UD.UserId
LEFT JOIN (SELECT PostId, COUNT(UserId) AS 'UrgencyCount' FROM Urgency GROUP BY PostId) UC ON P.PostId = UC.PostId
LEFT JOIN (SELECT PostId, COUNT(SpamId) AS 'SpamCount' FROM Spam GROUP BY PostId) SC ON P.PostId = SC.PostId
JOIN Cities C ON P.CityId = C.CityId
WHERE C.CityId = 1 AND P.IsClosed = 0
ORDER BY P.CreatedAt DESC


--13.Post on Need Type
SELECT P.Description, P.LocationName, P.HelpRequiredCount, P.ImageURL
FROM Post P JOIN RequirementType RT ON P.RequirementTypeId = RT.RequirementTypeId
WHERE RT.RequirementTypeName = 


--14.Insert details into OTP table
INSERT INTO OTP (UserId, OTP, CreatedAt) VALUES (5, FLOOR(RAND()*1000000-1), CURRENT_TIMESTAMP)

UPDATE OTP 
SET OTP = FLOOR(RAND()*1000000-1), CreatedAt = CURRENT_TIMESTAMP
WHERE UserId = 5


--15.Validate OTP
SELECT OTP FROM OTP WHERE OTP = 791895 AND UserId = 5

DECLARE @StartTime DATETIME = '2011-09-23 15:49:00'
,@EndTime DATETIME = '2011-09-23 15:54:00'
SELECT CONVERT(VARCHAR(8), DATEADD(SECOND, DATEDIFF(SECOND,@StartTime, @EndTime),0), 108) AS ElapsedTime


--16.City wise Organisation names
SELECT  O.OrganisationName, C.CityName
FROM Organisation O JOIN UserData UD ON O.OrganisationUserId = UD.UserId
JOIN Cities C ON UD.CityId = C.CityId
WHERE C.CityId = 6


--17.Search Organisation by username
SELECT O.OrganisationName 
FROM UserData UD JOIN Organisation O ON UD.UserId = O.OrganisationUserId 
WHERE UD.UserName LIKE 'Srp720'


--18.SELECT POST WHERE REQUIREMENT TYPE IS FOOD/SHELTER/EDUCATION
SELECT P.PostId, UD.ProfileImage, UD.UserName, P.LocationName, P.ImageURL, P.Description, P.HelpRequiredCount,R.RequirementTypeName,
CASE WHEN UC.UrgencyCount IS NULL THEN 0 ELSE UC.UrgencyCount END AS 'UrgencyCount',
CASE WHEN SC.SpamCount IS NULL THEN 0 ELSE SC.SpamCount END AS 'SpamCount'
FROM Post P
JOIN RequirementType R  ON P.RequirementTypeId=R.RequirementTypeId 
JOIN UserData UD ON P.UserId=UD.UserId
LEFT JOIN (SELECT PostId, COUNT(UserId) AS 'UrgencyCount' FROM Urgency GROUP BY PostId) UC ON P.PostId = UC.PostId
LEFT JOIN (SELECT PostId, COUNT(SpamId) AS 'SpamCount' FROM Spam GROUP BY PostId) SC ON P.PostId = SC.PostId
WHERE RequirementTypeName IN ('Food','Shelter','Education')


--19.SELECT USER WHERE USER IS A VOLUNTEER
SELECT CONCAT(UD.FirstName,' ',UD.LastName) AS Name, V.VolunteerId FROM UserData UD JOIN Volunteer V ON UD.UserId=V.VolunteerUserId


--20.SELECT USER WHERE USER IS A VERIFIED VOLUNTEER
SELECT COUNT(V.VolunteerId) FROM UserData UD JOIN Volunteer V ON UD.UserId=V.VolunteerUserId GROUP BY UD.IsVerified


--21.SELECT VOLUNTEER WHERE ORGANISATION NAME IS Yuvaa
SELECT CONCAT(UD.FirstName,' ',UD.LastName) AS Name, V.VolunteerId, O.OrganisationName FROM Volunteer V 
JOIN UserData UD ON V.VolunteerUserId=UD.UserId
JOIN Organisation O ON V.OrganisationId=O.OrganisationId 
WHERE OrganisationName='Yuvaa'


--22.SELECT ORGANISATION WHERE NO VOLUNTEER IS REIGISTERED/JOINED
SELECT O.OrganisationName FROM Volunteer V RIGHT JOIN Organisation O ON V.OrganisationId=O.OrganisationId WHERE O.OrganisationId NOT IN (SELECT OrganisationId FROM Volunteer)


--23.SELECT DATA OF 'Yuvaa' ORGANISATION AND IT'S VOLUNTEERS
SELECT O.OrganisationId, O.OrganisationName, O.CreatedAt, O.CreatedBy,  O.OrganisationAddress, O.OrganisationContactNo, O.OrganisationLogoURL,  V.VolunteerId AS 'Total Volunteers'  FROM Organisation O 
JOIN Volunteer V ON O.OrganisationId=V.VolunteerId WHERE OrganisationName='Yuvaa'


--24.SELECT USER ID & USER NAME WHERE THEY REACHED THEIR DAILY POST LIMIT
SELECT UserId, CONCAT(FirstName,' ',LastName) AS Name FROM UserData WHERE IsDailyPostLimitReached = 1


--25.SELECT POSTS WHICH ARE CLOSED TO MARK THEM AS COMPLETED
SELECT PostId, ImageURL FROM POST WHERE IsClosed=1 


--26.DESCRIBE DIFFERENT ROLES OF USERS
SELECT UD.UserId, UD.UserName, CONCAT(UD.FirstName,' ',UD.LastName) AS Name, RT.RoleType AS Role FROM UserData UD 
LEFT JOIN Roles R ON UD.UserId=R.UserId 
JOIN RoleType RT ON R.RoleTypeId=RT.RoleTypeId

                                  
--27.YEARLY REPORT OF POST
;WITH ClosedNeeds
AS (
SELECT YEAR(CreatedAt) AS 'Year', C.CityName, COUNT(P.PostId) AS 'ClosedPost'
FROM Post P
JOIN Cities C ON P.CityId = C.CityId
WHERE P.IsClosed = 1
GROUP BY YEAR(CreatedAt), C.CityName
)

, OpenNeeds
AS (
SELECT YEAR(CreatedAt) AS 'Year', C.CityName, COUNT(P.PostId) AS 'OpenPost'
FROM Post P
JOIN Cities C ON P.CityId = C.CityId
WHERE P.IsClosed = 0
GROUP BY YEAR(CreatedAt), C.CityName
)

SELECT YEAR(P.CreatedAt) AS 'Year', C.CityName, COUNT(P.PostId) AS 'TotalPost', ISNULL(O.OpenPost,0) AS OpenPost, ISNULL(CN.ClosedPost,0) AS ClosedPost
	FROM Post P
		JOIN Cities C ON P.CityId = C.CityId
		LEFT JOIN OpenNeeds O ON YEAR(P.CreatedAt) = O.Year AND (C.CityName = O.CityName)
		LEFT JOIN ClosedNeeds CN ON YEAR(P.CreatedAt) = CN.Year AND (C.CityName = CN.CityName)
			GROUP BY YEAR(P.CreatedAt), C.CityName, O.OpenPost, CN.ClosedPost


-------------------------------------------------"OR"-------------------------------------------------


SELECT ISNULL(YEAR(P.CreatedAt),1947) AS Year, C.CityName, COUNT(P.PostId) AS 'TotalPost',
    CASE
    WHEN P.IsClosed=0 THEN 'Requirements needs to be fulfilled'
    WHEN P.IsClosed=1 THEN 'Requirements fulfilled'
	ELSE 'Have not posted yet'
END AS Status
FROM Post P FULL JOIN Cities C ON P.CityId=C.CityId 
GROUP BY C.CityName, P.IsClosed, YEAR(P.CreatedAt)


--28. POST REPORT YEARLY REPORT
SELECT C.CityName, YEAR(P.CreatedAt) AS Year, PC.Pincode, P.PostId, UD.ProfileImage, UD.UserName, P.LocationName, P.ImageURL, P.Description, P.HelpRequiredCount, P.IsClosed
FROM Post P
JOIN UserData UD ON P.UserId = UD.UserId
LEFT JOIN Pincode PC ON P.PincodeId=PC.PincodeId
JOIN Cities C ON P.CityId = C.CityId
ORDER BY P.CreatedAt ASC