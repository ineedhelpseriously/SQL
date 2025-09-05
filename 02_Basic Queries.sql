--@block
SELECT * FROM students;

--@block
SELECT name, age, email FROM students;

--@block
SELECT name,email from students
WHERE age > 20;

--@block
SELECT student_id , amount from Payments
WHERE amount> 1500;

--@block
SELECT * FROM students
LIMIT 3;

--@block
SELECT * FROM students
LIMIT 2 OFFSET 2;

--@block
SELECT name AS StudentName , age AS Years
from students;

--@block
SELECT s.name, c.course_name
from Students AS s 
JOIN Enrollments AS e ON s.student_id=e.student_id
JOIN Courses AS c ON e.course_id=c.course_id;

--@block
SELECT * FROM Enrollments
WHERE grade IS null;


--TEST

--@block
SELECT name,class FROM students;
--@block
SELECT name FROM students
WHERE age>20;
--@block
SELECT * FROM students
LIMIT 2;
--@block
SELECT * FROM students
LIMIT 2 OFFSET 2;
--@block
SELECT c.course_name , i.name
from courses AS c  
JOIN instructors as i ON c.instructor_id=i.instructor_id;
--@block
SELECT enrollment_id FROM enrollments
WHERE grade IS NULL;
--@block
SELECT s.name
FROM students AS s
JOIN payments As p ON s.student_id=p.student_id
WHERE p.amount>1500