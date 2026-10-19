# Cours – La matrice de couverture et la deuxième réalisation

*BTS SIO SISR 2e année – Bloc 2 – S17*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

L'épreuve exige que **tes deux réalisations couvrent à elles deux** les compétences du bloc 2. Cela se vérifie, se prouve et se **prépare** : c'est le rôle de la **matrice de couverture**. Elle te dit où tu es, ce qui manque, et ce que ta deuxième réalisation doit apporter.

---

## 1. La matrice de couverture

Une matrice est un tableau : une ligne par compétence, une colonne par réalisation, et pour chaque case **le niveau de couverture** et **la preuve**.

| Niveau | Sens |
|---|---|
| **Fort** | La compétence est mobilisée de façon visible et **prouvée** (document, test, capture) |
| **Partiel** | Elle est mobilisée mais la preuve est mince, ou une partie seulement |
| **Absent** | Elle n'apparaît pas |

Une compétence est **couverte** si elle est **forte** dans au moins une réalisation, ou **partielle** dans les deux avec des preuves complémentaires.

### Les 17 lignes

Les 17 compétences de la grille (liste dans le [référentiel](../../ressources/referentiel.md)) : B2.1.1 à B2.1.6, B2.2.1 à B2.2.6, B2.3.1 à B2.3.5.

### Une deuxième matrice : l'environnement (annexe II.E)

Même principe pour les éléments de l'environnement technologique : authentification, SGBD, sauvegarde, plusieurs périmètres de sécurité, service sous contrat, analyse de trames, gestion des configurations, administration à distance, supervision avec alertes, accès sécurisé, continuité, tolérance de panne, répartition de charge, au moins une solution parmi *VPN site à site, déploiement, scripts, détection d'intrusion*.

---

## 2. Les compétences que l'on oublie

L'expérience montre que certaines lignes restent vides :

| Compétence | Pourquoi on l'oublie | Comment la couvrir |
|---|---|---|
| **B2.1.1** Analyser un besoin et son **contexte juridique** | On part directement de la technique | Une page : besoin, contraintes juridiques (RGPD, conservation des journaux, responsabilité) |
| **B2.1.2** Étudier l'**impact** d'une évolution | On l'a fait « dans sa tête » | Tableau des éléments touchés, risques, retour arrière |
| **B2.1.3** **Dossier de choix** et spécifications | On a choisi sans comparer | Comparer deux options avec critères (coût, délai, qualité, éthique) |
| **B2.1.6** **Préparer les tests** | On teste après coup | Plan de recette écrit **avant** |
| **B2.2.3** **Qualité de service** | Peu de projets en ont | Priorisation d'un flux (voix, supervision), mesures avant/après (S04) |
| **B2.2.4** **Documentation** technique et utilisateur | Fin de projet bâclée | Deux documents distincts, à jour |
| **B2.3.3** **Indicateurs et fichiers d'activité** | La supervision est « installée » sans analyse | Tableaux de bord, analyse des journaux centralisés |
| **B2.3.5** **Améliorer** la qualité d'un service | Réalisation figée | Mesure, constat, correction, nouvelle mesure |

---

## 3. Combler les trous

Quand la matrice révèle un manque, trois stratégies :

1. **Étendre** la réalisation 2 : ajouter un jalon qui couvre la compétence (exemple : ajouter une priorisation de flux sur le tunnel pour B2.2.3) ;
2. **Étoffer les preuves** d'une compétence partielle (écrire le plan de recette, produire le rapport d'incident) ;
3. **Réorienter** la réalisation 2 si elle ne couvre rien de nouveau.

> [!WARNING]
> Combler ne veut pas dire **gonfler**. Chaque compétence déclarée doit pouvoir être **montrée et expliquée en entretien** : un élément que tu ne sais pas défendre est plus dangereux que l'absence de cet élément.

---

## 4. Ce que chaque séance de l'année a entraîné (indicatif)

Pour retrouver des preuves déjà produites :

| Séance | Compétences travaillées (proposition) |
|---|---|
| S02 Besoin et contrat | B2.1.1 |
| S03 Coût, éthique, environnement | B2.1.3 |
| S04 Qualité de service | B2.1.4 · B2.2.3 |
| S05 Continuité et reprise | B2.1.4 · B2.2.2 |
| S06 Virtualisation | B2.1.5 · B2.2.1 |
| S07 Déploiement automatisé | B2.2.1 · B2.2.6 |
| S08 Git et Ansible | B2.2.6 · B2.3.1 · B2.3.2 |
| S09 Scripts d'exploitation | B2.3.2 · B2.3.3 |
| S10 VPN | B2.1.4 · B2.2.1 · B2.3.1 |
| S11 Supervision avancée | B2.3.3 · B2.3.4 |
| S12 Haute disponibilité | B2.1.4 · B2.2.2 · B2.2.5 |
| S13 Dépannage | B2.3.4 · B2.3.5 |
| S14 Service sous contrat | B2.1.6 · B2.2.5 · B2.3.5 |

Ces associations sont indicatives : c'est ce que **tu as réellement fait et prouvé** qui compte.

---

## 5. Vérifier par un regard extérieur

Un camarade (ou ton tuteur) joue la **commission** : il lit ta fiche, ton dossier, et applique la **grille** (annexe VII-5-A) et l'**attestation d'environnement** (annexe VII-7) :

- peut-il retrouver, pour chaque compétence, **où** elle est mobilisée ?
- les preuves sont-elles **ouvrables** et **datées** ?
- l'environnement est-il **réel** ?
- peut-il formuler une **expression des besoins** plausible qui prolonge ta réalisation ?

## Ce que tu dois retenir de la séance

- La **matrice de couverture** recense, pour les **17 compétences** et pour l'annexe II.E, le niveau de couverture et la preuve.
- Les lignes qu'on oublie : contexte juridique, impact, dossier de choix, tests préparés, qualité de service, documentation, indicateurs, amélioration.
- Combler = **étendre**, **étoffer les preuves** ou **réorienter** ; jamais gonfler.
- Un **regard extérieur** valide le tout.
