-- TRUNCATE TABLE fait dans le lanceur safe actualise de facture

INSERT INTO ${database_safe}.${table_safe_facture_actualise}
SELECT DISTINCT
    invoice_id                                          ,
    invoice_or_credit_number                            ,
    invoice_type                                        ,
    invoice_generation_date                             ,
    invoice_due_date                                    ,        
    invoice_support_code                                ,
    invoice_type_code                                   ,
    asap_invoice_indicator                              ,
    payment_type_code                                   ,
    reimbursement_type_code                             ,
    refund_period                                       ,
    billing_start_date                                  ,
    billing_end_date                                    ,
    invoice_validator_code                              ,
    invoice_validator_name                              ,
    invoice_validator_first_name                        ,
    invoice_gross_total_amount_ht                       ,
    invoice_discount_total_amount_ht                    ,
    invoice_net_total_amount_ht                         ,
    invoice_net_total_amount_ttc                        ,
    invoice_tax_total_amount                            ,
    total_amount_already_paid_ttc                       ,
    amount_to_be_paid                                   ,
    contractual_discount_amount_ht                      ,
    customer_id                                         ,
    customer_id_extension_code                          ,
    vat_customer_indicator                              ,
    master_customer_id                                  ,
    master_customer_id_extension                        ,
    customer_account_nature_code                        ,
    billing_back_office_wallet_code                     ,
    contract_number                                     ,
    hat_contract_number                                 ,
    contract_format_code                                ,
    billing_adress_id                                   ,
    direct_debit_bank_details                           ,
    bank_transfer_bank_details                          ,
    payment_deadline                                    ,
    first_billing_month_number                          ,
    billing_frequency                                   ,
    last_billed_operation_date                          ,
    contract_model_code                                 ,
    complex_contract_mode                               ,
    billing_sector_code                                 ,
    date_import

FROM (
    SELECT *, MAX(date_import) OVER (PARTITION BY (invoice_id)) as max_dateimport
    FROM ${database_safe}.${table_safe_facture_empile}
     ) a
WHERE a.date_import = a.max_dateimport
;
