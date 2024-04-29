USE SISDB;
SELECT Students.first_name,Students.last_name,Enrollments.enrollment_date
FROM Students JOIN Enrollments ON Students.student_id = Enrollments.student_id JOIN 
Courses ON Enrollments.course_id = Courses.course_id WHERE Courses.course_name = 'Arts'
ORDER BY Students.last_name,Students.first_name;SELECT Students.first_name,Students.last_name
FROM Student LEFT JOIN Payments ON Students.student_id = Payments.student_i WHERE Payments.student_id IS NULL
ORDER BY Students.last_name,Students.first_name;
    