-- Data Engineering
CREATE TABLE Departments (
    dept_no varchar(5) PRIMARY KEY NOT NULL,
    dept_name varchar(30) NOT NULL
);

CREATE TABLE Titles (
    title_id varchar(30) PRIMARY KEY NOT NULL,
    title varchar(30) NOT NULL
);

CREATE TABLE Employees (
    emp_no int PRIMARY KEY NOT NULL,
    emp_title varchar(30) NOT NULL,
    birth_date date NOT NULL,
    first_name varchar(30) NOT NULL,
    last_name varchar(30) NOT NULL,
    sex varchar(30) NOT NULL,
    hire_date date NOT NULL,
    FOREIGN KEY (emp_title) REFERENCES Titles(title_id)
);

CREATE TABLE Dept_Manager (
    dept_no varchar(5) NOT NULL,
    emp_no int NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE Salaries(
    emp_no int NOT NULL,
    salary bigint,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Dept_Emp (
	emp_no int NOT NULL,
    dept_no varchar(5) NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	PRIMARY KEY (emp_no, dept_no)
);