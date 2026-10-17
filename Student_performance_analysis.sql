create database stu_performance;
CREATE DATABASE IF NOT EXISTS stu_performance;

USE stu_performance;

SELECT DATABASE() AS current_database;
SHOW TABLES;
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'stu_performance'
ORDER BY TABLE_NAME, ORDINAL_POSITION;

SELECT COUNT(*) AS total_records
FROM your_table_name;

USE stu_performance;

SELECT COUNT(*) AS total_records
FROM student_data_cvs;

SELECT *
FROM student_data_cvs
LIMIT 200;

DESCRIBE student_data_cvs;
DESCRIBE student_data_cvs;
SELECT *
FROM student_data_cvs
LIMIT 5;

SELECT `ï»¿Student_ID`, COUNT(*) AS occurrences
FROM student_data_cvs
GROUP BY `ï»¿Student_ID`
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS total_students
FROM student_data_cvs;

SELECT
    AVG(Midterm_Score) AS average_midterm,
    AVG(Final_Score) AS average_final
FROM student_data_cvs;

SELECT
    AVG(Midterm_Score) AS average_midterm,
    AVG(Final_Score) AS average_final
FROM student_data_cvs;

SELECT
    Backlogs,
    COUNT(*) AS total_students,
    ROUND(AVG(Midterm_Score), 2) AS avg_midterm,
    ROUND(AVG(Final_Score), 2) AS avg_final
FROM student_data_cvs
GROUP BY Backlogs
ORDER BY Backlogs;

SELECT
    Attendance_Percentage,
    COUNT(*) AS total_students,
    ROUND(AVG(Midterm_Score), 2) AS avg_midterm,
    ROUND(AVG(Final_Score), 2) AS avg_final
FROM student_data_cvs
GROUP BY Attendance_Percentage
ORDER BY Attendance_Percentage;

SELECT
    ï»¿Student_ID,
    Attendance_Percentage,
    Midterm_Score,
    Final_Score,
    Backlogs
FROM student_data_cvs
WHERE  Attendance_Percentage < 75
  AND Final_Score < 50
ORDER BY Final_Score ASC;

SELECT
    MIN(Attendance_Percentage) AS lowest_attendance,
    MAX(Attendance_Percentage) AS highest_attendance,
    ROUND(AVG(Attendance_Percentage), 2) AS average_attendance
FROM student_data_cvs;

SELECT
    CASE
        WHEN Attendance_Percentage < 70 THEN 'Below 70%'
        WHEN Attendance_Percentage < 80 THEN '70-79.99%'
        ELSE '80% and Above'
    END AS attendance_group,
    COUNT(*) AS total_students,
    ROUND(AVG(Midterm_Score), 2) AS avg_midterm,
    ROUND(AVG(Final_Score), 2) AS avg_final
FROM student_data_cvs
GROUP BY attendance_group
ORDER BY avg_final DESC;

SELECT
    Family_Pressure_Level,
    COUNT(*) AS total_students,
    ROUND(AVG(Midterm_Score), 2) AS avg_midterm,
    ROUND(AVG(Final_Score), 2) AS avg_final
FROM student_data_cvs
GROUP BY Family_Pressure_Level
ORDER BY Family_Pressure_Level;

SELECT
    Self_Motivation_Level,
    COUNT(*) AS total_students,
    ROUND(AVG(Midterm_Score), 2) AS avg_midterm,
    ROUND(AVG(Final_Score), 2) AS avg_final
FROM student_data_cvs
GROUP BY Self_Motivation_Level
ORDER BY Self_Motivation_Level;

SELECT
    Family_Pressure_Level,
    Self_Motivation_Level,
    COUNT(*) AS total_students,
    ROUND(AVG(Final_Score), 2) AS avg_final_score
FROM student_data_cvs
GROUP BY
    Family_Pressure_Level,
    Self_Motivation_Level
ORDER BY avg_final_score DESC;

SELECT
    ï»¿Student_ID,
    Attendance_Percentage,
    Midterm_Score,
    Final_Score,
    Backlogs,
    CASE
        WHEN Final_Score < 40
             OR Backlogs >= 3
        THEN 'High Risk'

        WHEN Final_Score < 60
             OR Attendance_Percentage < 70
        THEN 'Medium Risk'

        ELSE 'Low Risk'
    END AS Risk_Category
FROM student_data_cvs
ORDER BY Final_Score ASC;

SELECT
    CASE
        WHEN Final_Score < 40
             OR Backlogs >= 3
        THEN 'High Risk'
        WHEN Final_Score < 60
             OR Attendance_Percentage < 70
        THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS Risk_Category,
    COUNT(*) AS Total_Students,
    ROUND(AVG(Final_Score), 2) AS Average_Final_Score
FROM student_data_cvs
GROUP BY Risk_Category
ORDER BY Total_Students DESC;

SELECT
    Department,
    COUNT(*) AS Total_Students,
    ROUND(AVG(Midterm_Score), 2) AS Avg_Midterm,
    ROUND(AVG(Final_Score), 2) AS Avg_Final
FROM student_data_cvs
GROUP BY Department
ORDER BY Avg_Final DESC;

SELECT
    ï»¿Student_ID,
    Attendance_Percentage,
    Midterm_Score,
    Final_Score,
    Backlogs
FROM student_data_cvs
ORDER BY Final_Score DESC
LIMIT 10;

SELECT
    `ï»¿Student_ID`,
    Attendance_Percentage,
    Midterm_Score,
    Final_Score,
    Backlogs
FROM student_data_cvs
ORDER BY Final_Score ASC
LIMIT 10;

SELECT
    COUNT(*) AS Total_Students,
    ROUND(AVG(Midterm_Score), 2) AS Avg_Midterm,
    ROUND(AVG(Final_Score), 2) AS Avg_Final,
    ROUND(AVG(Attendance_Percentage), 2) AS Avg_Attendance,
    SUM(CASE WHEN Backlogs > 0 THEN 1 ELSE 0 END)
        AS Students_With_Backlogs,
    SUM(CASE
        WHEN Final_Score < 40 OR Backlogs >= 3
        THEN 1 ELSE 0
    END) AS High_Risk_Students,
    SUM(CASE
        WHEN Final_Score >= 40 AND Final_Score < 60
             AND Backlogs < 3
        THEN 1
        WHEN Final_Score >= 60 AND Attendance_Percentage < 70
             AND Backlogs < 3
        THEN 1
        ELSE 0
    END) AS Medium_Risk_Students
FROM student_data_cvs;