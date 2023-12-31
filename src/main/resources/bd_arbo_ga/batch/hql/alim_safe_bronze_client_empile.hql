INSERT INTO ${database_safe}.${table_safe_client_empile}
SELECT
    CASE WHEN TRIM(customer_id)                               =  '' THEN NULL ELSE TRIM(customer_id)                               END AS customer_id                               ,
    CASE WHEN TRIM(customer_id_extension_code)                =  '' THEN NULL ELSE TRIM(customer_id_extension_code)                END AS customer_id_extension_code                ,
    CASE WHEN TRIM(seller_sector_code)                        =  '' THEN NULL ELSE TRIM(seller_sector_code)                        END AS seller_sector_code                        ,
    CASE WHEN TRIM(commercial_entity_code)                    =  '' THEN NULL ELSE TRIM(commercial_entity_code)                    END AS commercial_entity_code                    ,
    CASE WHEN TRIM(billing_sector_code)                       =  '' THEN NULL ELSE TRIM(billing_sector_code)                       END AS billing_sector_code                       ,
    CASE WHEN TRIM(recovery_division_code)                    =  '' THEN NULL ELSE TRIM(recovery_division_code)                    END AS recovery_division_code                    ,
    CASE WHEN TRIM(master_customer_id)                        =  '' THEN NULL ELSE TRIM(master_customer_id)                        END AS master_customer_id                        ,
    CASE WHEN TRIM(master_customer_id_extension)              =  '' THEN NULL ELSE TRIM(master_customer_id_extension)              END AS master_customer_id_extension              ,
    CAST(payment_period AS INT)                                                                                                                                                     ,
    CASE WHEN TRIM(customer_naf_code)                         =  '' THEN NULL ELSE TRIM(customer_naf_code)                         END AS customer_naf_code                         ,
    CASE WHEN TRIM(customer_siren)                            =  '' THEN NULL ELSE TRIM(customer_siren)                            END AS customer_siren                            ,
    CASE WHEN TRIM(customer_nic)                              =  '' THEN NULL ELSE TRIM(customer_nic)                              END AS customer_nic                              ,
    CASE WHEN TRIM(customer_account_category_code)            =  '' THEN NULL ELSE TRIM(customer_account_category_code)            END AS customer_account_category_code            ,
    CASE WHEN TRIM(customer_type_code)                        =  '' THEN NULL ELSE TRIM(customer_type_code)                        END AS customer_type_code                        ,
    CASE WHEN TRIM(name_recipient_institution_label)          =  '' THEN NULL ELSE TRIM(name_recipient_institution_label)          END AS name_recipient_institution_label          ,
    CASE WHEN TRIM(recipient_establishment_subdivision_name)  =  '' THEN NULL ELSE TRIM(recipient_establishment_subdivision_name)  END AS recipient_establishment_subdivision_name  ,
    CASE WHEN TRIM(recipient_address_line_description_3)      =  '' THEN NULL ELSE TRIM(recipient_address_line_description_3)      END AS recipient_address_line_description_3      ,
    CASE WHEN TRIM(recipient_address_line_description_4)      =  '' THEN NULL ELSE TRIM(recipient_address_line_description_4)      END AS recipient_address_line_description_4      ,
    CASE WHEN TRIM(recipient_address_line_description_5)      =  '' THEN NULL ELSE TRIM(recipient_address_line_description_5)      END AS recipient_address_line_description_5      ,
    CASE WHEN TRIM(recipient_address_line_description_6)      =  '' THEN NULL ELSE TRIM(recipient_address_line_description_6)      END AS recipient_address_line_description_6      ,
    CASE WHEN TRIM(direct_debit_bank_code)                    =  '' THEN NULL ELSE TRIM(direct_debit_bank_code)                    END AS direct_debit_bank_code                    ,
    CASE WHEN TRIM(direct_debit_bank_branch_code)             =  '' THEN NULL ELSE TRIM(direct_debit_bank_branch_code)             END AS direct_debit_bank_branch_code             ,
    CASE WHEN TRIM(direct_debit_bank_account_number)          =  '' THEN NULL ELSE TRIM(direct_debit_bank_account_number)          END AS direct_debit_bank_account_number          ,
    CASE WHEN TRIM(direct_debit_bank_account_key_number)      =  '' THEN NULL ELSE TRIM(direct_debit_bank_account_key_number)      END AS direct_debit_bank_account_key_number      ,
    CASE WHEN TRIM(transfer_bank_code)                        =  '' THEN NULL ELSE TRIM(transfer_bank_code)                        END AS transfer_bank_code                        ,
    CASE WHEN TRIM(bank_transfer_branch_code)                 =  '' THEN NULL ELSE TRIM(bank_transfer_branch_code)                 END AS bank_transfer_branch_code                 ,
    CASE WHEN TRIM(transfer_bank_account_number)              =  '' THEN NULL ELSE TRIM(transfer_bank_account_number)              END AS transfer_bank_account_number              ,
    CASE WHEN TRIM(transfer_bank_account_key_number)          =  '' THEN NULL ELSE TRIM(transfer_bank_account_key_number)          END AS transfer_bank_account_key_number          ,
    CASE WHEN TRIM(competitor_customer_indicator)             =  '' THEN NULL ELSE TRIM(competitor_customer_indicator)             END AS competitor_customer_indicator             ,
    '${date_import}' AS date_import

FROM ${database_raw}.${table_raw_cl};