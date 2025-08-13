SELECT
  APPROX_QUANTILES(smd_pct,10)    AS smd_deciles,
  APPROX_QUANTILES(sub2_pct,10)   AS sub2_deciles,
  APPROX_QUANTILES(sub3_pct,10)   AS sub3_deciles,
  APPROX_QUANTILES(tob3_pct,10)   AS tob3_deciles,
  APPROX_QUANTILES(medcont_pct,10)AS medcont_deciles,
  APPROX_QUANTILES(imm2_pct,10)   AS imm2_deciles,
  APPROX_QUANTILES(readm_rate,10) AS readm_deciles
FROM `risk.cleaned_inpatientPsy`;