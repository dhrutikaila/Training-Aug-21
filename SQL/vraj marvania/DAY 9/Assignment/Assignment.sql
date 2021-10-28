--BATCH
--1.Create a batch Select Banking as �Bank Dept�, Insurance as �Insurance Dept� and Services as �Services Dept� from employee table


SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,'DEPARTMENTNAME' = CASE DEPARTMENT
                                                         WHEN 'Banking' THEN 'Bank Dept'
														 WHEN 'Insurance' THEN 'Insurance Dept'
														 WHEN 'Services' THEN 'Services Dept'
														 END
FROM Employee

--JSON
--2. 5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, need to fetch these result from json variable. and select output in the json format
                    CREATE DATABASE JSON

                    CREATE TABLE Student
					(
					        NAME varchar(200),  
							Address varchar(200),  
							City varchar(200),  
							DOB  varchar(200),
							Standard varchar(200) 
					)


					DECLARE @DATA NVARCHAR(MAX)
					SET @DATA=N'[{ "Name": "VRAJ",
							     "Address": "KKV",
								 "City": "RAJKOT",
								 "DOB": "10-02-2000",
								 "Standard": "10th"
							   },
							    { "Name": "shivang",
							     "Address": "univercity",
								 "City": "RAJKOT",
								 "DOB": "10-03-2000",
								 "Standard": "12th"
							   },
							    { "Name": "navin",
							     "Address": "ring road",
								 "City": "RAJKOT",
								 "DOB": "20-06-2009",
								 "Standard": "9th"
							   },
							    { "Name": "darchan",
							     "Address": "KKV",
								 "City": "RAJKOT",
								 "DOB": "10-08-2000",
								 "Standard": "6th"
							   },
							   {  "Name": "JD",
							     "Address": "KKV",
								 "City": "AHMEDABAD",
								 "DOB": "26-06-2001",
								 "Standard": "07th"
							   }]';

			         IF (ISJSON(@DATA)>0)
					   INSERT INTO Student
                       SELECT *   FROM  OPENJSON ( @DATA )  
					   WITH (   
							NAME varchar(200)     '$.Name' ,  
							Address varchar(200)  '$.Address',  
							City varchar(200)     '$.City',  
							DOB  varchar(200)     '$.DOB',
							Standard varchar(200) '$.Standard'
						    )   
							
                       SELECT * FROM Student 
					   SELECT * FROM Student FOR JSON AUTO

					  

