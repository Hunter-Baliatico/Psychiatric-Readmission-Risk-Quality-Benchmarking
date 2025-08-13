SELECT
  MIN(`SMD %`)   AS min_smd_pct,
  MAX(`SMD %`)   AS max_smd_pct,
  MIN(`SUB-2 %`) AS min_sub2_pct,
  MAX(`SUB-2 %`) AS max_sub2_pct,
  MIN(`SUB-3 %`) AS min_sub3_pct,
  MAX(`SUB-3 %`) AS max_sub3_pct,
  MIN(`TOB-3 %`) AS min_tob3_pct,
  MAX(`TOB-3 %`) AS max_tob3_pct,
  MIN(`MedCont %`) AS min_medcont_pct,
  MAX(`MedCont %`) AS max_medcont_pct,
  MIN(`IMM-2 %`) AS min_imm2_pct,
  MAX(`IMM-2 %`) AS max_imm2_pct,
  MIN(`READM-30-IPF Rate`) AS min_readm_rate,
  MAX(`READM-30-IPF Rate`) AS max_readm_rate
FROM `risk.inpatientPsy`;