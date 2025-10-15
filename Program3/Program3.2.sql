DROP TABLE IF EXISTS sailors;
DROP TABLE IF EXISTS boats;
DROP TABLE IF EXISTS reserves;
CREATE TABLE sailors (
  sid INT PRIMARY KEY,
  sname VARCHAR(50)
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
(1, 'Ravi'),
(2, 'Lubber'),
(3, 'Horatio'),
(4, 'Dustin');
INSERT INTO boats VALUES
(101, 'Red'),
(102, 'Green'),
(103, 'Blue');
INSERT INTO reserves VALUES
(1, 101),  -- Ravi reserved Red
(1, 102),  -- Ravi reserved Green
(2, 101),  -- Lubber reserved Red
(3, 102),  -- Horatio reserved Green
(4, 101);  -- Dustin reserved Red
SELECT s.sname
FROM sailors s, reserves r, boats b
WHERE s.sid = r.sid AND b.bid = r.bid AND b.bcolor = 'Red'
UNION
SELECT s1.sname
FROM sailors s1, reserves r1, boats b1
WHERE s1.sid = r1.sid AND r1.bid = b1.bid AND b1.bcolor = 'Green';
-- ===== 2) UNION ALL (keeps duplicates) =====
SELECT s.sname
FROM sailors s, reserves r, boats b
WHERE s.sid = r.sid AND b.bid = r.bid AND b.bcolor = 'Red'
UNION ALL
SELECT s1.sname
FROM sailors s1, reserves r1, boats b1
WHERE s1.sid = r1.sid AND r1.bid = b1.bid AND b1.bcolor = 'Green';
-- ===== 3) INTERSECT (MySQL equivalent using INNER JOIN) =====
SELECT DISTINCT s.sname
FROM sailors s
JOIN reserves r ON s.sid = r.sid
JOIN boats b ON b.bid = r.bid AND b.bcolor = 'Red'
WHERE s.sid IN (
  SELECT s2.sid
  FROM sailors s2
  JOIN reserves r2 ON s2.sid = r2.sid
  JOIN boats b2 ON b2.bid = r2.bid AND b2.bcolor = 'Green'
);
-- ===== 4) MINUS (MySQL equivalent using LEFT JOIN + NULL check) =====
SELECT DISTINCT s.sname
FROM sailors s
JOIN reserves r ON s.sid = r.sid
JOIN boats b ON b.bid = r.bid AND b.bcolor = 'Red'
WHERE s.sid NOT IN (
  SELECT s2.sid
  FROM sailors s2
  JOIN reserves r2 ON s2.sid = r2.sid
  JOIN boats b2 ON b2.bid = r2.bid AND b2.bcolor = 'Green'
);