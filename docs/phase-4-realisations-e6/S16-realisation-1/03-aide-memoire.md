# Aide-mémoire – Mener une réalisation

*BTS SIO SISR 2e année – Bloc 2 – S16*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

## Cycle

Analyser → concevoir → préparer les tests → maquetter → installer → recetter → documenter → exploiter.

## Arborescence du dossier

```text
R1/
├── README.md
├── docs/     cahier des charges, choix, documentation, journal, incidents
├── configs/  configurations sans secret
├── scripts/  installation et exploitation
├── preuves/  captures, sorties, journaux
└── tests/    plan de recette, rapport de tests
```

## Une preuve

Horodatée · lisible · rattachée à une exigence. Prendre la capture **juste après** l'action.

## Dossier de choix

Au moins **deux options** · réponse au besoin · coût · délai · compétences · maintenabilité · éthique et environnement · risques · conclusion argumentée.

## Documents possibles à l'épreuve

Documentation technique · documentation utilisateur · rapport de tests · rapport d'incident.

## Kit de reprise (60 min le jour J)

Instantanés « nominal » · dépôt Git · fichier d'accès · aide-mémoire de commandes · schéma et adressage.

## Fiche descriptive

Recto : identification, compétences, conditions, ressources, accès. Verso : contexte, solution et choix, mise en œuvre, tests, exploitation, bilan.

## Réflexes

- Tests préparés **avant** l'installation.
- Un problème = un mini rapport d'incident, pas un oubli.
- Pas de secret dans le dépôt.
- Réalisation plus petite mais **prouvée** > grande à moitié testée.
