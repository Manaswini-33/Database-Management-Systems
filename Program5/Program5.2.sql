CREATE DATABASE IF NOT EXISTS company;
USE company;
-- Step 2: Create Table (with AUTO_INCREMENT primary key)
CREATE TABLE employees (
  emp_id INT AUTO_INCREMENT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  dept VARCHAR(50),
  salary INT,
  hired_date DATE,
  PRIMARY KEY (emp_id)
) ENGINE=InnoDB;
-- Step 3: Create Secondary Indexes
-- Index on last_name (for faster lookups by last name)
CREATE INDEX idx_lastname ON employees(last_name);
-- Composite index on (dept, salary)
CREATE INDEX idx_dept_salary ON employees(dept, salary);
-- Verify indexes
SHOW INDEX FROM employees;
-- Step 4: Insert Sample Data
INSERT INTO employees (first_name, last_name, dept, salary, hired_date) VALUES
('Alice', 'Kumar', 'R&D', 80000, '2020-03-15'),
('Bob', 'Sharma', 'Sales', 60000, '2019-08-01'),
('Carol', 'Kumar', 'R&D', 85000, '2021-02-10'),
('Dave', 'Patel', 'Marketing', 55000, '2018-11-20'),
('Eve', 'Sharma', 'Sales', 62000, '2022-01-05');
-- Step 5: Use EXPLAIN to Verify Index Usage
EXPLAIN SELECT * FROM employees WHERE last_name = 'Sharma';
-- Step 6: Retrieve Data Using Indexed Column
SELECT * FROM employees WHERE last_name = 'Sharma';
-- Step 7: (Optional) Check All Data
SELECT * FROM employees;
