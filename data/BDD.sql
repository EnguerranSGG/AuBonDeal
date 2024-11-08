CREATE DATABASE AuBonDeal;

CREATE ROLE administrator WITH CREATEDB CREATEROLE LOGIN PASSWORD 'Ça cest ce que jappelle un bon gros deal!';
ALTER DATABASE aubondeal OWNER TO administrator;

CREATE TABLE Users (user_UUID UUID NOT NULL, user_pseudo varchar(15) NOT NULL, username varchar(15) NOT NULL, user_password varchar(200) NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE Orders (order_number SERIAL NOT NULL, order_total_cost_ht DECIMAL NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, deliver_at DATE NOT NULL);
CREATE ROLE visitor; 



CREATE TABLE produits

