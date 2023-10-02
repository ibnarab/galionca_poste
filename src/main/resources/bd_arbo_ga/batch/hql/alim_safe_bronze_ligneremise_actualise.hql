-- TRUNCATE TABLE fait dans le lanceur safe actualise de ligneremise

INSERT INTO ${database_safe}.${table_safe_ligneremise_actualise}
SELECT DISTINCT
    invoice_id                                  ,
    invoice_discount_line_number                ,
    discount_code                               ,
    attached_invoice_id                         ,
    attached_invoice_line_number                ,
    discount_base                               ,
    discount_line_percentage                    ,
    discount_line_fixed_amount                  ,
    discount_line_unit_amount                   ,
    discount_line_amount_ht                     ,
    discount_line_tax_code                      ,
    discount_line_tax_rate                      ,
    billing_order_number                        ,
    billing_order_origin_code                   ,
    discount_type_code                          ,
    tax_amount                                  ,
    destination_zone_code                       ,
    tax_rule_code                               ,
    date_import

FROM (
    SELECT *, MAX(date_import) OVER (PARTITION BY (invoice_id, invoice_discount_line_number)) as max_dateimport
    FROM ${database_safe}.${table_safe_ligneremise_empile}
     ) a
WHERE a.date_import = a.max_dateimport
;
