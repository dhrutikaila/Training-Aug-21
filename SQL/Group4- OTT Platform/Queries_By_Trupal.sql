
/* Group Task Queries Trupal */

Use group_task

/*  1.  List the names of the shows where production company is ‘Alloy Entertainment’ and having Actor first name as ‘Joseph’ or last name as ‘Dobrev’ */

 SELECT * FROM Collection_of_shows C JOIN Production_show P on C.Show_ID = P.Show_ID 
 JOIN Actor_Work A ON C.Show_ID = A.Show_ID
 WHERE P.Production_ID = 226 
 AND A.Actor_ID IN (1078,1074)

 /* 2. list the movie title and web show title where IMDB rating is between 7 to 8 */
 
 SELECT C.Name, R.IMDB_Rating FROM Collection_of_shows C JOIN Rating R ON C.Show_ID = R.Show_ID 
 WHERE R.IMDB_Rating BETWEEN 7 AND 8 

 /* 3. List the full name of subscribers whose subscription plan has expired */

   SELECT * FROM (SELECT (s.FirstName+ ' ' + s.LastName)Name, p.Invoice_Date, Plan_Valid_Till = CASE 
   WHEN Subscription_Plan ='4' THEN DATEADD(MONTH,1, p.Invoice_Date)
   WHEN Subscription_Plan ='5' THEN DATEADD(MONTH,6, p.Invoice_Date)
   WHEN Subscription_Plan ='6' THEN DATEADD(MONTH,12, p.Invoice_Date)
   END
   FROM Payment p join Subscribers s ON p.Subscribers_ID=s.Subscribers_ID )temp
   WHERE (temp.Plan_Valid_Till < GETDATE())

 /* 4. List the names of subscribers who are having "Paid" subscription plan and their payment details */

  SELECT P.Payment_ID, Name = S.FirstName+' '+S.LastName,S.Email_ID, S.Subscription_Type, 
  P.Name_on_card, P.Card_Number, P.Valid_Thru, P.Payment_Type, P.Invoice_Date
  FROM subscribers s JOIN Payment p ON s.Subscribers_ID=p.Subscribers_ID
  WHERE s.Subscription_Type IN (SELECT ov.Object_Id FROM Object_Type ot JOIN Object_values ov ON ot.Type_ID=ov.Type_ID
  WHERE OV.Object_Id=8)

 /* 5. List the details of subscribers who are having their payment method as Credit card and age 18+ */

  SELECT S.FirstName+' '+S.LastName AS SUBSCRIBER_NAME,S.Email_ID,S.Age,S.Phone_Number, P.Payment_Type, S.Number_of_users 
  FROM Subscribers S JOIN Payment P ON P.Subscribers_ID = S.Subscribers_ID WHERE P.Payment_Type IN (SELECT ov.Object_Id 
  FROM Object_Type OT 
  JOIN Object_values OV ON OT.Type_ID=OV.Type_ID WHERE OV.Object_Id=9 and s.Age>18)

 /* 6. List the names of subscribers who are currently having Trial subscription plan  */

  SELECT Name= s.FirstName+' '+s.LastName , s.Subscription_Type FROM subscribers s JOIN Payment p
  ON s.Subscribers_ID=p.Subscribers_ID
  WHERE s.Subscription_Type  IN
  (SELECT ov.Object_Id FROM Object_Type ot JOIN Object_values ov ON ot.Type_ID=ov.Type_ID
  WHERE OV.Object_Id=7)

  /* 7. List the full name of subscribers whose subscription plan will expire within a month. */

   Select * from (select (s.FirstName+ ' ' + s.LastName)Name, p.Invoice_Date, Plan_Valid_Till = Case 
   When Subscription_Plan ='4' Then DATEADD(MONTH,1, p.Invoice_Date)
   When Subscription_Plan ='5' Then DATEADD(MONTH,6, p.Invoice_Date)
   when Subscription_Plan ='6' Then DATEADD(MONTH,12, p.Invoice_Date)
   end
   from Payment p join Subscribers s on p.Subscribers_ID=s.Subscribers_ID )temp
   where (temp.Plan_Valid_Till > GETDATE())and (temp.Plan_Valid_Till <= GETDATE()+30)

 -------------------------------- OR -------------------------------------------------------------------------------

   Select * from (select (s.FirstName+ ' ' + s.LastName)Name, p.Invoice_Date, Plan_Valid_Till = Case
   When Subscription_Plan ='4' Then DATEADD(MONTH,1, p.Invoice_Date)
   When Subscription_Plan ='5' Then DATEADD(MONTH,6, p.Invoice_Date)
   when Subscription_Plan ='6' Then DATEADD(MONTH,12, p.Invoice_Date)
   end
   from Payment p join Subscribers s on p.Subscribers_ID=s.Subscribers_ID )temp
   where (temp.Plan_Valid_Till > GETDATE())and (temp.Plan_Valid_Till <= DATEADD(DAY, 30, GETDATE()))

  /* 8. List the Subscribers details who have chosen a yearly subscription and who prefer German and English languages. */ 

  WITH SUB_CTE (FULL_NAME,LANGUAGE,SUBCRIPTION_PLAN) 
  AS
  (SELECT S.FirstName+' '+s.LastName AS FULL_NAME, L.Language,S.Subscription_Plan FROM Subscribers S JOIN Language_Preference L
  ON L.Subscribers_ID = S.Subscribers_ID
  WHERE S.Subscription_Plan IN (SELECT OV.Object_Id FROM Object_Type OT JOIN Object_values OV ON OT.Type_ID=OV.Type_ID
  WHERE OV.Object_Id=6)AND L.Language IN (SELECT OV.Object_Id FROM Object_Type OT JOIN Object_values OV ON OT.Type_ID=OV.Type_ID
  WHERE OV.Object_Id IN (25,27)))
  
  SELECT * INTO Q_8 FROM SUB_CTE
  
  SELECT * FROM Q_8

  /* 9. List the web_show starring a female actor having age greater than or equal to 35 , having
genre Horror and Maturity rating of 18+ */

	SELECT Web_Shows=C.Name,a.FirstName, a.Age, c.Maturity_Age,Genre  FROM Collection_of_shows C JOIN Web_Shows W ON C.Show_ID = W.Show_ID
	JOIN Actor_Work AW ON W.Show_ID = AW.Show_ID
	JOIN Actors A ON A.Actor_ID = AW.Actor_ID
	WHERE c.Maturity_Age = 18 AND A.Age >= 35 AND Genre IN 
	(SELECT OV.Object_Id FROM Object_Type OT JOIN Object_values OV ON OT.Type_ID=OV.Type_ID
	WHERE OV.Object_Id IN (16) )

/* 10. list the name of show where length of name is more than 15 characters, Maturity age greater than 13 and Rating between 8 to 10 */

	SELECT C.Name, C.Maturity_Age FROM Collection_of_shows C JOIN Rating R ON C.Show_ID=R.Show_ID
	WHERE LEN(C.Name) > 15 AND C.Maturity_Age > 13 AND R.IMDB_Rating BETWEEN 8 AND 10 
