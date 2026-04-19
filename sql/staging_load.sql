BULK INSERT stg_patients
FROM 'C:\Users\sweth\Documents\hospital_analytics_project\data\patients.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

BULK INSERT stg_doctors
FROM 'C:\Users\sweth\Documents\hospital_analytics_project\data\doctors.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

BULK INSERT stg_beds
FROM 'C:\Users\sweth\Documents\hospital_analytics_project\data\beds.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

BULK INSERT stg_admissions
FROM 'C:\Users\sweth\Documents\hospital_analytics_project\data\admissions.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);


BULK INSERT stg_treatments
FROM 'C:\Users\sweth\Documents\hospital_analytics_project\data\treatments.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);


