-- 1. Create a file named where_exercises.sql. Make sure to use the employees database.
USE employees;

-- 2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
# Answer: 709 rows of employees
SELECT * 
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');




-- 3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?
# Answer: 709 rows of employees

SELECT * 
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';





-- 4. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
# Answer: 441 rows of employees
SELECT * 
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya')
	AND gender ='M';




-- 5. Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
# Answer: 7330 rows of employees
SELECT *
FROM employees
WHERE last_name LIKE 'E%';




-- 6. Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?
# Answer: 30,723 rows employees whose last names starts or ends with 'E'. The number of employees who have last ends with E and does not start with E is 23,393.

SELECT *
FROM employees
WHERE last_name LIKE 'E%' 
	OR last_name LIKE '%E';
	
SELECT *
FROM employees
WHERE last_name LIKE '%E' 
	AND last_name NOT LIKE 'E%';





-- 7. Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?
# Answer: 899 rows employees whose last names starts or ends with 'E'. 
# Answer: The number of employees who have last ends with E regardless whether they start with E is 24,292.
SELECT *
FROM employees
WHERE last_name LIKE 'e%' and last_name LIKE '%e';

SELECT *
FROM employees
WHERE last_name LIKE '%e';




-- 8. Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
#Answer: 135,214 rows of employees
SELECT *
FROM employees
WHERE hire_date LIKE '199%';



-- 9. Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
#Answer: 842 rows of employees
SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25';


-- 10. Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
#Answer: 362 rows of employees
SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25'
	AND (
	hire_date LIKE '199%'
	);


-- 11. Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
#Answer: 1873 rows of employees
SELECT *
FROM employees
WHERE last_name LIKE '%q%';

-- 12. Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
# Answer: 547 rows of employees.
SELECT *
FROM employees
WHERE last_name LIKE '%q%' 
	AND last_name NOT LIKE '%qu%';