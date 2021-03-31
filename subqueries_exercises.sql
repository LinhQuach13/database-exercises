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
# Answer: 188132 employees.
select *
from employees
WHERE emp_no IN(
select emp_no
from titles
WHERE to_date NOT LIKE '9999%'
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

select *
from dept_manager
WHERE emp_no IN (select emp_no
from employees
WHERE gender LIKE '%f%')
AND
to_date > NOW();



-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
# Answer: 2844037 rows.

select emp_no, salary
from salaries
WHERE salary > 38864
AND emp_no IN(
select emp_no
FROM employees
)
ORDER BY salary DESC;


-- 6. How many current salaries are within 1 standard deviation of the current highest salary? 
-- (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
#Answer: 78 salaries are within 1 std deviation of the current highest salary and the percentage of salaries is less than 1%.
SELECT COUNT(salary)
FROM salaries
WHERE to_date>curdate()
AND salary >(
Select (max(salary)-std(salary))
FROM salaries
);



BONUS

-- 1. Find all the department names that currently have female managers.

-- 2. Find the first and last name of the employee with the highest salary.

-- 3. Find the department name that the employee with the highest salary works in.