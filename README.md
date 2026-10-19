# Bloc 2 · SISR – BTS SIO 2e année

Cours, TP et aide-mémoire du **bloc 2 (infrastructure, systèmes et réseaux)** du BTS SIO option SISR, 2e année : **19 séances de 4 h** pour 19 semaines d'alternance réparties sur l'année. Auteur : Yahn LE PRETTRE - Formateur – licence CC BY-NC-SA 4.0. Utilisation dans une formation payante ou financée (CFA, OPCO) : accord préalable de l'auteur, voir `docs/ressources/licences.md`.

**Site (GitHub Pages) :** <https://yahnlp.github.io/bts2-sio-sisr-bloc2/>

Ce dépôt fait suite à [`bts1-sio-sisr-bloc2`](https://github.com/YahnLP/bts1-sio-sisr-bloc2). La séance S01 révise l'essentiel de la première année ; les séances suivantes complètent les savoirs du référentiel non encore travaillés et préparent les deux réalisations et l'oral de l'épreuve E6.

## Contenu

| Dossier | Contenu |
|---|---|
| [`docs/phase-1-reprendre-concevoir`](docs/phase-1-reprendre-concevoir/README.md) | S01 à S05 : révisions, cahier des charges et contrat, coût et impact environnemental, qualité de service, continuité et reprise d'activité |
| [`docs/phase-2-deployer-automatiser`](docs/phase-2-deployer-automatiser/README.md) | S06 à S10 : virtualisation, déploiement automatisé, gestion des configurations, scripts d'exploitation, VPN |
| [`docs/phase-3-exploiter-superviser`](docs/phase-3-exploiter-superviser/README.md) | S11 à S14 : supervision avancée, haute disponibilité, dépannage, service sous contrat |
| [`docs/phase-4-realisations-e6`](docs/phase-4-realisations-e6/README.md) | S15 à S19 : deux réalisations, dossier numérique, entraînement à l'épreuve, épreuve blanche E6 |
| [`docs/ressources`](docs/ressources/README.md) | Référentiel, épreuve E6 et annexe II.E, fiche de réalisation, outils, glossaire, licences |
| [`corriges`](corriges/) | Corrigés **réservés à l'enseignant** (non publiés sur le site, mais visibles dans ce dépôt) |
| [`tools`](tools/CONVENTIONS.md) | Conventions de rédaction du site |

## Avancement

| Séances | État |
|---|---|
| S01 à S19 (phases 1 à 4) | Rédigées (fiche, cours, TP, aide-mémoire, corrigé) |

## Cadre d'examen

Toutes les épreuves sont **ponctuelles** (pas de contrôle en cours de formation). Ce bloc prépare l'épreuve **E6** (administration des systèmes et des réseaux : préparation de 1 h 30, oral de 40 min, deux réalisations). Voir [`docs/ressources/epreuve-e6.md`](docs/ressources/epreuve-e6.md).

## Travailler en local

```bash
pip install -r requirements.txt
mkdocs serve        # http://127.0.0.1:8000
mkdocs build --strict
```

## Licence

Contenus : **CC BY-NC-SA 4.0**. Détail : [`docs/ressources/licences.md`](docs/ressources/licences.md).
