SELECT COUNT(assistance_requests.*) AS total_assistances, students.name AS name
FROM students
  JOIN assistance_requests ON student_id = students.id
WHERE students.name = 'Elliot Dickinson'
GROUP BY name