-- Create the University Database
CREATE DATABASE UniversityDB;

-- Use the database
USE UniversityDB;

-- Create Students Table
CREATE TABLE Students (
    StudentID VARCHAR(20) PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Major VARCHAR(50)
);

-- Create Courses Table
CREATE TABLE Courses (
    CourseID VARCHAR(20) PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT
);

-- Create Instructors Table
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    InstructorName VARCHAR(100) NOT NULL,
    Phone BIGINT
);

-- Create Enrollments Table
CREATE TABLE Enrollments (
    StudentID VARCHAR(20),
    CourseID VARCHAR(20),
    EnrollmentDate DATE,
    PRIMARY KEY (StudentID, CourseID)
);

-- Create Course_Instructors Table
CREATE TABLE Course_Instructors (
    CourseID VARCHAR(20),
    InstructorID INT,
    PRIMARY KEY (CourseID, InstructorID)
);
