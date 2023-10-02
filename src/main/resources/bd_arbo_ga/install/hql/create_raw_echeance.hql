USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    invoice_id          STRING  COMMENT 'Identifiant GALION de la facture'  ,
    due_date_number     STRING  COMMENT 'N° échéance'                       ,
    due_date            STRING  COMMENT 'Date échéance (JJ/MM/AAAA)'        ,
    due_amount          STRING  COMMENT 'Montant échéance (en Euros)'
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ("skip.header.line.count"="1", 'serialization.null.format'='')
;