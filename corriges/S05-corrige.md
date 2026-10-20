# Corrigé – S05 : Continuité et reprise d'activité

*Réservé à l'enseignant. Procédure `tar` testée sur ​Debian : sauvegarde complète puis incrémentale, restauration, empreintes identiques.*

## Partie A – Objectifs

Toute valeur est acceptable **si justifiée** par l'activité du cabinet. Un RPO de 4 h exclut une sauvegarde nocturne seule. Refuser « RTO = 0 » sans coût associé : plus l'objectif est serré, plus la solution est chère.

## Partie B – Dimensionnement (200 Go, 3 Go/jour, 28 jours)

| | Stratégie 1 | ​Stratégie 2 | Stratégie 3 |
|---|---|---|---|
| Espace total | 5 600 Go | 872 Go | 1 052 Go |
| Au pire (samedi) | 1 copie | complète + 6 incrémentales | complète + 1 différentielle |
| Volume | 200 Go | 218 Go | 218 Go |
| Temps à 100 Mo/s | ≈ 33 min | ≈ 36 min | ≈ 36 min |

Détail stratégie 3 : par semaine, 3 + 6 + 9 + 12 + 15 + 18 = 63 Go ; 4 semaines = 252 Go, plus 4 × 200 = 800 Go.
Attendre une décision argumentée : le temps de ​transfert n'est pas le RTO, il faut ajouter réinstallation, vérification et information.

## Partie C – Sinistre simulé

| Étape | Attendu |
|---|---|
| C1 | 200 fichiers |
| C3 | L'incrémentale liste `doc201.txt`, `doc5.txt` et le dossier ; `doc7.txt` supprimé mémorisé |
| C6 | 200 fichiers (200 − 1 + 1) ; `doc7.txt` ​absent ; `doc5.txt` contient « modifie » ; mention `IDENTIQUE` |

**Pannes fréquentes.**

- Restauration dans le **mauvais ordre** (incrémentale avant la complète) : fichiers manquants.
- Oubli de `--listed-incremental=/dev/null` à l'extraction : les suppressions ne sont pas appliquées.
- Chemin de comparaison faux : lancer `sha256sum` depuis `restauration/` (sous-shell du TP).
- `tar` relancé avec le même fichier `suivi.snar` : l'incrémentale suivante ne contient que les ​nouveautés, comme prévu.

## Partie D – RPO et RTO réels

Le RPO réel dépend de la **fréquence de lancement** : une sauvegarde manuelle quotidienne donne 24 h. Le temps mesuré est très court sur 200 petits fichiers : faire remarquer qu'en réel les ​volumes, la réinstallation et la vérification dominent.

## Partie E – 3-2-1 et fiche de reprise

Dans le TP : une copie, un support, aucun hors site, donc **0 sur 3** critères. Fiche de reprise attendue : déclenchement, information, localisation de la sauvegarde saine, restauration ordonnée, ​vérification, retour à la normale, contacts.

## Bilan de compétences

Auto-évaluation ; B2.1, B2.3 et B3.4 proposées, à valider.
