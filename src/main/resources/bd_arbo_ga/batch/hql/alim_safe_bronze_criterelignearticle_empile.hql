INSERT INTO ${database_safe}.${table_safe_criterelignearticle_empile}
SELECT
    CASE WHEN TRIM(invoice_id)                  = '' THEN NULL ELSE TRIM(invoice_id)                  END AS invoice_id                  ,
    CASE WHEN TRIM(invoice_detail_line_number)  = '' THEN NULL ELSE TRIM(invoice_detail_line_number)  END AS invoice_detail_line_number  ,
    CASE WHEN TRIM(criteria_code)               = '' THEN NULL ELSE TRIM(criteria_code)               END AS criteria_code               ,
    CASE WHEN TRIM(criteria_value)              = '' THEN NULL ELSE TRIM(criteria_value)              END AS criteria_value              ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_cr}
;
