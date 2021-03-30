-- 1. CREATE a NEW FILE named group_by_exercises.sql
USE employees;

-- 2. IN your script, USE DISTINCT TO find the UNIQUE titles IN the titles table. How many UNIQUE titles have there ever been? Answer that IN a COMMENT IN your SQL file.
# Answer: 7 unique titles.
SELECT DISTINCT title
FROM titles;


-- 3. WRITE a QUERY TO TO find a LIST of ALL UNIQUE LAST NAMES of ALL employees that START AND END WITH 'E' USING GROUP BY.
#Answer: 903 rows.
SELECT last_name
FROM employees
WHERE last_name LIKE '%e%'
GROUP BY last_name;


-- 4. WRITE a QUERY TO TO find ALL UNIQUE combinations of FIRST AND LAST NAMES of ALL employees whose LAST NAMES START AND END WITH 'E'.
# Answer: 846 rows.
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name, first_name;



-- 5. WRITE a QUERY TO find the UNIQUE LAST NAMES WITH a 'q' but NOT 'qu'. Include those NAMES IN a COMMENT IN your SQL code.
# Answer: Chleq, Lindqvist, and Qiwen.
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' 
	AND last_name NOT LIKE '%qu%'
GROUP BY last_name;



-- 6. ADD a COUNT() TO your results (the QUERY above) AND USE ORDER BY TO make it easier TO find employees whose unusual NAME IS shared WITH others.
# Answer: 3 rows, Lindqvist = 190, Chleq = 189, and Qiwen = 168.
SELECT 
	last_name,
	COUNT(last_name) AS "count_by_last_name"
FROM employees
WHERE last_name LIKE '%q%' 
	AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;



-- 7. Find ALL ALL employees WITH FIRST NAMES 'Irena', 'Vidya', OR 'Maya'. USE COUNT(*) AND GROUP BY TO find the number of employees FOR EACH gender WITH those names.
# Answer: 6 rows.

SELECT 
	first_name, 
	gender,
	COUNT(gender) AS "Gender_Count"
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender
ORDER BY gender_count;


-- 8. USING your QUERY that generates a username FOR ALL of the employees, generate a count employees FOR EACH UNIQUE username. Are there ANY DUPLICATE usernames? BONUS: How many DUPLICATE usernames are there?
# Answer: Yes there are duplicates and you will see the amount of duplicates when you run the code below.
SELECT LOWER(
CONCAT(
	SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2),  SUBSTR(birth_date, 3, 2))) AS username, 
	COUNT(*)
FROM employees
GROUP BY username
HAVING COUNT(username) >1
ORDER BY COUNT(username) DESC;
