CREATE OR REPLACE VIEW `risk.view_medcont_subset` AS
SELECT *
FROM `risk.cleaned_inpatientPsy`
WHERE medcont_pct IS NOT NULL;