SELECT
  state,
  COUNT(*) AS n_facilities
FROM `risk.inpatientPsy`
GROUP BY state
ORDER BY n_facilities DESC;