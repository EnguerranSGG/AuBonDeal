--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Homebrew)
-- Dumped by pg_dump version 16.4 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: order_products; Type: TABLE; Schema: public; Owner: administrator
--

CREATE TABLE public.order_products (
    order_number integer NOT NULL,
    product_uuid uuid NOT NULL
);


ALTER TABLE public.order_products OWNER TO administrator;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: administrator
--

CREATE TABLE public.orders (
    order_number integer NOT NULL,
    order_total_cost_ht numeric(10,2) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    deliver_ato date NOT NULL,
    user_uuid uuid
);


ALTER TABLE public.orders OWNER TO administrator;

--
-- Name: orders_order_number_seq; Type: SEQUENCE; Schema: public; Owner: administrator
--

CREATE SEQUENCE public.orders_order_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_number_seq OWNER TO administrator;

--
-- Name: orders_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: administrator
--

ALTER SEQUENCE public.orders_order_number_seq OWNED BY public.orders.order_number;


--
-- Name: products; Type: TABLE; Schema: public; Owner: administrator
--

CREATE TABLE public.products (
    product_uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    product_name character varying(60) NOT NULL,
    product_description character varying(200),
    product_price numeric(10,2) NOT NULL,
    product_quantity integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.products OWNER TO administrator;

--
-- Name: users; Type: TABLE; Schema: public; Owner: administrator
--

CREATE TABLE public.users (
    user_uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_pseudo character varying(15) NOT NULL,
    username character varying(15) NOT NULL,
    user_password character varying(64) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO administrator;

--
-- Name: orders order_number; Type: DEFAULT; Schema: public; Owner: administrator
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_number SET DEFAULT nextval('public.orders_order_number_seq'::regclass);


--
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: administrator
--

COPY public.order_products (order_number, product_uuid) FROM stdin;
1	37684bd8-abb4-47dc-bebc-4d39b5110fdb
1	6e0d3247-8f37-41a1-a2ff-476825499f98
2	8d38362e-7c9a-4055-901b-0fdb474ce8de
2	7c163569-5c05-46ba-8fee-85b81d159b33
3	79b075b3-043c-49b4-bb2d-c1be655f47b3
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: administrator
--

COPY public.orders (order_number, order_total_cost_ht, created_at, deliver_ato, user_uuid) FROM stdin;
1	599.98	2024-11-11 12:32:55.151766	2024-12-22	15063d91-cf86-43c0-a4df-d0d3813e29d1
2	102.98	2024-11-11 12:32:55.151766	2024-11-13	3cc13efc-0fff-4b6d-b707-686d22be31d1
3	9.99	2024-11-11 12:32:55.151766	2024-11-13	9132f513-cbc7-4625-b1d9-4ef4d31a4bf0
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: administrator
--

COPY public.products (product_uuid, product_name, product_description, product_price, product_quantity, created_at, updated_at) FROM stdin;
37684bd8-abb4-47dc-bebc-4d39b5110fdb	Smartphone	Smartphone avec écran 6.5" et caméra 12MP	299.99	50	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
bf493294-e254-4faf-b0af-cddcfbad978d	Laptop	Ordinateur portable avec processeur i7 et 16GB RAM	899.99	30	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
d136d3d1-0cc5-4397-ad2a-070786a0ca61	Casque Bluetooth	Casque audio sans fil avec réduction de bruit	99.99	100	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
4d7f3857-2271-4f71-83f9-f6b37b3e3f64	Montre Connectée	Montre avec suivi de la fréquence cardiaque	149.99	60	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
b0959cca-4a80-406a-b56d-18d6fbc21e80	T-shirt Homme	T-shirt en coton, taille M, couleur noire	19.99	200	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
2b56b371-87da-4530-b5db-aa7e30efa2b2	Chaussures Running	Chaussures de course légères et confortables	59.99	120	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
b2d5e598-9de8-40b4-95b7-9581ed7b0ea8	Livre: "Le Petit Prince"	Le célèbre livre d'Antoine de Saint-Exupéry	12.99	150	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
2c34a502-8219-46e5-b2f9-c204d36e01cd	Sac à Dos	Sac à dos imperméable, idéal pour les randonnées	39.99	80	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
3dd829df-5d96-4d08-91c4-121836190370	Écouteurs sans fil	Écouteurs Bluetooth avec bonne qualité sonore	49.99	200	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
47b6cc9c-44c6-412f-88a4-a55323930a45	Appareil Photo	Appareil photo numérique avec zoom optique 5x	499.99	25	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
39925715-539e-4ce7-95d8-d6bd4a4f3c7f	Tablette	Tablette 10" avec 64GB de stockage	199.99	40	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
6c2c2235-2a20-4fd3-8ce8-c2b4cefb3011	Batterie Externe	Batterie portable 10,000mAh pour recharger vos appareils	29.99	100	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
daf51224-eb6c-4f00-a089-4322db1ec0df	Couteau de Cuisine	Couteau de cuisine de qualité professionnelle	49.99	150	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
1b113f60-2994-4dbd-98da-f726fa5cf2a5	Veste de Pluie	Veste imperméable, taille L	79.99	70	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
df297397-6008-43b9-bbcc-08d9cf483a35	Manteau Hiver	Manteau en laine pour l'hiver, taille XL	129.99	40	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
1356912b-7e5a-4292-9b86-e6c227d5ea1a	Chaise Bureau	Chaise ergonomique pour bureau avec réglage de hauteur	119.99	60	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
53269052-9011-4f25-a107-bf4d73b3d7b0	Lampe LED	Lampe de bureau à LED avec réglage de luminosité	25.99	200	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
7bce7c2b-14a2-475c-96a9-87e9a75c057b	Table de Salon	Table basse en bois avec finition vernie	149.99	30	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
c58d3255-3d8a-44a9-944e-acc68fceb8a5	Fauteuil Confort	Fauteuil en cuir pour salon	199.99	40	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
37b4f1f5-88ce-4d2c-9e57-2d32a7ec74f6	Cafetiere	Cafetière à filtre avec réservoir de 1.2L	59.99	80	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
17f9b66b-6c13-486d-ac9c-e9610ea37cae	Mixer	Blender puissant pour smoothies	39.99	60	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
3c148cb9-14fd-4cbd-a595-a7ccb97e3db7	Micro-ondes	Micro-ondes avec fonction grill	129.99	50	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
46ecce5e-2207-4695-87ea-2b3bf692b970	Réfrigérateur	Réfrigérateur double porte avec congélateur	399.99	20	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
5b444c0a-403d-40a9-92b2-1c25450a22c0	Lave-linge	Lave-linge avec fonction séchage	299.99	15	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
cf84a547-2f4c-451a-aa26-53b08071a36c	Aspirateur	Aspirateur sans sac, 2000W	99.99	70	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
22d22cb9-a721-4f5d-ad62-09ccf0e715c8	Gants de Sport	Gants pour sport d'hiver, taille M	29.99	150	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
abed6860-e4e4-42a9-9af4-6e5534aca23a	Tapis de Yoga	Tapis de yoga antidérapant, 180x60cm	19.99	100	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
9faf590d-2fcb-44bf-8a8f-fd7a80c79787	Couteau de Poche	Couteau multifonctions pour outdoor	24.99	120	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
6e0d3247-8f37-41a1-a2ff-476825499f98	Trampoline	Trampoline extérieur pour enfants, diamètre 3m	299.99	25	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
9fd99f95-b8e6-4985-9703-bc7090352242	Vélo de Route	Vélo de route avec cadre en aluminium	499.99	40	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
b7d4b685-8cab-4f7b-a90f-13b7ccd63540	Chaise Longue	Chaise longue pour jardin en bois	79.99	60	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
7c163569-5c05-46ba-8fee-85b81d159b33	Barbecue	Barbecue à charbon, 3 niveaux de cuisson	89.99	30	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
f483e26a-dc5e-4558-a759-59f50dbd68ef	Lunettes de Soleil	Lunettes de soleil avec protection UV 400	19.99	100	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
f09f37f3-fa4f-4bfb-90c5-fb748087d844	Tente Camping	Tente 4 personnes avec imperméabilité 3000mm	119.99	20	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
7c953f15-0af5-4ea0-941c-8ef41dd8a873	Sac de Couchage	Sac de couchage 3 saisons, taille XL	49.99	50	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
82812400-af83-47e4-b2ca-c82479bd6cda	Pelle à Neige	Pelle en métal pour déneiger	14.99	100	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
09d2f55c-0c12-4292-be72-15af6592b9e8	Gilet de Sauvetage	Gilet de sauvetage pour la mer, taille M	29.99	70	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
8bf440eb-59fe-4326-a2fb-e2a75fd77eed	Cage de Transport Animaux	Cage de transport pour chien, taille L	39.99	40	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
820164ac-f277-48d0-90b2-bd02a1aa88e1	Litière pour Chat	Litière pour chat, taille XXL	19.99	90	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
c2645b00-5ed4-4766-9c9d-593428829018	Cage à Oiseaux	Cage à oiseaux avec perchoirs et accessoires	59.99	50	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
e59db2e7-e8bc-4575-81a4-1afe1bf22ac7	Pèse Personne	Pèse-personne digital, capacité 180kg	29.99	80	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
51930ded-19d2-4a24-8403-2e458c5e5925	Lampe de Nuit	Lampe LED pour chambre d'enfant, avec veilleuse	15.99	120	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
2115a278-44be-41d9-8377-0a014a64ae5c	Horloge Murale	Horloge murale moderne avec affichage numérique	19.99	100	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
2b94b2bd-715c-478b-89df-f357ca455431	Calendrier 2023	Calendrier mural avec photos de paysages	9.99	150	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
5c47f73f-7052-4a8b-80cd-18bba422d5db	Portefeuille en Cuir	Portefeuille en cuir, coloris marron	29.99	200	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
d1515fd8-77cc-48b9-9f36-9454a04be578	Ceinture en Cuir	Ceinture en cuir, taille réglable	19.99	150	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
c1e8a71e-1390-4161-a82c-eab81e5de175	Pantalon de Jean	Jean homme coupe droite, taille 32	39.99	100	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
bd3d3e48-6621-4f77-af41-2cdf3d8cb1cc	Jupe Femme	Jupe en coton, taille M	29.99	80	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
75f87fd6-0840-4007-b8f5-7a25f8ddca82	Chemise Homme	Chemise à manches longues, taille L	49.99	90	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
3652b4d7-0f1f-4a2d-b6e6-30825be37b93	Robe de Soirée	Robe de soirée élégante, taille S	79.99	50	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
8d38362e-7c9a-4055-901b-0fdb474ce8de	Parapluie	Parapluie de poche, ultra compact	12.99	150	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
c551c973-fa52-41df-a852-61396b685d24	Souris Sans Fil	Souris sans fil avec ergonomie améliorée	29.99	120	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
f9f77555-2856-42f5-a7dc-8ef8ed1aba60	Clé USB 32GB	Clé USB 3.0 avec capacité de 32GB	19.99	200	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
1cfe31cc-2155-4455-80f1-d929ec000592	Chargeur Sans Fil	Chargeur sans fil pour smartphones	29.99	150	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
16ca4f5e-4954-43e9-8c73-87c9115f76cd	Haut-Parleur Bluetooth	Haut-parleur Bluetooth portable, 10h d'autonomie	49.99	100	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
79b075b3-043c-49b4-bb2d-c1be655f47b3	Câble HDMI	Câble HDMI 2.0 pour TV et consoles de jeux	9.99	200	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
963e4674-a52c-4755-b1e6-96841299f6db	Adaptateur USB-C	Adaptateur USB-C vers USB-A	14.99	150	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
03035561-3bd8-4451-b619-629e9ce5c46f	Disque Dur Externe 1TB	Disque dur externe 1TB USB 3.0	59.99	50	2024-11-11 12:32:43.101487	2024-11-11 12:32:43.101487
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: administrator
--

COPY public.users (user_uuid, user_pseudo, username, user_password, created_at) FROM stdin;
15063d91-cf86-43c0-a4df-d0d3813e29d1	alice123	Alice	$2a$06$PkSCIuJx/EKrV7hgqvjxE.gpZRq4pXmxTmoKC/FtodNAaUpzNdSxS	2024-11-11 12:32:29.885709
3cc13efc-0fff-4b6d-b707-686d22be31d1	bob321	Bob	$2a$06$XdGxd6QoJfrKlulKNdjmkOkPV74tDMZicLCKLZMa1D2yZ50iqhjly	2024-11-11 12:32:29.885709
9132f513-cbc7-4625-b1d9-4ef4d31a4bf0	carol_b	Carol	$2a$06$ouommo/ojb6P0st1NzrS7u9rUH.89bZ3yUNx1Gq5U2GsO8iiIJ1ZC	2024-11-11 12:32:29.885709
73e94eab-26f5-4631-a5d3-1ffb1627b6c4	davey_d	Dave	$2a$06$s29wE.XEyFBiob0ihhOCz.NZLRbV8q/.yIJGLXQzMXErAd8Cjp5y6	2024-11-11 12:32:29.885709
8c299ae1-ac7f-4d3d-9c5a-3b26fff9a8c6	eve_e	Eve	$2a$06$yTCxWhfOOQkiWJn5dO//FORIUbQnqvEEIMTmLDZGhc2k/y4dfDI7C	2024-11-11 12:32:29.885709
50a45bba-92b7-4e22-a3fd-aaff9e37ac95	frank_f	Frank	$2a$06$ZOJLycXeL.HWei8hXBN.neVASpBLZbFtsP6h68CNgYlXHEzKTFTKa	2024-11-11 12:32:29.885709
30bb0fb0-9469-4eee-ab44-12453e521644	grace_g	Grace	$2a$06$SVCEg/OB/vr683IMnggfReK.m.JFU2GUBx1L0uDZ3L70gTWR5akMC	2024-11-11 12:32:29.885709
c1efb411-633a-40ea-8b28-038c6ebf579e	hank_h	Hank	$2a$06$qDTmOdzA.DAg2Vbjjqthg.zbF29K0/qhVLxJvUQrpyhYl/Ufu4sM2	2024-11-11 12:32:29.885709
cfc76522-42f3-4df5-bd0f-825fa038eda2	iris_ivy	Iris	$2a$06$EF2.6qUDVR4D8ggCgq10U.1AYEWTe31YtropGJGgodNpCr17NKKZm	2024-11-11 12:32:29.885709
a54b1469-1fb3-47f6-a0a5-61e9490465a8	jack_j	Jack	$2a$06$5USmSIE1TxzdDOwKXAg0yOfGsXP7FVFEvo4FkEhP0wyAdW9RlQFPe	2024-11-11 12:32:29.885709
\.


--
-- Name: orders_order_number_seq; Type: SEQUENCE SET; Schema: public; Owner: administrator
--

SELECT pg_catalog.setval('public.orders_order_number_seq', 3, true);


--
-- Name: order_products order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: administrator
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (order_number, product_uuid);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: administrator
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_number);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: administrator
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_uuid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: administrator
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_uuid);


