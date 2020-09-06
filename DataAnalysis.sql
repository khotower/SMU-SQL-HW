--1.	List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT 
	e.emp_no AS "employee number", 
	last_name AS "last name", 
	first_name AS "first name", 
	sex, 
	sal.salary AS Salary 
FROM Employee e 
INNER JOIN Salary sal ON e.emp_no = sal.emp_no;

--2.	List first name, last name, and hire date for employees who were hired in 1986.
SELECT COUNT(emp_no)
FROM Employee 
where extract(year from hire_date) = 1986;

--3.	List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT 
	dm.emp_no AS "Department Manager Emp No", 
	d.dept_name AS "department name", 
	e.last_name AS "last name",
	e.first_name AS "first name"
FROM Dept_Manager dm 
INNER JOIN Departments d on dm.dept_no  = d.dept_no
INNER JOIN employee e on dm.emp_no = e.emp_no;
--we are getting 3 managers of Customer Service Department


---4.	List the department of each employee with the following information: 
--  employee number, last name, first name, and department name.

SELECT 
	e.emp_no AS "employee number", 
	d.dept_name AS "department name", 
	e.last_name AS "last name", 
	e.first_name AS "first name" 
FROM employee e 
INNER JOIN Dept_Emp de on e.emp_no = de.emp_no
INNER JOIN Departments d on de.dept_no = d.dept_no;

--5.	List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."

SELECT
	e.first_name AS "first name" , 
	e.last_name AS "last name", 
	sex
FROM employee e 
WHERE lower(e.first_name)  = 'hercules' AND lower(e.last_name) like 'b%';

--6.	List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.

SELECT 
	e.emp_no AS "employee number", 
	e.last_name AS "last name", 
	e.first_name AS "first name" ,
	d.dept_name AS "department name"
FROM employee e 
INNER JOIN Dept_Emp de on e.emp_no = de.emp_no
INNER JOIN Departments d on de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--7.	List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

SELECT 
	e.emp_no AS "employee number", 
	e.last_name AS "last name", 
	e.first_name AS "first name" ,
	d.dept_name AS "department name"
FROM employee e 
INNER JOIN Dept_Emp de on e.emp_no = de.emp_no
INNER JOIN Departments d on de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--8.	In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.

SELECT 
	e.last_name AS "last name", 
	COUNT(1) AS "frequncy count"
FROM employee e 
GROUP BY e.last_name 
ORDER BY COUNT(1) desc;