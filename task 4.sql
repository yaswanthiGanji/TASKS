USE SISDB;
SELECT AVG(num_students) AS average_students_per_course FROM (SELECT course_id, COUNT(student_id) AS num_students FROM Enrollments
GROUP BY course_id) AS enrollment_counts;
SELECT student_id,first_name,last_name FROM Students WHERE student_id IN (SELECT student_id FROM Payments 
WHERE amount = (SELECT MAX(amount) FROM Payments));
SELECT course_id,course_name FROM Courses WHERE course_id IN (SELECT course_id FROM Enrollments GROUP BY course_id
HAVING COUNT(*) = (SELECT MAX(enrollment_count) FROM (SELECT course_id,COUNT(*) AS enrollment_count FROM 
Enrollments GROUP BY course_id) AS subquery));
SELECT student_id,first_name,last_name FROM StudentS WHERE (SELECT COUNT(DISTINCT course_id)FROM Courses) 
= (SELECT COUNT(DISTINCT course_id)FROM Enrollments WHERE Enrollments.student_id = Students.student_id);
SELECT e.student_id,e.course_id,SUM(p.amount) AS total_payments FROM Enrollments e JOIN 
Payments p ON e.student_id = p.student_id GROUP BY e.student_id,e.course_id;
SELECT student_id,first_name,last_name FROM Students
WHERE student_id IN (SELECT student_id FROM Payments GROUP BY student_id );
SELECT Students.student_id,Students.first_name,Students.last_name,SUM(Payments.amount) AS total_payments
FROM Students
LEFT JOIN Payments ON Students.student_id = Payments.student_id
GROUP BY Students.student_id,Students.first_name,Students.last_name;
SELECT Courses.course_name,COUNT(Enrollments.student_id) AS num_students_enrolled FROM Courses
LEFT JOIN Enrollments ON Courses.course_id = Enrollments.course_id GROUP BY Courses.course_name;
SELECT AVG(Payments.amount) AS average_payment_amount
FROM Payments JOIN Students ON Payments.student_id = Students.student_id;