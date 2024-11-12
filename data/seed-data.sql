/* Installation de l'extension pour hasher et saler les mots-de-passe utilisateurs */

CREATE EXTENSION IF NOT EXISTS pgcrypto;

/* Données à insérer dans la base de données une fois les tables crées */

INSERT INTO Users (username, user_pseudo, user_password) VALUES
    ('Alice', 'alice123', crypt('password123', gen_salt('bf'))),
    ('Bob', 'bob321', crypt('qwerty123', gen_salt('bf'))),
    ('Carol', 'carol_b', crypt('letmein', gen_salt('bf'))),
    ('Dave', 'davey_d', crypt('hunter2', gen_salt('bf'))),
    ('Eve', 'eve_e', crypt('abc123', gen_salt('bf'))),
    ('Frank', 'frank_f', crypt('password1', gen_salt('bf'))),
    ('Grace', 'grace_g', crypt('123456', gen_salt('bf'))),
    ('Hank', 'hank_h', crypt('iloveyou', gen_salt('bf'))),
    ('Iris', 'iris_ivy', crypt('welcome', gen_salt('bf'))),
    ('Jack', 'jack_j', crypt('password!', gen_salt('bf')));

INSERT INTO Products (product_name, product_description, product_price, product_quantity) VALUES
    ('Smartphone', 'Smartphone avec écran 6.5" et caméra 12MP', 299.99, 50),
    ('Laptop', 'Ordinateur portable avec processeur i7 et 16GB RAM', 899.99, 30),
    ('Casque Bluetooth', 'Casque audio sans fil avec réduction de bruit', 99.99, 100),
    ('Montre Connectée', 'Montre avec suivi de la fréquence cardiaque', 149.99, 60),
    ('T-shirt Homme', 'T-shirt en coton, taille M, couleur noire', 19.99, 200),
    ('Chaussures Running', 'Chaussures de course légères et confortables', 59.99, 120),
    ('Livre: "Le Petit Prince"', 'Le célèbre livre d''Antoine de Saint-Exupéry', 12.99, 150),
    ('Sac à Dos', 'Sac à dos imperméable, idéal pour les randonnées', 39.99, 80),
    ('Écouteurs sans fil', 'Écouteurs Bluetooth avec bonne qualité sonore', 49.99, 200),
    ('Appareil Photo', 'Appareil photo numérique avec zoom optique 5x', 499.99, 25),
    ('Tablette', 'Tablette 10" avec 64GB de stockage', 199.99, 40),
    ('Batterie Externe', 'Batterie portable 10,000mAh pour recharger vos appareils', 29.99, 100),
    ('Couteau de Cuisine', 'Couteau de cuisine de qualité professionnelle', 49.99, 150),
    ('Veste de Pluie', 'Veste imperméable, taille L', 79.99, 70),
    ('Manteau Hiver', 'Manteau en laine pour l''hiver, taille XL', 129.99, 40),
    ('Chaise Bureau', 'Chaise ergonomique pour bureau avec réglage de hauteur', 119.99, 60),
    ('Lampe LED', 'Lampe de bureau à LED avec réglage de luminosité', 25.99, 200),
    ('Table de Salon', 'Table basse en bois avec finition vernie', 149.99, 30),
    ('Fauteuil Confort', 'Fauteuil en cuir pour salon', 199.99, 40),
    ('Cafetiere', 'Cafetière à filtre avec réservoir de 1.2L', 59.99, 80),
    ('Mixer', 'Blender puissant pour smoothies', 39.99, 60),
    ('Micro-ondes', 'Micro-ondes avec fonction grill', 129.99, 50),
    ('Réfrigérateur', 'Réfrigérateur double porte avec congélateur', 399.99, 20),
    ('Lave-linge', 'Lave-linge avec fonction séchage', 299.99, 15),
    ('Aspirateur', 'Aspirateur sans sac, 2000W', 99.99, 70),
    ('Gants de Sport', 'Gants pour sport d''hiver, taille M', 29.99, 150),
    ('Tapis de Yoga', 'Tapis de yoga antidérapant, 180x60cm', 19.99, 100),
    ('Couteau de Poche', 'Couteau multifonctions pour outdoor', 24.99, 120),
    ('Trampoline', 'Trampoline extérieur pour enfants, diamètre 3m', 299.99, 25),
    ('Vélo de Route', 'Vélo de route avec cadre en aluminium', 499.99, 40),
    ('Chaise Longue', 'Chaise longue pour jardin en bois', 79.99, 60),
    ('Barbecue', 'Barbecue à charbon, 3 niveaux de cuisson', 89.99, 30),
    ('Lunettes de Soleil', 'Lunettes de soleil avec protection UV 400',19.99, 100),
    ('Tente Camping', 'Tente 4 personnes avec imperméabilité 3000mm', 119.99, 20),
    ('Sac de Couchage', 'Sac de couchage 3 saisons, taille XL', 49.99, 50),
    ('Pelle à Neige', 'Pelle en métal pour déneiger', 14.99, 100),
    ('Gilet de Sauvetage', 'Gilet de sauvetage pour la mer, taille M', 29.99, 70),
    ('Cage de Transport Animaux', 'Cage de transport pour chien, taille L', 39.99, 40),
    ('Litière pour Chat', 'Litière pour chat, taille XXL', 19.99, 90),
    ('Cage à Oiseaux', 'Cage à oiseaux avec perchoirs et accessoires', 59.99, 50),
    ('Pèse Personne', 'Pèse-personne digital, capacité 180kg', 29.99, 80),
    ('Lampe de Nuit', 'Lampe LED pour chambre d''enfant, avec veilleuse', 15.99, 120),
    ('Horloge Murale', 'Horloge murale moderne avec affichage numérique', 19.99, 100),
    ('Calendrier 2023', 'Calendrier mural avec photos de paysages', 9.99, 150),
    ('Portefeuille en Cuir', 'Portefeuille en cuir, coloris marron', 29.99, 200),
    ('Ceinture en Cuir', 'Ceinture en cuir, taille réglable', 19.99, 150),
    ('Pantalon de Jean', 'Jean homme coupe droite, taille 32', 39.99, 100),
    ('Jupe Femme', 'Jupe en coton, taille M', 29.99, 80),
    ('Chemise Homme', 'Chemise à manches longues, taille L', 49.99, 90),
    ('Robe de Soirée', 'Robe de soirée élégante, taille S', 79.99, 50),
    ('Parapluie', 'Parapluie de poche, ultra compact', 12.99, 150),
    ('Souris Sans Fil', 'Souris sans fil avec ergonomie améliorée', 29.99, 120),
    ('Clé USB 32GB', 'Clé USB 3.0 avec capacité de 32GB', 19.99, 200),
    ('Chargeur Sans Fil', 'Chargeur sans fil pour smartphones', 29.99, 150),
    ('Haut-Parleur Bluetooth', 'Haut-parleur Bluetooth portable, 10h d''autonomie', 49.99, 100),
    ('Câble HDMI', 'Câble HDMI 2.0 pour TV et consoles de jeux', 9.99, 200),
    ('Adaptateur USB-C', 'Adaptateur USB-C vers USB-A', 14.99, 150),
    ('Disque Dur Externe 1TB', 'Disque dur externe 1TB USB 3.0', 59.99, 50);

