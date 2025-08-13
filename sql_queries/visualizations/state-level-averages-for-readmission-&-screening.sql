SELECT
  g.state,
  ROUND(AVG(c.readm_rate),1) AS avg_readm,
  ROUND(AVG(c.smd_pct),1)    AS avg_smd,
  COUNT(*)                   AS facility_count
FROM `risk.cleaned_inpatientPsy` AS c
JOIN `risk.hospitalGen`    AS g
  ON CAST(c.facilityId AS STRING) = g.facilityId
GROUP BY g.state
ORDER BY facility_count DESC
