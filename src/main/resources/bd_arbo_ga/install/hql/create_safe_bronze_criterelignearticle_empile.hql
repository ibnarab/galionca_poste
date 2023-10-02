USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    invoice_id                  STRING  COMMENT 'Identifiant ligne facture' ,
    invoice_detail_line_number  STRING  COMMENT 'Identifiant ligne article' ,
    criteria_code               STRING  COMMENT 'Code critère'              ,
    criteria_value              STRING  COMMENT 'Valeur critère'            ,
    date_import                 STRING  COMMENT 'Date import'
)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;
ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (invoice_id, invoice_detail_line_number, date_import)
disable novalidate
;
