-- Test script for syntax highlighting
CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    gpa DECIMAL(3,2)
);

SELECT name, gpa
FROM students
WHERE gpa > 3.5
ORDER BY gpa DESC;
