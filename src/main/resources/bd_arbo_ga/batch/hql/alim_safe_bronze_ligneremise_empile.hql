INSERT INTO ${database_safe}.${table_safe_ligneremise_empile}
SELECT
    CASE WHEN TRIM(invoice_id)                    = '' THEN NULL ELSE TRIM(invoice_id)                    END AS invoice_id                    ,
    CASE WHEN TRIM(invoice_discount_line_number)  = '' THEN NULL ELSE TRIM(invoice_discount_line_number)  END AS invoice_discount_line_number  ,
    CASE WHEN TRIM(discount_code)                 = '' THEN NULL ELSE TRIM(discount_code)                 END AS discount_code                 ,
    CASE WHEN TRIM(attached_invoice_id)           = '' THEN NULL ELSE TRIM(attached_invoice_id)           END AS attached_invoice_id           ,
    CASE WHEN TRIM(attached_invoice_line_number)  = '' THEN NULL ELSE TRIM(attached_invoice_line_number)  END AS attached_invoice_line_number  ,
    CAST(replace(discount_base,",",".")   AS DEC(18,5))                                                                                        ,
    CAST(replace(discount_line_percentage,",",".")   AS DEC(18,5))                                                                             ,
    CAST(replace(discount_line_fixed_amount,",",".")   AS DEC(18,5))                                                                           ,
    CAST(replace(discount_line_unit_amount,",",".")   AS DEC(18,5))                                                                            ,
    CAST(replace(discount_line_amount_ht,",",".")   AS DEC(18,5))                                                                              ,
    CASE WHEN TRIM(discount_line_tax_code)        = '' THEN NULL ELSE TRIM(discount_line_tax_code)        END AS discount_line_tax_code        ,
    CAST(replace(discount_line_tax_rate,",",".") AS DEC(18,5))                                                                                 ,
    CASE WHEN TRIM(billing_order_number)          = '' THEN NULL ELSE TRIM(billing_order_number)          END AS billing_order_number          ,
    CASE WHEN TRIM(billing_order_origin_code)     = '' THEN NULL ELSE TRIM(billing_order_origin_code)     END AS billing_order_origin_code     ,
    CASE WHEN TRIM(discount_type_code)            = '' THEN NULL ELSE TRIM(discount_type_code)            END AS discount_type_code            ,
    CAST(replace(tax_amount,",",".")   AS DEC(18,5))                                                                                           ,
    CASE WHEN TRIM(destination_zone_code)         = '' THEN NULL ELSE TRIM(destination_zone_code)         END AS destination_zone_code         ,
    CASE WHEN TRIM(tax_rule_code)                 = '' THEN NULL ELSE TRIM(tax_rule_code)                 END AS tax_rule_code                 ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_lr}
;
