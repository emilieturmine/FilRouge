INSERT INTO
  `categorie` (`cat_id`, `cat_nom`, `cat_pho`, `cat_par`)
VALUES
  (1, 'batterie', 'c1.png', 10),
  (2, 'cable', 'c2.png', 9),
  (3, 'case', 'c3.png', 11),
  (4, 'guitare', 'c4.png', 12),
  (5, 'piano', 'c5.png', 14),
  (6, 'micro', 'c6.png', 13),
  (7, 'saxo', 'c7.png', 15),
  (8, 'sono', 'c8.png', 16),
  (9, 'accessoires', 'c9.png', NULL),
  (10, 'batteries', 'c10.png', NULL),
  (11, 'cases', 'c11.png', NULL),
  (12, 'guitares', 'c12.png', NULL),
  (13, 'studio', 'c13.png', NULL),
  (14, 'claviers', 'c14.png', NULL),
  (15, 'instruments à vents', 'c15.png', NULL),
  (16, 'sonos', 'c16.png', NULL);

  INSERT INTO
  `fournisseur` (`fou_id`, `fou_nom`, `fou_adr`,`fou_cp`,`fou_vil` )
VALUES
  (1,'roland','324 rue de la zic','79000','saxa'),
  (2,'sennheiser','48 boulebvard des airs','87000','cantigny'),
  (3,'yamaha','789 route de paris','90000','versaille'),
  (4,'berhinger','78 rue du cafe gourmand','59000','lille');


  INSERT INTO
  `utilisateur` (`uti_id`,`uti_pse`,`uti_mdp`,`uti_nom`,`uti_adr`,`uti_ema`,`uti_coe`,`uti_pre`,`uti_cp`,`uti_vil`,`rol_id`,`uti_com`)
VALUES
  (1,'In','XJN42SCO8YL','Santiago','13 rue retu','ultrices.a.auctor@accumsan.co.uk',24.00,'Dexter','80000','Amiens','client particulier',2),
  (2,'Maecenas','EGY57MUM3UN','Vasquez','2057 Curabitur Road','iaculis.quis@orci.ca',30 ,' Carol ',' 62000 ',' arras ',' admistration ',NULL),
  (3,' euismod ',' LYD05OPA7DQ ',' Cortez ', ' 287 -6448 Tincidunt Ave ',' a @sodalesmauris.co.uk ',15,' Troy ',' 30000 ',' Marseille ',' client professionnel ',2),
  
  INSERT INTO `commande` (`com_id`,`com_fac_adr`,`com_fac_cp`,`com_fac_vil`,`com_date`,`com_statut`,`uti_id`)
VALUES
  (1,'59 rue tyugkhgk','80560','khkhkkhgs','2021-04-20','livree',1),
  (2,'59 rue tyugkhgk','80560','khkhkkhgs','2021-04-20','en cours',3),
(3,'59 rue tyugkhgk','80560','khkhkkhgs','2021-04-20','en cours',1);

INSERT INTO  `livraison` (`liv_id`,`liv_dat`,`liv_adr`,`liv_cp`,`liv_vil`,`com_id`)
  VALUES
  (1,'2021-04-20','59 rue tyugkhgk','80560','khkhkkhgs',1),
  (2,'2021-04-20','59 rue tyugkhgk','80560','khkhkkhgs',3),
  (3,'2021-04-20','59 rue tyugkhgk','80560','khkhkkhgs',2);
  
  INSERT INTO `produit` (`pro_id`,`pro_ref`,`pro_lib`,`pro_des`,`pro_pri_uni`,`pro_pho`,`pro_sto`,`pro_tva`,`fou_id`,`cat_id`)
