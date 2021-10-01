--This project is aimed at developing a web-based and central Recruitment Process System for the HR Group for a company. Some features of this system will be creating vacancies, storing Applicants data, Interview process initiation, Scheduling Interviews, Storing Interview results for the applicant and finally Hiring of the applicant. Reports may be required to be generated for the use of HR group.


CREATE DATABASE HumanResources

USE HumanResources

CREATE TABLE Vacancies (
Vacancy_ID INT PRIMARY KEY IDENTITY(1,1),
Job_ID INT CONSTRAINT fk_vac_job_id FOREIGN KEY REFERENCES Jobs(Job_ID),
Vaccany_Strength INT NOT NUll,
Recruiter_ID INT CONSTRAINT fk_vac_Rec_id FOREIGN KEY REFERENCES Recruiter(Recruiter_ID),
Date_Posted DATE NOT NULL,
Status bit NOT NULL
)

CREATE TABLE Jobs (
Job_ID INT PRIMARY KEY IDENTITY(1,1),
Job_Title VARCHAR(40) NOT NUlL,
Department_ID INT CONSTRAINT fk_jobs_dep_id FOREIGN KEY REFERENCES Department(Department_ID)
)

CREATE TABLE Department(
Department_ID INT PRIMARY KEY IDENTITY(1,1),
Dpartment_Name VARCHAR(20) NOT NULL
)

CREATE TABLE Recruiter (
Recruiter_ID INT PRIMARY KEY IDENTITY(1,1),
Recruiter_Name VARCHAR(20) NOT NULL,
)

CREATE TABLE Applicant (
Applicant_ID INT PRIMARY KEY IDENTITY(1,1),
Applicant_FirstName VARCHAR(20) NOT NULL,
Applicant_LastName VARCHAR(20) NOT NULL,
Applied_For INT CONSTRAINT fk_App_Vac_ID FOREIGN KEY REFERENCES Vacancies(Vacancy_ID),
Contact_No NUMERIC(10) NOT NULL,
Email NVARCHAR(20) CONSTRAINT uq_email UNIQUE,
CONSTRAINT chk_email CHECK (Email LIKE '%@%.%'), 
Applicant_Location VARCHAR(20) NOT NULL,
ResumeLink NVARCHAR(50) NOT NULL,
Applied_OnDate DATE NOT NULL
)

CREATE TABLE Interviews (
InterviewID INT PRIMARY KEY IDENTITY(1,1),
Applicant_ID INT CONSTRAINT fk_Int_App_ID FOREIGN KEY REFERENCES Applicant(Applicant_ID),
Status INT CONSTRAINT fk_Int_St_ID FOREIGN KEY REFERENCES InterviewStatus(StatusID)
)


CREATE TABLE InterviewStatus (
StatusID INT PRIMARY KEY IDENTITY(1,1),
StatusName VARCHAR(10) NOT NULL
)

CREATE TABLE InterviewsSchedule (
InterviewID INT CONSTRAINT fK_InS_Int_ID FOREIGN KEY REFERENCES Interviews(InterviewID),
ScheduleDate DATE NOT NULL,
interviewer_ID INT CONSTRAINT fk_InS_Inw_ID FOREIGN KEY REFERENCES Interviewer(Interviewer_ID)
)

CREATE TABLE Interviewer (
Interviewer_ID INT PRIMARY KEY IDENTITY(1,1),
Interviewer_Name VARCHAR(40) NOT NULL
)

CREATE TABLE IntResult (
ResultID INT PRIMARY KEY IDENTITY(1,1),
Interview_ID INT CONSTRAINT fk_InR_Int_ID FOREIGN KEY REFERENCES Interviews(InterviewID),
Applicant_ID INT CONSTRAINT fk_InR_App_ID FOREIGN KEY REFERENCES Applicant(Applicant_ID),
Interviewer_ID INT CONSTRAINT fk_InR_Inw_ID FOREIGN KEY REFERENCES Interviewer(Interviewer_ID),
ResultStatus bit NOT NULL
)


