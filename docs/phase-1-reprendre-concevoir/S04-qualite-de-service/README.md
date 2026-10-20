# S04 – Qualité de service : mesurer et prioriser

| Élément | Détail |
|---|---|
| **Niveau** | BTS SIO option SISR, 2e année – bloc 2 |
| **Séance** | S04 (séance 4 sur 19) – Phase 1 |
| **Durée** | 4 heures |
| **Parcours** | **Complément** – Qualité de service : aucune autre séance ne s'appuie sur son laboratoire ni sur ses résultats. Voir le [parcours cœur et complément](../../ressources/parcours-coeur-complement.md). |
| **Prérequis** | S01 (mini-laboratoire du TP) |
| **Matériel** | VirtualBox, deux machines Debian en réseau interne `lab-s04`, `iperf3`, `iproute2` |
| **Compétences travaillées** | B2.1 · B2.3 (voir [le référentiel](../../ressources/referentiel.md)) |

> [!NOTE]
> **Question qui guide la séance :** *« Pourquoi la voix saccade-t-elle quand quelqu'un télécharge un gros fichier ? »*

## Objectifs

À la fin de la séance, l'étudiant est capable de :

1. **Définir** débit, latence, gigue et perte de paquets ;
2. **Mesurer** un lien avec des outils (ping, iperf) ;
3. **Expliquer** le principe de la classification et de la priorisation du trafic ;
4. **Mettre en œuvre** une priorisation simple et **vérifier** son effet par des mesures.

## Contenu de la séance

| Document | Rôle |
|---|---|
| [Cours – Qualité de service](01-cours.md) | Cours |
| [TP – Goulot, priorisation et marquage](02-tp.md) | TP |
| [Aide-mémoire – Mesures, marquage, `tc` et MQC](03-aide-memoire.md) | Aide-mémoire |

## Déroulé conseillé (4 h)

| Durée | Activité | Format |
|---|---|---|
| 0 h 00 – 0 h 20 | **Accroche** : « la visioconférence saccade pendant un gros téléchargement » | Oral |
| 0 h 20 – 1 h 20 | **Cours** | Cours et questions |
| 1 h 20 – 4 h 00 | **TP**, parties A à E, nettoyage, puis bilan | Binôme puis individuel |

## Retour en entreprise

Si ta situation le permet : **observer** comment ton entreprise traite le sujet de la séance, **documenter** en une demi-page l'écart avec le TP, ou **réaliser** une partie après accord de ton tuteur. Voir [Transfert en entreprise](../../ressources/transfert-entreprise.md). Le travail réalisé peut alimenter une [fiche de réalisation](../../ressources/fiche-realisation-professionnelle.md).

## Évaluation

- Compte rendu avec captures d'écran datées, nommé `RENDU-B2A2-S04-NOM.pdf`.
- Bilan de compétences rempli en fin de séance (individuel).

<details markdown="1">
<summary>Notes pour l'enseignant</summary>

- **Compétences :** codes relus sur le référentiel (page [Référentiel](../../ressources/referentiel.md)).
- **Les commandes `tc` n'ont pas été exécutées pendant la rédaction.** Tester le TP une fois avant la séance (voir le corrigé pour les pannes probables : nom d'interface, offload).

</details>
