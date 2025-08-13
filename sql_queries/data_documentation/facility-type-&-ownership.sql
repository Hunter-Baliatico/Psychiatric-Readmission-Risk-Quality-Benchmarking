SELECT
  g.hospitalType    AS type,
  g.hospitalOwner   AS ownership,
  COUNT(*)          AS n_facilities
FROM `risk.hospitalGen` AS g
JOIN `risk.inpatientPsy` AS p
  ON CAST(p.facilityId AS STRING) = g.facilityId
GROUP BY type, ownership
ORDER BY n_facilities DESC;