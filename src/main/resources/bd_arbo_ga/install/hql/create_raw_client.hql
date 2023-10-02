USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    customer_id                                 STRING  COMMENT 'Code client courrier'                               ,
    customer_id_extension_code                  STRING  COMMENT 'Numero Extension Code Client'                       ,
    seller_sector_code                          STRING  COMMENT 'Code secteur vendeur'                               ,
    commercial_entity_code                      STRING  COMMENT 'Code entité commerciale'                            ,
    billing_sector_code                         STRING  COMMENT 'Code secteur facturation'                           ,
    recovery_division_code                      STRING  COMMENT 'Code direction de recouvrement'                     ,
    master_customer_id                          STRING  COMMENT 'Code client courrier maître'                        ,
    master_customer_id_extension                STRING  COMMENT 'Numero Extension Code Client maître'                ,
    payment_period                              STRING  COMMENT 'Délai de paiement'                                  ,
    customer_naf_code                           STRING  COMMENT 'Code NAF client courier'                            ,
    customer_siren                              STRING  COMMENT 'Siren client courrier'                              ,
    customer_nic                                STRING  COMMENT 'Nic client Courrier'                                ,
    customer_account_category_code              STRING  COMMENT 'Code Catégorie Compte Client'                       ,
    customer_type_code                          STRING  COMMENT 'Code Catégorie Compte Client'                       ,
    name_recipient_institution_label            STRING  COMMENT 'Libellé nom établissement destinataire'             ,
    recipient_establishment_subdivision_name    STRING  COMMENT 'Libellé subdivision établissement destinataire 2'   ,
    recipient_address_line_description_3        STRING  COMMENT 'Libellé ligne adresse destinataire 3'               ,
    recipient_address_line_description_4        STRING  COMMENT 'Libellé ligne adresse destinataire 4'               ,
    recipient_address_line_description_5        STRING  COMMENT 'Libellé ligne adresse destinataire 5'               ,
    recipient_address_line_description_6        STRING  COMMENT 'Libellé ligne adresse destinataire 6'               ,
    direct_debit_bank_code                      STRING  COMMENT 'Code banque prélèvement'                            ,
    direct_debit_bank_branch_code               STRING  COMMENT 'Code guichet banque prélèvement'                    ,
    direct_debit_bank_account_number            STRING  COMMENT 'Numéro compte banque prélèvement'                   ,
    direct_debit_bank_account_key_number        STRING  COMMENT 'Numéro clé compte banque prélèvement'               ,
    transfer_bank_code                          STRING  COMMENT 'Code banque virement'                               ,
    bank_transfer_branch_code                   STRING  COMMENT 'Code guichet banque virement'                       ,
    transfer_bank_account_number                STRING  COMMENT 'Numéro compte banque virement'                      ,
    transfer_bank_account_key_number            STRING  COMMENT 'Numéro clé compte banque virement'                  ,
    competitor_customer_indicator               STRING  COMMENT 'Indicateur client concurrent'
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ("skip.header.line.count"="1", 'serialization.null.format'='')
;