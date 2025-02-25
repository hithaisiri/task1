-- 1. Create Database
CREATE DATABASE IF NOT EXISTS StudentManagement;
USE StudentManagement;

-- 2. Create Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Gender VARCHAR(1) CHECK (Gender IN ('M', 'F')),
    Age INT CHECK (Age > 0),
    Grade VARCHAR(10),
    MathScore INT CHECK (MathScore BETWEEN 0 AND 100),
    ScienceScore INT CHECK (ScienceScore BETWEEN 0 AND 100),
    EnglishScore INT CHECK (EnglishScore BETWEEN 0 AND 100)
);

-- 3. Insert Sample Data
INSERT INTO Students (StudentID, Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) VALUES
(1,'Alice Johnson', 'F', 15, 'A', 90, 85, 88),
(2,'Bob Smith', 'M', 16, 'B', 75, 80, 78),
(3,'Charlie Brown', 'M', 15, 'A', 92, 88, 91),
(4,'Diana Ross', 'F', 14, 'C', 65, 70, 68),
(5,'Ethan Hunt', 'M', 16, 'B', 80, 79, 82),
(6,'Fiona Davis', 'F', 15, 'A', 95, 94, 96),
(7,'George White', 'M', 17, 'B', 78, 76, 80),
(8,'Hannah Lee', 'F', 14, 'C', 60, 63, 67),
(9,'Ian Scott', 'M', 15, 'B', 82, 85, 80),
(10,'Julia Adams', 'F', 16, 'A', 89, 91, 93);

-- 4. Retrieve All Student Data
SELECT * from Students;

-- 5. Calculate Average Scores for Each Subject
SELECT 
    AVG(MathScore) AS Avg_MathScore, 
    AVG(ScienceScore) AS Avg_ScienceScore, 
    AVG(EnglishScore) AS Avg_EnglishScore 
FROM Students;

-- 6. Find the Top Performer
SELECT *, (MathScore + ScienceScore + EnglishScore) AS TotalScore 
FROM Students 
ORDER BY TotalScore DESC 
LIMIT 1;

-- 7. Count Students in Each Grade
SELECT Grade, COUNT(*) AS StudentCount 
FROM Students 
GROUP BY Grade;

-- 8. Calculate Average Score by Gender
SELECT Gender, 
       AVG(MathScore) AS Avg_MathScore, 
       AVG(ScienceScore) AS Avg_ScienceScore, 
       AVG(EnglishScore) AS Avg_EnglishScore 
FROM Students 
GROUP BY Gender;

-- 9. Find High Achievers in Math (Score > 80)
SELECT * FROM Students WHERE MathScore > 80;

-- 10. Update Grade for a Specific Student
UPDATE Students 
SET Grade = 'A' 
WHERE StudentID = 5;


