USE florence23;

-- 1. Using the example from the lesson, re-create the employees_with_departments table.
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
where to_date >curdate();


-- A. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns.

ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);


-- B. Update the table so that full name column contains the correct data
UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);


-- C. Remove the first_name and last_name columns from the table.
ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;


-- D. What is another way you could have ended up with this same table?
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, concat(first_name, ' ', last_name), dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no);



-- 2. Create a temporary table based on the payment table 
-- from the sakila database.
CREATE TEMPORARY TABLE Kila AS 
SELECT *
FROM sakila.payment;


-- A. Write the SQL necessary to transform the amount column such 
-- that it is stored as an integer representing the 
-- number of cents of the payment. For example, 1.99 should become 199.

ALTER TABLE Kila
MODIFY COLUMN amount DECIMAL(7,2);


UPDATE Kila
set amount = amount*100;

ALTER TABLE Kila
MODIFY COLUMN amount INT;




-- 3. Find out how the current average pay in each department 
-- compares to the overall, historical average pay. 
-- In order to make the comparison easier, you should use the Z-score for salaries.
-- In terms of salary, what is the best department right now to work for? The worst?

select avg(salary) as avg_salary, std(salary) as std_salary
from employees.salaries;

create temporary table current as (
    select dept_name, avg(salary) as department_current_average
    from employees.salaries
    join employees.dept_emp using(emp_no)
    join employees.departments using(dept_no)
    where employees.dept_emp.to_date > curdate()
    and employees.salaries.to_date > curdate()
    group by dept_name
);

alter table current add average float(10,2);
alter table current add standard_deviation float(10,2);
alter table current add zscore float(10,2);

update current set average = 63810;
update current set standard_deviation = 16904;


update current
set zscore=(department_current_average- average)/ standard_deviation;

select * from current
order by zscore desc;


