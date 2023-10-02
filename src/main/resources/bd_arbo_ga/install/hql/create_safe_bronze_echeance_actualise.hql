USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    invoice_id      STRING          COMMENT 'Identifiant GALION de la facture'  ,
    due_date_number INT             COMMENT 'N° échéance'                       ,
    due_date        STRING          COMMENT 'Date échéance (JJ/MM/AAAA)'        ,
    due_amount      DECIMAL(18, 5)  COMMENT 'Montant échéance (en Euros)'       ,
    date_import     STRING          COMMENT 'Date import'
)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;
ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (invoice_id, due_date_number)
disable novalidate
;
