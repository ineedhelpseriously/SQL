--@block
SELECT name, age 
FROM students
ORDER BY age ASC;

--@block
SELECT name, age
FROM students
ORDER BY age DESC;

--@block
SELECT DISTINCT class
FROM students;

--@block
SELECT DISTINCT method
FROM payments;

--@block
SELECT class, COUNT(*) AS total_students
FROM students
GROUP BY class;

--@block
SELECT student_id , SUM(amount) AS total_paid
FROM payments
GROUP BY student_id;

--@block
SELECT p.student_id, s.name,SUM(p.amount) AS total_paid
FROM payments as p
JOIN students AS s ON p.student_id=s.student_id
GROUP BY student_id,name;

--@block
SELECT class,COUNT(*) AS total_students
FROM students
GROUP BY class
HAVING COUNT(*)>1;

--@block
SELECT student_id, SUM(amount) AS total_paid
FROM payments
GROUP BY student_id
HAVING SUM(amount)>1500;

--@block
SELECT name,age
FROM students
WHERE age>=20 AND age<=22;

--@block
SELECT student_id,method
FROM payments
WHERE method!='UPI';

--@block
SELECT course_name, credits
FROM courses
WHERE credits=3 OR instructor_id=1;


--TEST
--@block
SELECT name
FROM instructors
ORDER BY name ASC;
--@block
SELECT course_name,credits
FROM courses
ORDER BY credits DESC;
--@block
SELECT DISTINCT department
FROM instructors;
--@block
SELECT DISTINCT grade
FROM enrollments;
--@block
SELECT instructor_id,COUNT(course_name)
FROM courses
GROUP BY instructor_id;
--@block
SELECT method, AVG(amount)
FROM payments
GROUP BY method;
--@block
SELECT instructor_id
FROM courses
GROUP BY instructor_id
HAVING COUNT(course_id)>1;
--@block
SELECT class
FROM students
GROUP BY class
HAVING AVG(age)>20;
--@block
SELECT student_id
FROM students
WHERE gender='F' AND class='CS101';
--@block
SELECT course_name
FROM courses
WHERE credits>=3 AND credits<=4;