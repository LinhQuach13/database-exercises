# Use the employees database
USE employees;

#List all the tables in the database.
SHOW TABLES;




DESCRIBE employees;
#What data types are present in this table?
#Answer: The data types present are int, date, enum, and string.


DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE salaries;
DESCRIBE titles;
DESCRIBE current_dept_emp;
#Which table(s) do you think contain a numeric type column?
#Answer: employees, salaries, dept_emp, dept_manager, and titles.

# Which table(s) do you think contain string types?
#Answer: Departments, dept_emp, dept_manager, employees, and titles.

# Which table(s) do you think contain data type column?
# Answer: The tables are dept_emp, dept_manager, employees, salaries, and titles.



SHOW CREATE TABLE employees;
SHOW CREATE TABLE departments;
# What is the relationship between the employees and departments table?
# Answer: The employees and department table are both included in the department manager table.


#Show the SQL that created the dept_manager table.
SHOW CREATE TABLE dept_manager;




