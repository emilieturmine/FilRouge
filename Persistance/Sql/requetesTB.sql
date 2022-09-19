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
