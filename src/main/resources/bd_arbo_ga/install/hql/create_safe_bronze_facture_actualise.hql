USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    invoice_id                          STRING           COMMENT 'Identifiant GALION de la facture'              ,
    invoice_or_credit_number            STRING           COMMENT 'N° de facture ou davoir'                       ,
    invoice_type                        STRING           COMMENT 'Nature facture'                                ,
    invoice_generation_date             STRING           COMMENT 'Date édition facture (JJ/MM/AAAA)'             ,
    invoice_due_date                    STRING           COMMENT 'Date échéance facture (JJ/MM/AAAA) (*)'        ,
    invoice_support_code                STRING           COMMENT 'Code Support Facture'                          ,
    invoice_type_code                   STRING           COMMENT 'Code Type de facture'                          ,
    asap_invoice_indicator              STRING           COMMENT 'Indicateur facture « Au plus tôt »'            ,
    payment_type_code                   STRING           COMMENT 'Code type de paiement (*)'                     ,
    reimbursement_type_code             STRING           COMMENT 'Code type remboursement (*)'                   ,
    refund_period                       STRING           COMMENT 'Délai de remboursement (*)'                    ,
    billing_start_date                  STRING           COMMENT 'Date début facturation (JJ/MM/AAAA)'           ,
    billing_end_date                    STRING           COMMENT 'Date fin facturation (JJ/MM/AAAA)'             ,
    invoice_validator_code              STRING           COMMENT 'Code RH valideur de la facture'                ,
    invoice_validator_name              STRING           COMMENT 'Nom valideur de la facture'                    ,
    invoice_validator_first_name        STRING           COMMENT 'Prénom Valideur de la facture'                 ,
    invoice_gross_total_amount_ht       DECIMAL(18, 5)   COMMENT 'Total brut HT facture (en Euros)'              ,
    invoice_discount_total_amount_ht    DECIMAL(18, 5)   COMMENT 'Total HT remises facture (en Euros)'           ,
    invoice_net_total_amount_ht         DECIMAL(18, 5)   COMMENT 'Total net HT facture (en Euros)'               ,
    invoice_net_total_amount_ttc        DECIMAL(18, 5)   COMMENT 'Total net TTC facture (en Euros)'              ,
    invoice_tax_total_amount            DECIMAL(18, 5)   COMMENT 'Total TVA facture  (en Euros) (**)'            ,
    total_amount_already_paid_ttc       DECIMAL(18, 5)   COMMENT 'Total TTC déjà réglé (en Euros) '              ,
    amount_to_be_paid                   DECIMAL(18, 5)   COMMENT 'Montant à payer/due (en Euros)'                ,
    contractual_discount_amount_ht      DECIMAL(18, 5)   COMMENT 'Montant HT remises contractuelles (en Euros)'  ,
    customer_id                         STRING           COMMENT 'Code client courrier'                          ,
    customer_id_extension_code          STRING           COMMENT 'Numéro extension du code client'               ,
    vat_customer_indicator              STRING           COMMENT 'Client soumis à la TVA**'                      ,
    master_customer_id                  STRING           COMMENT 'Code client courrier maître'                   ,
    master_customer_id_extension        STRING           COMMENT 'Numéro extension du code client maître'        ,
    customer_account_nature_code        STRING           COMMENT 'Code nature compte client'                     ,
    billing_back_office_wallet_code     STRING           COMMENT 'Code portefeuille ADV'                         ,
    contract_number                     STRING           COMMENT 'Numéro de contrat'                             ,
    hat_contract_number                 STRING           COMMENT 'Numéro de contrat chapeau'                     ,
    contract_format_code                STRING           COMMENT 'Code format contrat'                           ,
    billing_adress_id                   STRING           COMMENT 'Identifiant adresse de facturation'            ,
    direct_debit_bank_details           STRING           COMMENT 'Identifiant des coordonnées de prélèvement'    ,
    bank_transfer_bank_details          STRING           COMMENT 'Identifiant des coordonnées de virement'       ,
    payment_deadline                    STRING           COMMENT 'Délai de paiement'                             ,
    first_billing_month_number          STRING           COMMENT 'Numéro du premier mois de facturation'         ,
    billing_frequency                   STRING           COMMENT 'Périodicité de facturation'                    ,
    last_billed_operation_date          STRING           COMMENT 'Date de dernière opération facturée'           ,
    contract_model_code                 STRING           COMMENT 'Code modèle de contrat'                        ,
    complex_contract_mode               STRING           COMMENT 'Mode de contrat complexe'                      ,
    billing_sector_code                 STRING           COMMENT 'Code secteur facturation'                      ,
    date_import                         STRING           COMMENT 'Date import'
)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;
ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (invoice_id)
disable novalidate
;
