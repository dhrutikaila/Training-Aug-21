-- JSON ARRAY
SELECT JSON_ARRAY(1,"HELLO",2,"EVERYONE");

---JSON  VALID OR NOT IF VALID THEAN RETURN 1 ELSE RETURN 0
SET @xyz = '["a", "b", "c", "d"]';
SELECT JSON_VALID(@xyz);	

	
--- JSON TYPE
SELECT JSON_TYPE(@jk);


----JSON QUOTE
SELECT JSON_QUOTE('[HELLO]');		


---JSON UNQOUTE
SET @abc = '"hello"';
SELECT JSON_UNQUOTE(@abc);


---ARRAY APPEND

SET @xyz = '["a",  "b", "c", "d"]';
SELECT JSON_ARRAY_APPEND(@xyz,'$[2]',5);


---- CREATE JSON OBJECT
SELECT JSON_OBJECT( 'EmployeeName', 'John','SALARY',20000);		



---FOR PERTICULAR VALUE

SELECT JSON_VALUE('{"EmployeeName" : "steven" ,"salary" : 20000}','$.EmployeeName');


SET @json = '[{"Name":"Harsh",
              "Address":"Kkv",
              "City":"Ahmedabad",
              "DOB":"2009-015-16",
              "STD":6},
              
              {"Name":"Mohit",
              "Address":"S.G.Highway",
              "City":"Ahemedabad",
              "DOB":"2007-06-29",
              "STD":8},
              
                {"Name":"Meet",
                "Address":"Powai",
                "City":"Mumbai",
                "DOB":"2008-11-25",
                "STD":7},
                
                 {"Name":"Rohan",
                 "Address":"M.G.Road",
                 "City":"Banglore",
                 "DOB":"2011-02-16",
                 "STD":4},
                 
                 {"Name":"Dev",
                 "Address":"Chandni",
                 "City":"Delhi",
                 "DOB":"2006-08-14",
                 "STD":9}]';

 

SELECT * FROM JSON_TABLE(@json, '$[*]' 
                         COLUMNS( Name VARCHAR(20) PATH '$.Name',
                                 Address VARCHAR(100) PATH '$.Address',
                                 City VARCHAR(30) PATH '$.City',
                                 DOB DATE PATH '$.DOB',
                                 STD INT(2) PATH '$.STD'
                                 )                                                 
                        ) AS tmp;


----for json formate

SELECT JSON_EXTRACT(@json,'$[*]');




