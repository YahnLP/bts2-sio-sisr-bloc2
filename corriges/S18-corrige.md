# Corrigé – S18 : Dossier numérique et entraînement à l'épreuve

*Réservé à l'enseignant.*

## Partie A – Dossier

Contrôle sur les points de l'annexe VII : deux fiches, éléments constitutifs (ressources matérielles et ​logicielles, schémas, documentation), modalités d'accès. Le **test d'accès** doit se faire depuis un autre poste et un autre réseau. Un lien privé, expiré, ou protégé par un compte inconnu est le défaut le plus fréquent.

## Partie B – Analyse des trois expressions (exemples d'attendus)

| Expression | Exigences clés | Plan (60 min) | Critères de recette |
|---|---|---|---|
| 1 (troisième serveur web) | ​Ajouter un serveur, sondes de santé, état dans la supervision, alerte à l'arrêt | 10 min préparer le serveur · 15 min répartiteur et sonde · 15 min supervision et alerte · 10 min tests · 10 min documentation | Trois serveurs en alternance ; arrêt d'un serveur sans coupure ; alerte reçue |
| 2 (agence 2) | ​Nouveau tunnel, isolement entre les agences, plan d'adressage à jour | 10 min plan d'adressage · 20 min configuration des deux extrémités · 10 min filtrage · 10 min tests · 10 min documentation | Ping siège ↔ agence 2 ; **échec** de agence 2 → agence 1 ; agence 1 non interrompue |
| 3 (sauvegarde) | Détecter et notifier un échec ; restauration testée ; prévenir la ​saturation | 10 min diagnostic · 20 min alerte · 15 min restauration · 10 min rotation/seuil · 5 min rapport d'incident | Échec simulé → alerte ; restauration et `sha256sum` identiques ; disque < 80 % |

L'expression 2 contient une **contrainte négative** (l'agence 2 ne doit pas accéder à l'agence 1) : vérifier que l'élève la repère.

## Partie C – Rédaction d'une expression

Une bonne expression : un seul sujet, observable, avec ​contraintes chiffrées, **réalisable en 45 minutes de réalisation**. Trop longue : plusieurs objectifs ou un élément absent de la réalisation. Trop courte : modification triviale.

## Partie D – Version courte

Grille de l'observateur : exiger un **fait** pour chaque niveau. Points de vigilance fréquents :

- candidat qui perd 15 minutes à retrouver ses accès : dossier d'accès incomplet ;
- ​absence d'instantané avant modification ;
- pas de preuve datée prise en route ;
- recette improvisée, sans scénario ;
- erreur traitée mais non notée.

## Bilan de compétences

Auto-évaluation ; B2.1, B2.2 et B2.3 proposées, à valider.
