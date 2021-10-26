use dhruti

CREATE TABLE Job_history(
emp_id decimal (6,0) NOT NULL,
start_date date NOT NULL,
end_date date NOT NULL,
CHECK(end_date LIKE '--/--/----'),
job_id varchar(10)NOT NULL,
dept_id decimal (4,0) NOT NULL,


)
