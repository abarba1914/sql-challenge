--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT
  e.emp_no
  ,e.last_name
  ,e.first_name
  ,e.sex
  ,s.salary
FROM employees e
INNER JOIN salaries s
on e.emp_no = s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT
  e.first_name
  ,e.last_name
  ,e.hire_date
FROM employees e
WHERE EXTRACT(YEAR FROM e.hire_date)=1986;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT
  d.dept_no
  ,d.dept_name
  ,dm.emp_no
  ,e.last_name
  ,e.first_name
FROM departments d
INNER JOIN dept_manager dm
on d.dept_no = dm.dept_no
INNER JOIN employees e
on dm.emp_no = e.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
  e.emp_no
  ,e.last_name
  ,e.first_name
  ,d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
on de.dept_no = d.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT
  e.first_name
  ,e.last_name
  ,e.sex
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
  e.emp_no
  ,e.last_name
  ,e.first_name
  ,d.dept_name
FROM employees e
INNER JOIN dept_emp de
on e.emp_no = de.emp_no
INNER JOIN departments d
on de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
  e.emp_no
  ,e.last_name
  ,e.first_name
  ,d.dept_name
FROM employees e
INNER JOIN dept_emp de
on e.emp_no = de.emp_no
INNER JOIN departments d
on de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
  e.last_name
  ,COUNT(e.emp_no) AS "Frequency"
FROM employees e
GROUP BY e.last_name
ORDER BY COUNT(e.emp_no)DESC;
