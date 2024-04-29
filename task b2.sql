USE SISDB;
INSERT INTO Enrollments (student_id, course_id, enrollment_date)
SELECT stu.student_id,cou.course_id,
    CURDATE()
FROM Students stu JOIN Courses cou ON stu.first_name = 'bhavana' AND stu.last_name = 'ganji'WHERE cou.course_name = 'Arts';
SELECT teacher_id,email FROM teacher WHERE teacher_id=114;
UPDATE Teacher SET email = 'cherry@gmail.com'WHERE teacher_id = 114;
DELETE FROM enrollments WHERE student_id=22 AND course_id=2;
SELECT teacher_id FROM Teacher WHERE teacher_id=114;
SELECT course_id FROM Courses WHERE course_name = 'Arts';UPDATE Courses SET teacher_id = 114 WHERE course_id ='Arts';
DELETE FROM Enrollments
WHERE student_id IN (SELECT student_id FROM Students WHERE first_name = 'sudha' AND last_name = 'kalathuru')
AND enrollment_id =7;
SELECT payment_id, student_id, amount FROM Payments WHERE student_id = 26;
UPDATE Payments
SET amount = 8000
WHERE payment_id = 6;