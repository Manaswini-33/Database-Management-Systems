CREATE DATABASE IF NOT EXISTS UniversityDB;
USE UniversityDB;
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;
CREATE TABLE Students (
    StudentID VARCHAR(20) PRIMARY KEY,
    StudentName VARCHAR(50),
    Major VARCHAR(50)
);
CREATE TABLE Courses (
    CourseID VARCHAR(20) PRIMARY KEY,
    CourseName VARCHAR(50),
    Credits INT
);
CREATE TABLE Enrollments (
    StudentID VARCHAR(20),
    CourseID VARCHAR(20),
    Marks INT,
    PRIMARY KEY (StudentID, CourseID)
);
INSERT INTO Students (StudentID, StudentName, Major) VALUES
('S1', 'Bala', 'CSE'),
('S2', 'Kiran', 'ECE'),
('S3', 'Raju', 'IT');
INSERT INTO Courses (CourseID, CourseName, Credits) VALUES
('C1', 'Data Structures', 4),
('C2', 'DBMS', 3);
INSERT INTO Enrollments (StudentID, CourseID, Marks) VALUES
('S1', 'C1', 85),
('S2', 'C1', 90),
('S3', 'C1', 75),
('S1', 'C2', 80),
('S2', 'C2', 95);
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
SELECT AVG(Marks) AS AverageMarks FROM Enrollments;
SELECT SUM(Marks) AS TotalMarks FROM Enrollments;
SELECT MAX(Marks) AS MaxMarks FROM Enrollments;
SELECT MIN(Marks) AS MinMarks FROM Enrollments;
SELECT COUNT(*) AS TotalRows FROM Enrollments;
-- Sum of marks per course
SELECT CourseID, SUM(Marks) AS TotalMarksPerCourse
FROM Enrollments
GROUP BY CourseID;
-- Minimum marks per course
SELECT CourseID, MIN(Marks) AS MinMarksPerCourse
FROM Enrollments
GROUP BY CourseID;
-- Maximum marks per course
SELECT CourseID, MAX(Marks) AS MaxMarksPerCourse
FROM Enrollments
GROUP BY CourseID;
-- Count of students per course
SELECT CourseID, COUNT(*) AS NumStudents
FROM Enrollments
GROUP BY CourseID;
-- Courses with more than 2 students
SELECT CourseID, COUNT(*) AS NumStudents
FROM Enrollments
GROUP BY CourseID
HAVING COUNT(*) > 2;
-- Courses with total marks > 200
SELECT CourseID, SUM(Marks) AS TotalMarks
FROM Enrollments
GROUP BY CourseID
HAVING SUM(Marks) > 200;
