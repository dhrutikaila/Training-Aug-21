--Get AllClusterLocations
CREATE PROCEDURE getAllClusterLocations
AS
BEGIN
    SELECT * FROM ClusterLocations
END;

--Get ClusterLocation by ClusterLocationId
CREATE PROCEDURE getClusterLocationByLocationId(@locationId AS BIGINT)
AS
BEGIN
    SELECT * FROM  ClusterLocations WHERE ClusterLocationId=@locationId
END;

--Get AllVolunteers
CREATE PROCEDURE getAllVolunteers
AS
BEGIN
    SELECT * FROM Volunteer
END;

--Get AllCharityEventInteract
CREATE PROCEDURE getAllCharityEventInteracts
AS
BEGIN
    SELECT * FROM CharityEventInteract
END;

--Get AllOrganisationData
CREATE PROCEDURE getAllOrganisationDatas
AS
BEGIN
    SELECT * FROM OrganisationData
END;

--Get AllVolunteers
CREATE PROCEDURE getAllUserData
AS
BEGIN
    SELECT * FROM UserData
END;