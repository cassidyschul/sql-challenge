

--List employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, salaries.salary
FROM employees e
INNER JOIN salaries ON e.emp_no = salaries.emp_no
ORDER BY emp_no ASC;

--List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%86';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT t.title, d.dept_no, d.dept_name, dept_manager.emp_no, e.last_name, e.first_name
FROM departments d
INNER JOIN dept_manager ON d.dept_no = dept_manager.dept_no
INNER JOIN employees e ON dept_manager.emp_no = e.emp_no
INNER JOIN titles t ON e.emp_title_id = t.title_id;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.dept_no, dept_emp.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp
INNER JOIN employees e ON dept_emp.emp_no = e.emp_no
INNER JOIN departments d ON dept_emp.dept_no = d.dept_no
ORDER BY emp_no ASC;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT t.title, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp
ON e.emp_no = dept_emp.emp_no
INNER JOIN titles t ON 
e.emp_title_id = t.title_id
INNER JOIN departments d 
ON dept_emp.dept_no = d.dept_no
WHERE d.dept_no = 'd007'
ORDER BY dept_emp.emp_no ASC;

	 
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT t.title, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp
ON e.emp_no = dept_emp.emp_no
INNER JOIN titles t ON 
e.emp_title_id = t.title_id
INNER JOIN departments d 
ON dept_emp.dept_no = d.dept_no
WHERE d.dept_no IN ('d007', 'd005')
ORDER BY dept_emp.emp_no ASC;


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;