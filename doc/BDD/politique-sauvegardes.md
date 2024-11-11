# Politique de sauvegardes 

Pour garantir la sécurité et la pérennité des données de votre site e-commerce, il est essentiel d'automatiser les sauvegardes régulières de la base de données. Dans un environnement Linux, cela peut être réalisé en utilisant des "cron jobs" ("tâches planifiées"), qui permettent de programmer l'exécution de commandes ou de scripts à des intervalles prédéfinis.

## Mise en place

Pour mettre en place une sauvegarde automatique de la base de données de votre site e-commerce, suivez les étapes suivantes.

1. **Ouvrir le Crontab** : Pour éditer les tâches cron de l’utilisateur actuel, utilisez la commande suivante dans le terminal :
   ```bash
   crontab -e
   ```
   Cette commande ouvre le fichier crontab de l'utilisateur dans l'éditeur de texte par défaut.

2. **Ajouter une Tâche Cron pour la Sauvegarde** : Pour planifier une sauvegarde quotidienne de la base de données à 3 heures du matin, ajoutez la ligne suivante au fichier crontab :
   ```bash
   0 3 * * * /opt/homebrew/opt/postgresql@16/bin/pg_dump -U administrator aubondeal > /Users/enguerransmagghe/CDA/AuBonDeal/data/Sauvegardes/backup_$(date +\%Y\%m\%d).sql
   ```

Voici ce que signifie cette ligne :

- **0 3 * * *** : Cette expression indique que la commande doit être exécutée chaque jour à 3 heures du matin.
- **/opt/homebrew/opt/postgresql@16/bin/pg_dump** : Spécifie le chemin du programme `pg_dump`, qui est utilisé pour exporter les données de la base PostgreSQL.
- **-U enguerransmagghe aubondeal** : Définit l'utilisateur de la base de données (`enguerransmagghe`) et le nom de la base de données (`aubondeal`) à sauvegarder.
- **> /Users/enguerransmagghe/CDA/AuBonDeal/data/Sauvegardes/backup_$(date +\%Y\%m\%d).sql** : Définit l'emplacement et le nom du fichier de sauvegarde. Le nom inclut la date du jour, ce qui permet de créer un fichier distinct pour chaque sauvegarde quotidienne.

## Pourquoi Sauvegarder à 3 heures du Matin ?

Le choix de 3 heures du matin pour effectuer les sauvegardes quotidiennes de la base de données repose sur plusieurs raisons spécifiques au contexte d’un site e-commerce :

- **Faible Affluence** : À 3 heures du matin, le nombre de visiteurs et d'achats sur le site est généralement faible. En exécutant la sauvegarde à ce moment-là, on minimise l'impact sur les performances de la base de données, car il y a moins d'utilisateurs en ligne.

- **Impact Limité sur les Ressources** : Les sauvegardes peuvent nécessiter des ressources importantes (CPU, mémoire, espace disque). Programmer les sauvegardes en dehors des heures de pointe permet de réduire les risques de ralentissements pour les utilisateurs, améliorant ainsi leur expérience lorsqu’ils naviguent sur le site pendant les heures d’activité normales.

- **Facilité de Maintenance** : Programmer les tâches de sauvegarde la nuit permet de disposer de sauvegardes récentes pour le début de chaque journée. En cas d'incident survenu dans la journée, la restauration peut se faire à partir de la sauvegarde de la veille, ce qui limite la perte de données.

## Avantages de cette Configuration de Sauvegarde

- **Sécurité des Données** : En automatisant les sauvegardes, on assure la conservation des données de manière régulière et fiable, en cas de panne, de corruption de données, ou d'attaque.
- **Historique de Sauvegardes** : En incluant la date dans le nom du fichier, cette configuration permet de conserver un historique des sauvegardes, facilitant ainsi le retour en arrière vers une date précise en cas de problème.
- **Gestion Optimisée des Ressources** : En programmant la tâche en dehors des heures de forte activité, la charge sur le système est mieux répartie, assurant ainsi un bon fonctionnement de la base de données même pendant les sauvegardes.
