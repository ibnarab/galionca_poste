# bdl-bscc-galionca
Les différentes directions ou BU cherchent à avoir une vision 360° du CA réalisé par le groupe la Poste et ses filiales. De ce fait, dans l'outil de pilotage de la BSCC, il nous faut intégrer les chiffres d'affaires réalisés par l'outil de facturation Grand Large, bientôt remplacé dans le cadre du projet Paktole nouvellement Factura.<br />
Ce fichier transmis quotidiennement les 7 premiers jours ouvrés du moiss puis tous les mardis et vendredis par Galion nous permet d'avoir la visibilité sur le CA réalisé le mois précédent par un client. Afin de réussir à avoir cette vue 360°.

# Liens
* **MIS** : https://wiki.net.extra.laposte.fr/confluence/display/BGDL/MIS+galionca
* **DEX** : https://wiki.net.extra.laposte.fr/confluence/display/BGDL/DEX+galionca


# FlowChart
```mermaid
flowchart LR
    %% Style des tables (couleurs de remplissage, texte, bordure)
    classDef topic_ws_file  fill:#000000,color:#fff,stroke:#fff
    classDef raw            fill:#eb467d,color:#fff,stroke:#fff
    classDef bronze         fill:#a16137,color:#fff,stroke:#fff
    classDef nickel         fill:#8d389c,color:#fff,stroke:#fff
    classDef silver         fill:#8f8a86,color:#fff,stroke:#fff
    classDef chrome         fill:#ebbedc,color:#000,stroke:#000
    classDef gold           fill:#f0c04f,color:#000,stroke:#000
    classDef temp           fill:#38929c,color:#fff,stroke:#fff
    classDef work           fill:#1a6e21,color:#fff,stroke:#fff
    classDef param          fill:#ececff,color:#000,stroke:#000


    %% Variables
    %% Syntaxe d'une table non-partitionnée : my_table:::raw
    %% Syntaxe d'une table     partitionnée : my_table[[my_table]]:::raw
    d9claaaa.bd:::topic_ws_file
    d9fcaaaa.bd:::topic_ws_file
    d9boaaaa.bd:::topic_ws_file
    d9lraaaa.bd:::topic_ws_file
    d9liaaaa.bd:::topic_ws_file
    d9craaaa.bd:::topic_ws_file
    d9ecaaaa.bd:::topic_ws_file

    subgraph bd_aa_xcom_raw
    r_galionca_cl_client:::raw
    r_galionca_fc_facture:::raw
    r_galionca_bo_bondecommande:::raw
    r_galionca_lr_ligneremise:::raw
    r_galionca_li_lignearticle:::raw
    r_galionca_cr_criterelignearticle:::raw
    r_galionca_ec_echeance:::raw
    end

    subgraph bd_aa_xcom_safe
    b_galionca_client_empile:::bronze
    b_galionca_client_actualise:::bronze
    b_galionca_facture_empile:::bronze
    b_galionca_facture_actualise:::bronze
    b_galionca_bondecommande_empile:::bronze
    b_galionca_bondecommande_actualise:::bronze
    b_galionca_ligneremise_empile:::bronze
    b_galionca_ligneremise_actualise:::bronze
    b_galionca_lignearticle_empile:::bronze
    b_galionca_lignearticle_actualise:::bronze
    b_galionca_criterelignearticle_empile:::bronze
    b_galionca_criterelignearticle_actualise:::bronze
    b_galionca_echeance_empile:::bronze
    b_galionca_echeance_actualise:::bronze
    end

    subgraph bd_aa_commercial_optimized
    g_cial_ca_mensuel_galion:::gold
    end

    %% Flux
    %% Syntaxe d'un flux principal  : -->
    %% Syntaxe d'un flux secondaire : -..->
    d9claaaa.bd                              --> r_galionca_cl_client
    d9fcaaaa.bd                              --> r_galionca_fc_facture
    d9boaaaa.bd                              --> r_galionca_bo_bondecommande
    d9lraaaa.bd                              --> r_galionca_lr_ligneremise
    d9liaaaa.bd                              --> r_galionca_li_lignearticle
    d9craaaa.bd                              --> r_galionca_cr_criterelignearticle
    d9ecaaaa.bd                              --> r_galionca_ec_echeance
    r_galionca_cl_client                     --> b_galionca_client_empile
    r_galionca_fc_facture                    --> b_galionca_facture_empile
    r_galionca_bo_bondecommande              --> b_galionca_bondecommande_empile
    r_galionca_lr_ligneremise                --> b_galionca_ligneremise_empile
    r_galionca_li_lignearticle               --> b_galionca_lignearticle_empile
    r_galionca_cr_criterelignearticle        --> b_galionca_criterelignearticle_empile
    r_galionca_ec_echeance                   --> b_galionca_echeance_empile
    b_galionca_client_empile                 --> b_galionca_client_actualise
    b_galionca_facture_empile                --> b_galionca_facture_actualise
    b_galionca_bondecommande_empile          --> b_galionca_bondecommande_actualise
    b_galionca_ligneremise_empile            --> b_galionca_ligneremise_actualise
    b_galionca_lignearticle_empile           --> b_galionca_lignearticle_actualise
    b_galionca_criterelignearticle_empile    --> b_galionca_criterelignearticle_actualise
    b_galionca_echeance_empile               --> b_galionca_echeance_actualise
    b_galionca_client_actualise              --> g_cial_ca_mensuel_galion
    b_galionca_facture_actualise             --> g_cial_ca_mensuel_galion
    b_galionca_bondecommande_actualise       --> g_cial_ca_mensuel_galion
    b_galionca_ligneremise_actualise         --> g_cial_ca_mensuel_galion
    b_galionca_lignearticle_actualise        --> g_cial_ca_mensuel_galion
```

> **Légende**
> * **Trait plein** : Ce flux transporte les données principales, relatives au 'coeur de Métier' de l'application
> * **Trait pointillé** : Ce flux transporte des données secondaires, moins importantes et principalement utilisées lors jointure/union/...
> * **Doubles bordures verticales** : Cette table est partitionnée


# Historique des évolutions fonctionnelles et techniques
| Date de MEP | Version  | Jira                                                               | Description                                                |
|-------------|----------|--------------------------------------------------------------------|------------------------------------------------------------|
| 2023-03-07  | 02_00_00 | [BDL-663](https://jira.net.extra.laposte.fr/jira/browse/BDL-663)   | Première MEP                                               |
| 2023-05-16  | 02_00_01 | [BDL-1023](https://jira.net.extra.laposte.fr/jira/browse/BDL-1023) | Ajout condition de jointure                                |
| 2023-06-01  | 02_00_02 | [BDL-1091](https://jira.net.extra.laposte.fr/jira/browse/BDL-1091) | Empile - maj decimal replace virgule to point              |
| 2023-06-01  | 02_00_03 | [BDL-1097](https://jira.net.extra.laposte.fr/jira/browse/BDL-1097) | Encodage des fichiers                                      |


# Notes
Aucune donnée à caractère personnel n'est recensée dans ce flux .<br />
<br />
Volumétrie du fichier mensuel : 20 lignes<br />
Volumétrie de la table à 1 an : 60 Ko/an<br />
Nombre de colonnes dans la tableau :  2+1<br />
Autre :

# TODO List
*
