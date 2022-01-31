--sp for add query
CREATE PROCEDURE addState(@sname AS NVARCHAR(50),@cby AS NVARCHAR(50), @cat AS DATETIME, @uby AS NVARCHAR(50), @uat AS DATETIME)
	AS
BEGIN
	INSERT INTO 
	States (StateName,CreatedBy,CreatedAt,UpdatedBy,UpdatedAt)
	VALUES (@sname,@cby,@cat,@uby,@uat)
END;

Exec addState 'MP','Piyush','2-2-2020','piyush','6-8-2020'


-----


Exec addState 'MP','Piyush','2-2-2020','piyush','6-8-2020'
CREATE PROCEDURE addCity(@sid AS BIGINT,@cname AS NVARCHAR, @cat AS DATETIME,@cby AS NVARCHAR(50), @uby AS NVARCHAR(50), @uat AS DATETIME)
AS
BEGIN
INSERT INTO
Cities(StateId,CityName,CreatedBy,CreatedAt,UpdatedBy,UpdatedAt)
VALUES (@sid,@cname,@cby,@cat,@uby,@uat)
End;