## 1. Data Gathering

#### Row Counts
**Purpose:** Quick sanity check to confirm expected record volumes after ingest.
```sql
-- Count rows in the inpatient psychiatric table
SELECT 'psy' AS table_name, COUNT(*) AS row_count
FROM `risk.inpatientPsy`;

-- Count rows in the general hospital table
SELECT 'hospitalGen' AS table_name, COUNT(*) AS row_count
FROM `risk.hospitalGen`;
```

#### Null Checks on Keys
**Purpose:** Ensure the primary join key (`facilityId`) is present in all rows.
```sql
-- Looking for facility IDs in psych table
SELECT COUNT(*) AS psy_null_facilityId
FROM `riskmanagement-466908.risk.inpatientPsy`
WHERE facilityId IS NULL;
```

```sql
SELECT COUNT(*) AS gen_null_facilityId
FROM `riskmanagement-466908.risk.hospitalGen`
WHERE facilityId IS NULL;
```

#### Distinct Facility IDs
**Purpose:** Detect accidental duplicates on the key.
```sql
-- Distinct facilities in psych table
SELECT COUNT(DISTINCT facilityId) AS psy_distinct_facilities
FROM `riskmanagement-466908.risk.inpatientPsy`;

-- Distinct facilities in hospitalGen
SELECT COUNT(DISTINCT facilityId) AS gen_distinct_facilities
FROM `riskmanagement-466908.risk.hospitalGen`;
```

#### Value Ranges for % Measures
**Purpose:** Profile numeric range and detect non-numeric placeholders like `"Not Available"`.
```sql
SELECT
  MIN(`SMD %`)   AS min_smd_pct,
  MAX(`SMD %`)   AS max_smd_pct,
  MIN(`SUB-2 %`) AS min_sub2_pct,
  MAX(`SUB-2 %`) AS max_sub2_pct,
  MIN(`SUB-3 %`) AS min_sub3_pct,
  MAX(`SUB-3 %`) AS max_sub3_pct,
  MIN(`TOB-3 %`) AS min_tob3_pct,
  MAX(`TOB-3 %`) AS max_tob3_pct,
  MIN(`MedCont %`) AS min_medcont_pct,
  MAX(`MedCont %`) AS max_medcont_pct,
  MIN(`IMM-2 %`) AS min_imm2_pct,
  MAX(`IMM-2 %`) AS max_imm2_pct,
  MIN(`READM-30-IPF Rate`) AS min_readm_rate,
  MAX(`READM-30-IPF Rate`) AS max_readm_rate
FROM `riskmanagement-466908.risk.inpatientPsy`;
```

#### Date Consistency Checks
**Purpose:** Validate coverage windows across measures to inform time alignment decisions.
```sql
SELECT
  MIN(`Start Date`)           AS min_generic_start,
  MAX(`End Date`)             AS max_generic_end,
  MIN(`READM-30-IPF Start Date`) AS min_readm_start,
  MAX(`READM-30-IPF End Date`)   AS max_readm_end,
  MIN(`Flu Season Start Date`)   AS min_flu_start,
  MAX(`Flu Season End Date`)     AS max_flu_end
FROM `riskmanagement-466908.risk.inpatientPsy`;
```


