CREATE DATABASE healthcare_appointments;
USE healthcare_appointments;
SHOW DATABASES;
USE healthcare_appointments;

CREATE TABLE appointments (
    PatientId VARCHAR(30),
    AppointmentID INT,
    Gender VARCHAR(10),
    ScheduledDay VARCHAR(30),
    AppointmentDay VARCHAR(30),
    WaitTime INT,
    Age INT,
    Neighbourhood VARCHAR(100),
    Scholarship INT,
    Hypertension INT,
    Diabetes INT,
    Alcoholism INT,
    Handcap INT,
    SMS_received INT,
    No_show VARCHAR(10),
    Attendance VARCHAR(20),
    AgeGroup VARCHAR(20),
    AppointmentWeekday VARCHAR(20),
    WaitCategory VARCHAR(20)
);
SHOW TABLES;
DESCRIBE appointments;
SELECT COUNT(*) FROM appointments;
LOAD DATA LOCAL INFILE 'C:/healthcare_appointments.csv'
INTO TABLE appointments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
appointmentsSET GLOBAL local_infile = 1;
LOAD DATA LOCAL INFILE 'C:/healthcare_appointments.csv'
INTO TABLE appointments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
SET GLOBAL local_infile = 1;
LOAD DATA LOCAL INFILE 'C:/healthcare_appointments.csv'
INTO TABLE appointments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
SHOW VARIABLES LIKE 'secure_file_priv';
USE healthcare_appointments;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/healthcare_appointments.csv'
INTO TABLE appointments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
USE healthcare_appointments;

DROP TABLE appointments;

CREATE TABLE appointments (
    PatientId VARCHAR(30),
    AppointmentID INT,
    Gender VARCHAR(10),
    ScheduledDay VARCHAR(30),
    ScheduledDay_cleaned VARCHAR(30),
    AppointmentDay VARCHAR(30),
    AppointmentDay_cleaned VARCHAR(30),
    Appointment_weekDay VARCHAR(20),
    WaitTime VARCHAR(20),
    waitBucket VARCHAR(20),
    waitTime_category VARCHAR(30),
    Age INT,
    AgeGroup VARCHAR(20),
    Neighbourhood VARCHAR(100),
    Scholarship INT,
    Hipertension INT,
    Diabetes INT,
    Alcoholism INT,
    Handcap INT,
    SMS_received INT,
    No_show VARCHAR(10),
    Attendance VARCHAR(20)
);
USE healthcare_appointments;

DROP TABLE appointments;
SHOW TABLES;

SHOW TABLES;
USE healthcare_appointments;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/healthcare_appointments.csv'
INTO TABLE appointments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
SELECT COUNT(*) FROM appointments;
SELECT * 
FROM appointments
LIMIT 10;


SELECT 
    waitTime_category,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN Attendance = 'Missed' THEN 1 ELSE 0 END) AS missed,
    ROUND(
        SUM(CASE WHEN Attendance = 'Missed' THEN 1 ELSE 0 END) / COUNT(*) * 100,
        2
    ) AS missed_rate_percent
FROM appointments
GROUP BY waitTime_category
ORDER BY missed_rate_percent DESC;


SELECT 
    AgeGroup,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN Attendance = 'Missed' THEN 1 ELSE 0 END) AS missed,
    ROUND(
        SUM(CASE WHEN Attendance = 'Missed' THEN 1 ELSE 0 END) / COUNT(*) * 100,
        2
    ) AS missed_rate_percent
FROM appointments
GROUP BY AgeGroup
ORDER BY missed_rate_percent DESC;

SELECT 
    Appointment_weekDay,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN Attendance = 'Missed' THEN 1 ELSE 0 END) AS missed,
    ROUND(
        SUM(CASE WHEN Attendance = 'Missed' THEN 1 ELSE 0 END) / COUNT(*) * 100,
        2
    ) AS missed_rate_percent
FROM appointments
GROUP BY Appointment_weekDay
ORDER BY missed_rate_percent DESC;

SELECT 
    waitTime_category,
    SMS_received,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN Attendance = 'Missed' THEN 1 ELSE 0 END) AS missed,
    ROUND(
        SUM(CASE WHEN Attendance = 'Missed' THEN 1 ELSE 0 END) / COUNT(*) * 100,
        2
    ) AS missed_rate_percent
FROM appointments
GROUP BY waitTime_category, SMS_received
ORDER BY waitTime_category, SMS_received;


SELECT
    AgeGroup,
    waitTime_category,
    SMS_received,
    COUNT(*) AS total,
    ROUND(
        SUM(CASE WHEN Attendance='Missed' THEN 1 ELSE 0 END)/COUNT(*)*100,
        2
    ) AS missed_rate
FROM appointments
GROUP BY AgeGroup, waitTime_category, SMS_received
HAVING COUNT(*) > 100
ORDER BY missed_rate DESC
LIMIT 10;