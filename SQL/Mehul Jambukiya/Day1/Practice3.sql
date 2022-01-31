CREATE TABLE Jobs
(
 JobId int CONSTRAINT pkJobId PRIMARY KEY,
 JobTitle varchar(25) CONSTRAINT defJobTilte DEFAULT '',
 MinSalary int CONSTRAINT difMinSal DEFAULT 8000,
 MaxSalary int CONSTRAINT difMaxsal DEFAULT NULL
);


INSERT INTO Jobs (JobId) values (5);
INSERT INTO Jobs (JobId,JobTitle,MinSalary,MaxSalary) values (15,'Junior Software Engineer',20000,30000);
INSERT INTO Jobs (JobId,JobTitle) values (17,'Sr Software Engineer');

SELECT * FROM Jobs;