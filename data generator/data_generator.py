import pandas as pd
import numpy as np
from faker import Faker
import random
from datetime import datetime, timedelta

fake = Faker()
np.random.seed(42)
random.seed(42)

# -----------------------------
# CONFIG
# -----------------------------
NUM_PATIENTS = 50000
NUM_ADMISSIONS = 100000
NUM_DOCTORS = 1000
NUM_BEDS = 500
NUM_TREATMENTS = 150000

START_DATE = datetime(2023, 1, 1)
END_DATE = datetime(2025, 1, 1)

DISEASES = ["Dengue", "Cardiac", "Trauma", "Fever", "Covid", "Orthopedic"]
DEPARTMENTS = ["General", "ICU", "Emergency", "Cardiology", "Orthopedic"]

# -----------------------------
# HELPERS
# -----------------------------
def random_date():
    delta = END_DATE - START_DATE
    return START_DATE + timedelta(days=random.randint(0, delta.days))

def outbreak_multiplier(date):
    # simulate dengue spike in monsoon (Jun-Sep)
    if date.month in [6,7,8,9]:
        return 1.5
    return 1

# -----------------------------
# PATIENTS
# -----------------------------
patients = []
for i in range(1, NUM_PATIENTS + 1):
    patients.append({
        "patient_id": i,
        "age": random.randint(1, 90),
        "gender": random.choice(["Male", "Female"]),
        "city": fake.city(),
        "disease_type": random.choice(DISEASES)
    })

df_patients = pd.DataFrame(patients)
df_patients.to_csv("patients.csv", index=False)

# -----------------------------
# DOCTORS
# -----------------------------
doctors = []
for i in range(1, NUM_DOCTORS + 1):
    doctors.append({
        "doctor_id": i,
        "name": fake.name(),
        "specialization": random.choice(DEPARTMENTS),
        "shift": random.choice(["Morning", "Evening", "Night"])
    })

df_doctors = pd.DataFrame(doctors)
df_doctors.to_csv("doctors.csv", index=False)

# -----------------------------
# BEDS
# -----------------------------
beds = []
for i in range(1, NUM_BEDS + 1):
    beds.append({
        "bed_id": i,
        "ward_type": random.choice(["ICU", "General"]),
        "block": f"Block-{random.randint(1,5)}"
    })

df_beds = pd.DataFrame(beds)
df_beds.to_csv("beds.csv", index=False)

# -----------------------------
# ADMISSIONS
# -----------------------------
admissions = []
for i in range(1, NUM_ADMISSIONS + 1):
    admit_date = random_date()
    
    # simulate length of stay
    stay_days = int(np.random.exponential(scale=5))
    discharge_date = admit_date + timedelta(days=stay_days)

    admissions.append({
        "admission_id": i,
        "patient_id": random.randint(1, NUM_PATIENTS),
        "admission_date": admit_date,
        "discharge_date": discharge_date,
        "department": random.choice(DEPARTMENTS),
        "bed_id": random.randint(1, NUM_BEDS),
        "admission_type": random.choice(["Emergency", "Planned"]),
        "severity_score": random.randint(1, 10)
    })

df_admissions = pd.DataFrame(admissions)
df_admissions.to_csv("admissions.csv", index=False)

# -----------------------------
# TREATMENTS
# -----------------------------
treatments = []
for i in range(1, NUM_TREATMENTS + 1):
    treatments.append({
        "treatment_id": i,
        "admission_id": random.randint(1, NUM_ADMISSIONS),
        "doctor_id": random.randint(1, NUM_DOCTORS),
        "treatment_type": random.choice(["Medication", "Surgery", "Therapy"]),
        "cost": round(random.uniform(500, 50000), 2),
        "duration_hours": round(random.uniform(0.5, 10), 2)
    })

df_treatments = pd.DataFrame(treatments)
df_treatments.to_csv("treatments.csv", index=False)

print("✅ All CSV files generated successfully!")