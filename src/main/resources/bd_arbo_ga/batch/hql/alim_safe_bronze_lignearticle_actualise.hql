-- TRUNCATE TABLE fait dans le lanceur safe actualise de ligne article

INSERT INTO ${database_safe}.${table_safe_lignearticle_actualise}
SELECT DISTINCT
    invoice_id                              ,
    invoice_detail_line_number              ,
    article_code                            ,
    attached_invoice_id                     ,
    attached_invoice_line_number            ,
    article_label                           ,
    invoice_line_quantity                   ,
    unit_price_ht                           ,
    article_line_amount_ht                  ,
    tax_code                                ,
    franking_mode_code                      ,
    invoice_line_tax_rate                   ,
    billing_order_number                    ,
    billing_order_origin_code               ,
    downgrading_reason_code                 ,
    downgrading_reason_label                ,
    sender_customer_code                    ,
    deposit_date                            ,
    deposit_establishment_code              ,
    semaphore_note_id                       ,
    semaphore_customer_note_id              ,
    tax_amount                              ,
    destination_zone_code                   ,
    tax_rule_code                           ,
    date_import

FROM (
    SELECT *, MAX(date_import) OVER (PARTITION BY (invoice_id, invoice_detail_line_number)) as max_dateimport
    FROM ${database_safe}.${table_safe_lignearticle_empile}
     ) a
WHERE a.date_import = a.max_dateimport
;
