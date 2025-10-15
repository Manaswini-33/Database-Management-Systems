-- (A) DATA CONTROL LANGUAGE (DCL)
CREATE DATABASE college_db;
USE college_db;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Department VARCHAR(20)
);
INSERT INTO Students VALUES (1, 'Ravi', 'CSE');
INSERT INTO Students VALUES (2, 'Anita', 'ECE');
INSERT INTO Students VALUES (3, 'Mahesh', 'IT');
-- Step 3: Create a new user (Only DBA or root can do this)
-- Note: In MySQL, if you don’t have permission, skip this section or ask your admin to execute.
CREATE USER 'student_user'@'localhost' IDENTIFIED BY 'password123';
-- Step 4: Grant privileges to the user
GRANT SELECT, INSERT ON college_db.Students TO 'student_user'@'localhost';
-- The user 'student_user' can now SELECT and INSERT into Students table.
-- Step 5: Revoke one privilege
REVOKE INSERT ON college_db.Students FROM 'student_user'@'localhost';
-- (B) TRANSACTION CONTROL LANGUAGE (TCL)
-- Step 1: Start a transaction
START TRANSACTION;
-- Step 2: Insert new records
INSERT INTO Students VALUES (4, 'Sita', 'EEE');
INSERT INTO Students VALUES (5, 'Arjun', 'MECH');
-- Step 3: Save the current transaction state
SAVEPOINT sp1;
-- Step 4: Insert more records
INSERT INTO Students VALUES (6, 'Priya', 'CIVIL');
INSERT INTO Students VALUES (7, 'Kiran', 'IT');
-- Step 5: Create another savepoint
SAVEPOINT sp2;

-- Step 6: Delete one record
DELETE FROM Students WHERE StudentID = 2;
-- Step 7: Rollback to a specific savepoint
ROLLBACK TO sp1;
-- This will undo all changes made after SAVEPOINT sp1 (records 6, 7 and delete of 2).
-- Step 8: Commit the remaining changes
COMMIT;
-- Step 9: Display the final data
SELECT * FROM Students;