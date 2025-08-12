# SQL Documentation – Psychiatric Readmission Analysis

This section outlines the SQL queries used to clean, transform, and analyze the dataset for the psychiatric readmission project.  
The queries are grouped into **Cleaning** and **Analysis** stages for clarity.  
Full `.sql` files are stored in the [`queries`](./queries) folder of this repository.

---

## **1. Data Cleaning & Preparation**

These queries ensure the dataset is complete, correctly structured, and ready for analysis.

- **[Creating Cleaned Table](./queries/Creating%20Cleaned%20Table.sql)**  
  Creates a cleaned version of the original dataset, standardizing column names, data types, and formatting for consistency.

- **[Null Coverage](./queries/Null%20Coverage.sql)**  
  Checks for missing values in key metrics such as `readm_rate`, `medcont_pct`, `smd_pct`, etc., to assess data quality and completeness.

---

## **2. Analysis Queries**

These queries extract insights for KPI calculation, benchmark comparisons, and visualizations in Tableau.

- **[Summary of Important Metrics](./queries/Summary%20of%20Important%20Metrics.sql)**  
  Returns core project KPIs including:
  - Average 30-day readmission rate
  - Median medication continuation rate

- **[Average 30 Day Readmission](./queries/Average%2030%20Day%20Readmission.sql)**  
  Computes the overall average 30-day psychiatric readmission rate across all facilities.

- **[Decile Cut-points for Key Metrics](./queries/Decile%20Cut-points%20for%20Key%20Metrics.sql)**  
  Calculates percentile breakpoints (deciles) for interventions such as SMD, SUB-2, SUB-3, TOB-3, MedCont, IMM-2, and readmission rate.

- **[Readmission Breakdown](./queries/Readmission%20Breakdown.sql)**  
  Categorizes facilities into performance tiers (e.g., High, Medium, Low) based on readmission rates.

- **[Readmission Tiers](./queries/Readmission%20Tiers.sql)**  
  Segments facilities into groups based on relative performance compared to the national average.
 
- **[Ownership Type Analysis](./queries/Ownership%20Type%20Analysis.sql)**  
  Compares average readmission rates across hospital ownership types (government, private nonprofit, physician-owned, etc.).

- **[Readmission % Screening State Level Averages](./queries/Readmission%20%25%20Screening%20State%20Level%20Averages.sql)**  
  Calculates state-level averages for readmission rate and screening measures, used for the geographical benchmark dashboard.

- **[Top 10 Lowest Readmission Rate Facilities](./queries/Top%2010%20Lowest%20Readmission%20Rate%20Facilities.sql)**  
  Identifies the 10 facilities with the lowest readmission rates.

- **[Top 10 Highest Readmission Rate Facilities](./queries/Top%2010%20Highest%20Readmission%20Rate%20Facilities.sql)**  
  Identifies the 10 facilities with the highest readmission rates.

---

## **How to View Full Queries**

To explore the SQL logic in detail, open the `.sql` files in the [`queries`](./queries) folder.  
Each file is named to clearly indicate its purpose and is documented with in-line comments.

---
