# S07 – Déploiement automatisé de postes et de serveurs

| Élément | Détail |
|---|---|
| **Niveau** | BTS SIO option SISR, 2e année – bloc 2 |
| **Séance** | S07 (séance 7 sur 19) – Phase 2 |
| **Durée** | 4 heures |
| **Prérequis** | S06 |
| **Matériel** | Machines virtuelles Debian, image ISO netinst, connexion Internet |
| **Compétences travaillées** | B2.2 (voir [le référentiel](../../ressources/referentiel.md)) |

> [!NOTE]
> **Question qui guide la séance :** *« Comment installer vingt machines identiques sans taper vingt fois les mêmes réponses ? »*

## Objectifs

À la fin de la séance, l'étudiant est capable de :

1. **Décrire** les méthodes de déploiement (image, installation automatisée, démarrage réseau) ;
2. **Écrire** un fichier de réponses pour une installation automatique ;
3. **Déployer** une machine à partir de cet automatisme et **tester** le résultat ;
4. **Documenter** la procédure de déploiement.

## Contenu de la séance

| Document | Rôle |
|---|---|
| [Cours – Déploiement automatisé](01-cours.md) | Cours |
| [TP – Installation Debian automatisée par preseed](02-tp.md) | TP |
| [Aide-mémoire – Déploiement automatisé](03-aide-memoire.md) | Aide-mémoire |

## Déroulé conseillé (4 h)

| Durée | Activité | Format |
|---|---|---|
| 0 h 00 – 0 h 20 | **Accroche** : « vingt postes identiques sans taper vingt fois les mêmes réponses » | Oral |
| 0 h 20 – 1 h 15 | **Cours** | Cours et questions |
| 1 h 15 – 4 h 00 | **TP**, parties A à D, puis bilan | Binôme puis individuel |

## Retour en entreprise

Si ta situation le permet : **observer** comment ton entreprise traite le sujet de la séance, **documenter** en une demi-page l'écart avec le TP, ou **réaliser** une partie après accord de ton tuteur. Voir [Transfert en entreprise](../../ressources/transfert-entreprise.md). Le travail réalisé peut alimenter une [fiche de réalisation](../../ressources/fiche-realisation-professionnelle.md).

## Évaluation

- Compte rendu avec captures d'écran datées, nommé `RENDU-B2A2-S07-NOM.pdf`.
- Bilan de compétences rempli en fin de séance (individuel).

<details markdown="1">
<summary>Notes pour l'enseignant</summary>

- **Compétences :** codes relus sur le référentiel (page [Référentiel](../../ressources/referentiel.md)) ; le choix des compétences pour cette séance est une proposition à valider.
- **Corrigé :** dans `corriges/` à la racine du dépôt (hors du site publié).
- Le fichier preseed est vérifié en syntaxe seulement ; **l'installation complète n'a pas été exécutée**. Essayer avant la séance. Durée réelle du déploiement : 10 à 20 minutes selon le miroir.

</details>
