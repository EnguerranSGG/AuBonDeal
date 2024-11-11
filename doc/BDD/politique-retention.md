# Politique de rétention 

Pour un site de e-commerce comme AuBonDeal, définir une politique de rétention des données adéquate est d'abord essentielle pour garantir le respect de la réglementation en vigueur, notemment en matière de conservation des données personnelles. 

Ensuite, d'un point de vue sécuritaire, stocker des données indéfiniment augmente les risques en cas d'attaques par injection SQL ou par force brute, plus la quantité de données sensibles est importante, plus la surface d’attaque potentielle l'est également.

Troisièment, épurer la base de données régulièrement assure son optimisation en terme de performance. En effet, plus le volume de données à traiter est important, plus cela risque d'impacter les performances des requêtes. 

Pour finir, stocker des données a un coût, particulièrement les en ce qui concerne les sauvegardes quotidiennes et les archives. Le fait de limiter la durée de conservation des données permettra de réduire ces coûts. 

## Rétention des données clients

En cas de relation client active, c'est à dire que le client se connecte plus ou moins régulièrement ou bien qu'il passe des commandes, il est approprié de conserver son compte et les données qui y sont lié. 

Cependant, si celui-ci ne se connecte pas pendant 2 ans, un rappel lui sera envoyer pour réactiver son compte. Si ce dernier ne le fait pas dans les trois mois suivants, son compte sera desactivé et ses données seront anonymisées.

## Historiques d'achats 

D'un point de vue légal, ces données doivents être conservées pendant 5 ans après l'achat. Après cette durée, il serait approprié de les conserver mais en archive, elle ne devront plus être accessibles depuis la base de donnnées principale afin de l'alléger. 

## Données de paiement

Conserver des données de paiement en base de données est plus que non-recommandé. Non seulement cela est soumis à une réglementation stricte mais en plus cela augmente exponentiellement le risque d'attaque. Il est judicieux de plutôt passer par un prestataire externaire comme PayPal afin de limiter notre responsabilité et de se conformer plus aisément à la réglementation.
