-- =========================
-- 1. Students Table
-- =========================
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender CHAR(1),
    class VARCHAR(10),
    email VARCHAR(100) UNIQUE
);

INSERT INTO Students VALUES
(1, 'Aarav Mehta', 20, 'M', 'CS101', 'aarav@example.com'),
(2, 'Priya Sharma', 21, 'F', 'CS101', 'priya@example.com'),
(3, 'Rohan Singh', 19, 'M', 'EE201', 'rohan@example.com'),
(4, 'Neha Verma', 22, 'F', 'ME301', 'neha@example.com'),
(5, 'Kabir Rao', 20, 'M', 'CS101', 'kabir@example.com');

-- =========================
-- 2. Courses Table
-- =========================
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    instructor_id INT
);

INSERT INTO Courses VALUES
(101, 'Database Systems', 4, 1),
(102, 'Data Structures', 3, 2),
(103, 'Machine Learning', 4, 3),
(104, 'Operating Systems', 3, 1);

-- =========================
-- 3. Instructors Table
-- =========================
CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO Instructors VALUES
(1, 'Dr. Anil Gupta', 'Computer Science', 85000),
(2, 'Dr. Sunita Rao', 'Computer Science', 92000),
(3, 'Dr. Vivek Kumar', 'AI & ML', 95000);

-- =========================
-- 4. Enrollments Table
-- =========================
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrolled_on DATE,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Enrollments VALUES
(1, 1, 101, '2025-01-15', 'A'),
(2, 2, 101, '2025-01-16', 'B'),
(3, 3, 102, '2025-01-20', 'A'),
(4, 4, 103, '2025-01-22', 'C'),
(5, 5, 104, '2025-01-25', 'B'),
(6, 1, 103, '2025-02-01', 'A');

-- =========================
-- 5. Payments Table
-- =========================
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10,2),
    date DATE,
    method VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Payments VALUES
(1, 1, 1500.00, '2025-01-10', 'Credit Card'),
(2, 2, 1500.00, '2025-01-12', 'UPI'),
(3, 3, 1200.00, '2025-01-15', 'Cash'),
(4, 4, 2000.00, '2025-01-18', 'Net Banking'),
(5, 5, 1500.00, '2025-01-20', 'UPI'),
(6, 1, 500.00, '2025-02-05', 'Credit Card');
