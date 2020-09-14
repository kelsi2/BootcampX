SELECT students.name AS student_name, students.start_date AS student_start_date, cohorts.name AS cohort_name, cohorts.start_date AS cohort_start_date
FROM students JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.start_date != students.start_date
ORDER by cohorts.start_date