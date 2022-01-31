-- JSON Assignment

-- 5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, need to fetch these result from json variable. and select output in the json format


USE json_prac;

-- Step1 CREATE TABLE student

CREATE TABLE student
(
    jsoncolumn JSON
);

-- Step2 INSERT VALUES in student table in JSON format.

INSERT INTO student(jsoncolumn) VALUES
			('{"students":[
			{"S_Name":"Rita","Address":"asdasdadsssd","City":"Ahmedabad","DOB":"2006-01-01","Standard":10},
			{"S_Name":"Shyam","Address":"qwewrtref","City":"Gandhinagar","DOB":"2005-02-01","Standard":11},
                 	{"S_Name":"Gita","Address":"asdaqweer","City":"Surat","DOB":"2007-01-01","Standard":9},
                 	{"S_Name":"Ram","Address":"asfkgjhnv","City":"Rajkot","DOB":"2008-03-01","Standard":8},
                 	{"S_Name":"Priya","Address":"khvhjgmkl","City":"Baroda","DOB":"2009-05-01","Standard":7}]}'
);

-- Step3 Display JSON data of student table in tabular form. 

SELECT students.* FROM student,JSON_TABLE(jsoncolumn, '$.students[*]' 
                         COLUMNS( S_Name VARCHAR(20) PATH '$.S_Name',
                                 Address VARCHAR(100) PATH '$.Address',
                                 City VARCHAR(30) PATH '$.City',
                                 DOB DATE PATH '$.DOB',
                                 Standard INT(2) PATH '$.Standard'
                                 ) 			                                    
                        ) AS students;

-- Step4 Display student table data in JSON format.
-- Method1

SET @studentdata = (SELECT jsoncolumn FROM student);
SELECT JSON_EXTRACT(@studentdata,'$[*]');


--Method2

SELECT JSON_OBJECT("students",JSON_ARRAYAGG(JSON_OBJECT("S_Name",S_Name,"Address",Address,"City",City,"DOB",DOB,"Standard",Standard)))
FROM student,JSON_TABLE(jsoncolumn, '$.students[*]' 
                         COLUMNS( S_Name VARCHAR(20) PATH '$.S_Name',
                                 Address VARCHAR(100) PATH '$.Address',
                                 City VARCHAR(30) PATH '$.City',
                                 DOB DATE PATH '$.DOB',
                                 Standard INT(2) PATH '$.Standard'
                                 ) 			                                    
                        ) AS students;

