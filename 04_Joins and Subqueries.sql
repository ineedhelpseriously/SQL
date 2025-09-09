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
SELECT s1.name AS student1, s2.name AS student2, s1.class
FROM Students s1
JOIN Students s2 ON s1.class = s2.class
WHERE s1.student_id < s2.student_id;
--@block
SELECT course_name
FROM courses
WHERE credits=(SELECT MAX(credits) FROM courses)
--@block
SELECT name, salary
FROM instructors
WHERE salary > (SELECT AVG(salary) FROM instructors);
--@block
SELECT name
FROM students
WHERE student_id IN (SELECT s.student_id 
                  FROM students s
                  JOIN enrollments e ON s.student_id=e.student_id
                  JOIN courses c ON e.course_id=c.course_id
                  JOIN instructors i ON c.instructor_id=i.instructor_id
                  WHERE i.name='Dr. Anil Gupta');
--@block
SELECT student_id
FROM payments
WHERE SEM(amount) > (SELECT AVG(amount) FROM payments);
--@block
SELECT s.name, c.course_name
FROM Students s
JOIN Enrollments e1 ON s.student_id = e1.student_id
JOIN Courses c ON e1.course_id = c.course_id
WHERE CASE e1.grade
          WHEN 'A' THEN 3
          WHEN 'B' THEN 2
          WHEN 'C' THEN 1
          ELSE 0
      END = (
    SELECT MAX(
        CASE e2.grade
            WHEN 'A' THEN 3
            WHEN 'B' THEN 2
            WHEN 'C' THEN 1
            ELSE 0
        END
    )
    FROM Enrollments e2
    WHERE e2.course_id = e1.course_id
);