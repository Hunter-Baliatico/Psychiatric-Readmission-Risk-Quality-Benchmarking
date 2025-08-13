SELECT
  MIN(`Start Date`)           AS min_generic_start,
  MAX(`End Date`)             AS max_generic_end,
  MIN(`READM-30-IPF Start Date`) AS min_readm_start,
  MAX(`READM-30-IPF End Date`)   AS max_readm_end,
  MIN(`Flu Season Start Date`)   AS min_flu_start,
  MAX(`Flu Season End Date`)     AS max_flu_end
FROM `risk.inpatientPsy`;