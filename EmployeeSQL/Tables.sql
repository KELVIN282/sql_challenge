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