-- TRUNCATE TABLE fait dans le lanceur safe actualise de echeance

INSERT INTO ${database_safe}.${table_safe_echeance_actualise}
SELECT DISTINCT
    invoice_id                              ,
    due_date_number                         ,
    due_date                                ,
    due_amount                              ,
    date_import

FROM (
    SELECT *, MAX(date_import) OVER (PARTITION BY (invoice_id, due_date_number)) as max_dateimport
    FROM ${database_safe}.${table_safe_echeance_empile}
     ) a
WHERE a.date_import = a.max_dateimport
;
