-- dim facility

CREATE OR REPLACE TABLE `risk.dim_facility` AS
SELECT
  facilityId,
  facilityName,
  state,
  hospitalType,
  hospitalOwner
FROM `risk.master_facility_metrics`
GROUP BY facilityId, facilityName, state, hospitalType, hospitalOwner;

-- dim metric period

CREATE OR REPLACE TABLE `risk.dim_metric_period` AS
SELECT DISTINCT
  'Generic'                    AS measure_type,
  measure_start                AS period_start,
  measure_end                  AS period_end
FROM `risk.cleaned_inpatientPsy`
UNION DISTINCT
SELECT
  'Readmission'                AS measure_type,
  readm_start                  AS period_start,
  readm_end                    AS period_end
FROM `risk.cleaned_inpatientPsy`;