<<<<<<< HEAD
# hospital-analytics-project
=======
# 🏥 Hospital Resource Optimization Analytics

## 📌 Overview

This project simulates hospital operations and builds an end-to-end analytics pipeline to analyze patient flow, resource utilization, and operational efficiency.

It demonstrates **data engineering + analytics engineering + BI reporting** using a realistic healthcare use case.

---

## 🏗️ Architecture

```
Python (Data Generator)
        ↓
CSV Files
        ↓
SQL Server (Staging Layer)
        ↓
Star Schema (Fact + Dimension Tables)
        ↓
Power BI (Dashboard & Reporting)
```

---

## ⚙️ Tech Stack

* Python (Pandas, NumPy, Faker)
* Microsoft SQL Server (MSSQL)
* Power BI
* Git & GitHub

---

## 📂 Project Structure

```
hospital-analytics-project/
│
├── data_generator/
│   └── generate_data.py
│
├── sql/
│   ├── create_tables.sql
│   ├── staging_load.sql
│   ├── transformations.sql
│
├── powerbi/
│   └── hospital_dashboard.pbix
│
├── README.md
└── .gitignore
```

---

## 🧠 Data Model (Star Schema)

### ⭐ Fact Table

* `fact_hospital_activity`

### 📊 Dimension Tables

* `dim_patient`
* `dim_doctor`
* `dim_bed`
* `dim_department`
* `dim_date`

👉 Designed for **analytical querying and Power BI performance**

---

## 📊 Key Metrics

* Total Admissions
* Total Treatment Cost
* Average Length of Stay (LOS)
* ICU Utilization %
* Emergency Admission %
* Average Treatment Time
* High Severity Cases

---

## 📈 Dashboard Pages

### 🟢 Hospital Overview

* Admissions trend
* Disease distribution
* Department-wise load

### 🔴 Emergency & Outbreak Analysis

* Monthly admission spikes
* Disease trends (e.g., Dengue)
* High severity tracking

### 🔵 Resource Optimization

* ICU vs General bed utilization
* Department workload
* Length of stay analysis

### 🟡 Doctor Performance

* Patients handled
* Treatment time
* Cost contribution

---

## 🚀 How to Run

### 1. Generate Data

```bash
python data_generator/generate_data.py
```

### 2. Load into SQL Server

Run scripts in order:

1. create_tables.sql
2. staging_load.sql
3. transformations.sql

---

### 3. Open Power BI

* Open `hospital_dashboard.pbix`
* Update SQL Server connection
* Click **Refresh**

---


## 💡 Key Learnings

* End-to-end data pipeline design
* Bulk data ingestion in SQL Server
* Dimensional modeling (Star Schema)
* Analytical transformations
* Power BI data modeling & DAX
* Dashboard storytelling

---

## 🎯 Use Case Value

This project simulates real-world hospital analytics scenarios:

* Resource planning (ICU beds, staff)
* Identifying disease outbreaks
* Improving operational efficiency
* Monitoring healthcare performance KPIs

---

## 📌 Author

**Swetha**

---
>>>>>>> 18ec9da (Initial commit - hospital analytics project)
