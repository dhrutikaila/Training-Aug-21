-- 2)5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, need to fetch these result from json variable. and select output in the json format

        Declare @JSON varchar(max)
        SET @JSON=
        '[
        {"STUDENTID":1,
        "NAME":"VRAJ MARVANIYA",
        "ADDRESS":"C.G. ROAD",
        "CITY":"AHMEDABAD",
        "DOB":"2000-08-05"},

        {"STUDENTID":2,
        "NAME":"KETAN JAMBUKIYA",
        "ADDRESS":"S.G.HIGHWAY",
        "CITY":"AHMEDABAD",
        "DOB":"1999-11-05"},
        {"STUDENTID":3,
        "NAME":"BRIJEN SADARIYA",
        "ADDRESS":"MAVDI CIRCLE ",
        "CITY":"RAJKOT",
        "DOB":"2002-01-23"},

        {"STUDENTID":4,
        "NAME":"SHREYASH VANJA",
        "ADDRESS":"RING ROAD ",
        "CITY":"BHUJ",
        "DOB":"2002-07-15"},

        {"STUDENTID":5,
        "NAME":"VRAJ MARVANIYA",
        "ADDRESS":"C.G. ROAD",
        "CITY":"AHMEDABAD",
        "DOB":"2000-08-05"}
        ]'

        IF(ISJSON(@JSON) = 1)
        BEGIN
        select * INTO  STUDENT FROM
        OPENJSON(@JSON)
        WITH 
        (
        STUDENTID  INT  '$.STUDENTID',
        NAME VARCHAR(50) '$.NAME',
        ADDRESS VARCHAR(100) '$.ADDRESS',
        CITY VARCHAR(20) '$.CITY',
        DOB DATE '$.DOB'
        )
        END
        ELSE
        PRINT 'JSON FORMAT IS NOT VALID'

        -- JSON FORMAT
            select * from student for json path

