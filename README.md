# **Psychiatric Facility Readmission Analysis**  

## **Background & Overview**  
This project analyzes psychiatric facility performance in the U.S., focusing on **30-day readmission rates**, **medication continuation**, and **screening compliance**. Using national inpatient psychiatric facility quality measure data, the goal was to identify patterns, highlight best and worst performers, and provide actionable recommendations for reducing readmissions.  

The analysis was conducted using **SQL Server** for data preparation, **Excel** for intermediate checks, and **Tableau** for interactive visualization.  

---

## **Data Structure Overview**  
The dataset included facility-level metrics:  
- **Readmission Rates** (30-day psychiatric)  
- **Medication Continuation** (% patients continuing prescribed meds post-discharge)  
- **Screening Compliance** for metabolic disorders (SMD), substance use (SUB), and tobacco cessation (TOB-3)  
- **Ownership Type** (e.g., physician-owned, government, private non-profit)  
- **State-Level Performance**  

Data cleaning included:  
- Standardizing column names  
- Removing nulls and “Too Few to Report” facilities  
- Calculating performance tiers for readmission rates  
- Grouping facilities into deciles for deeper KPI comparisons  

---

## **Executive Summary**  
Across **1,451 facilities**, the average 30-day psychiatric readmission rate is **19.5%**, with **6.2%** performing worse than the national benchmark. The average medication continuation rate is **79.6%**, indicating strong follow-up at many sites.  

However, performance distribution shows most facilities cluster in the **15–25% readmission range**, leaving significant room for improvement. Ownership type and geography emerge as key influencing factors, with **physician-owned hospitals** having both the highest readmissions and the lowest screening rates.  

---

## **Insights Deep Dive**  

### **1. Overall Facility Performance **
<img width="1100" height="771" alt="Dashboard1" src="https://github.com/user-attachments/assets/ba666b92-fa40-44eb-a8d6-084e03e68502" />

- **Most facilities (93%)** fall in the **15–25% readmission range**.  
- Only **36 facilities** have readmissions below 15%, while **44 exceed 25%**.  
- Suggests a larger focus area for small-scale improvements in the 20–25% group, while still addressing high-risk sites.  

### **2. Top & Bottom Facilities **  
<img width="1174" height="812" alt="Dashboard2" src="https://github.com/user-attachments/assets/d0291917-762d-4710-a2f5-2f6de6b3b104" />

- Ten best performers, such as **Saint John Hospital (13.3%)**, consistently stay under 14%.  
- Ten worst performers, including **Community Hospital of San Bernardino (31.6%)**, all exceed 27%.  
- Shows both where best practices are working and where urgent interventions are required.  

### **3. Intervention Metrics & Distribution ** 
<img width="949" height="790" alt="Dashboard3" src="https://github.com/user-attachments/assets/ee3a4079-95fb-4076-833c-7f86a61428a3" />

- Over **80% of facilities** screen for metabolic disorders (SMD) and over **50%** provide tobacco cessation counseling (TOB-3).  
- However, **some facilities report 0% compliance**, suggesting major gaps in implementation or reporting.  
- Readmission distribution is **right-skewed**, with half of facilities between 15–20% and a long tail above 25%.  

### **4. Ownership & Regional Patterns **  
<img width="1382" height="821" alt="Dashboard4" src="https://github.com/user-attachments/assets/65ebf3bd-6fbc-44d4-b7ea-793c87e2222a" />

- **Physician-owned facilities** average the highest readmissions (**21.5%**) and lowest screening rates (**58%**).  
- **Non-profit hospitals** perform best overall.  
- State-level analysis shows rates range from **~17% in top-performing states** to **over 22% in high-risk areas**.  

---

## **Recommendations**  

1. **Target the 20–25% Readmission Group**  
   - This segment makes up a large share of facilities and is close to breaking into the “average” range.  
   - Low-cost, incremental improvements here could yield major national impact.  

2. **Address Zero-Compliance Facilities**  
   - Investigate facilities reporting **0%** screening or intervention rates to identify data issues or operational failures.  

3. **Share Best Practices from Top Performers**  
   - Facilities like Saint John Hospital can serve as case studies for effective discharge planning, follow-up care, and intervention programs.  

4. **Ownership-Based Strategies**  
   - Physician-owned facilities need targeted improvement plans, possibly linked to performance-based incentives or required operational changes.  

5. **Regional Health Policy Alignment**  
   - States with high average readmissions may benefit from coordinated policy changes, funding allocations, and resource sharing between top- and low-performing regions.  
