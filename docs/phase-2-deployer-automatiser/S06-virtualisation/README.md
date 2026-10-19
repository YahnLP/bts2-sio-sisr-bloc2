# S06 – Virtualisation : hyperviseurs, instantanés, réseau virtuel

| Élément | Détail |
|---|---|
| **Niveau** | BTS SIO option SISR, 2e année – bloc 2 |
| **Séance** | S06 (séance 6 sur 19) – Phase 2 |
| **Durée** | 4 heures |
| **Prérequis** | S01 |
| **Matériel** | VirtualBox, une VM Debian de référence |
| **Compétences travaillées** | B2.1 · B2.2 (voir [le référentiel](../../ressources/referentiel.md)) |

> [!NOTE]
> **Question qui guide la séance :** *« Comment faire tourner dix serveurs sur une seule machine physique, et à quel prix ? »*

## Objectifs

À la fin de la séance, l'étudiant est capable de :

1. **Distinguer** hyperviseur de type 1 et de type 2 ;
2. **Créer** et **cloner** des machines virtuelles, utiliser des instantanés ;
3. **Construire** un réseau virtuel (réseau interne, pont, plusieurs sous-réseaux) ;
4. **Évaluer** les ressources nécessaires et les limites de la virtualisation.

## Contenu de la séance

| Document | Rôle |
|---|---|
| [Cours – Virtualisation](01-cours.md) | Cours |
| [TP – Un laboratoire virtuel à deux sous-réseaux](02-tp.md) | TP |
| [Aide-mémoire – Virtualisation et `VBoxManage`](03-aide-memoire.md) | Aide-mémoire |

## Déroulé conseillé (4 h)

| Durée | Activité | Format |
|---|---|---|
| 0 h 00 – 0 h 20 | **Accroche** : « dix serveurs sur une seule machine : à quel prix ? » | Oral |
| 0 h 20 – 1 h 20 | **Cours** | Cours et questions |
| 1 h 20 – 4 h 00 | **TP**, parties A à D, puis bilan | Binôme puis individuel |

## Retour en entreprise

Si ta situation le permet : **observer** comment ton entreprise traite le sujet de la séance, **documenter** en une demi-page l'écart avec le TP, ou **réaliser** une partie après accord de ton tuteur. Voir [Transfert en entreprise](../../ressources/transfert-entreprise.md). Le travail réalisé peut alimenter une [fiche de réalisation](../../ressources/fiche-realisation-professionnelle.md).

## Évaluation

- Compte rendu avec captures d'écran datées, nommé `RENDU-B2A2-S06-NOM.pdf`.
- Bilan de compétences rempli en fin de séance (individuel).

<details markdown="1">
<summary>Notes pour l'enseignant</summary>

- **Compétences :** codes relus sur le référentiel (page [Référentiel](../../ressources/referentiel.md)) ; le choix des compétences pour cette séance est une proposition à valider.
- **Corrigé :** dans `corriges/` à la racine du dépôt (hors du site publié).
- Les commandes `VBoxManage` n'ont pas été exécutées pendant la rédaction : à tester avant la séance. **Choix d'hyperviseur** : le TP utilise VirtualBox (type 2) comme en première année ; Proxmox VE, Hyper-V et ESXi sont présentés dans le cours. À adapter si la salle dispose d'un hyperviseur de type 1.

</details>
