CREATE TABLE departments (
	dept_no VARCHAR(30) PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);

ALTER TABLE departments ADD CONSTRAINT unique_dept_no UNIQUE (dept_no);

SELECT * from departments;

CREATE TABLE titles (
	title_id VARCHAR(30) PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);

ALTER TABLE titles ADD CONSTRAINT unique_title_id UNIQUE (title_id);

SELECT * from titles;

CREATE TABLE employees (
	emp_no INTEGER PRIMARY KEY,
	title_id VARCHAR(30) NOT NULL,
		FOREIGN KEY (title_id) REFERENCES titles(title_id),
    birth_date DATE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE
);

SELECT * from employees;

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(30) NOT NULL,
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * from dept_emp;
	
CREATE TABLE dept_manager (
	dept_no VARCHAR(30) NOT NULL,
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INTEGER NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * from dept_manager;
									  
CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INTEGER NOT NULL
);

SELECT * from salaries;								  