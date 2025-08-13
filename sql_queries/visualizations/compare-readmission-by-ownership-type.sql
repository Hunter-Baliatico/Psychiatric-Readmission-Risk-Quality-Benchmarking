SELECT
  d.hospitalOwner      AS ownership,
  ROUND(AVG(f.readm_rate),1) AS avg_readm,
  COUNT(*)                   AS n_facilities
FROM `risk.fact_facility_quality` AS f
JOIN `risk.dim_facility`   AS d
  ON f.facilityId = d.facilityId
GROUP BY ownership
ORDER BY avg_readm DESC;