CREATE DATABASE IF NOT EXISTS University;
USE University;
DROP TABLE IF EXISTS univ_denorm;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Course_Instructors;
-- Step 3: Create Denormalized Table
-- (Contains redundant data — before normalization)
CREATE TABLE univ_denorm (
  StudentID INT,
  StudentName VARCHAR(100),
  Major VARCHAR(50),
  CourseID VARCHAR(20),
  CourseName VARCHAR(100),
  Credits INT,
  EnrollmentDate DATE,
  InstructorID INT,
  InstructorName VARCHAR(100),
  Phone VARCHAR(20)
);
-- Step 4: Insert Sample Data
INSERT INTO univ_denorm 
(StudentID, StudentName, Major, CourseID, CourseName, Credits, EnrollmentDate, InstructorID, InstructorName, Phone)
VALUES
(1, 'Alice Smith', 'Computer Science', 'C101', 'Intro to CS', 3, '2025-09-01', 10, 'Dr. Adams', '555-0100'),
(1, 'Alice Smith', 'Computer Science', 'C101', 'Intro to CS', 3, '2025-09-01', 11, 'Dr. Baker', '555-0111'),
(2, 'Bob Jones', 'Mathematics', 'C101', 'Intro to CS', 3, '2025-09-03', 10, 'Dr. Adams', '555-0100'),
(2, 'Bob Jones', 'Mathematics', 'C101', 'Intro to CS', 3, '2025-09-03', 11, 'Dr. Baker', '555-0111'),
(1, 'Alice Smith', 'Computer Science', 'C102', 'Calculus I', 4, '2025-09-02', 11, 'Dr. Baker', '555-0111'),
(3, 'Carol Lee', 'Physics', 'C103', 'Physics I', 4, '2025-09-04', 12, 'Dr. Clark', '555-0122');
-- View Denormalized Data
SELECT * FROM univ_denorm;
-- Step 5: Functional Dependencies (for understanding)
-- StudentID → StudentName, Major
-- CourseID → CourseName, Credits
-- InstructorID → InstructorName, Phone
-- (StudentID, CourseID) → EnrollmentDate
-- Candidate Key: (StudentID, CourseID, InstructorID)
-- Step 6: Normalization to 2NF / 3NF / BCNF / 4NF
-- Creating Separate Tables from univ_denorm
-- Students Table
CREATE TABLE Students AS
  SELECT DISTINCT StudentID, StudentName, Major FROM univ_denorm;
-- Courses Table
CREATE TABLE Courses AS
  SELECT DISTINCT CourseID, CourseName, Credits FROM univ_denorm;
-- Instructors Table
CREATE TABLE Instructors AS
  SELECT DISTINCT InstructorID, InstructorName, Phone FROM univ_denorm;
-- Enrollments Table
CREATE TABLE Enrollments AS
  SELECT DISTINCT StudentID, CourseID, EnrollmentDate FROM univ_denorm;
-- Course_Instructors Table
CREATE TABLE Course_Instructors AS
  SELECT DISTINCT CourseID, InstructorID FROM univ_denorm;
-- Step 7: Verify Normalized Tables
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Instructors;
SELECT * FROM Enrollments;
SELECT * FROM Course_Instructors;
-- Step 8: Verify 5NF using JOINs (Reconstructing the original data)
SELECT 
  e.StudentID, 
  s.StudentName, 
  s.Major,
  e.CourseID, 
  c.CourseName, 
  c.Credits, 
  e.EnrollmentDate, 
  ci.InstructorID, 
  i.InstructorName, 
  i.Phone
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Course_Instructors ci ON c.CourseID = ci.CourseID
JOIN Instructors i ON ci.InstructorID = i.InstructorID
ORDER BY e.StudentID, e.CourseID, ci.InstructorID;
-- End of Normalization Demonstration