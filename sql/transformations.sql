CREATE TABLE dim_patient (
    patient_key INT IDENTITY(1,1) PRIMARY KEY,
    patient_id INT,
    age INT,
    age_group VARCHAR(20),
    gender VARCHAR(10),
    city VARCHAR(100),
    disease_type VARCHAR(50)
);

CREATE TABLE dim_doctor (
    doctor_key INT IDENTITY(1,1) PRIMARY KEY,
    doctor_id INT,
    name VARCHAR(100),
    specialization VARCHAR(50),
    shift VARCHAR(20)
);

CREATE TABLE dim_bed (
    bed_key INT IDENTITY(1,1) PRIMARY KEY,
    bed_id INT,
    ward_type VARCHAR(20),
    block VARCHAR(20)
);

CREATE TABLE dim_department (
    department_key INT IDENTITY(1,1) PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    year INT,
    weekday VARCHAR(20)
);

CREATE TABLE fact_hospital_activity (
    fact_id INT IDENTITY(1,1) PRIMARY KEY,
    
    patient_key INT,
    doctor_key INT,
    bed_key INT,
    department_key INT,
    date_key INT,

    admission_id INT,

    length_of_stay INT,
    treatment_cost DECIMAL(12,2),
    duration_hours DECIMAL(10,2),
    severity_score INT,

    FOREIGN KEY (patient_key) REFERENCES dim_patient(patient_key),
    FOREIGN KEY (doctor_key) REFERENCES dim_doctor(doctor_key),
    FOREIGN KEY (bed_key) REFERENCES dim_bed(bed_key),
    FOREIGN KEY (department_key) REFERENCES dim_department(department_key),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);

INSERT INTO dim_patient (patient_id, age, age_group, gender, city, disease_type)
SELECT 
    patient_id,
    age,
    CASE 
        WHEN age < 18 THEN 'Child'
        WHEN age BETWEEN 18 AND 40 THEN 'Adult'
        WHEN age BETWEEN 41 AND 60 THEN 'Middle Age'
        ELSE 'Senior'
    END,
    gender,
    city,
    disease_type
FROM stg_patients;

INSERT INTO dim_doctor (doctor_id, name, specialization, shift)
SELECT DISTINCT doctor_id, name, specialization, shift
FROM stg_doctors;

INSERT INTO dim_bed (bed_id, ward_type, block)
SELECT DISTINCT bed_id, ward_type, block
FROM stg_beds;


INSERT INTO dim_date
SELECT DISTINCT
    CONVERT(INT, FORMAT(admission_date, 'yyyyMMdd')),
    admission_date,
    DAY(admission_date),
    MONTH(admission_date),
    YEAR(admission_date),
    DATENAME(WEEKDAY, admission_date)
FROM stg_admissions;


INSERT INTO fact_hospital_activity (
    patient_key,
    doctor_key,
    bed_key,
    department_key,
    date_key,
    admission_id,
    length_of_stay,
    treatment_cost,
    duration_hours,
    severity_score
)
SELECT
    dp.patient_key,
    dd.doctor_key,
    db.bed_key,
    ddep.department_key,
    ddate.date_key,
    a.admission_id,

    DATEDIFF(DAY, a.admission_date, a.discharge_date),
    t.cost,
    t.duration_hours,
    a.severity_score

FROM stg_admissions a

LEFT JOIN dim_patient dp ON a.patient_id = dp.patient_id
LEFT JOIN dim_bed db ON a.bed_id = db.bed_id
LEFT JOIN dim_department ddep ON a.department = ddep.department_name

LEFT JOIN stg_treatments t ON a.admission_id = t.admission_id
LEFT JOIN dim_doctor dd ON t.doctor_id = dd.doctor_id

LEFT JOIN dim_date ddate 
ON ddate.full_date = a.admission_date;




