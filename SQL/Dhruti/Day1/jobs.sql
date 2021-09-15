use dhruti


CREATE TABLE Job
(
JobId int NOT NULL CONSTRAINT pkJobId PRIMARY KEY,
JobTitle varchar(30) CONSTRAINT chkJobtitle DEFAULT '',
MinSalary int NOT NULL CONSTRAINT chkMinSalary DEFAULT 8000,
MaxSalary int CONSTRAINT chkMaxSalary DEFAULT NULL  
)

INSERT INTO Jobs ([job id],[job title],[min salary],[max salary]) 
VALUES 
(3,' ANALYST',15000,30000),
(4,'ENG.',25000,36000);
