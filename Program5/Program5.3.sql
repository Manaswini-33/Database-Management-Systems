CREATE DATABASE IF NOT EXISTS company;
USE company;
CREATE TABLE IF NOT EXISTS employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,     -- Clustered primary key
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dept VARCHAR(50),
    salary INT,                                -- Salary as INT to match previous examples
    hired_date DATE,
    INDEX idx_lastname (last_name),            -- Secondary index 1
    INDEX idx_dept_salary (dept, salary)       -- Secondary composite index
) ENGINE=InnoDB;
-- Step 2: Insert initial rows
INSERT INTO employees (first_name, last_name, dept, salary, hired_date)
VALUES
('Alice', 'Sharma', 'HR', 50000, '2023-05-10'),
('Carol', 'Sharma', 'Finance', 60000, '2022-03-15');
-- Step 3: Demonstrate INSERT effect on indexes
INSERT INTO employees (first_name, last_name, dept, salary, hired_date)
VALUES ('Frank','Kumar','R&D',78000,'2024-07-01');
-- Step 4: Demonstrate UPDATE effect on a non-indexed column (salary)
UPDATE employees
SET salary = salary + 2000
WHERE last_name = 'Sharma';
-- Step 5: Demonstrate UPDATE effect on an indexed column (last_name)
UPDATE employees
SET last_name = 'Sharma-Old'
WHERE emp_id= 2;

-- Step 6: Verify final data
SELECT * FROM employees;

-- Optional: Check indexes
SHOW INDEX FROM employees;
