-- CHIFFRE DAFFAIRE HORS TAXE PAR FOURNISSEUR
SELECT
    fournisseur.fou_nom AS "Nom fournisseur",
    SUM(
        (
            ligne_de_commande.li_montant - (
                (utilisateur.uti_coef / 100) * ligne_de_commande.li_montant
            )
        )
    ) AS " CA Hors Taxe "
FROM
    (
        (
            (
                ligne_de_commande
                JOIN utilisateur ON (
                    (
                        utilisateur.uti_id = ligne_de_commande.li_uti_id
                    )
                )
            )
            JOIN produit ON (
                (
                    produit.pro_id = ligne_de_commande.pro_id
                )
            )
        )
        JOIN fournisseur ON (
            (
                fournisseur.fou_id = produit.fou_id
            )
        )
    )
GROUP BY
    fournisseur.fou_nom;

-- CHIFFRE DAFFAIRE HORS TAXE VILLAGE GREEN
SELECT
    SUM(commande.com_montant) AS "chiffre daffaire total"
from
    commande;

-- CLIENT EN RETARD DE PAIEMENT
SELECT
    CONCAT(
        utilisateur.uti_nom,
,
        utilisateur.uti_prenom
    ) AS " nom client",
    utilisateur.uti_id AS "numero client",
    utilisateur.uti_email AS "email client",
    utilisateur.uti_adresse AS "adresse client",
    role.rol_profil AS "type de client",
    commande.com_id AS " numero de commande",
    commande.com_montant AS " montant de la commande",
    commande.com_statut AS "statut de la commande"
FROM
    (
        (
            (
                (
                    commande
                    JOIN ligne_de_commande ON (
                        (
                            ligne_de_commande.com_id = commande.com_id
                        )
                    )
                )
                JOIN utilisateur ON (
                    (
                        utilisateur.uti_id = ligne_de_commande.li_uti_id
                    )
                )
            )
            JOIN role ON ((role.rol_id = utilisateur.rol_id))
        )
        JOIN facturation ON((facturation.fac_id = commande.fac_id))
    )
WHERE
    (
        facturation.fac_statut = "paiement en retard"
    )
GROUP BY
    utilisateur.uti_id
ORDER BY
    commande.com_date;

--ETAT DES COMMANDES
SELECT
    commande.com_id AS "numero de commande",
    commande.com_date AS "date de la commande",
    commande.com_statut AS "statut de la commande",
    facturation.fac_statut AS "statut de la facturation"
FROM
    (
        commande
        JOIN facturation ON ((commande.fac_id = facturation.fac_id))
    )
GROUP BY
    commande.com_id;

-- LISTE DES COMMANDES PAR CLIENT
SELECT
    commande.com_date AS "date de commande",
    utilisateur.uti_id AS "reference client",
    commande.com_montant AS "montant de la commande",
    commande.com_statut AS "statut de la commande"
FROM
    (
        (
            commande
            JOIN ligne_de_commande ON (
                (
                    ligne_de_commande.com_id = commande.com_id
                )
            )
        )
        JOIN utilisateur ON (
            (
                utilisateur.uti_id = ligne_de_commande.li_uti_id
            )
        )
    )
GROUP BY
    utilisateur.uti_id;

--LISTE DES COMMANDES POUR CLIENT X
SELECT
    commande.com_date AS "date de commande",
    utilisateur.uti_id AS "reference client",
    commande.com_montant AS "montant de la commande",
    commande.com_statut AS "statut de la commande"
FROM
    (
        (
            commande
            JOIN ligne_de_commande ON(
                (
                    ligne_de_commande.com_id = commande.com_id
                )
            )
        )
        JOIN utilisateur ON(
            (
                utilisateur.uti_id = ligne_de_commande.li_uti_id
            )
        )
    )
WHERE
    (utilisateur.uti_id = 4)
GROUP BY
    commande.com_id;

-- LES LIVRAISONS EN COURS
SELECT
    commande.com_id AS "numero de commande",
    commande.com_date AS "date de commande",
    commande.com_bon AS "bon de commande"
FROM
    commande
WHERE
    (commande.com_statut = en cours);

--LES PRODUITS VENDUES EN 2021
SELECT
    produit.pro_ref AS "reference du produit",
    produit.pro_libelle AS "nom du produit",
    ligne_de_commande.pro_quantite AS "quantité vendue",
    fournisseur.fou_nom AS "nom du fournisseur"
