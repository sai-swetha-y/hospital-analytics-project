CREATE DATABASE HospitalAnalyticsDB;
GO

USE HospitalAnalyticsDB;
GO

CREATE TABLE stg_patients (
    patient_id INT,
    age INT,
    gender VARCHAR(10),
    city VARCHAR(100),
    disease_type VARCHAR(50)
);

CREATE TABLE stg_doctors (
    doctor_id INT,
    name VARCHAR(100),
    specialization VARCHAR(50),
    shift VARCHAR(20)
);

CREATE TABLE stg_beds (
    bed_id INT,
    ward_type VARCHAR(20),
    block VARCHAR(20)
);

CREATE TABLE stg_admissions (
    admission_id INT,
    patient_id INT,
    admission_date DATE,
    discharge_date DATE,
    department VARCHAR(50),
    bed_id INT,
    admission_type VARCHAR(20),
    severity_score INT
);

CREATE TABLE stg_treatments (
    treatment_id INT,
    admission_id INT,
    doctor_id INT,
    treatment_type VARCHAR(50),
    cost DECIMAL(10,2),
    duration_hours DECIMAL(5,2)
);

