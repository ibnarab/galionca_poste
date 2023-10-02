USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    invoice_id                  STRING  COMMENT 'Identifiant ligne facture'  ,
    invoice_detail_line_number  STRING  COMMENT 'Identifiant ligne article'  ,
    criteria_code               STRING  COMMENT 'Code critère'               ,
    criteria_value              STRING  COMMENT 'Valeur critère'
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${hdfs_path}'
TBLPROPERTIES ("skip.header.line.count"="1", 'serialization.null.format'='')
;