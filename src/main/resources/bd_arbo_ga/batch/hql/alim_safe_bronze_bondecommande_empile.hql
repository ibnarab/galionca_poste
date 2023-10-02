INSERT INTO ${database_safe}.${table_safe_bondecommande_empile}
SELECT
    CASE WHEN TRIM(invoice_id)                            =  '' THEN NULL ELSE TRIM(invoice_id)                            END AS invoice_id                             ,
    CASE WHEN TRIM(billing_order_number)                  =  '' THEN NULL ELSE TRIM(billing_order_number)                  END AS billing_order_number                   ,
    CASE WHEN TRIM(corrected_billing_order_number)        =  '' THEN NULL ELSE TRIM(corrected_billing_order_number)        END AS corrected_billing_order_number         ,
    CASE WHEN TRIM(billing_order_origin_code)             =  '' THEN NULL ELSE TRIM(billing_order_origin_code)             END AS billing_order_origin_code              ,
    CASE WHEN TRIM(establishment_code)                    =  '' THEN NULL ELSE TRIM(establishment_code)                    END AS establishment_code                     ,
    CASE WHEN TRIM(agent_code)                            =  '' THEN NULL ELSE TRIM(agent_code)                            END AS agent_code                             ,
    CASE WHEN TRIM(agent_name)                            =  '' THEN NULL ELSE TRIM(agent_name)                            END AS agent_name                             ,
    CASE WHEN TRIM(agent_first_name)                      =  '' THEN NULL ELSE TRIM(agent_first_name)                      END AS agent_first_name                       ,
    CASE WHEN TRIM(accounting_year)                       =  '' THEN NULL ELSE TRIM(accounting_year)                       END AS accounting_year                        ,
    CASE WHEN TRIM(accounting_month)                      =  '' THEN NULL ELSE TRIM(accounting_month)                      END AS accounting_month                       ,
    CASE WHEN TRIM(service_start_date)                    =  '' THEN NULL ELSE CONCAT(substr(service_start_date, 7, 4), "-", substr(service_start_date, 4, 2), "-", substr(service_start_date, 1, 2))    END AS service_start_date ,
    CASE WHEN TRIM(service_end_date)                      =  '' THEN NULL ELSE CONCAT(substr(service_end_date, 7, 4),   "-", substr(service_end_date, 4, 2),   "-", substr(service_end_date, 1, 2))      END AS service_end_date   ,
    CASE WHEN TRIM(deposit_zone_code)                     =  '' THEN NULL ELSE TRIM(deposit_zone_code)                     END AS deposit_zone_code                      ,
    CASE WHEN TRIM(deposit_establishment_code)            =  '' THEN NULL ELSE TRIM(deposit_establishment_code)            END AS deposit_establishment_code             ,
    CASE WHEN TRIM(credit_note_reference_invoice_number)  =  '' THEN NULL ELSE TRIM(credit_note_reference_invoice_number)  END AS credit_note_reference_invoice_number   ,
    CAST(replace(payment_amount,",",".") AS DEC(18,5))                                                                                                                   ,
    CASE WHEN TRIM(payment_date)                          =  '' THEN NULL ELSE CONCAT(substr(payment_date, 7, 4),       "-", substr(payment_date, 4, 2),       "-", substr(payment_date, 1, 2))          END AS payment_date       ,
    CASE WHEN TRIM(payment_number)                        =  '' THEN NULL ELSE TRIM(payment_number)                        END AS payment_number                         ,
    CASE WHEN TRIM(payment_place_establishment_code)      =  '' THEN NULL ELSE TRIM(payment_place_establishment_code)      END AS payment_place_establishment_code       ,
    CASE WHEN TRIM(service_number)                        =  '' THEN NULL ELSE TRIM(service_number)                        END AS service_number                         ,
    CASE WHEN TRIM(specific_header1)                      =  '' THEN NULL ELSE TRIM(specific_header1)                      END AS specific_header1                       ,
    CASE WHEN TRIM(specific_header2)                      =  '' THEN NULL ELSE TRIM(specific_header2)                      END AS specific_header2                       ,
    CASE WHEN TRIM(specific_header3)                      =  '' THEN NULL ELSE TRIM(specific_header3)                      END AS specific_header3                       ,
    CASE WHEN TRIM(specific_header4)                      =  '' THEN NULL ELSE TRIM(specific_header4)                      END AS specific_header4                       ,
    CASE WHEN TRIM(specific_header5)                      =  '' THEN NULL ELSE TRIM(specific_header5)                      END AS specific_header5                       ,
    CAST(replace(billing_order_amount_ht,",",".") AS DEC(18,5))                                                                                                          ,
    CASE WHEN TRIM(billing_order_message)                 =  '' THEN NULL ELSE TRIM(billing_order_message)                 END AS billing_order_message                  ,
    CASE WHEN TRIM(billing_order_type_code)               =  '' THEN NULL ELSE TRIM(billing_order_type_code)               END AS billing_order_type_code                ,
    CASE WHEN TRIM(franking_machine_postal_type_code)     =  '' THEN NULL ELSE TRIM(franking_machine_postal_type_code)     END AS franking_machine_postal_type_code      ,
    CASE WHEN TRIM(franking_machine_serial_number)        =  '' THEN NULL ELSE TRIM(franking_machine_serial_number)        END AS franking_machine_serial_number         ,
    CASE WHEN TRIM(franking_machine_category_code)        =  '' THEN NULL ELSE TRIM(franking_machine_category_code)        END AS franking_machine_category_code         ,
    CASE WHEN TRIM(sales_channel_code)                    =  '' THEN NULL ELSE TRIM(sales_channel_code)                    END AS sales_channel_code                     ,
    CASE WHEN TRIM(sales_channel_label)                   =  '' THEN NULL ELSE TRIM(sales_channel_label)                   END AS sales_channel_label                    ,
    CASE WHEN TRIM(seller_code)                           =  '' THEN NULL ELSE TRIM(seller_code)                           END AS seller_code                            ,
    CASE WHEN TRIM(supply_mode_indicator)                 =  '' THEN NULL ELSE TRIM(supply_mode_indicator)                 END AS supply_mode_indicator                  ,
    CASE WHEN TRIM(eva_norm_indicator)                    =  '' THEN NULL ELSE TRIM(eva_norm_indicator)                    END AS eva_norm_indicator                     ,
    CASE WHEN TRIM(eva_visa_indicator)                    =  '' THEN NULL ELSE TRIM(eva_visa_indicator)                    END AS eva_visa_indicator                     ,
    CASE WHEN TRIM(mail_product_contract_type_code)       =  '' THEN NULL ELSE TRIM(mail_product_contract_type_code)       END AS mail_product_contract_type_code        ,
    CASE WHEN TRIM(mail_product_contract_id)              =  '' THEN NULL ELSE TRIM(mail_product_contract_id)              END AS mail_product_contract_id               ,
    CASE WHEN TRIM(mail_product_contract_number)          =  '' THEN NULL ELSE TRIM(mail_product_contract_number)          END AS mail_product_contract_number           ,
    CASE WHEN TRIM(overlay_color)                         =  '' THEN NULL ELSE TRIM(overlay_color)                         END AS overlay_color                          ,
    CASE WHEN TRIM(cap_type_code)                         =  '' THEN NULL ELSE TRIM(cap_type_code)                         END AS cap_type_code                          ,
    CASE WHEN TRIM(cap_id)                                =  '' THEN NULL ELSE TRIM(cap_id)                                END AS cap_id                                 ,
    CASE WHEN TRIM(cap_number)                            =  '' THEN NULL ELSE TRIM(cap_number)                            END AS cap_number                             ,
    CASE WHEN TRIM(intermediate_customer_id)              =  '' THEN NULL ELSE TRIM(intermediate_customer_id)              END AS intermediate_customer_id               ,
    CASE WHEN TRIM(deadline_commitment_indicator)         =  '' THEN NULL ELSE TRIM(deadline_commitment_indicator)         END AS deadline_commitment_indicator          ,
    CASE WHEN TRIM(meridien_contract_id)                  =  '' THEN NULL ELSE TRIM(meridien_contract_id)                  END AS meridien_contract_id                   ,
    CASE WHEN TRIM(meridien_authorization_number)         =  '' THEN NULL ELSE TRIM(meridien_authorization_number)         END AS meridien_authorization_number          ,
    CASE WHEN TRIM(contract_number)                       =  '' THEN NULL ELSE TRIM(contract_number)                       END AS contract_number                        ,
    CAST(distance_selling_indicator AS INT)                                                                                                                              ,
    CASE WHEN TRIM(external_piece_number)                 =  '' THEN NULL ELSE TRIM(external_piece_number)                 END AS external_piece_number                  ,
    CASE WHEN TRIM(transmitter_system_code)               =  '' THEN NULL ELSE TRIM(transmitter_system_code)               END AS transmitter_system_code                ,
    CASE WHEN TRIM(customer_contract_reference)           =  '' THEN NULL ELSE TRIM(customer_contract_reference)           END AS customer_contract_reference            ,
    CASE WHEN TRIM(customer_id)                           =  '' THEN NULL ELSE TRIM(customer_id)                           END AS customer_id                            ,
    CASE WHEN TRIM(customer_id_extension_code)            =  '' THEN NULL ELSE TRIM(customer_id_extension_code)            END AS customer_id_extension_code             ,
    CASE WHEN TRIM(execution_order_number)                =  '' THEN NULL ELSE TRIM(execution_order_number)                END AS execution_order_number                 ,
    CAST(multi_transmitter_indicator           AS INT)                                                                                                                   ,
    CAST(contractor_equals_depositor_indicator AS INT)                                                                                                                   ,
    CASE WHEN TRIM(accounting_document_number)            =  '' THEN NULL ELSE TRIM(accounting_document_number)            END AS accounting_document_number             ,
    CASE WHEN TRIM(external_customer_id)                  =  '' THEN NULL ELSE TRIM(external_customer_id)                  END AS external_customer_id                   ,
    CASE WHEN TRIM(establishment_area_code)               =  '' THEN NULL ELSE TRIM(establishment_area_code)               END AS establishment_area_code                ,
    CASE WHEN TRIM(tax_type_code)                         =  '' THEN NULL ELSE TRIM(tax_type_code)                         END AS tax_type_code                          ,
    CAST(replace(affranchigo_service_amount,",",".") AS DEC(18,5))                                                                                                       ,
    CAST(replace(next_invoice_credit,",",".")        AS DEC(18,5))                                                                                                       ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_bo}
;