INSERT INTO Orders (order_total_cost_ht, deliver_atO, user_UUID) 
 VALUES (
     (SELECT p.product_price FROM Products p WHERE p.product_name = 'Smartphone') + 
     (SELECT p.product_price FROM Products p WHERE p.product_name = 'Trampoline'), 
     '2024-12-22', 
     (SELECT u.user_uuid FROM users u WHERE u.username = 'Alice')
 ),
 (
     (SELECT p.product_price FROM Products p WHERE p.product_name = 'Parapluie') + 
     (SELECT p.product_price FROM Products p WHERE p.product_name = 'Barbecue'), 
     '2024-11-13', 
     (SELECT u.user_uuid FROM users u WHERE u.username = 'Bob')
 ),
 (
     (SELECT p.product_price FROM Products p WHERE p.product_name = 'Câble HDMI'),
     '2024-11-13', 
     (SELECT u.user_uuid FROM users u WHERE u.username = 'Carol')
 );

INSERT INTO Order_products (order_number, product_UUID)
VALUES
    ((SELECT order_number FROM Orders WHERE user_UUID = (SELECT user_UUID FROM Users WHERE username = 'Alice')), 
     (SELECT product_UUID FROM Products WHERE product_name = 'Smartphone')),
    ((SELECT order_number FROM Orders WHERE user_UUID = (SELECT user_UUID FROM Users WHERE username = 'Alice')), 
     (SELECT product_UUID FROM Products WHERE product_name = 'Trampoline'));

INSERT INTO Order_products (order_number, product_UUID)
VALUES
    ((SELECT order_number FROM Orders WHERE user_UUID = (SELECT user_UUID FROM Users WHERE username = 'Bob')), 
     (SELECT product_UUID FROM Products WHERE product_name = 'Parapluie')),
    ((SELECT order_number FROM Orders WHERE user_UUID = (SELECT user_UUID FROM Users WHERE username = 'Bob')), 
     (SELECT product_UUID FROM Products WHERE product_name = 'Barbecue'));

INSERT INTO Order_products (order_number, product_UUID)
VALUES
    ((SELECT order_number FROM Orders WHERE user_UUID = (SELECT user_UUID FROM Users WHERE username = 'Carol')), 
     (SELECT product_UUID FROM Products WHERE product_name = 'Câble HDMI'));