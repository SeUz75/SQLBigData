-- Step 1: Create the database
CREATE DATABASE IzbiraemaTask;

USE IzbiraemaTask;

-- Step 2: Create the 'departments' table first
CREATE TABLE departments (
    dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Step 3: Create the 'employees' table
CREATE TABLE employees (
    emp_no INT NOT NULL PRIMARY KEY,
    birth_date DATE NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    gender CHAR NOT NULL,
    hire_date DATE NOT NULL
);


-- Step 4: Create the 'salaries' table
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY(emp_no, from_date),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Step 5: Create the 'titles' table
CREATE TABLE titles (
    emp_no INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY (emp_no, title, from_date),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Step 6: Create the 'dept_emp' table
CREATE TABLE dept_emp(
     	emp_no INT NOT NULL,
	dept_no VARCHAR(5) NOT NULL,
    	from_date DATE NOT NULL,
    	to_date DATE NOT NULL,
    	PRIMARY KEY (emp_no,dept_no),
    	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    	FOREIGN KEY (dept_no) REFERENCES employees(dept_no)
    	);

-- Step 7: Create the 'dept_manager' table
CREATE TABLE dept_manager (
    emp_no INT NOT NULL,
    dept_no VARCHAR(6) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY(emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