FROM
    (
        (
            (
                ligne_de_commande
                JOIN commande ON (
                    (
                        ligne_de_commande.com_id = commande.com_id
                    )
                )
            )
            JOIN produit ON (
                (
                    ligne_de_commande.pro_id = produit.pro_id
                )
            )
        )
        JOIN fournisseur ON ((produit.fou_id = fournisseur.fou_id))
    )
WHERE
    (commande.com_date LIKE 2021 %);

--REPARTITION DU CHIFFRE DAFFAIRE HORS TAXE PAR TYPE DE CLIENT
SELECT
    role.rol_profil AS "type de client",
    SUM(commande.com_montant) AS "CAHT"
FROM
    (
        (
            (
                commande
                JOIN ligne_de_commande ON (
                    (
                        ligne_de_commande.com_id = commande.com_id
                    )
                )
            )
            JOIN utilisateur ON (
                (
                    utilisateur.uti_id = ligne_de_commande.li_uti_id
                )
            )
        )
        JOIN role ON ((role.rol_id = utilisateur.rol_id))
    )
GROUP BY
    utilisateur.rol_id;

-- Jointure table fournisseur et produit
SELECT
    fou_nom AS "nom fournisseur",
    pro_ref AS "reference produit",
    pro_libelle AS "nom du produit",
    pro_description AS "description produit",
    pro_prix_achat AS "prix",
    pro_photo AS "photo",
    pro_stock AS "stock"
FROM
    produit
    RIGHT JOIN fournisseur ON fournisseur.fou_id = produit.fou_id;

-- PROCEDURE CHIFFRE DAFFAIRE PAR FOURNISSEUR ( A METTRE EN PLACE)
DELIMITER | CREATE PROCEDURE p_caht_par_fournisseur(
    IN p_fournisseur VARCHAR(20),
    OUT p_caht INT (10)
) BEGIN
SELECT
    fou_nom AS "Nom fournisseur ",
    SUM(
        ligne_de_commande.li_montant - (
            (utilisateur.uti_coef / 100) * ligne_de_commande.li_montant
        )
    ) INTO p_caht
FROM
    ligne_de_commande
    JOIN utilisateur ON utilisateur.uti_id = ligne_de_commande.li_uti_id
    JOIN produit ON produit.pro_id = ligne_de_commande.pro_id
    JOIN fournisseur ON fournisseur.fou_id = produit.fou_id
WHERE
    fou_nom = p_fournisseur;

END | DELIMITER;

END | --ETAT DES COMMANDES 
CREATE PROCEDURE p_etat_commande_client(IN p_numero_client INT(10)) BEGIN
SELECT
    commande.com_id AS "numero de commande",
    commande.com_date AS "date de la commande",
    commande.com_statut AS "statut de la commande",
    facturation.fac_statut AS "statut de la facturation"
FROM
    (
        commande
        JOIN facturation ON ((commande.fac_id = facturation.fac_id))
        JOIN ligne_de_commande ON (
            (ligne_de_commande.com_id = commande.com_id)
        )
        JOIN utilisateur ON (
            (utilisateur.uti_id = ligne_de_commande.li_uti_id)
        )
    )
WHERE
    utilisateur.uti_id = p_numero_client;

--DELAI MOYEN ENTRE DATE COMMANDE ET DATE DE FACTURATION
DELIMITER | CREATE PROCEDURE p_delai_moyen_facturation(OUT p_delai_moyen int (5)) BEGIN
SELECT
    AVG(DATEDIFF(com_date, fac_date)) INTO p_delai_moyen
FROM
    facturation
    JOIN commande ON commande.fac_id = facturation.fac_id
END | DELIMITER;

-- REASSORT FOURNISSEUR
DELIMITER | CREATE PROCEDURE p_reassort_produit (IN p_fournisseur INT(2)) BEGIN
SELECT
    pro_ref,
    pro_libelle,
    pro_photo,
    pro_prix_achat,
    pro_stock
FROM
    produit
    JOIN fournisseur ON fournisseur.fou_id = produit.fou_id
WHERE
    fournisseur.fou_id = p_fournisseur
    AND pro_stock = < 5;

END | DELIMITER;