CREATE OR REPLACE TABLE `risk.master_facility_metrics` AS
SELECT
  f.facilityId,
  f.facilityName,
  f.state,
  f.smd_pct,
  f.sub2_pct,
  f.sub3_pct,
  f.tob3_pct,
  f.imm2_pct,
  f.readm_rate,
  f.high_readm_flag,
  g.hospitalType,
  g.hospitalOwner
FROM `risk.facilities_with_flags` AS f
LEFT JOIN `risk.hospitalGen` AS g
  ON CAST(f.facilityId AS STRING) = g.facilityId;