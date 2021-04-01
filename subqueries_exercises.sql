-- Create a file named subqueries_exercises.sql and craft queries to return the results for the following criteria:
USE employees;

-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
#Answer: 69 employees.
Select first_name, last_name, hire_date
FROM employees
WHERE hire_date IN(
Select hire_date
FROM employees
WHERE emp_no LIKE '101010'
);


-- 2. Find all the titles ever held by all current employees with the first name Aamod.
select DISTINCT title
from titles
WHERE emp_no IN(
select emp_no
from employees
WHERE first_name = "Aamod"
)
AND
titles.to_date > NOW();



-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
# Answer: 59,900 employees.

select count(*)
from employees
WHERE emp_no NOT IN (
SELECT emp_no
FROM salaries
WHERE to_date = '9999-01-01'
);

					


-- 4. Find all the current department managers that are female. List their names in a comment in your code.
# Answer: Isamu Legleitner, Karsten Sigstam, Leon DasSarma, Hilary Kambil.
select *
FROM employees
WHERE emp_no IN(
select emp_no
from dept_manager
WHERE to_date > NOW()
)
AND
gender LIKE '%f%';



-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
# Answer: 154,543 rows.

SELECT 
	employees.emp_no,
	first_name,
	last_name,
	salary
FROM employees 
JOIN salaries ON employees.emp_no = salaries.emp_no
	AND to_date > NOW()
WHERE salary > (
				SELECT AVG(salary)
				FROM salaries
				);

-- 6. How many current salaries are within 1 standard deviation of the current highest salary? 
-- (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
#Answer: 83 salaries are within 1 std deviation of the current highest salary and the percentage of salaries is 0.0346%.

-- Current salaries within 1 std deviation of the current highest salary
SELECT COUNT(salary)
FROM salaries
WHERE to_date>curdate()
AND salary >=(
Select (max(salary)-std(salary))
FROM salaries
WHERE to_date > CURDATE()
);


-- Percentage of all salaries
SELECT
(SELECT
	COUNT(salary)
FROM salaries
WHERE to_date > CURDATE()
	AND salary >= (
SELECT
MAX(salary) - STDDEV(salary)
FROM salaries
WHERE to_date > CURDATE()
))
/
(SELECT
	COUNT(salary)
FROM salaries
WHERE to_date > CURDATE()) * 100 AS percent_of_salaries;



