create trigger tr_Student_forinsert
on tbl Student
after insert
as
begin
print 'Something happened to the student table' ;|
end

alter trigger tr_Student_forinsert
on tbl Student
after insert
as
begin
SELECT * from inserted
end

create trigger tr_Student_fordelete
on tbl Student
after delete
as
begin
SELECT * from deleted
end

CREATE TRIGGER t_country_forinsert ON country INSTEAD OF INSERT
AS BEGIN
    DECLARE @country_name CHAR(128);
    DECLARE @country_name_eng CHAR(128);
    DECLARE @country_code  CHAR(8);
    SELECT @country_name = country_name, @country_name_eng = country_name_eng, @country_code = country_code FROM INSERTED;
    IF @country_name IS NULL SET @country_name = @country_name_eng;
    IF @country_name_eng IS NULL SET @country_name_eng = @country_name;
    INSERT INTO country (country_name, country_name_eng, country_code) VALUES (@country_name, @country_name_eng, @country_code);
END;

CREATE TRIGGER t_country_fordelete ON country INSTEAD OF DELETE
AS BEGIN
    DECLARE @id INT;
    DECLARE @count INT;
    SELECT @id = id FROM DELETED;
    SELECT @count = COUNT(*) FROM city WHERE country_id = @id;
    IF @count = 0
        DELETE FROM country WHERE id = @id;
    ELSE
        THROW 51000, 'can not delete - country is referenced in other tables', 1;
END;
DELETE FROM country WHERE id = 6;