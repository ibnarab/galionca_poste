INSERT INTO ${database_safe}.${table_safe_echeance_empile}
SELECT
    CASE WHEN TRIM(invoice_id)       = '' THEN NULL ELSE TRIM(invoice_id)      END AS invoice_id                                                                   ,
    CAST(due_date_number AS INT)                                                                                                                                   ,
    CASE WHEN TRIM(due_date)         = '' THEN NULL ELSE CONCAT(substr(due_date, 7, 4), "-", substr(due_date, 4, 2), "-", substr(due_date, 1, 2)) END AS due_date  ,
    CAST(replace(due_amount,",",".") AS DEC(18,5))                                                                                                                 ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_ec}
;
