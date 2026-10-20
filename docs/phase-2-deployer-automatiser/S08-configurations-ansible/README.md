# S08 – Gestion des configurations et automatisation

| Élément | Détail |
|---|---|
| **Niveau** | BTS SIO option SISR, 2e année – bloc 2 |
| **Séance** | S08 (séance 8 sur 19) – Phase 2 |
| **Durée** | 4 heures |
| **Parcours** | **Cœur** – Gestion des configurations (Ansible) : seule séance pour cet élément de l'annexe II.E. Voir le [parcours cœur et complément](../../ressources/parcours-coeur-complement.md). |
| **Prérequis** | S06, S07 |
| **Matériel** | Une machine de gestion et deux machines Debian cibles |
| **Compétences travaillées** | B2.2 · B2.3 (voir [le référentiel](../../ressources/referentiel.md)) |

> [!NOTE]
> **Question qui guide la séance :** *« Comment être sûr que trois serveurs ont exactement la même configuration, aujourd'hui et dans six mois ? »*

## Objectifs

À la fin de la séance, l'étudiant est capable de :

1. **Versionner** des fichiers de configuration avec Git ;
2. **Décrire** l'état voulu d'un serveur avec un inventaire et un playbook Ansible ;
3. **Appliquer** un playbook et **constater** l'idempotence ;
4. **Comparer** une configuration réelle à une configuration attendue.

## Contenu de la séance

| Document | Rôle |
|---|---|
| [Cours – Git et Ansible](01-cours.md) | Cours |
| [TP – Versionner et appliquer la configuration de deux serveurs](02-tp.md) | TP |
| [Aide-mémoire – Git et Ansible](03-aide-memoire.md) | Aide-mémoire |

## Déroulé conseillé (4 h)

| Durée | Activité | Format |
|---|---|---|
| 0 h 00 – 0 h 20 | **Accroche** : « trois serveurs identiques le jour de l'installation ; le sont-ils encore six mois plus tard ? » | Oral |
| 0 h 20 – 1 h 20 | **Cours** | Cours et questions |
| 1 h 20 – 4 h 00 | **TP**, parties A à E, puis bilan | Binôme puis individuel |

## Retour en entreprise

Si ta situation le permet : **observer** comment ton entreprise traite le sujet de la séance, **documenter** en une demi-page l'écart avec le TP, ou **réaliser** une partie après accord de ton tuteur. Voir [Transfert en entreprise](../../ressources/transfert-entreprise.md). Le travail réalisé peut alimenter une [fiche de réalisation](../../ressources/fiche-realisation-professionnelle.md).

## Évaluation

- Compte rendu avec captures d'écran datées, nommé `RENDU-B2A2-S08-NOM.pdf`.
- Bilan de compétences rempli en fin de séance (individuel).

<details markdown="1">
<summary>Notes pour l'enseignant</summary>

- **Compétences :** codes relus sur le référentiel (page [Référentiel](../../ressources/referentiel.md)).
- Le playbook a passé `--syntax-check` et l'idempotence de `template` et `lineinfile` a été testée en local ; les tâches `apt` et `service` n'ont pas été exécutées sur des cibles Debian. Un défaut a été corrigé à l'écriture (`regexp` sur `PermitRootLogin`) : voir le corrigé.

</details>
