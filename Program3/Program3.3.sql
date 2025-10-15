CREATE DATABASE IF NOT EXISTS UniversityDB;
USE UniversityDB;
DROP TABLE IF EXISTS sailors;
DROP TABLE IF EXISTS boats;
DROP TABLE IF EXISTS reserves;
CREATE TABLE sailors (
  sid INT PRIMARY KEY,
  sname VARCHAR(50),
  rating INT
);
CREATE TABLE boats (
  bid INT PRIMARY KEY,
  bcolor VARCHAR(20)
);
CREATE TABLE reserves (
  sid INT,
  bid INT
);
INSERT INTO sailors VALUES
(1, 'Ravi', 8),
(2, 'Lubber', 6),
(3, 'Horatio', 5),
(4, 'Dustin', 9),
(5, 'Andy', 7);
INSERT INTO boats VALUES
(101, 'Red'),
(102, 'Green'),
(103, 'Blue');
INSERT INTO reserves VALUES
(1, 101),  -- Ravi reserved Red
(1, 103),  -- Ravi reserved Blue
(2, 103),  -- Lubber reserved Blue
(4, 103),  -- Dustin reserved Blue
(3, 102);  -- Horatio reserved Green
-- =====  NESTED QUERIES (IN, NOT IN, ALL, ANY)  =====
-- 1️⃣ Sailors who have reserved boat no 103 (Nested query using IN)
SELECT s.sname
FROM sailors s
WHERE s.sid IN (
    SELECT r.sid FROM reserves r WHERE r.bid = 103
);
-- 2️⃣ Sailors who have NOT reserved boat no 103 (Nested query using NOT IN)
SELECT s.sname
FROM sailors s
WHERE s.sid NOT IN (
    SELECT r.sid FROM reserves r WHERE r.bid = 103
);
-- 3️⃣ Sailor ID(s) with the highest rating (Nested query using ALL)
SELECT s.sid
FROM sailors s
WHERE s.rating >= ALL (
    SELECT s1.rating FROM sailors s1
);
-- 4️⃣ Sailor ID(s) whose rating is better than ANY sailor named 'Andy'
SELECT s.sid
FROM sailors s
WHERE s.rating > ANY (
    SELECT s1.rating FROM sailors s1 WHERE s1.sname = 'Andy'
);
-- =====  CORRELATED SUBQUERIES (EXISTS / NOT EXISTS)  =====
-- 5️⃣ Sailors who have reserved boat no 103 (Correlated subquery with EXISTS)
SELECT s.sname
FROM sailors s
WHERE EXISTS (
    SELECT * FROM reserves r
    WHERE s.sid = r.sid AND r.bid = 103
);
-- 6️⃣ Sailors who have NOT reserved boat no 103 (Correlated subquery with NOT EXISTS)
SELECT s.sname
FROM sailors s
WHERE NOT EXISTS (
    SELECT * FROM reserves r
    WHERE s.sid = r.sid AND r.bid = 103
);