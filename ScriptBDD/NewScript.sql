DROP DATABASE filrouge;
CREATE DATABASE filrouge;
USE filrouge;


CREATE TABLE categorie(
   cat_id INT AUTO_INCREMENT,
   cat_nom VARCHAR(255)  NOT NULL,
   cat_pho VARCHAR(255)  NOT NULL,
   cat_par INT,
    PRIMARY KEY(cat_id),
    FOREIGN KEY(cat_par) REFERENCES Categorie(cat_id)
);

CREATE TABLE fournisseur(
   fou_id INT AUTO_INCREMENT,
   fou_nom VARCHAR(255)  NOT NULL,
   fou_adr VARCHAR(255)  NOT NULL,
   fou_cp VARCHAR(255)  NOT NULL,
   fou_vil VARCHAR(255)  NOT NULL,
   PRIMARY KEY(fou_id)
);

CREATE TABLE utilisateur(
   uti_id INT AUTO_INCREMENT,
   uti_pse VARCHAR(255)  NOT NULL,
   uti_mdp VARCHAR(255)  NOT NULL,
   uti_nom VARCHAR(255)  NOT NULL,
   uti_adr VARCHAR(255)  NOT NULL,
   uti_ema VARCHAR(255)  NOT NULL,
   uti_coe DECIMAL(15,2)   NOT NULL,
   uti_pre VARCHAR(255)  NOT NULL,
   uti_cp VARCHAR(255)  NOT NULL,
   uti_vil VARCHAR(255)  NOT NULL,
   uti_rol VARCHAR(255)  NOT NULL,
   uti_com INT,
   PRIMARY KEY(uti_id),
   FOREIGN KEY(uti_com) REFERENCES utilisateur(uti_id)
);

CREATE TABLE commande(
   com_id INT AUTO_INCREMENT,
   com_fac_adr VARCHAR(255)  NOT NULL,
   com_fac_cp VARCHAR(255)  NOT NULL,
   com_fac_vil VARCHAR(255)  NOT NULL,
   com_date DATE,
   com_statut VARCHAR(255) ,
   uti_id INT NOT NULL,
   PRIMARY KEY(com_id),
   FOREIGN KEY(uti_id) REFERENCES utilisateur(uti_id)
);

CREATE TABLE livraison(
   liv_id INT AUTO_INCREMENT,
   liv_dat DATE NOT NULL,
   liv_adr VARCHAR(255)  NOT NULL,
   liv_cp VARCHAR(255)  NOT NULL,
   liv_vil VARCHAR(255)  NOT NULL,
   com_id INT NOT NULL,
   PRIMARY KEY(liv_id),
   FOREIGN KEY(com_id) REFERENCES commande(com_id)
);

CREATE TABLE produit(
   pro_id INT AUTO_INCREMENT,
   pro_ref VARCHAR(255)  NOT NULL,
   pro_lib VARCHAR(255)  NOT NULL,
   pro_des VARCHAR(255)  NOT NULL,
   pro_pri_uni DECIMAL(5,2)   NOT NULL,
   pro_pho VARCHAR(255)  NOT NULL,
   pro_sto INT NOT NULL,
   pro_tva DECIMAL(15,2)   NOT NULL,
   fou_id INT NOT NULL,
   cat_id INT NOT NULL,
   PRIMARY KEY(pro_id),
   FOREIGN KEY(fou_id) REFERENCES fournisseur(fou_id),
   FOREIGN KEY(cat_id) REFERENCES Categorie(cat_id)
);

CREATE TABLE ligne_de_commande(
   pro_id INT,
   com_id INT,
   pro_quantité INT NOT NULL,
   pro_pri_ach DECIMAL(15,2)   NOT NULL,
   PRIMARY KEY(pro_id, com_id),
   FOREIGN KEY(pro_id) REFERENCES produit(pro_id),
   FOREIGN KEY(com_id) REFERENCES commande(com_id)
);
