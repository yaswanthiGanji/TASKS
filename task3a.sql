USE SISDB;
SELECT st.student_id,st.first_name,st.last_name, SUM(pay.amount) AS total_payments
FROM Students st JOIN Payments pay ON st.student_id = pay.student_id WHERE st.student_id = 24 
GROUP BY st.student_id,st.first_name,st.last_name;
SELECT co.course_id,co.course_name, COUNT(en.student_id) AS enrolled_students_count FROM Courses co
LEFT JOIN Enrollments en ON co.course_id = en.course_id
GROUP BY co.course_id,co.course_name ORDER BY enrolled_students_count DESC;
SELECT st.student_id,st.first_name,st.last_name FROM Students st LEFT JOIN Enrollments en ON st.student_id = en.student_id
WHERE en.student_id IS NULL ORDER BY st.first_name,st.last_name;
SELECT st.first_name,st.last_name,co.course_name FROM Students st JOIN Enrollments en ON st.student_id = en.student_id
JOIN Courses co ON en.course_id = co.course_id ORDER BY st.first_name,st.last_name;
SELECT te.teacher_id,te.first_name,te.last_name,co.course_name FROM Teacher te
JOIN Courses co ON te.teacher_id = co.teacher_id ORDER BY te.first_name,te.last_name;
SELECT Students.first_name,Students.last_name,Enrollments.enrollment_date
FROM Students JOIN Enrollments ON Students.student_id = Enrollments.student_id
JOIN Courses ON Enrollments.course_id = Courses.course_id
WHERE Courses.course_name = 'specific_course_name'ORDER BY  Students.first_name,Students.last_name;
   