# Corrigé – S14 : Service sous contrat

*Réservé à l'enseignant. Les calculs ont été refaits : 43,2 minutes ; 99,94 % ; 99,84 % ; 99,92 %, 99,83 %, 99,69 %. Cette séance ​réutilise les laboratoires des séances précédentes : **rien de nouveau à tester techniquement**, mais prévoir un laboratoire reconstructible (configurations versionnées, S08).*

## Partie A

Voir le tableau du TP. Exiger pour chaque ligne un critère **mesurable** et une **preuve** possible. Refuser « le site est rapide », « le VPN est sécurisé ».

## Partie B

- ​Schéma : sites, adresses, tunnel, VIP, supervision, sauvegarde. Doit permettre de reconstruire.
- SPOF acceptés : valables s'ils sont **justifiés** (coût, probabilité, contournement).
- ​Calcul : 99,94 % (site, hors VPN) ; 99,84 % pour le flux de l'agence (VPN unique).

## Partie C – Recette

| Contrôle | Attendu |
|---|---|
| Choix des scénarios | Au moins quatre, justifiés ; T2, T4 et T6 sont les plus instructifs |
| Chaque verdict | Mesure + horodatage + preuve |
| Verdict « conforme avec réserve » | Autorisé si la réserve est ​écrite |

**Pannes fréquentes.** Laboratoires incomplets (VPN ou VIP non remontés) : prévoir de les remonter à partir des dépôts Git, ou limiter la recette à trois scénarios. Une alerte non reçue vient ​souvent d'un média de notification non configuré.

## Partie D – Rapport de service

| Cas | Indisponibilité comptée | Disponibilité | Verdict |
|---|---|---|---|
| Exclusions respectées (I2, I4 exclues) | 34 min | 99,92 % | Respecté, pas de crédit |
| ​Maintenance comptée | 74 min | 99,83 % | Non respecté : 1 tranche entamée → crédit de 5 % |
| Tout compté | 134 min | 99,69 % | Non respecté : 99,9 − 99,69 ≈ 0,21 point → 3 tranches entamées → 15 % |

À faire dire : le rapport **signale I3** et sa cause ; la rédaction des ​exclusions décide du verdict.

## Partie E

Ligne « 3 (panne d'un nœud) » de la partie A : attendre capacité restante chiffrée, fonctions maintenues, durée maximale, alerte « service ​dégradé » et test de panne daté.

Sommaire attendu : contexte et contrat, exigences et critères, architecture et adressage, configurations, procédures, plan de recette et preuves, rapport de ​service, fiches d'incident, risques restants.

## Lien avec l'épreuve E6

Cette séance est la **répétition** d'une réalisation : repérer les compétences couvertes et les consigner dans la [matrice de couverture](../docs/ressources/epreuve-e6.md) avant S15.

## Bilan de compétences

Auto-évaluation ; B2.1, B2.2, B2.3 et B3.4 proposées, à valider.
