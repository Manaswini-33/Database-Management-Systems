CREATE DATABASE IF NOT EXISTS UniversityDB;
USE UniversityDB;
DROP TABLE IF EXISTS st1;
DROP TABLE IF EXISTS table1;
DROP TABLE IF EXISTS table2;
CREATE TABLE st1 (
  rollno INT PRIMARY KEY,
  name VARCHAR(50),
  marks INT
);
INSERT INTO st1 VALUES
(501, 'jyothi', 90),
(502, 'sai', 95),
(503, 'ravi', 80),
(504, 'yamuna', 70),
(505, 'padma', 60);
CREATE OR REPLACE VIEW myview AS
SELECT rollno, name FROM st1;
SELECT * FROM myview;
INSERT INTO myview VALUES (506, 'prathisha');
-- Display the updated view
SELECT * FROM myview;
-- Display the base table (st1) after insertion
SELECT * FROM st1;
-- Delete the newly inserted row using the view
DELETE FROM myview WHERE rollno = 506;
-- Display the view after deletion
SELECT * FROM myview;
-- Display the base table (st1) after deletion
SELECT * FROM st1;
-- ===== Step 6: Change the Structure of the View =====
CREATE OR REPLACE VIEW myview AS
SELECT * FROM st1;
SELECT * FROM myview;
-- ===== Step 7: Create View when base table doesn’t exist =====
-- This will give a warning in MySQL because the table does not exist.
CREATE OR REPLACE VIEW abc AS
SELECT * FROM dummy_table;
-- (You’ll get: “View created with compilation errors” or “Unknown table” in MySQL Workbench)
-- ===== Step 8: Create a Read-Only View =====
CREATE OR REPLACE VIEW myview1 AS
SELECT * FROM st1
WITH CHECK OPTION;  -- (MySQL doesn’t support “WITH READ ONLY” directly, so CHECK OPTION ensures valid data only)

-- Display the read-only view
SELECT * FROM myview1;
-- Attempt to insert (will fail)
-- INSERT INTO myview1 VALUES (507, 'prathisha', 85);
-- Error: CHECK OPTION constraint fails
-- Attempt to update (will fail)
-- UPDATE myview1 SET name='suma' WHERE rollno=505;
-- ===== Step 9: Create View with CHECK OPTION =====
CREATE OR REPLACE VIEW myview2 AS
SELECT * FROM st1 WHERE marks < 101
WITH CHECK OPTION;
-- Try inserting a valid record (should work)
INSERT INTO myview2 VALUES (508, 'siri', 99);
-- Try inserting invalid record (should fail)
-- INSERT INTO myview2 VALUES (509, 'siri', 105);
-- Error: CHECK OPTION constraint fails
-- Display data in view
SELECT * FROM myview2;
-- ===== Step 10: Dropping a View =====
DROP VIEW IF EXISTS myview1;
-- ===== Step 11: Complex View (Using Multiple Tables) =====
-- Create two sample tables
CREATE TABLE table1 (
  rollno INT PRIMARY KEY,
  name VARCHAR(50),
  marks INT
);
INSERT INTO table1 VALUES
(501, 'jyothi', 90),
(502, 'sai', 95),
(503, 'ravi', 80),
(504, 'yamuna', 70),
(505, 'padma', 60);
CREATE TABLE table2 (
  sid INT,
  bib INT
);
INSERT INTO table2 VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105);
-- Create a complex view combining both tables
CREATE OR REPLACE VIEW MarksView AS
SELECT t1.rollno, t1.name, t2.sid, t2.bib
FROM table1 t1, table2 t2;
-- Display the complex view
SELECT * FROM MarksView;
-- DML operations like INSERT/UPDATE/DELETE are NOT allowed on complex views
-- Example: (This will cause an error)
-- INSERT INTO MarksView VALUES (506, 'prathisha', 6, 106);
-- Drop the complex view
DROP VIEW IF EXISTS MarksView;