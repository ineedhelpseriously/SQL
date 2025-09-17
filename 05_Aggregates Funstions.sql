--@block
SELECT COUNT(*)
AS total_students
FROM students;

--@block
SELECT SUM(amount)
AS total_amount
FROM payments;

--@block
SELECT AVG(age)
AS avg_age
FROM students;

--@block
SELECT MIN(age) AS youngest,
MAX(age) AS oldest
FROM students;

--@block
SELECT UPPER(name)
FROM students;

--@block
SELECT LOWER(name)
FROM students;

--@block
SELECT CONCAT(name, '-', class)
AS student_class
FROM students;

--@block
SELECT TRIM('   hello   ')
AS cleaned_text;

--@block
SELECT YEAR(date)
AS year_of_payment
FROM payments;

--@block
SELECT MONTH(date)
AS month_of_payment
FROM payments;

--@block
SELECT CURRENT_DATE;

--@block
SELECT DATEDIFF(CURRENT_DATE, date)
AS days_since_payments
FROM payments;

--@block
SELECT student_id , amount,
CASE
    WHEN amount>1500 THEN 'HIGH'
    ELSE 'LOW'
END AS payment_category
FROM payments;

--@block
SELECT student_id , grade,
CASE grade
    WHEN 'A' THEN 'Amazing'
    WHEN 'B' THEN 'Boring'
    WHEN 'C' THEN 'Clapped'
    ELSE 'NOT GRADED'
END AS grade_discription
FROM enrollments;

--@block
SELECT credits,CAST(credits AS CHAR)
AS credits_text
FROM courses;

--@block
SELECT CAST('123' AS SIGNED)
AS NUMBER;

--@block
SELECT ROUND(AVG(salary),2)
AS avg_salary_rounded
FROM instructors;

--Test
--@block
SELECT COUNT(*) FROM students AS total_students;
--@block
SELECT SUM(amount) FROM payments AS total_payments;
--@block
SELECT
MIN(age) AS youngest,
MAX(age) AS oldest,
AVG(age) AS avg_age
FROM students;
--@block
SELECT UPPER(course_name) FROM courses;
--@block
SELECT CONCAT(name,'(',department,')') FROM instructors;
--@block
SELECT payment_id,amount,YEAR(date) AS year_of_payment
FROM payments;
--@block
SELECT payment_id,amount,DATEDIFF(CURRENT_DATE,date) AS days_since_payments
FROM payments;
