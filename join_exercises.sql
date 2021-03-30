-- Exercise Goals

-- Use join, left join, and right join statements on our Join Example DB
USE join_example_db;
-- Integrate aggregate functions and clauses into our queries with JOIN statements

-- Create a file named join_exercises.sql to do your work in.

-- Join Example Database

-- 1. Use the join_example_db. Select all the records from both the users and roles tables.
SELECT *
FROM users
JOIN roles;



-- 2. Use join, left join, and right join to combine results from the users 
-- and roles tables as we did in the lesson. 
-- Before you run each query, guess the expected number of results.
#Answer: My guess is they will all run 24 rows.
SELECT *
FROM users
JOIN roles;

SELECT *
FROM users
LEFT JOIN roles ON users.role_id = roles.id;


SELECT *
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;


-- 3. Although not explicitly covered in the lesson, aggregate functions like 
-- count can be used with join queries. Use count and the appropriate join type 
-- to get a list of roles along with the number of users that has the role. 
-- Hint: You will also need to use group by in the query.

SELECT roles.name, count(users.role_id) AS role_count
FROM roles
LEFT JOIN users ON users.role_id = roles.id
GROUP BY roles.name;



-- Employees Database

-- 1. Use the employees database.
USE employees;


-- 2. Using the example in the Associative Table Joins section as a guide, 
-- write a query that shows each department along with the name of the current manager for that department.

select dept_name as "Department Name", concat(first_name, " ", last_name) as "Department Manager"
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no
join employees on employees.emp_no= dept_manager.emp_no
WHERE dept_manager.to_date > curdate()
ORDER BY dept_name ASC;


-- 3. Find the name of all departments currently managed by women.
select dept_name as "Department Name", concat(first_name, " ", last_name) as "Department Manager"
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no
join employees on employees.emp_no= dept_manager.emp_no
WHERE dept_manager.to_date > curdate() AND gender NOT LIKE 'm%m'
ORDER BY dept_name ASC;


-- 4. Find the current titles of employees currently working in the Customer Service department.

select titles.title AS 'Title', COUNT(titles.title) AS 'Count'
FROM departments 
Join dept_emp using(dept_no)
join titles using(emp_no)
WHERE departments.dept_no IN ('d009')
AND titles.to_date LIKE '9999%'
AND dept_emp.to_date LIKE '9999%'
GROUP BY Title;


-- 5. Find the current salary of all current managers.
select dept_name as "Department Name", concat(first_name, " ", last_name) as "Department Manager", salary AS 'Salary'
from departments
Join dept_manager using(dept_no)
join employees using(emp_no)
join salaries using(emp_no)
WHERE dept_manager.to_date > curdate()
AND salaries.to_date > curdate()
ORDER BY dept_name ASC;



-- 6. Find the number of current employees in each department.
select 
	dept_no,
	dept_name,
	count(*) AS "num_employees"
from departments
Join dept_emp using(dept_no)
WHERE dept_emp.to_date > curdate()
GROUP By dept_no;


-- 7. Which department has the highest average salary? Hint: Use current not historic information.
# answer: Sales
select dept_name, AVG(salary) AS 'average_salary'
from departments
join dept_emp using(dept_no)
join salaries using(emp_no)
WHERE dept_emp.to_date > curdate()
AND salaries.to_date > curdate()
GROUP BY dept_name
ORDER BY average_salary DESC
LIMIT 1;


-- 8. Who is the highest paid employee in the Marketing department?
#answer: Akemi Warwick
select employees.first_name, employees.last_name
from departments
join dept_emp using(dept_no)
join employees using(emp_no)
join salaries using(emp_no)
WHERE dept_name ="Marketing"
ORDER BY salaries.salary DESC
LIMIT 1;



-- 9. Which current department manager has the highest salary?
# Answer: Vishwani Minakawa, $106,491, Marketing
select first_name, last_name, salary, dept_name
from departments
Join dept_manager using(dept_no)
join employees using(emp_no)
join salaries using(emp_no)
WHERE dept_manager.to_date > curdate()
AND salaries.to_date > curdate()
ORDER BY salary DESC
Limit 1;




