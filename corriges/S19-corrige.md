# Corrigé et guide de l'enseignant – S19 : Épreuve blanche E6

*Réservé à l'enseignant. L'organisation s'inspire de la proposition de la circulaire 2026 (annexe VII-4) : 30 min de ​préparation sur table, 20 min d'entretien d'explicitation, 60 min de réalisation (marge technique de 10 min), 20 min de recette. Maximum conseillé par la circulaire : **cinq candidats par jour et par commission**, et **deux environnements exploitables en même temps**.*

## Organisation pour une classe

| Élément | Recommandation |
|---|---|
| Commissions | Deux enseignants/formateurs, ou un enseignant et un pair formé ; à défaut, des élèves non passants encadrés |
| Environnements | Deux postes d'environnement par ​commission (un candidat en réalisation, un en préparation) |
| Planning | Candidat n : P → E1 → R → E2 ; décaler d'environ 1 h 30 les candidats suivants |
| Durée totale | Prévoir une journée ou plusieurs séances selon l'effectif |
| Élèves non passants | Jouent la ​commission ou l'observateur, ou finalisent leur dossier |
| Matériel | Poste de commission autonome avec imprimante pour les expressions des besoins |
| Personne ressource | Présente pendant toute la durée |

## Préparation de la commission

1. Lire les **deux fiches** de chaque candidat avant la journée.
2. **Choisir la ​réalisation** et rédiger l'**expression des besoins** (annexe VII-3), circonscrite à 60 minutes.
3. Vérifier que l'expression est **réalisable** (tester soi-même si possible).
4. Prévoir la **grille d'aide à l'évaluation** (annexe VII-5-A), la **fiche d'appréciation** (VII-6) et la liste des **pénalités**.

## Banque de modèles d'expressions des besoins (à adapter à la réalisation du candidat)

| # | Type | Modèle d'expression | Production attendue |
|---|---|---|---|
| 1 | Disponibilité | Ajouter un serveur derrière le ​répartiteur ; visibilité dans la supervision | Trois serveurs servis, arrêt d'un serveur sans coupure, alerte |
| 2 | Interconnexion | Raccorder un nouveau site avec un plan d'adressage distinct ; isolement entre sites | Tunnel opérationnel, filtrage vérifié |
| 3 | Sauvegarde | ​Alerter sur tout échec de sauvegarde ; tester la restauration ; empêcher la saturation | Alerte, restauration chronométrée, rotation |
| 4 | Qualité de service | Prioriser un flux sensible sur le lien inter-sites ; mesurer avant/après | Configuration, mesures de latence et de gigue |
| 5 | Déploiement | Déployer un nouveau serveur ​identique de façon automatisée ; vérifier la conformité | Serveur installé sans intervention, conformité contrôlée |
| 6 | Supervision | Ajouter une alerte sur le temps de réponse d'un ​service ; réduire les fausses alertes | Déclencheur avec plusieurs mesures, test, documentation utilisateur |
| 7 | Incident | Un service est indisponible (panne injectée) : diagnostiquer, corriger, rédiger le ​rapport | Service rétabli, rapport d'incident |
| 8 | Sécurité | Restreindre l'accès d'un service à un groupe ; tracer les accès | Règles de filtrage, journaux, test d'accès refusé |

Pour les pannes injectées du modèle 7, réutiliser le script de la ​séance S13 (`corriges/S13-injection-pannes.sh`).

## Fiche d'observation de la commission

| Phase | Observations | Points forts | Points faibles |
|---|---|---|---|
| E1 (reformulation, plan, questions) | | | |
| R (démarche, traitement des erreurs, preuves) | | | |
| E2 (démonstration, argumentation, documentation) | | | |

## Profil de compétences (annexe VII-5-A)

| Axe ou compétence | Niveau |
|---|---|
| Comprendre le ​besoin | |
| Proposer une solution | |
| Démarche et technologies | |
| Erreurs (identifier, résoudre, documenter) | |
| Communication | |
| Couverture des compétences du bloc par les deux réalisations | Complète / Incomplète |
| Environnement conforme à l'annexe II.E | Oui / Non |

La note finale (sur 20) résulte du **jugement de la commission** à ​partir du profil et des **pénalités** éventuelles (10 points par réalisation absente ; jusqu'à 15 points pour un environnement non conforme). Pour une épreuve blanche, **ne communiquer que le profil et l'appréciation**, pas une note, afin de ne pas figer la perception de l'élève.

## Harmonisation

Entre commissions, comparer les **profils**, pas seulement les notes. Les écarts d'appréciation les plus fréquents :

- **Générosité sur la communication** quand l'élève parle bien mais sans ​preuve ;
- **Sévérité sur les erreurs** : une erreur traitée **et documentée** doit être valorisée ;
- **Confusion** entre « a fini » et « a bien fait » : on évalue la démarche autant que le résultat.

## Après l'épreuve blanche

1. Remettre à chaque élève sa **fiche d'appréciation** (profil et commentaire).
2. Corriger avec lui le plan de progression (partie F du TP).
3. ​Relever au niveau de la classe les **compétences systématiquement faibles** pour les retravailler.
4. Faire un point sur les **dossiers** : accès, preuves, fiches.

## Bilan de compétences

Auto-évaluation ; B2.1, B2.2 et B2.3 proposées, à valider.
