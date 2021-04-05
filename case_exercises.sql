-- Create a file named case_exercises.sql and craft queries to return the results for the 
--following criteria:

-- 1. Write a query that returns all employees (emp_no), their department number, 
-- their start date, their end date, and a new column 'is_current_employee' 
-- that is a 1 if the employee is still with the company and 0 if not.
USE employees;

-- the sub-query we will be adding to query
SELECT emp_no, max(to_date) AS max_date
FROM dept_emp
GROUP BY emp_no;

#Answer: 300,024 employees returned.
SELECT dept_emp.emp_no, dept_no, from_date AS start_date_of_current_role, to_date,
	IF (to_date > curdate(), TRUE, FALSE) AS 'is_current_employee'
FROM dept_emp 
	JOIN (SELECT emp_no, max(to_date) AS max_date
			FROM dept_emp
			GROUP BY emp_no) AS current_dept
			ON dept_emp.emp_no = current_dept.emp_no
			AND dept_emp.to_date = current_dept.max_date;

-- 2. Write a query that returns all employee names (previous and current), 
-- and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' 
-- depending on the first letter of their last name.
SELECT first_name, last_name,
CASE
WHEN last_name LIKE 'a%' 
	OR last_name LIKE 'b%'
	OR last_name LIKE 'c%'
	OR last_name LIKE 'd%'
	OR last_name LIKE 'e%'
	OR last_name LIKE 'f%'
	OR last_name LIKE 'g%'
	OR last_name LIKE 'h%' THEN 'A-H'
WHEN last_name LIKE 'i%'
	OR last_name LIKE 'j%'
	OR last_name LIKE 'k%'
	OR last_name LIKE 'l%'
	OR last_name LIKE 'm%'
	OR last_name LIKE 'n%'
	OR last_name LIKE 'o%'
	OR last_name LIKE 'p%'
	OR last_name LIKE 'q%' THEN 'I-Q'
WHEN last_name LIKE 'r%'
	OR last_name LIKE 's%'
	OR last_name LIKE 't%'
	OR last_name LIKE 'u%'
	OR last_name LIKE 'v%'
	OR last_name LIKE 'w%'
	OR last_name LIKE 'x%'
	OR last_name LIKE 'y%'
	OR last_name LIKE 'z%' THEN 'R-Z'
	ELSE 'Other'
	END AS alpha_group
	FROM employees
	GROUP BY last_name, first_name;



-- 3. How many employees (current or previous) were born in each decade?
SELECT
CASE
WHEN birth_date LIKE '195%' THEN 'born_in_the_50s_decade'
WHEN birth_date LIKE '196%' THEN 'born_in_the_60s_decade'
ELSE 'Other'
END AS birth_decade,
COUNT(*) AS decade_count
FROM employees
GROUP BY birth_decade
ORDER BY decade_count;


-- BONUS
-- What is the current average salary for each of the following 
-- department groups: R&D, Sales & Marketing, 
-- Prod & QM, Finance & HR, Customer Service?
