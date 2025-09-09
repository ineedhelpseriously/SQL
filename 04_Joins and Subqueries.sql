--@block
SELECT s.name , c.course_name
FROM students s
JOIN enrollments e ON s.student_id=e.student_id
JOIN courses c ON e.course_id=c.course_id;

--@block
SELECT s.name , p.amount
FROM students s
LEFT JOIN payments p ON s.student_id=p.student_id;

--@block
SELECT c.course_name , e.student_id
FROM courses c
LEFT JOIN enrollments e ON c.course_id=e.course_id;

--@block
SELECT s.name, c.course_name
FROM students s
CROSS JOIN courses c;

--@block
SELECT s1.name AS student1 , s2.name AS student2 , s1.class
FROM students s1
JOIN students s2  ON s1.class=s2.class
WHERE s1.student_id < s2.student_id;

--@block
SELECT name , age
FROM students
WHERE age=(SELECT MAX(age) FROM students);

--@block
SELECT name
FROM students 
WHERE student_id IN(
    SELECT student_id
    FROM enrollments
    WHERE course_id=(SELECT course_id 
                    FROM courses 
                    WHERE course_name = 'Machine Learning')
);


--TEST
--@block
SELECT s.name, e.grade
FROM students s
INNER JOIN enrollments e ON s.student_id=e.student_id;
--@block
SELECT s.name, p.amount
FROM students s
LEFT JOIN payments p ON s.student_id=p.student_id;
--@block
SELECT s.name , c.course_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
RIGHT JOIN courses c ON e.course_id = c.course_id;
--@block
SELECT c.course_name, i.name
FROM courses c
CROSS JOIN instructors i;
--@block
SELECT course_name
FROM courses
WHERE (SELECT COUNT(*))