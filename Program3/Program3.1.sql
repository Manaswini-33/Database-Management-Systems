DROP TABLE IF EXISTS tb1;
DROP TABLE IF EXISTS tb2;
CREATE TABLE tb1 (
  RNO INT PRIMARY KEY,
  NAME VARCHAR(50),
  MARKS INT
);
CREATE TABLE tb2 (
  RNO INT PRIMARY KEY,
  FEE INT
);
INSERT INTO tb1 (RNO, NAME, MARKS) VALUES
(503, 'Suma', 40),
(504, 'Raju', 70),
(505, 'Ramu', 45),
(501, 'Abhi', 50),
(502, 'Ravi', 60);
INSERT INTO tb2 (RNO, FEE) VALUES
(501, 15000),
(502, 5000),
(503, 10000),
(504, 25000);
-- ===== 1) INNER JOIN (returns matching rows) =====
SELECT tb1.RNO, tb1.NAME, tb1.MARKS, tb2.FEE
FROM tb1
INNER JOIN tb2 ON tb1.RNO = tb2.RNO;
-- Or:
SELECT tb1.RNO, tb1.NAME, tb1.MARKS, tb2.FEE
FROM tb1 JOIN tb2 ON tb1.RNO = tb2.RNO;
-- ===== 2) LEFT OUTER JOIN (all tb1 rows; tb2 NULL where no match) =====
SELECT tb1.RNO, tb1.NAME, tb1.MARKS, tb2.FEE
FROM tb1 LEFT OUTER JOIN tb2 ON tb1.RNO = tb2.RNO;
-- ===== 3) RIGHT OUTER JOIN (all tb2 rows; tb1 NULL where no match) =====
SELECT tb1.RNO, tb1.NAME, tb1.MARKS, tb2.FEE
FROM tb1 RIGHT OUTER JOIN tb2 ON tb1.RNO = tb2.RNO;
-- ===== 4) NATURAL JOIN (joins on columns with same name & compatible types) =====
-- Note: NATURAL JOIN will join on column RNO because both tables have it.
SELECT * FROM tb1 NATURAL JOIN tb2;
-- ===== 5) CROSS JOIN (Cartesian product) =====
SELECT tb1.RNO, tb1.NAME, tb1.MARKS, tb2.RNO AS tb2_RNO, tb2.FEE
FROM tb1 CROSS JOIN tb2;
-- Or equivalent syntax:
SELECT tb1.RNO, tb1.NAME, tb1.MARKS, tb2.RNO AS tb2_RNO, tb2.FEE
FROM tb1, tb2; -- cross join (explicit comma-style)
-- ===== 6) SELF JOIN (table joined with itself) =====
-- Example: pair rows on same RNO (trivial here — returns same rows)
SELECT t1.RNO, t2.NAME
FROM tb1 t1
JOIN tb1 t2 ON t1.RNO = t2.RNO;
-- ===== 7) EQUI JOIN (join with equality condition using WHERE) =====
-- Equivalent to inner join in behavior
SELECT tb1.RNO, tb1.NAME, tb1.MARKS, tb2.FEE
FROM tb1, tb2
WHERE tb1.RNO = tb2.RNO;
-- ===== Inspect Query Plan (EXPLAIN) =====
-- Use EXPLAIN to see how MySQL plans to execute the join
EXPLAIN SELECT tb1.RNO, tb1.NAME, tb2.FEE
FROM tb1 JOIN tb2 ON tb1.RNO = tb2.RNO;
EXPLAIN SELECT tb1.RNO, tb1.NAME, tb2.FEE
FROM tb1 JOIN tb2 ON tb1.RNO = tb2.RNO;