VALUES
  (1,'0633816503009',
    'Pearl - Export Rock 22',
    'Après plusieurs années d\'absence,la batterie la plus vendue de l\'histoire fait son grand retour.',
    '759.99',
    'i1.webp',
    2,
    5.5,
    1,
    1
  ),
  (
    2,
    '0019239393050',
    'Gretsch - Catalina Club CLUB 4 Futs',
    'Grosse caisse,Tom ,Stand tom ,Caisse claire ,... ',
    '669.99',
    'i2.webp',
    2,
    5.5,
    2,
    1
  ),
  (
    3,
    '0694318023808',
    'Alesis - Nitro Mesh Kit 5 Futs - 3 Cymbales',
    'Vous cherchez un kit électronique débutant ? Alesis Nitro Mesh est le premier kit à enfin rendre les pads maillés accessibles à tous.',
    '350.00',
    'i3.webp',
    3,
    5.5,
    4,
    1
  ),
  (
    4,
    '2001000237623',
    'Yamaha - Batterie électronique DTX532K',
    'DTX532K ce le kit de batterie électronique de la série 502 équipé DTX-PAD XP-80 pour la caisse claire et vrai pied de charley. ',
    '990.00',
    'i4.webp',
    1,
    16,
    3,
    1
  ),
  (
    5,
    '3700408373542',
    'Shiver - Câble jack 6,35mm longueur 3m',
    'Ce produit permet de relier toutes sources audio équipées vers un amplificateur ou une table de mixage.',
    '6.00',
    'i5.webp',
    15,16,
    1,
    2
  ),
  (
    6,
    '3700166300088',
    'Yellow cable - HP03- Câble haut parleur jack - 3 m',
    'Câble haut-parleur jack-jack  longueur de 3 mètres, suffisant pour connecter un baffle à une tête ampli.',
    '10.00',
    'i6.png',
    20,16,
    2,
    2
  ),
  (
    7,
    '3700408430672',
    'Shiver - Câble plat Jack 6.35 / Jack 6.35 6 m',
    'Câble Shiver jack 6,35 6 mètres de type plat anti emmêlement.',
    '20.00',
    'i7.webp',
    50,16,
    3,
    2
  ),
  (
    8,
    '0694318010266',
    'Guitarlink-Plus Cable Usb Jack 6.35Mm Alesis',
    'Avec le câble GuitarLink-Plus, branchez directement votre basse, votre guitare ou une source audio de niveau ligne pour enregistrement direct via le port USB de votre ordinateur.',
    '35.00',
    'i8.jpg',
    18,16,
    4,
    2
  ),
  (
    9,
    '0716408502526',
    'Gator Cases EPS ',
    'Étui pour clavier électronique (88 touches) - robuste - nylon, polyéthylène - Noir',
    '200.00',
    'i9.jpg',
    5,16,
    1,
    3
  ),
  (
    10,
    '370040838756',
    'Fender G&G Deluxe Hardshell Cases',
    'Transportez et rangez votre guitare avec style grâce à cet étui conçu spécialement pour votre instrument.',
    '300.00',
    'i10.jpg',
    2,16,
    2,
    3
  ),
  (
    11,
    '3700408361686',
    'Shiver - Housse guitare électrique standard',
    'Solide et économique, elle permettra de protéger votre guitare électrique avec sobriété et efficacité.',
    '20.00',
    'i11.webp',
    35,16,
    3,
    3
  ),
  (
    12,
    '0642388318003',
    'Zildjian - ZCB20 - Housse pour cymbales en nylon',
    'Avec la housse en nylon ZCB20 de Zildjian, vous pourrez transporter en toute sécurité et protéger vos baguettes et vos cymbales.',
    '39.00',
    'i12.jpg',
    15,16,
    4,
    3
  ),
  (
    13,
    '4515110508767',
    'Ibanez - Pack guitare Folk V50NJP-NT Naturel',
    'Le pack V series 50NJP-NT Ibanez',
    '129.00',
    'i13.webp',
    2,16,
    1,
    4
  ),
  (
    14,
    '0885978901340',
    'Fender - Malibu Player Artic Gold ',
    'Une guitare électro-acoustique à un prix abordable avec de nombreux atouts pour un musicien',
    '325.00',
    'i14.jpg',
    2,16,
    2,
    4
  ),
  (
    15,
    '4957812589017',
    'Yamaha - GSLG200S - Guitare cordes acier naturel',
    'La guitare silencieuse Yamaha SLG200S délivre une performance presque inaudible avec un son acoustique incroyablement naturel.',
    '700.00',
    'i15.webp',
    2,16,
    3,
    4
  ),
  (
    16,
    '3700166306646',
    'Guitare Classique - Estudio 3/4 - Sant Y M',
    'Développées à partir des recommandations de guitaristes classiques, en collaboration avec des luthiers ',
    '58.00',
    'i16.jpg',
    5,16,
    4,
    4
  ),
  (
    17,
    '0694318024874',
    'Akai Professional MPK Mini mk3 - Clavier maître',
    'Un contrôleur remis au goût du jour.Le MPK Mini, qui fait partie des claviers de contrôle les plus vendus au monde',
    '101.00',
    'i17.webp',
    15,16,
    1,
    5
  ),
  (
    18,
    '3700408361969',
    'Shiver - DPS200B Piano numérique Noir',
    'Le Shiver DPS200 est un piano numérique accessible sans concession.',
    '699.00',
    'i18.webp',
    1,16,
    2,
    5
  ),
  (
    19,
    '4957812638401',
    'Yamaha - Arius YDP-144 noir',
    'Le YDP-144 noir vous offre une expérience pianistique proche de celle un authentique piano à queue ',
    '929.00',
    'i19.webp',
    1,16,
    3,
    5
  ),
  (
    20,
    ' 4971850315087',
    'Casio CT-S1 - Clavier -',
    'Clavier arrangeur',
    '260.00',
    'i20.webp',
    1,16,
    4,
    5
  ),
  (
    21,
    '0042406071826',
    'Shure - SM58-LCE Microphone',
    'Les micro Shure SM57 et SM58…',
    '109.00',
    'i21webp',
    50,16,
    1,
    6
  ),
  (
    22,
    '3760010252413',
    'Prodipe - Micro ST-1 Ludovic Lanen',
    'Le ST1, conçu sur la base du STC-3D et offrant la même sonorité et les mêmes qualités',
    '120.00',
    'i22.jpg',
    5,16,
    2,
    6
  ),
  (
    23,
    '0042406391436',
    'Micro serre-tête, émetteur ceinture',
    'Micro serre-tête, émetteur ceinture et récepteur - BLX14E-PGA31-M17 ',
    '269.00',
    'i23.webp',
    70,16,
    3,
    6
  ),
  (
    24,
    '3700408388782',
    'Shiver - Pack Micro Dynamique Chant MDS-10',
    'Le micro dynamique chant MDS-10 Shiver est spécifiquement conçu pour la voix.',
    '59.99',
    'i24.jpg',
    2,16,
    4,
    6
  ),
  (
    25,
    '3700166361065',
    'Saxophone étude Alto vernis - A300',
    'Parce il est plus facile aborder la musique avec un bon instrument',
    '379.00',
    'i25.web',
    6,16,
    1,
    7
  ),
  (
    26,
    '8053251170147',
    'Alysée - A-808L - Saxophone Alto verni',
    'Caractéristiques :- Pavillon gravé- clés vernies',
    '250.00',
    'i26.jpg',
    2,16,
    2,
    7
  ),
  (
    27,
    '3700166346154',
    'SML Paris - A420-II - Saxophone Alto',
    'Le saxophone A420-II de SML Paris est un instrument idéal pour les saxophonistes débutants',
    '580.00',
    'i27.jpg',
    3,16,
    3,
    7
  ),
  (
    28,
    '3700166346963',
    'Saxophone - T620-II - Sml Paris',
    'Avec son poids maîtrisé et son ergonomie étudiée',
    '880.00',
    'i28.jpg',
    1,16,
    4,
    7
  ),
  (
    29,
    '5420047136626',
    'Madison - MAD-HP400 - Enceinte amplifiée autonome',
    'Système autonome avec batterie rechargeable intégrée, équipé du Bluetooth, entrées micro et guitare. ',
    '150.00',
    'i29.jpg',
    2,16,
    1,
    8
  ),
  (
    30,
    '5420047116192',
    'IBIZA - PORT15VHF - Enceinte portable 15',
    'En plus de sa qualité sonore exceptionnelle pour sa catégorie',
    '299.00',
    'i31.jpg',
    5,16,
    2,
    8
  ),
  (
    31,
    '4957812559690',
    'Yamaha - DBR10 Enceinte active 10',
    'La DBR10 est un modèle compact.',
    '399.00',
    'i30.webp',
    2,16,
    3,
    8
  ),
  (
    32,
    '4515260018086',
    'L-12 LIVETRACK Console de mixage',
    'L-12 LIVETRACK Console de mixage 12 voies',
    '559.00',
    'i32.webp',
    2,16,
    4,
    8
  );

  
INSERT INTO
  `ligne_de_commande` (`pro_id`, `com_id`, `pro_quantité`,`pro_pri_ach`)
VALUES
  (25, 1,  2,42),
  (12, 1, 1,580),
  (5, 1,  1,657),
  (8, 2,  1,30),
  (16, 2, 1,47),
  (28, 3, 1,789),
  (29, 3, 1,985)
  ;
