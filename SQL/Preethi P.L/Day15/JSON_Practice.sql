-- JSON PRACTICE

-- Store data of 5 students in a variable in JSON format and display data in tabular format.
USE json_prac;
SET @student = '[{"S_Name":"Rita","Address":"asdasdadsssd","City":"Ahmedabad","DOB":"2006-01-01","Standard":10},
			     {"S_Name":"Shyam","Address":"qwewrtref","City":"Gandhinagar","DOB":"2005-02-01","Standard":11},
                 {"S_Name":"Gita","Address":"asdaqweer","City":"Surat","DOB":"2007-01-01","Standard":9},
                 {"S_Name":"Ram","Address":"asfkgjhnv","City":"Rajkot","DOB":"2008-03-01","Standard":8},
                 {"S_Name":"Priya","Address":"khvhjgmkl","City":"Baroda","DOB":"2009-05-01","Standard":7}]';

SELECT * FROM JSON_TABLE(@student, '$[*]' 
                         COLUMNS( S_Name VARCHAR(20) PATH '$.S_Name',
                                 Address VARCHAR(100) PATH '$.Address',
                                 City VARCHAR(30) PATH '$.City',
                                 DOB DATE PATH '$.DOB',
                                 Standard INT(2) PATH '$.Standard'
                                 ) 			                                    
                        ) AS tmp;

-- Create table employees and insert details in JSON format and display data in tabular format. Also display the table data in JSON format.

USE json_prac;
CREATE TABLE employees
(
	empdetails JSON
);
INSERT INTO employees VALUES('[
							{"EmployeeID":1, "Name": "Riya", "Department":"PHP","City":"Ahmedabad"},
                            {"EmployeeID":2, "Name": "Harsh", "Department":".Net","City":"Ahmedabad"},
                            {"EmployeeID":3, "Name": "Ajay", "Department":"Android","City":"Gandhinagar"},
                            {"EmployeeID":4, "Name": "Shreya", "Department":"PHP","City":"Surat"},
                            {"EmployeeID":5, "Name": "Prachi", "Department":".Net","City":"Ahmedabad"}
]');
SELECT * FROM employees;
SELECT tmp.* FROM employees,JSON_TABLE(empdetails, '$[*]'
									COLUMNS(EmployeeID INT PATH '$.EmployeeID',
											Name VARCHAR(30) PATH '$.Name',
                                            Department VARCHAR(30) PATH '$.Department',
                                            City VARCHAR(50) PATH '$.City')
) AS tmp;

SET @emp = (SELECT empdetails FROM employees); 
SELECT JSON_EXTRACT(@student,'$[*]');

-- JSON FUNCTIONS

SELECT JSON_VALID(@student);		-- Whether JSON value is valid
SELECT JSON_TYPE(@student);			-- Type of JSON value	

SET @emp = '[{"abc",10,"xyz",20}]'; 
SELECT JSON_EXTRACT(@student,'$[*]');  -- Return data from JSON document	

SELECT JSON_ARRAY(1,"abc",2,"xyz");		-- Create JSON array	

SET @j = '["a", ["b", "c"], "d"]';
SELECT JSON_ARRAY_APPEND(@j,'$[1]',0); -- Append data to JSON document

SET @j = '"abc"';
SELECT @j, JSON_UNQUOTE(@j);		-- Unquote JSON value	
SELECT JSON_QUOTE('[1, 2, 3]');		-- Quote JSON document	

SELECT JSON_OBJECT('ID', 87, 'Name', 'John');	-- Create JSON object	

SELECT JSON_VALUE('{"fname": "Joe", "lname": "Palmer"}', '$.fname');  -- Extract value from JSON document at location pointed to by path provided; return this value as VARCHAR(512) or specified type
SELECT JSON_VALUE('{"ID":1,"Name":"John"}', '$.Name');	
SELECT JSON_VALUE('{"item": "shoes", "price": "49.95"}', '$.price' RETURNING DECIMAL(4,2)) AS price;

SET @j = '{"a": 1, "b": 2, "c": {"d": 4}}';
SET @j2 = '1';
SELECT JSON_CONTAINS(@j, @j2, '$.a');		-- Whether JSON document contains specific object at path	

SET @j = '{"a": 1, "b": 2, "c": {"d": 4}}';
SELECT JSON_CONTAINS_PATH(@j, 'one', '$.a', '$.e'); -- Whether JSON document contains any data at path
SELECT JSON_CONTAINS_PATH(@j, 'all', '$.a', '$.e');	