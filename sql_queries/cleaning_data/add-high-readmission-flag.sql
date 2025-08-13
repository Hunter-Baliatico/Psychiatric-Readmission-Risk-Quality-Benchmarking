CREATE OR REPLACE TABLE `risk.facilities_with_flags` AS
SELECT
  v.*,
  CASE 
    WHEN readm_rate > 22.9 THEN TRUE 
    ELSE FALSE 
  END AS high_readm_flag
FROM `risk.valid_readm_facilities` AS v;