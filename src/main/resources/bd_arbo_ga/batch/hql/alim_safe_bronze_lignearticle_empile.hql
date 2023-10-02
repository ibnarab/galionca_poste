INSERT INTO ${database_safe}.${table_safe_lignearticle_empile}
SELECT
    CASE WHEN TRIM(invoice_id)                    = '' THEN NULL ELSE TRIM(invoice_id)                    END AS invoice_id                                                                     ,
    CASE WHEN TRIM(invoice_detail_line_number)    = '' THEN NULL ELSE TRIM(invoice_detail_line_number)    END AS invoice_detail_line_number                                                     ,
    CASE WHEN TRIM(article_code)                  = '' THEN NULL ELSE TRIM(article_code)                  END AS article_code                                                                   ,
    CASE WHEN TRIM(attached_invoice_id)           = '' THEN NULL ELSE TRIM(attached_invoice_id)           END AS attached_invoice_id                                                            ,
    CASE WHEN TRIM(attached_invoice_line_number)  = '' THEN NULL ELSE TRIM(attached_invoice_line_number)  END AS attached_invoice_line_number                                                   ,
    CASE WHEN TRIM(article_label)                 = '' THEN NULL ELSE TRIM(article_label)                 END AS article_label                                                                  ,
    CAST(invoice_line_quantity AS INT)                                                                                                                                                          ,
    CAST(replace(unit_price_ht,",",".")   AS DEC(18,5))                                                                                                                                         ,
    CAST(replace(article_line_amount_ht,",",".")   AS DEC(18,5))                                                                                                                                ,
    CASE WHEN TRIM(tax_code)                      = '' THEN NULL ELSE TRIM(tax_code)                      END AS tax_code                                                                       ,
    CASE WHEN TRIM(franking_mode_code)            = '' THEN NULL ELSE TRIM(franking_mode_code)            END AS franking_mode_code                                                             ,
    CAST(replace(invoice_line_tax_rate,",",".")   AS DEC(18,5))                                                                                                                                 ,
    CASE WHEN TRIM(billing_order_number)          = '' THEN NULL ELSE TRIM(billing_order_number)          END AS billing_order_number                                                           ,
    CASE WHEN TRIM(billing_order_origin_code)     = '' THEN NULL ELSE TRIM(billing_order_origin_code)     END AS billing_order_origin_code                                                      ,
    CASE WHEN TRIM(downgrading_reason_code)       = '' THEN NULL ELSE TRIM(downgrading_reason_code)       END AS downgrading_reason_code                                                        ,
    CASE WHEN TRIM(downgrading_reason_label)      = '' THEN NULL ELSE TRIM(downgrading_reason_label)      END AS downgrading_reason_label                                                       ,
    CASE WHEN TRIM(sender_customer_code)          = '' THEN NULL ELSE TRIM(sender_customer_code)          END AS sender_customer_code                                                           ,
    CASE WHEN TRIM(deposit_date)                  = '' THEN NULL ELSE CONCAT(substr(deposit_date, 7, 4), "-", substr(deposit_date, 4, 2), "-", substr(deposit_date, 1, 2)) END AS deposit_date  ,
    CASE WHEN TRIM(deposit_establishment_code)    = '' THEN NULL ELSE TRIM(deposit_establishment_code)    END AS deposit_establishment_code                                                     ,
    CASE WHEN TRIM(semaphore_note_id)             = '' THEN NULL ELSE TRIM(semaphore_note_id)             END AS semaphore_note_id                                                              ,
    CASE WHEN TRIM(semaphore_customer_note_id)    = '' THEN NULL ELSE TRIM(semaphore_customer_note_id)    END AS semaphore_customer_note_id                                                     ,
    CAST(replace(tax_amount,",",".")   AS DEC(18,5))                                                                                                                                            ,
    CASE WHEN TRIM(destination_zone_code)         = '' THEN NULL ELSE TRIM(destination_zone_code)         END AS destination_zone_code                                                          ,
    CASE WHEN TRIM(tax_rule_code)                 = '' THEN NULL ELSE TRIM(tax_rule_code)                 END AS tax_rule_code                                                                  ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_li}
;
