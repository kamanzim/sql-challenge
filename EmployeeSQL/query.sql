-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
-- Created a view for it called "employees_details".

CREATE VIEW employees_details AS
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

SELECT * FROM employees_details;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
-- Created a view for it called "employees_1986".
CREATE VIEW employees_1986 AS
SELECT employees.first_name,
	employees.last_name,
	employees.hire_date
FROM employees
WHERE extract(YEAR FROM hire_date) = 1986;

SELECT * FROM employees_1986;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
-- Created a view for it called "departments_managers".

CREATE VIEW departments_managers AS
SELECT departments.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name
FROM departments
INNER JOIN dept_manager ON
departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no;

SELECT * FROM departments_managers;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
-- Created view for it called "employees_departments_name".

CREATE VIEW employees_departments_name AS
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM departments
INNER JOIN dept_emp ON
dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON
dept_emp.emp_no = employees.emp_no
ORDER BY "emp_no" ASC;

SELECT * FROM employees_departments_name;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
-- Created a view for it called "Hercules_B_employees".

CREATE VIEW Hercules_B_employees AS
SELECT employees.first_name,
	employees.last_name,
	employees.sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

SELECT * FROM Hercules_B_employees;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- Created a view for it called "Sales_employees".

CREATE VIEW Sales_employees AS
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp ON
dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

SELECT * FROM Sales_employees;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- Created a view for it called "Sales&Develpment_employees".

CREATE VIEW Sales_Development_employees AS
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp ON
dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

SELECT * FROM Sales_Development_employees;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
-- Created view for it called "Frequency_count_last_name". 

CREATE VIEW Frequency_count_last_name AS
SELECT last_name, COUNT (last_name) AS frequency_count_last_name
FROM employees
GROUP BY last_name
ORDER BY "frequency_count_last_name" DESC;

SELECT * FROM Frequency_count_last_name;