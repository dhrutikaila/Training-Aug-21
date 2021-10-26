--insert data
--tables  vacancies jobs Department Recruiter Applicant Interviews InterviewStatus InterviewsSchedule Interviewer IntResult

INSERT INTO Department
VALUES('DotNet'),
('PHP'),
('Accounting'),
('HumanResources'),
('Executive')

INSERT INTO Recruiter
VALUES('Rahul'),
('Abhi'),
('Sagar')

SELECT * FROM Department

INSERT INTO Jobs
VALUES('juniour php devloper',2),
('senior php devloper',2),
('team leader',2),
('senior team leader',2),
('junior dotnet devloper',1),
('senior dotnet devloper',1),
('team leader',1),
('senior team leader',1),
('Accountant',3),
('senior Accountant',3),
('junior Recruiter',4),
('senior Recruiter',4)


INSERT INTO Vacancies(Job_ID,Vaccany_Strength,Recruiter_ID,Date_Posted,Status)
VALUES (2,1,1,'2021-09-17',0),
(5,3,2,'2021-09-18',0),
(6,2,2,'2021-09-18',0),
(7,1,2,'2021-09-18',0),
(11,1,3,'2021-09-19',0),
(3,2,1,'2021-09-20',0)

SELECT * FROM Vacancies

INSERT INTO Applicant (Applicant_FirstName,Applicant_LastName,Applied_For,Contact_No,Email,Applicant_Location,ResumeLink,Applied_OnDate)
VALUES
('Raviraj','Padhiyar',5,9265914306,'rvrj@gmail.com','Morbi','Resumes/resume1.pdf','2021-09-20'),
('Abhi','Patel',1,9265914305,'abhi@gmail.com','Ahmedabad','Resumes/resume2.pdf','2021-09-21'),
('Rahul','Patel',1,9265914301,'rahul@gmail.com','Ahmedabad','Resumes/resume3.pdf','2021-09-21'),
('Hardik','Parmar',6,9265914302,'hardik@gmail.com','Anand','Resumes/resume4.pdf','2021-09-21')

SELECT * FROM Applicant


INSERT INTO InterviewStatus
VALUES('Initiated'),
('Schdeduled'),
('ResultAwa'),
('Concluded')

SELECT * FROM InterviewStatus

SELECT * FROM Applicant

INSERT INTO Interviews
VALUES
(11,4),
(12,4),
(13,4)

SELECT * FROM Interviewer
INSERT INTO Interviewer
VALUES
('Gajendra singh'),
('mahavir Kumar')

SELECT * FROM Interviewer

INSERT INTO InterviewsSchedule
VALUES(1,'2021-09-22',1),
(2,'2021-09-21',2)


