CREATE DATABASE IF NOT EXISTS company;
USE company;
-- Step 1: Create employees table with indexes
CREATE TABLE IF NOT EXISTS employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,     -- Clustered primary key
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dept VARCHAR(50),
    salary INT,
    hired_date DATE,
    INDEX idx_lastname (last_name),            -- Secondary index 1
    INDEX idx_dept_salary (dept, salary)       -- Secondary composite index
) ENGINE=InnoDB;
-- Step 2: Insert sample rows
INSERT INTO employees (first_name, last_name, dept, salary, hired_date)
VALUES
('Alice', 'Sharma', 'HR', 50000, '2023-05-10'),
('Carol', 'Sharma', 'Finance', 60000, '2022-03-15'),
('Dave', 'Patel', 'Marketing', 55000, '2018-11-20'),
('Eve', 'Sharma', 'Sales', 62000, '2022-01-05'),
('Frank', 'Kumar', 'R&D', 78000, '2024-07-01');
-- Step 3: Demonstrate DELETE effect on indexes
DELETE FROM employees WHERE emp_id = 4;  -- delete Eve
-- Step 4: Verify table after DELETE
SELECT * FROM employees;
-- Step 5: Drop a secondary index
DROP INDEX idx_lastname ON employees;
-- Step 6: Recreate the secondary index
CREATE INDEX idx_lastname ON employees(last_name);
-- Step 7: Optional: Rebuild all indexes for performance
ALTER TABLE employees ENGINE=InnoDB;
-- Step 8: Final SELECT to check table and indexes
SELECT * FROM employees;
SHOW INDEX FROM employees;
