## 3. Data Gathering

### Step 1 — Load CSVs into SQL Environment
The datasets `inpatientPsy` and `hospitalGen` were loaded into **BigQuery Sandbox** for inspection and cleaning.

---

#### Row Counts
**Purpose:** Quick sanity check to confirm expected record volumes after ingest.

-- Count rows in the inpatient psychiatric table
SELECT 'psy' AS table_name, COUNT(*) AS row_count
FROM `risk.inpatientPsy`;

-- Count rows in the general hospital table
SELECT 'hospitalGen' AS table_name, COUNT(*) AS row_count
FROM `risk.hospitalGen`;
Documentation notes:

COUNT(*) returns total rows, including ones with nulls in any column.

Returning a label ('psy' AS table_name) helps when you UNION multiple counts together for a quick side-by-side.

Null Checks on Keys
Purpose: Ensure the primary join key (facilityId) is present in all rows.

-- Any missing facility IDs in psych table?
SELECT COUNT(*) AS psy_null_facilityId
FROM `risk.inpatientPsy`
WHERE facilityId IS NULL;

-- Any missing facility IDs in hospitalGen?
SELECT COUNT(*) AS gen_null_facilityId
FROM `risk.hospitalGen`
WHERE facilityId IS NULL;
Documentation notes:

WHERE facilityId IS NULL filters only problematic rows.

If any count > 0, fix before joins—missing keys will drop rows during JOINs and skew results.

Distinct Facility IDs
Purpose: Detect accidental duplicates on the key.

-- Distinct facilities in psych table
SELECT COUNT(DISTINCT facilityId) AS psy_distinct_facilities
FROM `risk.inpatientPsy`;

-- Distinct facilities in hospitalGen
SELECT COUNT(DISTINCT facilityId) AS gen_distinct_facilities
FROM `risk.hospitalGen`;
Documentation notes:

Compare COUNT(DISTINCT facilityId) to the total row count.

If distinct < total, investigate whether the duplicates are valid (e.g., multiple measure periods) or need de-duplication.

Value Ranges for % Measures
Purpose: Profile numeric range and detect non-numeric placeholders like "Not Available".

SELECT
  -- Screening & intervention measures (stored as strings in the raw file)
  MIN(`SMD %`)       AS min_smd_pct,
  MAX(`SMD %`)       AS max_smd_pct,
  MIN(`SUB-2 %`)     AS min_sub2_pct,
  MAX(`SUB-2 %`)     AS max_sub2_pct,
  MIN(`SUB-3 %`)     AS min_sub3_pct,
  MAX(`SUB-3 %`)     AS max_sub3_pct,
  MIN(`TOB-3 %`)     AS min_tob3_pct,
  MAX(`TOB-3 %`)     AS max_tob3_pct,
  MIN(`MedCont %`)   AS min_medcont_pct,
  MAX(`MedCont %`)   AS max_medcont_pct,
  MIN(`IMM-2 %`)     AS min_imm2_pct,
  MAX(`IMM-2 %`)     AS max_imm2_pct,

  -- Outcome measure (readmission rate)
  MIN(`READM-30-IPF Rate`) AS min_readm_rate,
  MAX(`READM-30-IPF Rate`) AS max_readm_rate
FROM `risk.inpatientPsy`;
Documentation notes:

Using MIN/MAX on string columns will still return values, but lexicographically (e.g., "Not Available" beats numbers alphabetically).

If you see "Not Available" in the result, plan to NULLIF(column, 'Not Available') and then CAST(... AS FLOAT64) in a later cleaning step.

After casting, re-run this range query to confirm numeric min/max.

Date Consistency Checks
Purpose: Validate coverage windows across measures to inform time alignment decisions.

SELECT
  -- Generic measure window
  MIN(`Start Date`)               AS min_generic_start,
  MAX(`End Date`)                 AS max_generic_end,

  -- Readmission window (often multi-year)
  MIN(`READM-30-IPF Start Date`)  AS min_readm_start,
  MAX(`READM-30-IPF End Date`)    AS max_readm_end,

  -- Seasonal measure window (flu season)
  MIN(`Flu Season Start Date`)    AS min_flu_start,
  MAX(`Flu Season End Date`)      AS max_flu_end
FROM `risk.inpatientPsy`;
Documentation notes:

If these are stored as strings, convert to DATE first: SAFE.PARSE_DATE('%Y-%m-%d', col) or use DATE(col) if already YYYY-MM-DD.

Different windows imply you should either:

filter to a common period (e.g., 2023 only), or

segment the analysis by measure period (showing separate trends).

Step 2 — Data Documentation Notes (for your project notebook)
Observations & Actions:

Row counts: inpatientPsy ≈ 1,451 and hospitalGen ≈ 5,381; both have unique facilityId.

Keys: 0 nulls in facilityId in both tables.

Percent measures: Many cells contain "Not Available" → Action: NULLIF(...,'Not Available') and CAST(... AS FLOAT64) before aggregations.

Dates: Generic measures mostly cover 2023; readmission spans 2021-07 to 2023-06; flu season extends into 2024-03 → Action: align or segment by period.

Why this matters (documentation notes):

Cleaning placeholders and casting ensures averages/percentiles aren’t silently treated as strings.

Validating date windows early prevents mixing incomparable periods in one KPI.

Confirming uniqueness of keys avoids accidental double counting in joins.
