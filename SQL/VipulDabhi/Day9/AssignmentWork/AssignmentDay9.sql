
--Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ from employee table

SELECT 'Department' = CASE Department 
					WHEN 'Banking' THEN 'BankingDept'
					WHEN 'Insurance' THEN 'InsuranceDept'
					WHEN 'Service' THEN 'ServiceDept'
					END
FROM Employee

--5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, need to fetch these result from json variable. and select output in the json format
DECLARE @JSON NVARCHAR(MAX);
SET @JSON = '[{"Name":"Mayank","Address":"abc","City":"Mumbai","DOB":"01/01/2012","Standard":"5"},
                {"Name":"Hitesh","Address":"cde","City":"Dehli","DOB":"05/02/2020","Standard":"6"},
                {"Name":"Ravi","Address":"opq","City":"Ahmedabad","DOB":"13/03/2001","Standard":"7"},
                {"Name":"sheetal","Address":"xyz","City":"Rajkot","DOB":"11/04/2003","Standard":"8"},
                {"Name":"Shilpa","Address":"mnp","City":"Narmada","DOB":"21/05/2005","Standard":"9"}]'
				
CREATE TABLE StudentData
(
Name NVARCHAR(MAX),
Address NVARCHAR(MAX),
City NVARCHAR(MAX),
DOB NVARCHAR(MAX),
Standard NVARCHAR(MAX)
)

IF(ISJSON(@JSON)>0)
    BEGIN
        INSERT INTO StudentData SELECT * FROM OPENJSON(@JSON)
            WITH
            (
            Name NVARCHAR(MAX) '$.Name',
            Address NVARCHAR(MAX) '$.Address',
            City NVARCHAR(MAX) '$.City',
            DOB NVARCHAR(MAX) '$.DOB',
            Standard NVARCHAR(MAX) '$.Standard'    
            )
    END

SELECT * FROM StudentData FOR JSON AUTO  
			
			 