# S05 – Continuité et reprise d'activité

| Élément | Détail |
|---|---|
| **Niveau** | BTS SIO option SISR, 2e année – bloc 2 |
| **Séance** | S05 (séance 5 sur 19) – Phase 1 |
| **Durée** | 4 heures |
| **Prérequis** | S01, S02, S03 |
| **Matériel** | Une machine virtuelle Debian |
| **Compétences travaillées** | B2.1 · B2.3 · B3.4 (voir [le référentiel](../../ressources/referentiel.md)) |

> [!NOTE]
> **Question qui guide la séance :** *« Le serveur tombe à 10 h : combien de temps, combien de données peut-on perdre ? »*

## Objectifs

À la fin de la séance, l'étudiant est capable de :

1. **Définir** plan de continuité et plan de reprise d'activité, RTO et RPO ;
2. **Construire** une stratégie de sauvegarde adaptée à des objectifs chiffrés ;
3. **Choisir** des supports de sauvegarde en justifiant ;
4. **Tester** une restauration et **mesurer** le temps réel de reprise ;
5. **Décrire** un mode dégradé (fonctions, capacité, décision, durée, retour au nominal).

## Contenu de la séance

| Document | Rôle |
|---|---|
| [Cours – Continuité et reprise d'activité](01-cours.md) | Cours |
| [TP – Stratégie de sauvegarde et test de restauration](02-tp.md) | TP |
| [Aide-mémoire – RTO, RPO et sauvegardes](03-aide-memoire.md) | Aide-mémoire |

## Déroulé conseillé (4 h)

| Durée | Activité | Format |
|---|---|---|
| 0 h 00 – 0 h 20 | **Accroche** : « le serveur est détruit à 16 h : que perd-on, et combien de temps est-on arrêté ? » | Oral |
| 0 h 20 – 1 h 20 | **Cours** | Cours et questions |
| 1 h 20 – 4 h 00 | **TP**, parties A à E, puis bilan | Binôme puis individuel |

## Retour en entreprise

Si ta situation le permet : **observer** comment ton entreprise traite le sujet de la séance, **documenter** en une demi-page l'écart avec le TP, ou **réaliser** une partie après accord de ton tuteur. Voir [Transfert en entreprise](../../ressources/transfert-entreprise.md). Le travail réalisé peut alimenter une [fiche de réalisation](../../ressources/fiche-realisation-professionnelle.md).

## Évaluation

- Compte rendu avec captures d'écran datées, nommé `RENDU-B2A2-S05-NOM.pdf`.
- Bilan de compétences rempli en fin de séance (individuel).

<details markdown="1">
<summary>Notes pour l'enseignant</summary>

- **Compétences :** codes relus sur le référentiel (page [Référentiel](../../ressources/referentiel.md)).
- La procédure `tar --listed-incremental` a été testée (complète, incrémentale, restauration, empreintes identiques). Les volumes de la partie B sont fictifs.

</details>
