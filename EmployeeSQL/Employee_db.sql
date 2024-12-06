-- Create Departments Table
CREATE TABLE Departments (
    dept_no CHAR(4) PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

--Display Departments table
SELECT *
FROM Departments

-- Create Department Employees Table
CREATE TABLE Dept_Emp (
    emp_no INT,
    dept_no CHAR(4),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

--Display Dept_Emp table
SELECT *
FROM Dept_Emp

-- Department Managers Table
CREATE TABLE Dept_Manager (
    dept_no CHAR(4),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

--Display Dept_Manager table
SELECT *
FROM Dept_Manager

-- Create Employees Table
CREATE TABLE Employees(
	emp_no INT,
	emp_title CHAR(5),
	birth_date VARCHAR (30),
	first_name VARCHAR (30),
	last_name VARCHAR (30),
	sex CHAR(1) NOT NULL ,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no, emp_title)
);

--Display Employees table
SELECT *
FROM Employees

-- Create Salaries Table
CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	PRIMARY KEY (emp_no)
);

--Display Salaries table
SELECT *
FROM salaries

-- Create Titles Table
CREATE TABLE Titles (
    title_id CHAR(5) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

--Display Titles table
SELECT *
FROM Titles


--List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM Employees e
JOIN Salaries s ON e.emp_no = s.emp_no;


--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
    first_name,
    last_name,
     hire_date
FROM Employees
WHERE hire_date >= '01/01/1986' and hire_date < '01/01/1987';


--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    dm.dept_no,
    d.dept_name,
    dm.emp_no AS manager_emp_no,
    e.last_name AS manager_last_name,
    e.first_name AS manager_first_name
FROM 
    Dept_Manager dm
JOIN 
    Departments d
ON 
    dm.dept_no = d.dept_no
JOIN 
    Employees e
ON 
    dm.emp_no = e.emp_no;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
    de.dept_no,
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM 
    Dept_Emp de
JOIN 
    Employees e
ON 
    de.emp_no = e.emp_no
JOIN 
    Departments d
ON 
    de.dept_no = d.dept_no;


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
    first_name,
    last_name,
    sex
FROM 
    Employees
WHERE 
    first_name = 'Hercules'
    AND last_name LIKE 'B%';


--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name
FROM 
    Employees e
JOIN 
    Dept_Emp de
ON 
    e.emp_no = de.emp_no
JOIN 
    Departments d
ON 
    de.dept_no = d.dept_no
WHERE 
    d.dept_name = 'Sales';


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM 
    Employees e
JOIN 
    Dept_Emp de
ON 
    e.emp_no = de.emp_no
JOIN 
    Departments d
ON 
    de.dept_no = d.dept_no
WHERE 
    d.dept_name IN ('Sales', 'Development');


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT 
    last_name,
    COUNT(*) AS last_name_count
FROM 
    Employees
GROUP BY 
    last_name
ORDER BY 
    last_name_count DESC;











