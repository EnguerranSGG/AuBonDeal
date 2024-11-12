# Benchmark du gestionnaire de base de données

AuBonDeal étant une plateforme de e-commerce, les transactions seront monnaie courante, il est donc **essentiel de choisir un système de gestion de base de données qui assurera performance et sécurité**. Vous trouverez ci-dessous les raisons pour lesquelles nous avons préféré recourir à PostgreSQL plutôt qu'à MySQL.

## Les avantages de PostgreSQL sur MySQL

### Orienté objet

Pour commencer, alors que MySQL est un système de gestion de base de données relationnelles, **PostgreSQL est un système de gestion de base de données relationnelles dit « orienté objet »**. Cela signifie que, même complexes, les données peuvent être modélisées sous forme d'objets pour faciliter leur manipulation.

Pour un site de e-commerce, cela **faciliterait grandement la gestion des catalogues produits, des profils clients**, et **des transactions complexes**. Cette flexibilité permet également de modéliser facilement des relations telles que les **recommandations de produits ou les historiques d'achat**, tout en assurant une haute performance et une manipulation fluide des informations, **même en cas de forte affluence sur le site**.

### Conformité ACID

Ensuite, sans avoir recours à des moteurs de stockage ou des modules logiciels comme MySQL, **PostgreSQL respecte la conformité aux propriétés ACID** : atomicité, cohérence, isolation et durabilité. Ces propriétés sont essentielles pour AuBonDeal dans la mesure où **toutes les transactions, qu'il s'agisse d'achats, de paiements ou de mises à jour de stock, sont traitées de manière fiable et sécurisée**.

**Pour entrer dans le détail**, nous allons prendre l'**exemple des transactions**. L'**atomicité** garantit d'abord que chaque manipulation de données soit considérée comme une unité indivisible ; dans notre contexte, cela signifie que toutes les étapes d'une transaction seront exécutées ou pas du tout. 

À la moindre erreur donc, rien ne se passera, rien ne sera modifié dans la base de données. Cela **évite les erreurs partielles, comme la réduction du stock sans confirmation de paiement**. Cette atomicité vient également garantir la **cohérence** de la base de données puisque, de transaction en transaction, **elle amènera nos données d'un état valide à un autre**.

L'**isolation** quant à elle va s'assurer que **chacune des transactions soit indépendante** des autres : **deux clients ne peuvent pas acheter le dernier article d’un produit en stock** puisque les transactions concurrentes sont isolées. PostgreSQL gère cela avec des niveaux d’isolation qui permettent de choisir le degré de visibilité des transactions en cours, minimisant ainsi les conflits et les erreurs.

Enfin, la **durabilité** est **essentielle pour pérenniser la confiance des utilisateurs**. Elle assure que les **données soient toujours enregistrées de façon permanente**. Cela signifie qu'**en cas de panne**, si un client passe **une commande**, celle-ci est sécurisée et **ne sera jamais perdue**.

### Contrôle de la simultanéité multiversion 

Le **MVCC permet à plusieurs utilisateurs de lire et de modifier des données en même temps sans interférence**. Alors que MySQL utilise un système de verrous, PostgreSQL garantit ce contrôle grâce à un système de copies d'enregistrements afin de lire et de mettre à jour en toute sécurité les mêmes données en parallèle.

Ainsi, un **client peut consulter un produit pendant qu’un autre finalise son achat sur le même produit**. **Contrairement au système de verrous de MySQL**, PostgreSQL gère **cette simultanéité** en permettant à chaque transaction d’avoir une vue unique et cohérente de la base de données, ce qui **évite les blocages et les ralentissements, même en période de forte affluence**.

Cela **garantit la fluidité de l'expérience utilisateur en temps réel**. En effet, les **visiteurs du site pourront consulter le catalogue d'articles sans être affectés par** les manipulations en base de données, comme par exemple **les modifications de stock, des prix, des articles**, etc.

De plus, nous n'étions pas entrés dans le détail en parlant de l'**isolation**, mais **puisque MVCC conserve plusieurs versions d’un enregistrement, dans l'exemple du dernier article il garantit l’intégrité des stocks et des commandes**.

En effet, **si deux utilisateurs passent commande pour le dernier exemplaire d’un produit**, PostgreSQL, grâce à **MVCC, traitera uniquement la transaction de celui qui a confirmé l’achat en premier**, et l’autre utilisateur recevra une mise à jour indiquant l’indisponibilité du produit.

### L'utilisation des index 

Toujours dans l'optique de garantir la fluidité de l'expérience des visiteurs du site, l'**utilisation des index de PostgreSQL** permet un accès rapide aux données, et donc aux produits. Comme il propose différents types d'index, il **s'adapte aux divers besoins du site**. Par exemple, les index B-tree permettent de trouver rapidement les produits selon des critères de prix, tandis que les index partiels optimisent les recherches en se concentrant sur les articles en stock uniquement.

**Cette diversité d’index** garantit que les recherches des visiteurs sont traitées de manière efficace et rapide, peu importe le volume de données. Ainsi, PostgreSQL **offre une solution adaptée aux spécificités d'un site de e-commerce, en s'ajustant aux différents types de requêtes fréquentes.**

En plus d'optimiser l’accès aux produits, les index de PostgreSQL **contribuent aussi à la fluidité des processus de commande**. Lorsqu'un client passe commande, le système peut retrouver rapidement les informations nécessaires (disponibilité, prix actualisé, etc.), évitant ainsi tout ralentissement lors des transactions. Cela réduit la charge sur le serveur et améliore les performances globales, **offrant une expérience utilisateur fluide, même lors des pics de trafic, et renforçant la satisfaction et la fidélité des clients**.

## Conclusion

En choisissant PostgreSQL pour la plateforme e-commerce AuBonDeal, nous avons opté pour un système de gestion de base de données performant, sécurisé et capable de gérer les transactions complexes inhérentes à ce type de site. Grâce à ses fonctionnalités avancées : conformité ACID, gestion de la simultanéité avec MVCC et optimisation des recherches avec différents types d’index; PostgreSQL garantit une expérience utilisateur fluide et fiable, essentielle pour un e-commerce de qualité. Il assure également la pérennité des données et la sécurité des opérations, contribuant ainsi à instaurer la confiance et à améliorer la satisfaction des clients.