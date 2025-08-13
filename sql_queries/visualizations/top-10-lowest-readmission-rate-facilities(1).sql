SELECT
  d.facilityName,
  f.readm_rate
FROM `risk.fact_facility_quality` AS f
JOIN `risk.dim_facility`    AS d
  ON f.facilityId = d.facilityId
ORDER BY f.readm_rate ASC
LIMIT 10;