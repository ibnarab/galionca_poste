USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    invoice_id                      STRING  COMMENT 'Identifiant GALION de la facture'                                              ,
    invoice_discount_line_number    STRING  COMMENT 'Numéro Ligne Facture Remise'                                                   ,
    discount_code                   STRING  COMMENT 'Code remise'                                                                   ,
    attached_invoice_id             STRING  COMMENT 'Identifiant GALION de la facture de rattachement'                              ,
    attached_invoice_line_number    STRING  COMMENT 'Numéro Ligne Facture Article de rattachement (pour une remise de type <> 2)'   ,
    discount_base                   STRING  COMMENT 'Assiette de la remise'                                                         ,
    discount_line_percentage        STRING  COMMENT 'Pourcentage ligne remise (en pour cents)'                                      ,
    discount_line_fixed_amount      STRING  COMMENT 'Montant forfaitaire ligne remise (en Euros)'                                   ,
    discount_line_unit_amount       STRING  COMMENT 'Montant unitaire ligne remise (en Euros)'                                      ,
    discount_line_amount_ht         STRING  COMMENT 'Montant ligne remise HT (en Euros)'                                            ,
    discount_line_tax_code          STRING  COMMENT 'Code TVA ligne remise'                                                         ,
    discount_line_tax_rate          STRING  COMMENT 'Taux TVA de la ligne de facture (en pour cents)'                               ,
    billing_order_number            STRING  COMMENT 'Numéro du bon de commande'                                                     ,
    billing_order_origin_code       STRING  COMMENT 'Code origine du bon de commande'                                               ,
    discount_type_code              STRING  COMMENT 'Code type de remise'                                                           ,
    tax_amount                      STRING  COMMENT 'Montant tva'                                                                   ,
    destination_zone_code           STRING  COMMENT 'Code zone de destination'                                                      ,
    tax_rule_code                   STRING  COMMENT 'Code zone de destination'
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ("skip.header.line.count"="1", 'serialization.null.format'='')
;