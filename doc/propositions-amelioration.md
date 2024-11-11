# Propositions d'amélioration

Sans remettre en cause l'indégnable qualité du travail de conception que vous nous avez fourni, vous trouverez ici ensemble de suggestions visant à améliorer la gestion et la sécurité de votre site de e-commerce. 

### La table Users

#### La colonne "username"

Concernant les utilisateurs du site, il serait préférable de séparer leur nom et leur prénom plutôt que d'avoir un "username". 

#### La colonne "user_pseudo"

Aussi, afin d'éviter d'avoir plusieurs utilisateurs avec le même pseudo, il faudrait envisager d'y apposer une contrainte d'unicité. 

#### Envisager une colonne "user_email" 

Il serait pertinant de recolter l'adresse mail des utilisteurs afin de leur transmettre des informations sur leur commande mais aussi pour potentiellement leur envoyer des offres commerciales.

#### La colonne "created_at" 

La colonne created_at existant dans chaque table de la BDD, il faudrait ici préciser dans quelle table on se trouve pour eviter les doublons et les confusions. On pourrait par exemple l'appeller : "account__creation_date".

### La table Orders 

#### La colonne "created_at" 

Comme ci-dessus, la colonne created_at existant dans chaque table de la BDD, il faudrait ici préciser dans quelle table on se trouve pour eviter les doublons et les confusions. On pourrait par exemple l'appeller : "order_date".

#### La colonne "deliver_atO"

Au delà du fait qu'il y ai un "O" à la fin du nom de la colonne, "deliver_at" mériterait d'être renommé en "delivery_date". 

### La table products 

#### La colonne "created_at"

Comme ci-dessus, la colonne created_at existant dans chaque table de la BDD, il faudrait ici préciser dans quelle table on se trouve pour eviter les doublons et les confusions. On pourrait par exemple l'appeller : "product_added_date".

#### Création d'une table category

Afin de permettre aux clients de filtrer les produits, il serait approprié voir nécessaire de créer un table category.