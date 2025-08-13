SELECT
  `READM-30-IPF Category` AS category,
  COUNT(*)                AS facility_count,
  ROUND(100 * COUNT(*) 
    / (SELECT COUNT(*) FROM `risk.inpatientPsy`),1
  )                       AS pct
FROM `risk.inpatientPsy`
GROUP BY category
ORDER BY facility_count DESC;