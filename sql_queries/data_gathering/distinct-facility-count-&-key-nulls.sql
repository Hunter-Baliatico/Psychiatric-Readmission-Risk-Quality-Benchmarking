SELECT
  COUNT(DISTINCT facilityId)          AS distinct_facilities,
  COUNT(*) - COUNT(facilityName)      AS null_facilityName,
  COUNT(*) - COUNT(state)             AS null_state,
  COUNT(*) - COUNT(measure_start)     AS null_measure_start,
  COUNT(*) - COUNT(readm_rate)        AS null_readm_rate
FROM `risk.inpatientPsy`;