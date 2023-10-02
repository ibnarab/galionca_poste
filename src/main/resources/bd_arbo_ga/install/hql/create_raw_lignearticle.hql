USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    invoice_id                      STRING  COMMENT 'Identifiant GALION de la facture'                                          ,
    invoice_detail_line_number      STRING  COMMENT 'Numéro Ligne Facture Article'                                              ,
    article_code                    STRING  COMMENT 'Code article'                                                              ,
    attached_invoice_id             STRING  COMMENT 'Identifiant GALION de la facture de rattachement'                          ,
    attached_invoice_line_number    STRING  COMMENT 'Numéro Ligne Facture Article de rattachement (cas des services associés)'  ,
    article_label                   STRING  COMMENT 'Libellé article valorisé'                                                  ,
    invoice_line_quantity           STRING  COMMENT 'Quantité Ligne facture'                                                    ,
    unit_price_ht                   STRING  COMMENT 'Prix unitaire HT (en Euros)'                                               ,
    article_line_amount_ht          STRING  COMMENT 'Montant ligne article HT (en Euros)'                                       ,
    tax_code                        STRING  COMMENT 'Code TVA'                                                                  ,
    franking_mode_code              STRING  COMMENT 'Code mode daffranchissement'                                               ,
    invoice_line_tax_rate           STRING  COMMENT 'Taux TVA de la ligne de facture (en pour cents)'                           ,
    billing_order_number            STRING  COMMENT 'Numéro du bon de commande'                                                 ,
    billing_order_origin_code       STRING  COMMENT 'Code origine du bon de commande'                                           ,
    downgrading_reason_code         STRING  COMMENT 'Code motif de déclassement'                                                ,
    downgrading_reason_label        STRING  COMMENT 'Libellé motif de déclassement'                                             ,
    sender_customer_code            STRING  COMMENT 'Code client émetteur'                                                      ,
    deposit_date                    STRING  COMMENT 'Date établissement de dépôt'                                               ,
    deposit_establishment_code      STRING  COMMENT 'Code établissement de dépôt'                                               ,
    semaphore_note_id               STRING  COMMENT 'Identifiant bordereau Sémaphore'                                           ,
    semaphore_customer_note_id      STRING  COMMENT 'Identifiant bordereau client Sémaphore'                                    ,
    tax_amount                      STRING  COMMENT 'Montant TVA'                                                               ,
    destination_zone_code           STRING  COMMENT 'Code zone destination'                                                     ,
    tax_rule_code                   STRING  COMMENT 'RG fiscale'
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ("skip.header.line.count"="1", 'serialization.null.format'='')
;