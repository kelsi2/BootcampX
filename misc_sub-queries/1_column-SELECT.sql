-- SELECT (
--   SELECT count(*)
--   FROM table_name
-- ) as total, other_column
-- FROM other_table_name
-- ORDER BY total;

SELECT (
  SELECT count(assignments)
  FROM assignments
)-count(assignment_submissions) as total_incomplete
FROM assignment_submissions
  JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';