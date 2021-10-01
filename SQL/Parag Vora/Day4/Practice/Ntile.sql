-- NTILE function without partition by

select * , ntile(11) over (order by salary desc) from employees

-- ntile function with partition by
select * , ntile(5) over (partition by JobId order by salary desc) from employees

-- Created table in to TestNtile database
Create database TestNtile

-- created table ExamResult
CREATE TABLE ExamResult
(StudentName VARCHAR(70), Subject     VARCHAR(20), Marks       INT);

-- inserted values
INSERT INTO ExamResult
VALUES
('Lily', 
 'Maths', 
 65
);
INSERT INTO ExamResult
VALUES
('Lily', 
 'Science', 
 80
);
INSERT INTO ExamResult
VALUES
('Lily', 
 'english', 
 70
);
INSERT INTO ExamResult
VALUES
('Isabella', 
 'Maths', 
 50
);
INSERT INTO ExamResult
VALUES
('Isabella', 
 'Science', 
 70
);
INSERT INTO ExamResult
VALUES
('Isabella', 
 'english', 
 90
);
INSERT INTO ExamResult
VALUES
('Olivia', 
 'Maths', 
 55
);
INSERT INTO ExamResult
VALUES
('Olivia', 
 'Science', 
 60
);
INSERT INTO ExamResult
VALUES
('Olivia', 
 'english', 
 89
);

-- performed queries on TestNtile

select *,Ntile(4) over(order by Marks desc) as Rank from ExamResult --without partition by

select *,Ntile(2) over(partition by studentname order by Marks desc) as Rank from ExamResult --with partition by

select *,Ntile(2) over(partition by studentname order by Marks desc) as 'Rank' 
from ExamResult 
order by 'rank' 

select *,Ntile(3) over(partition by 'subject' order by Marks desc) as 'Rank' 
from ExamResult 
order by 'rank' 

