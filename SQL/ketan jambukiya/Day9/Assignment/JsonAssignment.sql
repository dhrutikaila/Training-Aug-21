CREATE TABLE Student
(
  Studata JSON
)

INSERT INTO student(Studata) VALUES
			('{"students":[{"Name":"Harsh",
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
                 "STD":9}]}'
);


SELECT students.* FROM student,JSON_TABLE(Studata, '$.students[*]' 
                         COLUMNS( Name VARCHAR(20) PATH '$.Name',
                                 Address VARCHAR(100) PATH '$.Address',
                                 City VARCHAR(30) PATH '$.City',
                                 DOB DATE PATH '$.DOB',
                                 STD INT(2) PATH '$.STD'
                                 ) 			                                    
                        ) as students;


----for json formate


SET @studentdata=(SELECT Studata FROM student);

SELECT JSON_EXTRACT (@studentdata,'$[*]');