-- TRUNCATE TABLE fait dans le lanceur safe actualise de critère ligne article

INSERT INTO ${database_safe}.${table_safe_criterelignearticle_actualise}
SELECT DISTINCT
    invoice_id                          ,
    invoice_detail_line_number          ,
    criteria_code                       ,
    criteria_value                      ,
    date_import

FROM (
    SELECT *, MAX(date_import) OVER (PARTITION BY (invoice_id, invoice_detail_line_number)) as max_dateimport
    FROM ${database_safe}.${table_safe_criterelignearticle_empile}
     ) a
WHERE a.date_import = a.max_dateimport
;
