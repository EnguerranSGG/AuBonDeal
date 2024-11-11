# AuBonDeal - Base de Données

Bienvenue dans le dépôt de code source pour **AuBonDeal**, votre plateforme e-commerce performante. Notre mission consiste à développer une base de données solide et sécurisée pour AuBonDeal, permettant une gestion optimisée des opérations de vente en ligne. 

## Modèle de Données et Implémentation

Notre modèle de données a été développé en se basant sur les MCD et MLD fournis par vos soins. Les principales entités sont :
- **Users** : gestion des utilisateurs, avec les informations de connexion et le suivi des créations de comptes.
- **Orders** : suivi des commandes et de leurs informations (coût, dates).
- **Products** : gestion des produits, de leurs caractéristiques et de leurs disponibilités.
- **Order_Products** : table de liaison entre les commandes et les produits.

Chaque entité a été conçue pour optimiser les opérations CRUD, en tenant compte de la cohérence des données et des contraintes d’intégrité.

## Table des Matières

### I - Documentation 
- 1.1 : [Règles de gestion](doc/regles-gestions.md)
- 1.2 : [Benchmark du gestionnaire de BDD](doc/BDD/benchmark.md)
- 1.3 : [Politiques de rétention des données](doc/BDD/politique-retention.md)
- 1.4 : [Politique de sauvegarde des données](doc/BDD/politique-sauvegardes.md)
- 1.5 : [Dictionnaire de données](doc/BDD/dictionnaire-donnees.md)
- 1.6 : [Définition de MERISE](doc/MERISE-definition.md)
- 1.6 : [Modèle Conceptuel de Données](doc/BDD/MCD.png)
- 1.7 : [Modèle Logique de Données](doc/BDD/MLD.png)
- 1.8 : [Suggestions d'améliorations](doc/propositions-amelioration.md)

### II - Base de données
- 2.1 : [Création de la BDD, ses tables et rôles](data/tables-roles.sql)
- 2.2 : [Premier peuplement de la BDD](data/seed-data.sql)
- 2.3 : [Première sauvegarde](data/Sauvegardes/manual_backup_20241111.sql)

---

Nous vous remercions pour votre confiance et restons à votre disposition pour toute question ou besoin d’assistance concernant ce projet.

## Authors

- [@EnguerranSGG](https://github.com/EnguerranSGG)