--
-- Name: order_products order_products_order_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: administrator
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_order_number_fkey FOREIGN KEY (order_number) REFERENCES public.orders(order_number);


--
-- Name: order_products order_products_product_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: administrator
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_product_uuid_fkey FOREIGN KEY (product_uuid) REFERENCES public.products(product_uuid);


--
-- Name: orders orders_user_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: administrator
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_uuid_fkey FOREIGN KEY (user_uuid) REFERENCES public.users(user_uuid) ON DELETE CASCADE;


--
-- Name: TABLE order_products; Type: ACL; Schema: public; Owner: administrator
--

GRANT SELECT ON TABLE public.order_products TO customer;


--
-- Name: TABLE orders; Type: ACL; Schema: public; Owner: administrator
--

GRANT SELECT ON TABLE public.orders TO customer;
GRANT SELECT ON TABLE public.orders TO vendor;


--
-- Name: TABLE products; Type: ACL; Schema: public; Owner: administrator
--

GRANT SELECT ON TABLE public.products TO visitor;
GRANT SELECT ON TABLE public.products TO customer;
GRANT SELECT,INSERT,UPDATE ON TABLE public.products TO vendor;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: administrator
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.users TO customer;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: enguerransmagghe
--

ALTER DEFAULT PRIVILEGES FOR ROLE enguerransmagghe IN SCHEMA public GRANT SELECT ON TABLES TO administrator;


--
-- PostgreSQL database dump complete
--

