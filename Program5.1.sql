-- AIM: 5.1 (A) Setup: Create database and sample table
--      (B) Create Secondary Indexes
CREATE DATABASE company_db;
USE company_db;
-- Step 3: Create the employees table with a PRIMARY KEY
CREATE TABLE employees (
    emp_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dept VARCHAR(50),
    salary INT,
    hired_date DATE,
    PRIMARY KEY (emp_id)  -- creates a clustered primary index on emp_id (InnoDB)
) ENGINE=InnoDB;
-- Expected Output:
-- Query OK, 0 rows affected (0.02 sec)
-- Step 4: Insert sample data
INSERT INTO employees VALUES
(101, 'Ravi', 'Kumar', 'HR', 40000, '2020-06-10'),
(102, 'Anita', 'Sharma', 'Finance', 55000, '2019-03-12'),
(103, 'Vikram', 'Patel', 'IT', 60000, '2021-01-05'),
(104, 'Sita', 'Verma', 'IT', 50000, '2022-08-20'),
(105, 'Arjun', 'Rao', 'HR', 42000, '2020-12-15');
-- (B) Creating Secondary Indexes
-- Step 5: Create a non-unique (secondary) index on last_name
CREATE INDEX idx_lastname ON employees(last_name);
-- Expected Output:
-- Query OK, 0 rows affected (0.01 sec)
-- Step 6: Create a composite secondary index on (dept, salary)
CREATE INDEX idx_dept_salary ON employees(dept, salary);
-- Expected Output:
-- Query OK, 0 rows affected (0.01 sec)
-- Step 7: Display all indexes on the employees table
SHOW INDEX FROM employees;
-- Step 8: Query using indexes (to test them)
-- Search using secondary index (on last_name)
SELECT * FROM employees WHERE last_name = 'Verma';
-- Search using composite index (on dept and salary)
SELECT * FROM employees WHERE dept = 'IT' AND salary > 55000;