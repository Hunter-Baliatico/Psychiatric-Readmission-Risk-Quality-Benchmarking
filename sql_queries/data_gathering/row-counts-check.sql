SELECT 
  'inpatientPsy_2023' AS table_name, COUNT(*) AS row_count
FROM `risk.inpatientPsy`
UNION ALL
SELECT 
  'hospitalGen' AS table_name, COUNT(*) AS row_count
FROM `risk.hospitalGen`;

