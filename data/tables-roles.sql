/* Création de la base */ 
/* Création de la base de données */

CREATE DATABASE AuBonDeal;

/* Création d'un rôle administrateur et attribution de la BDD */

CREATE ROLE administrator WITH CREATEDB CREATEROLE LOGIN PASSWORD 'Ça cest ce que jappelle un bon gros deal!';
ALTER DATABASE aubondeal OWNER TO administrator;

/* Accorde les droits nécessaire à la mise en place d'une sauvegarde quotidienne */

GRANT SELECT ON ALL TABLES IN SCHEMA public TO administrator;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO administrator;

/* Installation de l'extension pour générer les UUID */

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

/* Création  des tables */

CREATE TABLE Users (
    user_UUID UUID PRIMARY KEY DEFAULT uuid_generate_v4(), 
    user_pseudo varchar(15) NOT NULL, 
    username varchar(15) NOT NULL, 
    user_password varchar(64) NOT NULL, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE Orders (
    order_number SERIAL NOT NULL PRIMARY KEY, 
    order_total_cost_ht DECIMAL(10, 2) NOT NULL, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    deliver_atO DATE NOT NULL, 
    user_UUID UUID REFERENCES users(user_UUID) ON DELETE CASCADE);

CREATE TABLE Products (
    product_UUID UUID PRIMARY KEY DEFAULT uuid_generate_v4(), 
    product_name VARCHAR(60) NOT NULL, 
    product_description VARCHAR(200), 
    product_price DECIMAL(10, 2) NOT NULL, 
    product_quantity INTEGER NOT NULL, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP); 

CREATE TABLE Order_products (
    order_number INTEGER, 
    product_UUID UUID, 
    PRIMARY KEY (order_number, product_UUID), 
    FOREIGN KEY (order_number) REFERENCES orders(order_number),
    FOREIGN KEY (product_UUID) REFERENCES products(product_UUID));

/* Attribution des permissions pour les visteurs du site */

CREATE ROLE visitor;
GRANT SELECT ON TABLE products TO visitor;

/* Attribution des permissions aux clients du site */

CREATE ROLE customer;
GRANT SELECT ON TABLE products TO customer;
GRANT SELECT, INSERT, UPDATE ON TABLE users TO customer;
GRANT SELECT ON TABLE orders TO customer;
GRANT SELECT ON TABLE order_products TO customer;

/* Attribution des permissions aux vendeurs sur le site */

CREATE ROLE vendor;
GRANT SELECT, INSERT, UPDATE ON TABLE products TO vendor;
GRANT SELECT ON TABLE orders TO vendor;

