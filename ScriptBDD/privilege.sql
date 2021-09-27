CREATE ROLE 'r_villagegreen_visiteur' @'localhost';

GRANT
SELECT
    ON villagegreen.categorie TO 'r_villagegreen_visiteur' @'localhost';

GRANT
SELECT
    ON villagegreen.produit TO 'r_villagegreen_visiteur' @'localhost';

--   lecture sur le catalogue
CREATE ROLE 'r_villagegreen_client_part' @'localhost';

GRANT
SELECT
    ON villagegreen.* TO 'r_villagegreen_client_part' @'localhost';

GRANT
INSERT
,
UPDATE
    ON villagegreen.ligne_de_commande TO 'r_villagegreen_client_part' @'localhost';

GRANT
INSERT
,
UPDATE
    ON villagegreen.commande TO 'r_villagegreen_client_part' @'localhost';

;

GRANT
INSERT
,
UPDATE
    ON villagegreen.utilisateur TO 'r_villagegreen_client_part' @'localhost';

-- lecture sur toute la base,insertion et mise a jour sur commande et utilisateur
CREATE ROLE 'r_villagegreen_client_pro' @'localhost';

GRANT
SELECT
    ON villagegreen.* TO 'r_villagegreen_client_pro' @'localhost';

GRANT
INSERT
,
UPDATE
    ON villagegreen.ligne_de_commande TO 'r_villagegreen_client_pro' @'localhost';

GRANT
INSERT
,
UPDATE
    ON villagegreen.commande TO 'r_villagegreen_client_pro' @'localhost';

GRANT
INSERT
,
UPDATE
    ON villagegreen.utilisateur TO 'r_villagegreen_client_pro' @'localhost';

-- lecture sur toute la base,insertion et mise a jour sur commande et utilisateur
CREATE ROLE 'r_villagegreen_gestion' @'localhost';

GRANT
SELECT
,
INSERT
,
UPDATE
    ON villagegreen.* TO 'r_villagegreen_gestion' @'localhost';

-- lecture et ecriture dans la base
CREATE ROLE 'r_villagegreen_administration' @'localhost';

GRANT ALL ON villagegreen.* TO 'r_villagegreen_administration' @'localhost';

CREATE ROLE 'r_villagegreen_maintenance' @'localhost';

GRANT ALL ON villagegreen.* TO 'r_villagegreen_maintenance' @'localhost';