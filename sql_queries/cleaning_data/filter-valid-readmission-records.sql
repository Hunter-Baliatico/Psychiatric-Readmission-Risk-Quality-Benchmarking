CREATE OR REPLACE TABLE `risk.valid_readm_facilities` AS
SELECT *
FROM `risk.cleaned_inpatientPsy`
WHERE readm_rate IS NOT NULL;