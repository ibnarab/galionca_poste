-- TRUNCATE TABLE fait dans le lanceur safe actualise de client

INSERT INTO ${database_safe}.${table_safe_client_actualise}
SELECT DISTINCT
     customer_id                                 ,
     customer_id_extension_code                  ,
     seller_sector_code                          ,
     commercial_entity_code                      ,
     billing_sector_code                         ,
     recovery_division_code                      ,
     master_customer_id                          ,
     master_customer_id_extension                ,
     payment_period                              ,
     customer_naf_code                           ,
     customer_siren                              ,
     customer_nic                                ,
     customer_account_category_code              ,
     customer_type_code                          ,
     name_recipient_institution_label            ,
     recipient_establishment_subdivision_name    ,
     recipient_address_line_description_3        ,
     recipient_address_line_description_4        ,
     recipient_address_line_description_5        ,
     recipient_address_line_description_6        ,
     direct_debit_bank_code                      ,
     direct_debit_bank_branch_code               ,
     direct_debit_bank_account_number            ,
     direct_debit_bank_account_key_number        ,
     transfer_bank_code                          ,
     bank_transfer_branch_code                   ,
     transfer_bank_account_number                ,
     transfer_bank_account_key_number            ,
     competitor_customer_indicator               ,
     date_import

FROM (
    SELECT *, MAX(date_import) OVER (PARTITION BY (customer_id, customer_id_extension_code)) as max_dateimport
    FROM ${database_safe}.${table_safe_client_empile}
     ) a
WHERE a.date_import = a.max_dateimport
;
