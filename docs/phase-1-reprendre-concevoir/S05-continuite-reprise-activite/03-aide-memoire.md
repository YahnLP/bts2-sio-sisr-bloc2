# Aide-mémoire – Continuité et reprise d'activité

*BTS SIO SISR 2e année – Bloc 2 – S05*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

## Vocabulaire

| Terme | Sens |
|---|---|
| **PCA** | Continuer l'activité **pendant** l'incident |
| **PRA** | Redémarrer **après** le sinistre |
| **RTO** | Durée d'arrêt maximale admissible |
| **RPO** | Perte de données maximale admissible (en temps) |
| **Sauvegarde** | Un moyen du PRA ; une copie à l'abri |
| **Réplication** | Copie continue ; **n'est pas** une sauvegarde |

Le **RPO** fixe la **fréquence** des sauvegardes. Le **RTO** fixe la **méthode** (restauration ou bascule).

## Types de sauvegarde

| Type | Copie | Restauration |
|---|---|---|
| Complète | Tout | Une seule copie |
| Différentielle | Depuis la dernière **complète** | Complète + dernière différentielle |
| Incrémentale | Depuis la dernière sauvegarde | Complète + **toutes** les incrémentales |

## Règle 3-2-1

**3** copies · **2** types de supports · **1** hors site. Variante : + **1** hors ligne ou non modifiable, **0** erreur après vérification.

## Commandes `tar` du TP

```bash
# complète (crée le fichier de suivi)
tar --listed-incremental=suivi.snar -czf complete.tar.gz dossier
# incrémentale (réutilise le fichier de suivi)
tar --listed-incremental=suivi.snar -czf incr1.tar.gz dossier
# lister le contenu d'une archive
tar tzf archive.tar.gz
# restaurer : dans l'ordre, la complète puis les incrémentales
tar --listed-incremental=/dev/null -xzf complete.tar.gz -C destination
tar --listed-incremental=/dev/null -xzf incr1.tar.gz -C destination
# vérifier l'intégrité
sha256sum fichiers | sort -k2 > attendu.sha
```

## Plan de reprise : le minimum

Périmètre et objectifs · Rôles · Contacts (**hors** du système en panne) · Procédures pas à pas · **Ordre de redémarrage** (réseau, annuaire et DNS, base de données, applications) · Communication.

## Réflexes

- Une sauvegarde **non testée** n'est pas une sauvegarde.
- **Mesurer** le temps de restauration et le comparer au RTO.
- **Protéger** les sauvegardes (chiffrement, accès restreint, copie hors ligne).
- **Mettre à jour** le plan à chaque changement d'infrastructure.
- **Décrire** le mode dégradé (fonctions, capacité, décideur, durée, retour) et le **vérifier** périodiquement.
