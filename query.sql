-- Data Analysis
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees join salaries on employees.emp_no = salaries.emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date between '1985-12-31' and '1987-01-01'

-- 3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
select d.dept_no, d.dept_name, emp.emp_no, emp.last_name, emp.first_name
from departments as d
join dept_manager as dm on d.dept_no = dm.dept_no
join employees as emp on dm.emp_no = emp.emp_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select emp.emp_no,emp.last_name, emp.first_name, d.dept_name
from employees as emp
join dept_emp as de on emp.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, d.dept_name
from employees as emp
join dept_emp as de on emp.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no
where d.dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
Select emp.emp_no, emp.last_name, emp.first_name, d.dept_name
from employees as emp
join dept_emp as de on emp.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no
where d.dept_name in ('Sales','Development')

-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
select distinct last_name, count(*)
from employees
group by last_name
order by last_name asc