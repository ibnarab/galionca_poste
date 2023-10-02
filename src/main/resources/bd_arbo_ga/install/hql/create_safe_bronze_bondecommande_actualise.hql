USE ${database};

DROP TABLE IF EXISTS ${table};

CREATE EXTERNAL TABLE ${table}
(
    invoice_id                              STRING            COMMENT 'Identifiant GALION de la facture'                                                          ,
    billing_order_number                    STRING            COMMENT 'N° de bon de commande'                                                                     ,
    corrected_billing_order_number          STRING            COMMENT 'N° de bon de commande corrigé'                                                             ,
    billing_order_origin_code               STRING            COMMENT 'Code Origine Bon de Commande'                                                              ,
    establishment_code                      STRING            COMMENT 'Code établissement de saisie du bon de commande'                                           ,
    agent_code                              STRING            COMMENT 'Code RH Agent de saisie du bon de commande'                                                ,
    agent_name                              STRING            COMMENT 'Nom Agent de saisie du bon de commande'                                                    ,
    agent_first_name                        STRING            COMMENT 'Prénom Agent de saisie du bon de commande'                                                 ,
    accounting_year                         STRING            COMMENT 'Année comptable'                                                                           ,
    accounting_month                        STRING            COMMENT 'Mois comptable'                                                                            ,
    service_start_date                      STRING            COMMENT 'Date de début de prestation'                                                               ,
    service_end_date                        STRING            COMMENT 'Date de fin de prestation'                                                                 ,
    deposit_zone_code                       STRING            COMMENT 'Code Zone de dépôt du bon de commande'                                                     ,
    deposit_establishment_code              STRING            COMMENT 'Code établissement lieu de dépôt'                                                          ,
    credit_note_reference_invoice_number    STRING            COMMENT 'N° de facture de référence pour un avoir'                                                  ,
    payment_amount                          DECIMAL(18, 5)    COMMENT 'Montant du règlement (en Euros)'                                                           ,
    payment_date                            STRING            COMMENT 'Date du règlement (JJ/MM/AAAA)'                                                            ,
    payment_number                          STRING            COMMENT 'N° règlement'                                                                              ,
    payment_place_establishment_code        STRING            COMMENT 'Code établissement du lieu de règlement'                                                   ,
    service_number                          STRING            COMMENT 'N° prestation'                                                                             ,
    specific_header1                        STRING            COMMENT 'Entête spécifique 1'                                                                       ,
    specific_header2                        STRING            COMMENT 'Entête spécifique 2'                                                                       ,
    specific_header3                        STRING            COMMENT 'Entête spécifique 3'                                                                       ,
    specific_header4                        STRING            COMMENT 'Entête spécifique 4'                                                                       ,
    specific_header5                        STRING            COMMENT 'Entête spécifique 5'                                                                       ,
    billing_order_amount_ht                 DECIMAL(18, 5)    COMMENT 'Montant bon de commande HT(en Euros)'                                                      ,
    billing_order_message                   STRING            COMMENT 'Message bon de commande'                                                                   ,
    billing_order_type_code                 STRING            COMMENT 'Code type du bon de commande'                                                              ,
    franking_machine_postal_type_code       STRING            COMMENT 'Code type postal machine à affranchir'                                                     ,
    franking_machine_serial_number          STRING            COMMENT 'Code type postal machine à affranchir'                                                     ,
    franking_machine_category_code          STRING            COMMENT 'Code catégorie machine à affranchir'                                                       ,
    sales_channel_code                      STRING            COMMENT 'Code canal de vente'                                                                       ,
    sales_channel_label                     STRING            COMMENT 'Libellé Canal de Vente'                                                                    ,
    seller_code                             STRING            COMMENT 'Code RH du vendeur'                                                                        ,
    supply_mode_indicator                   STRING            COMMENT 'Indicateur mode approvisionnement'                                                         ,
    eva_norm_indicator                      STRING            COMMENT 'Indicateur Norm Eva'                                                                       ,
    eva_visa_indicator                      STRING            COMMENT 'Indicateur Visa Eva'                                                                       ,
    mail_product_contract_type_code         STRING            COMMENT 'Code type CPC'                                                                             ,
    mail_product_contract_id                STRING            COMMENT 'Identifiant CPC'                                                                           ,
    mail_product_contract_number            STRING            COMMENT 'Numéro CPC'                                                                                ,
    overlay_color                           STRING            COMMENT 'Couleur recouvrement CPC'                                                                  ,
    cap_type_code                           STRING            COMMENT 'Code type CAP'                                                                             ,
    cap_id                                  STRING            COMMENT 'Identifiant CAP'                                                                           ,
    cap_number                              STRING            COMMENT 'Numéro  CAP'                                                                               ,
    intermediate_customer_id                STRING            COMMENT 'N° COCLICO intermédiaire'                                                                  ,
    deadline_commitment_indicator           STRING            COMMENT 'Indicateur engagement délai'                                                               ,
    meridien_contract_id                    STRING            COMMENT 'Identifiant contrat méridien'                                                              ,
    meridien_authorization_number           STRING            COMMENT 'Numéro dautorisation méridien'                                                             ,
    contract_number                         STRING            COMMENT 'Numéro de contrat'                                                                         ,
    distance_selling_indicator              INT               COMMENT 'Indicateur vente à distance du canal de vente (0 : canal de vente : ‘vente à distance’)'   ,
    external_piece_number                   STRING            COMMENT 'Numéro de pièce externe'                                                                   ,
    transmitter_system_code                 STRING            COMMENT 'Code système émetteur'                                                                     ,
    customer_contract_reference             STRING            COMMENT 'Référence contrat client'                                                                  ,
    customer_id                             STRING            COMMENT 'Code client courrier'                                                                      ,
    customer_id_extension_code              STRING            COMMENT 'Numéro extension code client'                                                              ,
    execution_order_number                  STRING            COMMENT 'Numéro bon d’exécution'                                                                    ,
    multi_transmitter_indicator             INT               COMMENT 'Indicateur multi émetteur'                                                                 ,
    contractor_equals_depositor_indicator   INT               COMMENT 'Indicateur contractant égal déposant'                                                      ,
    accounting_document_number              STRING            COMMENT 'Numéro pièce comptable'                                                                    ,
    external_customer_id                    STRING            COMMENT 'Numéro client externe'                                                                     ,
    establishment_area_code                 STRING            COMMENT 'Code zone d’implantation'                                                                  ,
    tax_type_code                           STRING            COMMENT 'Code typo TVA'                                                                             ,
    affranchigo_service_amount              DECIMAL(18, 5)    COMMENT 'Montant de la prestation Affranchigo'                                                      ,
    next_invoice_credit                     DECIMAL(18, 5)    COMMENT 'next_invoice_credit'                                                                       ,
    date_import                             STRING            COMMENT 'Date import'
)
STORED AS PARQUET
LOCATION '${hdfs_path}'
;
ALTER TABLE ${table}
ADD CONSTRAINT pk_${table} PRIMARY KEY (invoice_id, billing_order_number, billing_order_origin_code, accounting_year, accounting_month)
disable novalidate
;