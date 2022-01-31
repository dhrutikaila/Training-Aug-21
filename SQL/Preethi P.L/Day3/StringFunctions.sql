/* ASCII */ 
SELECT ASCII('A');
SELECT ASCII('Customer');

/* CHAR */
SELECT CHAR(65);

/* CHARACTER_LENGTH & CHAR_LENGTH*/
SELECT CHARACTER_LENGTH("SQLTraining");
SELECT CHAR_LENGTH("SQLTrainingDay2");

/* CONCAT */
SELECT CONCAT("Today","is","day3","of","SQL Training");

/* CONCAT_WS */
SELECT CONCAT_WS("-","Today","is","day3","of","SQL Training");
SELECT CONCAT_WS(" ","Today","is","day3","of","SQL Training");

/* FIELD */
SELECT FIELD("q","s","q","l");

/* FIND_IN_SET */
SELECT FIND_IN_SET("q", "s,q,l");

/* FORMAT */
SELECT FORMAT(250500.5634, 2);

/* INSERT */
SELECT INSERT("learning.com", 1, 8, "funlearn");

/* INSTR */
SELECT INSTR("SQLTraining", "T") AS MatchPosition;

/* LCASE & LOWER */
SELECT LCASE("SQL Tutorial is FUN!");
SELECT LOWER("SQL Tutorial is FUN!");

/* LEFT */
SELECT LEFT("SQL Tutorial", 3) AS ExtractString;

/*LENGTH*/
SELECT LENGTH("SQL Tutorial") AS LengthOfString;

/*LOCATE*/
SELECT LOCATE("Q", "SQLDAY1") AS MatchPosition;

/*LPAD*/
SELECT LPAD("SQLDAY1", 20, "ABC");

/*LTRIM*/
SELECT LTRIM("     SQL Tutorial") AS LeftTrimmedString;

/*MID*/
SELECT MID("SQL Tutorial", 5, 3) AS ExtractString;

/*POSITION*/
SELECT POSITION("Q" IN "SQL.com") AS MatchPosition;

/*REPEAT*/
SELECT REPEAT("SQL Tutorial", 3);

/*REPLACE*/
SELECT REPLACE("SQL TRAINING", "SQL", "HTML");

/*REVERSE*/
SELECT REVERSE("SQL Tutorial");

/*RIGHT*/
SELECT RIGHT("Hello World", 4) AS ExtractString;

/*RPAD*/
SELECT RPAD("SQLTutorialDay1", 20, "ABC");

/*RTRIM*/
SELECT RTRIM("SQL Tutorial     ") AS RightTrimmedString;

/*SPACE*/
SELECT SPACE(10);

/*STRCMP*/
SELECT STRCMP("SQL Tutorial Day1", "SQL Tutorial");

/*SUBSTR & SUBSTRING*/
SELECT SUBSTR("SQL Tutorial", 5, 3) AS ExtractString;
SELECT SUBSTRING("SQL Tutorial", 5, 3) AS ExtractString;

/*SUBSTRING_INDEX*/
SELECT SUBSTRING_INDEX("www.google.com", ".", 1);

/*TRIM*/
SELECT TRIM('    SQL Tutorial    ') AS TrimmedString;

/*UCASE & UPPER*/
SELECT UCASE("SQL Tutorial is FUN!");
SELECT UPPER("SQL Tutorial is FUN!");

/*SOUNDEX*/
SELECT SOUNDEX("RED"), SOUNDEX("READ")  