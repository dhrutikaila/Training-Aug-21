use subqueries
-------error_message()
-BEGIN TRY

INSERT INTO Employees values(1,'s','a','aa','940212121','1200-12-10','data',1200,0,0,0)  

End TRY

begin catch

select'there was error'+ error_message() AS 'duplicate value'

end catch



----error_number()
BEGIN TRY

INSERT INTO Employees values(2,'s','a','d','940212121','1200a-12-10','data',1200,0,0,0)  
INSERT INTO Employees values(3,'a','a','aa','940212121','1200-12-10','data',1200,0,0,0)  

End TRY

begin catch

select error_number()  
select error_message()  

end catch





BEGIN TRY

INSERT INTO Employees values(2,'s','a','d','940212121','1200a-12-10','data',1200,0,0,0)  
INSERT INTO Employees values(3,'a','a','aa','940212121','1200-12-10','data',1200,0,0,0)  

End TRY

begin catch

select error_line()  
select error_message()  

end catch



BEGIN TRY

INSERT INTO Employees values(2,'s','a','d','940212121','1200a-12-10','data',1200,0,0,0)  
INSERT INTO Employees values(3,'a','a','aa','940212121','1200-12-10','data',1200,0,0,0)  

End TRY

begin catch

select error_state()  
select error_message()  

end catch


BEGIN TRY
create PROCEDURE p @name varchar(50)
AS
(
 select * from Employees where firstname=@name
)
END TRY


begin catch

select error_procedure()  
select error_message()  

end catch






  BEGIN TRY  
    -- Generate a divide-by-zero error.  
    SELECT 1/0;  
END TRY  
BEGIN CATCH  
    SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH;  


 
