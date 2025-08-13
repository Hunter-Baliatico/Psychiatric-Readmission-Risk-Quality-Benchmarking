# Psychiatric Readmission Analysis — Data Documentation

---

## 1. Data Gathering

### Row Counts
Quick sanity check to confirm expected record volumes after ingest.  
[Inpatient Psy Row Count](../sql_queries/data_gathering/inpatientpsy-row-count.sql)
[Hospital Gen Row Count](../sql_queries/data_gathering/hospitalgen-row-count.sql)
### Null Checks on Keys
Ensure the primary join key (`facilityId`) is present in all rows.  
[View SQL](../sql_queries/null_check_facilityId.sql)

### Distinct Facility IDs
Detect accidental duplicates on the key.  
[View SQL](../sql_queries/distinct_facility_ids.sql)

### Value Ranges for % Measures
Profile numeric ranges and detect non-numeric placeholders like `"Not Available"`.  
[View SQL](../sql_queries/value_ranges_pct_measures.sql)

### Date Consistency Checks
Validate coverage windows across measures to inform time alignment decisions.  
[View SQL](../sql_queries/date_consistency_checks.sql)

---

### Insights
- **Row counts**:
  - Inpatient Psy: 1,451 rows & 1,451 distinct facilityIds → no duplicates.  
  - Hospital Gen: 5,381 rows & 5,381 distinct facilityIds → no duplicates.
- **Keys**: 0 nulls in `facilityId` in both datasets.
- **Percent measures**: `"Not Available"` appears in many % columns where data are missing.
- **Date coverage**:
  - Generic measures: 2023.
  - Readmission: mid-2021 → mid-2023.
  - Flu-season: extends into early 2024.
- **Data completeness**:
  - MedCont % missing in 51.1% of facilities → exclude from cross-facility comparisons.
  - SUB-2/3 % & TOB-3 % missing ~24–27%.
  - Readm_rate missing in 15.6% of facilities.

---

## 2. Cleaning Data

### Subset MedCont-Cleaned View
Filters to facilities with valid medication continuation data.  
[View SQL](../sql_queries/view_medcont_subset.sql)

### Filter to Valid Readmission Records
Keeps only facilities with a valid readmission rate.  
[View SQL](../sql_queries/table_valid_readm_facilities.sql)

### High-Readmission Flag (>90th percentile)
Identifies facilities with notably high readmission rates.  
[View SQL](../sql_queries/table_facilities_with_flags.sql)

### Assemble Master Facility Metrics
Joins cleaned quality data with hospital metadata.  
[View SQL](../sql_queries/table_master_facility_metrics.sql)

---

### Insights
- Excluding MedCont % from uniform aggregations removes 51.1% missing bias.
- Readmission rate null filtering ensures valid outcome comparisons.
- High-readmission flag at >22.9% isolates top 10% worst performers for targeted analysis.

---

## 3. Shaping Data

### Dim Facility
Unique list of facilities with static attributes.  
[View SQL](../sql_queries/dim_facility.sql)

### Dim Metric Period
Records measure-specific coverage periods.  
[View SQL](../sql_queries/dim_metric_period.sql)

### Fact Facility Quality
Narrow fact table for key quality metrics and flags.  
[View SQL](../sql_queries/fact_facility_quality.sql)

### Bridge Readmission Category
Links CMS readmission category labels to facilities.  
[View SQL](../sql_queries/bridge_readm_category.sql)

---

### Insights
- **Readmission category breakdown**:
  - 75.2% “No Different Than National Rate”.
  - 6.2% “Worse Than National Rate”.
  - 8.2% missing (“Not Available”), 7.4% too small sample.
- **Ownership mix**:
  - Dominant: Nonprofit acute care, proprietary psychiatric, proprietary acute care, state-run psychiatric.
- **State coverage**: NY, CA, TX, LA highest counts.

---

## 4. Queries Used for Visualizations

Purpose: Power Tableau dashboards with targeted result sets for KPIs, ranked lists, and chart inputs.

- **Average 30-Day Readmission Rate**  
  Calculates the mean readmission rate for facilities with valid data.  
  [View SQL](../sql_queries/kpi_avg_readmission.sql)

- **% Facilities “Worse Than National Rate”**  
  Percentage of facilities flagged as worse than the national benchmark.  
  [View SQL](../sql_queries/kpi_pct_worse_than_national.sql)

- **Median MedCont %**  
  Median medication continuation percentage for facilities with valid data.  
  [View SQL](../sql_queries/kpi_median_medcont.sql)

- **Top 10 Lowest Readmission Rates**  
  Returns the facilities with the best performance.  
  [View SQL](../sql_queries/top_10_lowest_readmission.sql)

- **Top 10 Highest Readmission Rates**  
  Returns the facilities with the worst performance.  
  [View SQL](../sql_queries/top_10_highest_readmission.sql)

- **Decile Cut-Points for Key Metrics**  
  Used for percentile-based analysis and threshold setting.  
  [View SQL](../sql_queries/decile_cutpoints_metrics.sql)

- **Ownership Benchmark Analysis**  
  Average readmission rate grouped by ownership type.  
  [View SQL](../sql_queries/ownership_type_analysis.sql)

- **State-Level Readmission Rates**  
  Average readmission rates by state for choropleth mapping.  
  [View SQL](../sql_queries/state_avg_readmission.sql)

---

### Insights
- **Metric distribution**:
  - Most screening metrics 10th percentile ≥49%, medians ≥81%.
  - Readmission median 18.7%, right tail up to 31.6%.
- **Outliers**:
  - Low readmissions: KS, NY, MS, OK, CA.
  - High readmissions: CA, FL, IL.
- **Correlation**:
  - MedCont % shows inverse relationship with readmission (r≈–0.26).
- **State performance**:
  - NY leads in lowest readmissions and highest screening.
- **Ownership patterns**:
  - Physician-owned worst performing (highest readmission, lowest screening).
