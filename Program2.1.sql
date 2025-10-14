-- Create the University Database
CREATE DATABASE IF NOT EXISTS UniversityDB;

-- Use the database
USE UniversityDB;

-- Create Students Table
CREATE TABLE IF NOT EXISTS Students (
    StudentID VARCHAR(20) PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Major VARCHAR(50)
);

-- Create Courses Table
CREATE TABLE IF NOT EXISTS Courses (
    CourseID VARCHAR(20) PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT
);

-- Create Instructors Table
CREATE TABLE IF NOT EXISTS Instructors (
    InstructorID INT PRIMARY KEY,
    InstructorName VARCHAR(100) NOT NULL,
    Phone BIGINT
);

-- Create Enrollments Table
CREATE TABLE IF NOT EXISTS Enrollments (
    StudentID VARCHAR(20),
    CourseID VARCHAR(20),
    EnrollmentDate DATE,
    PRIMARY KEY (StudentID, CourseID)
);

-- Create Course_Instructors Table
CREATE TABLE IF NOT EXISTS Course_Instructors (
    CourseID VARCHAR(20),
    InstructorID INT,
    PRIMARY KEY (CourseID, InstructorID)
);

--------------------------------------------------------------------------------
-- DML Commands (Insert, Select, Update, Delete)
--------------------------------------------------------------------------------

-- Insert sample students
INSERT INTO Students VALUES ('24B11CS234','Bala','CSE');
INSERT INTO Students VALUES ('24B11CS381','Kiran','ECE');
INSERT INTO Students VALUES ('24B11CS412','Raju','IT');

-- Insert sample courses
INSERT INTO Courses VALUES ('CS101','Data Structures',4);
INSERT INTO Courses VALUES ('CS102','DBMS',3);
INSERT INTO Courses VALUES ('CS103','AI',3);

-- Insert sample instructors
INSERT INTO Instructors VALUES (1,'Dr. Sharma',9876543210);
INSERT INTO Instructors VALUES (2,'Dr. Verma',9876501234);

-- Insert sample enrollments
INSERT INTO Enrollments VALUES ('24B11CS234','CS101','2025-10-01');
INSERT INTO Enrollments VALUES ('24B11CS381','CS102','2025-10-02');
INSERT INTO Enrollments VALUES ('24B11CS412','CS103','2025-10-03');

-- Insert sample course_instructors
INSERT INTO Course_Instructors VALUES ('CS101',1);
INSERT INTO Course_Instructors VALUES ('CS102',2);
INSERT INTO Course_Instructors VALUES ('CS103',1);


-- SELECT Queries

-- Display all students
SELECT * FROM Students;

-- Display only student names
SELECT StudentName FROM Students;

-- Display a specific student
SELECT * FROM Students WHERE StudentID='24B11CS234';

-- Display all courses
SELECT * FROM Courses;

-- Display all instructors
SELECT * FROM Instructors;

-- Display all enrollments
SELECT * FROM Enrollments;

-- UPDATE Queries

-- Update a student's name
UPDATE Students SET StudentName='Bala Raju' WHERE StudentID='24B11CS234';

-- Update course credits
UPDATE Courses SET Credits=5 WHERE CourseID='CS101';

-- DELETE Queries

-- Delete a student
DELETE FROM Students WHERE StudentID='24B11CS381';

-- Delete a course
DELETE FROM Courses WHERE CourseID='CS102';
