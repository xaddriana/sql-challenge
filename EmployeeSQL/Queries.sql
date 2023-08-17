---Prints employees number, last name, sex, salary
SELECT emp_no, last_name, sex, salary
FROM employees
JOIN salaries USING (emp_no);

--- prints employees first name, last name, and their hire date
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--- prints the managers of each department with their dep number, dep name, emp number, first and last name
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments USING (dept_no)
JOIN employees ON dept_manager.emp_no = employees.emp_no;

--- prints employee number, with their last and first name, and their dep name
SELECT e.emp_no, last_name, first_name, dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

--- prints employees names are Hercules and last names start with B and their Sex
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--- prints employess that are in the sales departments with their employe no., first and last name.
SELECT e.emp_no, last_name, first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--- prints employess that are in the sales and development department with their employe no., first and last name.
SELECT e.emp_no, last_name, first_name, dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

--- prints the most used last names in the company from highest to lowest
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;