# S10 – VPN entre deux sites et accès distant sécurisé

| Élément | Détail |
|---|---|
| **Niveau** | BTS SIO option SISR, 2e année – bloc 2 |
| **Séance** | S10 (séance 10 sur 19) – Phase 2 |
| **Durée** | 4 heures |
| **Prérequis** | S06 ; chiffrement vu en bloc 3 (ou rappel en séance) |
| **Matériel** | Trois machines virtuelles Debian (deux passerelles et un poste) |
| **Compétences travaillées** | B2.1 · B2.2 · B3.4 (voir [le référentiel](../../ressources/referentiel.md)) |

> [!NOTE]
> **Question qui guide la séance :** *« Comment relier deux agences par Internet sans exposer le trafic ? »*

## Objectifs

À la fin de la séance, l'étudiant est capable de :

1. **Expliquer** le principe d'un VPN site à site et d'un accès nomade ;
2. **Concevoir** le plan d'adressage de deux sites reliés ;
3. **Mettre en place** un tunnel entre deux machines virtuelles et **tester** la communication ;
4. **Vérifier** que le trafic est bien chiffré (capture de trames).

## Contenu de la séance

| Document | Rôle |
|---|---|
| [Cours – VPN site à site et accès nomade](01-cours.md) | Cours |
| [TP – Relier deux agences avec un tunnel WireGuard](02-tp.md) | TP |
| [Aide-mémoire – VPN et WireGuard](03-aide-memoire.md) | Aide-mémoire |

## Déroulé conseillé (4 h)

| Durée | Activité | Format |
|---|---|---|
| 0 h 00 – 0 h 20 | **Accroche** : « deux agences, un serveur de fichiers, Internet entre les deux » | Oral |
| 0 h 20 – 1 h 20 | **Cours** | Cours et questions |
| 1 h 20 – 4 h 00 | **TP**, parties A à E, puis bilan | Binôme puis individuel |

## Retour en entreprise

Si ta situation le permet : **observer** comment ton entreprise traite le sujet de la séance, **documenter** en une demi-page l'écart avec le TP, ou **réaliser** une partie après accord de ton tuteur. Voir [Transfert en entreprise](../../ressources/transfert-entreprise.md). Le travail réalisé peut alimenter une [fiche de réalisation](../../ressources/fiche-realisation-professionnelle.md).

## Évaluation

- Compte rendu avec captures d'écran datées, nommé `RENDU-B2A2-S10-NOM.pdf`.
- Bilan de compétences rempli en fin de séance (individuel).

<details markdown="1">
<summary>Notes pour l'enseignant</summary>

- **Compétences :** codes relus sur le référentiel (page [Référentiel](../../ressources/referentiel.md)) ; le choix des compétences pour cette séance est une proposition à valider.
- **Les commandes WireGuard et les captures n'ont pas été exécutées pendant la rédaction.** Monter le laboratoire une fois avant la séance. WireGuard a été choisi pour sa simplicité ; IPsec et OpenVPN sont présentés dans le cours.

</details>
