USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    invoice_id                      STRING            COMMENT 'Identifiant GALION de la facture'                                              ,
    invoice_discount_line_number    STRING            COMMENT 'Numéro Ligne Facture Remise'                                                   ,
    discount_code                   STRING            COMMENT 'Code remise'                                                                   ,
    attached_invoice_id             STRING            COMMENT 'Identifiant GALION de la facture de rattachement'                              ,
    attached_invoice_line_number    STRING            COMMENT 'Numéro Ligne Facture Article de rattachement (pour une remise de type <> 2)'   ,
    discount_base                   DECIMAL(18, 5)    COMMENT 'Assiette de la remise'                                                         ,
    discount_line_percentage        DECIMAL(18, 5)    COMMENT 'Pourcentage ligne remise (en pour cents)'                                      ,
    discount_line_fixed_amount      DECIMAL(18, 5)    COMMENT 'Montant forfaitaire ligne remise (en Euros)'                                   ,
    discount_line_unit_amount       DECIMAL(18, 5)    COMMENT 'Montant unitaire ligne remise (en Euros)'                                      ,
    discount_line_amount_ht         DECIMAL(18, 5)    COMMENT 'Montant ligne remise HT (en Euros)'                                            ,
    discount_line_tax_code          STRING            COMMENT 'Code TVA ligne remise'                                                         ,
    discount_line_tax_rate          DECIMAL(18, 5)    COMMENT 'Taux TVA de la ligne de facture (en pour cents)'                               ,
    billing_order_number            STRING            COMMENT 'Numéro du bon de commande'                                                     ,
    billing_order_origin_code       STRING            COMMENT 'Code origine du bon de commande'                                               ,
    discount_type_code              STRING            COMMENT 'Code type de remise'                                                           ,
    tax_amount                      DECIMAL(18, 5)    COMMENT 'Montant tva'                                                                   ,
    destination_zone_code           STRING            COMMENT 'Code zone de destination'                                                      ,
    tax_rule_code                   STRING            COMMENT 'Code zone de destination'                                                      ,
    date_import                     STRING            COMMENT 'Date import'
)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;
ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (invoice_id, invoice_discount_line_number, date_import)
disable novalidate
;
