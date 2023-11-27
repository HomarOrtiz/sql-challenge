-- Departments table
CREATE TABLE Departments (
    dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
    dept_name VARCHAR NOT NULL
);

-- Titles table
CREATE TABLE Titles (
    title_id VARCHAR(5) PRIMARY KEY NOT NULL,
    title VARCHAR NOT NULL
);

-- Employees table
CREATE TABLE Employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

-- Salaries table
CREATE TABLE Salaries (
    emp_no INT PRIMARY KEY NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

Drop table if exists Dept_Employees

-- Dpt_Employees table
CREATE TABLE Dept_Employees (
    emp_no INT NOT NULL,
    dept_no VARCHAR(5) NOT NULL,
	PRIMARY KEY (emp_no, dept_no), --Composite Primary Key
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

-- Dept_Manager table with composite key
CREATE TABLE Dept_Manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no), -- Composite primary key
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);
