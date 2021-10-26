--total interview today for interviewer


SELECT * FROM Interviewer
SELECT * FROM InterviewsSchedule

SELECT * FROM InterviewsSchedule i
INNER JOIN Interviewer iw
	ON iw.Interviewer_ID = i.interviewer_ID
WHERE ScheduleDate LIKE '2021-09-22'