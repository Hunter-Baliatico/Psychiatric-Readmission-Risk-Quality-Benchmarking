# Psychiatric Facility Readmission Analysis

## Project Background
This project analyzes psychiatric facility readmission rates across the United States, with a focus on understanding performance trends, identifying top and bottom performers, evaluating intervention implementation, and assessing the influence of ownership structures and geography.  
The dataset spans **1,451 facilities** and includes metrics on 30-day readmission rates, medication continuation, screening for metabolic disorders (SMD), substance use treatment (SUB), and tobacco cessation counseling (TOB-3).  

From the perspective of a data analyst at a healthcare quality oversight organization, the goal was to uncover patterns that could guide targeted interventions and improve patient outcomes.

**Insights and recommendations are provided on the following key areas:**
- **Category 1:** Facility Readmission Overview
- **Category 2:** Top & Bottom Performing Facilities
- **Category 3:** Intervention Metrics & Readmission Distribution
- **Category 4:** Ownership & Regional Benchmarks

The SQL queries used to inspect, clean, and analyze the data for this analysis can be found here → [SQL Data Cleaning Scripts](#)  
The full SQL documentation page can be found here → SQL Documentation.md
An interactive Tableau story including all 5 dashboard used to explore and report findings can be found here → https://public.tableau.com/app/profile/hunter.baliatico/viz/PsychiatricFacilityReadmissionAnalysis/PsychiatricFacilityReadmissionAnalysis

---

## Data Structure & Initial Checks
The primary dataset for this analysis is a flat table exported from CMS hospital reporting systems, containing:
- **Facility Information:** ID, Name, State, ZIP Code  
- **Performance Metrics:** Readmission rate, Medication continuation %, Screening percentages for SMD, SUB, and TOB-3  
- **Timeframe:** Reporting periods covering recent performance windows  

---

## Executive Summary
**Overview of Findings**  
Nationwide psychiatric facility readmission rates average **19.5%**, with **6.2% of facilities performing worse than the national benchmark**.  
The majority of facilities cluster between **15–25%**, suggesting a concentrated improvement opportunity.  
Medication continuation averages **79.6%**, though the lowest-performing facilities often lag in this metric.  
Ownership type and geography both strongly correlate with outcomes, and top-performing facilities demonstrate that **sub-14% readmission rates are achievable**.

---

## Insights Deep Dive

### **Category 1: Facility Readmission Overview**
- **Clustering within a narrow range offers a clear improvement target.** 93% of facilities fall between 15%–25% readmission, with 698 facilities in the 15–20% range and 446 in the 20–25% range. Shifting mid-tier performers down could materially lower the national average.
- **Low and high extremes are rare but critical.** Only 36 facilities report <15% readmission, while 44 exceed 25%, representing both model examples and urgent intervention candidates.
- **Medication continuation rates are strong but uneven.** Averaging 79.6%, most facilities perform well, but those below the benchmark often struggle in this area — reinforcing the link between follow-up care and reduced readmissions.

<img width="1100" height="771" alt="Dashboard1" src="https://github.com/user-attachments/assets/6b1f122f-692a-4dea-ab3f-411b52a5c6af" />

---

### **Category 2: Top & Bottom Performing Facilities**
- **Best practices deliver sub-14% rates.** Saint John Hospital and Erie County Medical Center tie at 13.3%, demonstrating the feasibility of low readmissions with robust discharge planning and patient engagement.
- **The gap between top and bottom is stark.** The highest 10 facilities all exceed 27%, with Community Hospital of San Bernardino reaching 31.6%. This represents an **18 percentage point spread**, underscoring systemic care quality disparities.
- **Performance polarity highlights intervention needs.** While low performers likely require systemic change, high performers can serve as case studies for scalable quality improvements.

<img width="1174" height="812" alt="Dashboard2" src="https://github.com/user-attachments/assets/81611b49-4a1a-4eba-9ed6-59421437aba9" />

---

### **Category 3: Intervention Metrics & Readmission Distribution**
- **Screening compliance is high but inconsistent.** Over 80% of facilities screen for SMD and over 50% provide TOB-3 counseling, but a notable minority report 0%, suggesting either implementation failure or data reporting gaps.
- **Right-skewed readmission distribution shows concentrated mid-tier and long tail of high-risk sites.** Half of all facilities fall between 15–20%, but the distribution extends above 31%, with the top 10% exerting outsized influence on national averages.
- **Metric variability suggests targeted metric-specific interventions.** Facilities scoring zero in any intervention metric present a low-effort opportunity for immediate improvement.

<img width="949" height="790" alt="Dashboard3" src="https://github.com/user-attachments/assets/d48dd05f-8db1-4417-92c4-c75d43ad706f" />

---

### **Category 4: Ownership & Regional Benchmarks**
- **Ownership type impacts outcomes.** Physician-owned facilities average 21.5% readmissions and just 58% screening compliance, while non-profit hospitals outperform across metrics.
- **Geographic spread points to systemic disparities.** State averages range from ≈17% in top performers to over 22% in high-risk states.  
- **Policy and infrastructure influence is evident.** New York averages 18.7%, while larger states like Texas and California hover near 19.5%, hinting at differences in healthcare funding, accessibility, and community resources.

<img width="1382" height="821" alt="Dashboard4" src="https://github.com/user-attachments/assets/015e9f8f-eb74-4761-a2da-2918e7b1b031" />

---

## Recommendations
Based on the analysis of psychiatric facility performance across all four dashboard areas, we recommend the following targeted actions:

1. **Target mid-tier facilities (15–25% readmission) with structured improvement initiatives.**  
   These facilities make up over 90% of the dataset and represent the largest opportunity for measurable national impact. Even a 2–3 percentage point reduction in this group could reduce the national average by ~1.5–2 points. Strategies should include enhanced discharge planning, increased follow-up scheduling within 7 days, and real-time monitoring of post-discharge patient status.

2. **Leverage top-performing facilities (<14% readmission) as operational benchmarks.**  
   Facilities such as Saint John Hospital (13.3%) consistently outperform national averages. Conduct structured case studies and site visits to document their discharge workflows, patient education programs, and care coordination processes, then create a standardized “best practice playbook” for national distribution.

3. **Prioritize facilities with 0% reporting in key intervention metrics (SMD, SUB, TOB-3).**  
   A non-trivial number of facilities reported no screening or counseling activity for critical measures. Whether due to process gaps or reporting issues, these sites represent an opportunity for immediate improvement. A mandatory compliance check combined with rapid onboarding to standardized screening protocols could bring these facilities in line within a single reporting cycle.

4. **Address ownership-related performance disparities through oversight and incentives.**  
   Physician-owned hospitals average 21.5% readmissions and the lowest screening compliance (≈58%). Regulatory bodies should consider targeted audits and incentive programs to encourage adherence to intervention protocols. In addition, non-profits can be recognized for their higher performance and encouraged to mentor lower-performing peers.

5. **Establish regional quality collaboratives to reduce geographic performance gaps.**  
   State-level disparities ranging from 17% in the best-performing states to 22%+ in others suggest uneven resource allocation, policy environments, and care delivery structures. Regional collaboratives should share staffing models, community resource partnerships, and integration strategies that have proven successful in lower-rate states.

---

## Assumptions and Caveats
- Some facilities may underreport metrics (e.g., 0% screening rates) due to data submission errors rather than true absence of service.
- Data is aggregated at the facility level and may mask patient-level variations.
- Geographic averages may be influenced by outlier facilities in each state.
- “Worse than National Rate” classification is based solely on CMS thresholds and may not capture all dimensions of performance quality.

---

