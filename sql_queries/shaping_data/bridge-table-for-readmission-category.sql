CREATE OR REPLACE TABLE `risk.bridge_readm_category` AS
SELECT
  p.facilityId,
  p.`READM-30-IPF Category` AS category
FROM `risk.inpatientPsy` AS p
WHERE p.`READM-30-IPF Category` IS NOT NULL;