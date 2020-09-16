require('dotenv').config();
const {Pool} = require('pg');

const pool = new Pool({
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  host: process.env.DB_HOST,
  database: process.env.DB_DATABASE
});

let cohortName = process.argv[2];
const queryString = `
SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort 
FROM teachers 
JOIN assistance_requests ON teachers.id = teacher_id 
JOIN students ON students.id = student_id 
JOIN cohorts ON cohorts.id = cohort_id 
WHERE cohorts.name = $1 
ORDER BY teacher;
`;
const values = [cohortName];

pool.query(queryString, values)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.cohort}: ${user.teacher}`);
    });
    pool.end();
  })
  .catch(err => console.error('query error', err.stack));