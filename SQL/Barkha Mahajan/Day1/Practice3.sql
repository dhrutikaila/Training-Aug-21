CREATE TABLE Jobs 
(
JobId INT PRIMARY KEY IDENTITY(1000,3),
JobTitle VARCHAR(20) DEFAULT ' ', 
MinSalary MONEY DEFAULT 8000,
MaxSalary INT DEFAULT NULL
)


INSERT INTO Jobs (JobTitle) VALUES ('QA')
INSERT INTO Jobs (JobTitle, MinSalary) 
VALUES ('Python Developer', 10000),
('Java Developer', 9000)
('Sr. Python Developer', 50000)
('Sr. Java Developer', 45000)
