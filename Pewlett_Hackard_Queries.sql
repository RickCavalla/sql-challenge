SELECT e.emp_no, e.last_name, e.gender, s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no
;

SELECT e.emp_no, e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986
;

SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_manager AS dm
JOIN departments AS d
ON dm.dept_no = d.dept_no
JOIN employees AS e
ON dm.emp_no = e.emp_no
;

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
;

-- I feel like there are way too many employees named Hercules!
-- Were these names randomly generated from a hardcoded list
-- of names that included Hercules?
SELECT e.emp_no, e.first_name, e.last_name
FROM employees AS e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%'
;

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments AS d
JOIN dept_emp AS de
ON d.dept_no = de.dept_no
JOIN employees AS e
ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales'
;

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments AS d
JOIN dept_emp AS de
ON d.dept_no = de.dept_no
JOIN employees AS e
ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'
;

SELECT e.last_name, COUNT(*) AS ln_count
FROM employees AS e
GROUP BY e.last_name
ORDER BY ln_count DESC
;