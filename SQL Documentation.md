# Psychiatric Readmission Analysis — Data Documentation

---

## 1. Data Gathering

### InpatientPsy Row Count
Confirming expected record volumes after loading data. 
[View SQL](sql_queries/data_gathering/inpatientpsy-row-count.sql)

### HospitalGen Row Count
[View SQL](sql_queries/data_gathering/hospitalgen-row-count.sql)

### Null / Distinct Checks on Keys
Ensure the primary join key (`facilityId`) exists and is unique.  
[View SQL](sql_queries/data_gathering/distinct-facility-count-%26-key-nulls.sql)

### Value Ranges for % Measures
Identify numeric ranges and detect non-numeric placeholders like `"Not Available"`.  
[View SQL](sql_queries/data_gathering/value-ranges-for-%25-measures.sql)

### Date Consistency Checks
Validate coverage windows across measures to inform time alignment decisions.  
[View SQL](sql_queries/data_gathering/date-consistency-checks.sql)

---

## 2. Data Documentation Notes

### Observations
- **Row counts**  
  - Inpatient Psy: 1,451 rows & 1,451 distinct facilityIds → no duplicate facility entries.  
  - Hospital Gen: 5,381 rows & 5,381 distinct facilityIds → likewise, no duplicates.
- **Keys**: 0 nulls in `facilityId` in both tables.
- **Percent measures**: `"Not Available"` appears in many % columns where data are missing.
- **Date windows**  
  - Generic measures (SUB, SMD, TOB, MedCont, IMM) span calendar 2023.  
  - Readmission outcome covers 2021-07 to 2023-06.  
  - Flu-season window extends into 2024-03.
- **Data completeness**  
  - MedCont % missing in 51.1% of facilities → exclude from cross-facility comparisons, keep for subset analysis.  
  - SUB-2/3 % and TOB-3 % missing ~24–27%.  
  - Readm_rate missing in 15.6% of facilities.

- **Overall metric ranges & averages**  
  - Most compliance metrics average ~70–80%.  
  - Readmission averages ~19.5% (min ~13%, max 31.6%).
- **Distribution insights (deciles)**  
  - Compliance: 10th pct 49–74%, median 81–94%.  
  - Readmission: 10th 13.3%, median 18.7%, 90th 22.9% → long right tail.
- **Readmission category breakdown**  
  - 75.2% “No Different Than National Rate”, 8.2% “Not Available”, 7.4% “Cases Too Small”, 6.2% “Worse”.
- **Ownership mix**  
  - Dominant segments: Nonprofit acute (394), Proprietary psychiatric (327), Proprietary acute (155), State-run psychiatric (145).
- **Geographic coverage**  
  - Highest facility counts: NY (93), CA (92), TX (92), LA (73).
- **Outliers**  
  - Best (~13.3%): KS, NY, MS, OK, CA.  
  - Worst (30–31.6%): CA, FL, IL.
- **Correlations**  
  - MedCont % shows the strongest inverse correlation with readmission (r ≈ –0.26).  
  - Other quality measures near zero.

### Actions
- Recode `"Not Available"` → `NULL` and cast affected columns to `FLOAT`.
- Align analysis to a common date range or segment by period.
- Focus primary comparisons on high-coverage metrics (SMD %, IMM-2 %).
- Define “high readmission” as > 90th percentile (~22.9%).
- Consider MedCont % for deeper causal analysis despite missingness.

---

## 3. Cleaning Data

Purpose: standardize data types, remove placeholders, and create analysis-ready tables/views.

- **Subset MedCont-Cleaned View**  
  Filters to facilities with valid medication continuation data.  
  [View SQL](sql_queries/cleaning_data/subset-medcont-cleaned-view.sql)

- **Filter to Valid Readmission Records**  
  Keeps only facilities with a valid readmission rate.  
  [View SQL](sql_queries/cleaning_data/filter-valid-readmission-records.sql)

- **High-Readmission Flag (> 90th percentile)**  
  Identifies facilities with notably high readmission rates.  
  [View SQL](sql_queries/cleaning_data/add-high-readmission-flag.sql)

- **Assemble Master Facility Metrics**  
  Joins cleaned quality data with hospital data.  
  [View SQL](sql_queries/cleaning_data/create-clean-master-table.sql)

---

## 4. Shaping Data

Purpose: create a dimensional model to support analysis and visualization.

- **Dim Facility**  
  Unique list of facilities with static attributes.  
  [View SQL](sql_queries/shaping_data/create-dimension-tables%20(1).sql)

- **Bridge Readmission Category**  
  Links CMS readmission category labels to facilities.  
  [View SQL](sql_queries/shaping_data/bridge-table-for-readmission-category.sql)

---

## 5. Data Documentation / Profiling Queries

- **Cleaned Summary Stats for Key Metrics**  
  Min/Avg/Max for all major quality metrics (after cleaning).  
  [View SQL](sql_queries/data_documentation/cleaned-summary-stats-for-key-metrics.sql)

- **Readmission Category Breakdown**  
  Share of facilities across CMS category buckets.  
  [View SQL](sql_queries/data_documentation/readmission-category-breakdown.sql)

- **Facility Type & Ownership Mix**  
  Filters by hospital type/ownership.  
  [View SQL](sql_queries/data_documentation/facility-type-%26-ownership.sql)

- **Geographic Distribution (Counts by State)**  
  Facility counts by state for coverage identification.  
  [View SQL](sql_queries/data_documentation/geographic-distribution.sql)

**Relevant insights for this section**
- Most compliance metrics average ~70–80%; readmission ~19.5% with a right-skew.
- 75.2% are “No Different Than National Rate”; only 6.2% “Worse”.
- Ownership and geography show meaningful variation in outcomes.

---

## 6. Queries Used for Visualizations

Purpose: create Tableau dashboards with targeted result sets for ranked lists, deciles, ownership, and state views.

- **Top 10 Lowest Readmission Rates**  
  Facilities with the best performance.  
  [View SQL](sql_queries/visualizations/top-10-lowest-readmission-rate-facilities (1).sql)

- **Top 10 Highest Readmission Rates**  
  Facilities with the worst performance.  
  [View SQL](sql_queries/visualizations/top-10-highest-readmission-rate-facilities.sql)

- **Decile Cut-Points for Key Metrics**  
  Percentile thresholds used for distribution and tiering visuals.  
  [View SQL](sql_queries/visualizations/decile-cut-points-for-key-metrics.sql)

- **Ownership Benchmark Analysis**  
  Average readmission rate grouped by ownership type.  
  [View SQL](sql_queries/visualizations/compare-readmission-by-ownership-type.sql)

- **State-Level Averages for Readmission & Screening**  
  Choropleth inputs for state comparisons.  
  [View SQL](sql_queries/visualizations/state-level-averages-for-readmission-%26-screening.sql)

**Relevant insights for this section**
- **Extremes:** top performers under ~14%; worst facilities reach 31.6%.  
- **Distribution:** median readmission ~18.7%, 90th percentile ~22.9%.  
- **Ownership:** physician-owned show highest readmission (21.5%) and lowest screening (57.8%).  
- **Geography:** NY performs best; CA/TX slightly worse.

---
