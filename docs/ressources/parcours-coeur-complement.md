# Parcours « cœur » et « complément »

Les 19 séances de 4 h représentent **76 h** par an. Le volume prévu pour ce bloc en deuxième année dans la grille sous statut scolaire est de **216 h** (annexe III.A du référentiel) : le bloc 2 est le plus comprimé de la formation en apprentissage. Ce parcours indique **quelles séances garder en priorité** quand le temps manque.

> [!NOTE]
> Ce classement est une **proposition de l'auteur, à valider** par l'équipe pédagogique. Il ne retire rien du site : chaque séance reste disponible, et son statut est rappelé dans sa fiche.

## Pourquoi si peu de compléments

Les séances de ce bloc forment une **chaîne** : virtualisation (S06), déploiement (S07), configurations (S08), scripts (S09), supervision (S11), dépannage (S13) ; la séance S14 assemble ensuite les briques de S05 et de S07 à S13, et les réalisations de l'épreuve E6 (S15 à S19) s'appuient sur l'ensemble. Les éléments de l'annexe II.E à pouvoir montrer le jour de l'épreuve sont aussi portés par ces séances. Seules **trois séances** peuvent être allégées sans casser de prérequis.

## Principe

Une séance est **cœur** si l'une au moins de ces conditions est vraie :

1. elle est la **seule** à porter un élément de l'annexe II.E ou un savoir du bloc ;
2. elle est un **prérequis** ou une **brique** d'une autre séance cœur ;
3. elle alimente directement **l'épreuve E6** (S15 à S19).

Sinon elle est **complément** : utile, mais le reste de la progression se déroule sans elle, à condition de lire la consigne de remplacement ci-dessous.

## Résultat

- **16 séances cœur** (64 h) ;
- **3 séances complément** (12 h) : S03, S04 et S13.

| Séance | Thème | Parcours | Pourquoi |
|---|---|---|---|
| S01 | Reprendre la main : révisions rapides et auto-diagnostic | **Cœur** | Remise à niveau et diagnostic ; prérequis de S02 à S06. |
| S02 | Cahier des charges, expression des besoins, contrat de prestation | **Cœur** | Cahier des charges et contrat : seule séance dédiée ; le cas du Cabinet Delorme sert de fil rouge à S05. |
| S03 | Coût de possession, éthique et environnement | **Complément** | Coût de possession et éthique : aucune séance ne s'appuie dessus au-delà du cas de S05 ; savoir à acquérir malgré tout (voir ci-dessous). |
| S04 | Qualité de service : mesurer et prioriser | **Complément** | Qualité de service : aucune autre séance ne s'appuie sur son laboratoire ni sur ses résultats. |
| S05 | Continuité et reprise d'activité | **Cœur** | Continuité et reprise (RTO, RPO) : éléments de l'annexe II.E ; prérequis de S12 et S14. |
| S06 | Virtualisation : hyperviseurs, instantanés, réseau virtuel | **Cœur** | Virtualisation : prérequis de S07, S08 et S10. |
| S07 | Déploiement automatisé de postes et de serveurs | **Cœur** | Déploiement automatisé : prérequis de S08 ; une des solutions possibles de l'annexe II.E. |
| S08 | Gestion des configurations et automatisation | **Cœur** | Gestion des configurations (Ansible) : seule séance pour cet élément de l'annexe II.E. |
| S09 | Scripts d'exploitation | **Cœur** | Scripts d'exploitation : repris dans S11 (supervision d'un script) et S14 (scripts planifiés). |
| S10 | VPN entre deux sites et accès distant sécurisé | **Cœur** | Connexion sécurisée entre deux sites et administration à distance : éléments de l'annexe II.E ; prérequis de S14. |
| S11 | Supervision avancée | **Cœur** | Supervision avec alertes : élément de l'annexe II.E ; prérequis de S13 et S14. |
| S12 | Haute disponibilité et répartition de charge | **Cœur** | Haute disponibilité et répartition de charge : éléments de l'annexe II.E ; prérequis de S14. |
| S13 | Dépannage et gestion d'incidents | **Complément** | Dépannage méthodique : utilisé comme brique dans S14 (fiche d'incident), mais aucune séance ne dépend de son TP. |
| S14 | Service sous contrat de niveau de service | **Cœur** | Service sous contrat : synthèse qui assemble les briques de S05 et S07 à S13. |
| S15 | Cadrer une réalisation pour l'épreuve E6 | **Cœur** | Cadrage de la réalisation E6 : prérequis de S16. |
| S16 | Réalisation 1 : mise en œuvre et preuves | **Cœur** | Première réalisation E6. |
| S17 | Réalisation 2 et matrice de couverture | **Cœur** | Deuxième réalisation E6 et couverture des compétences. |
| S18 | Dossier numérique et entraînement à l'épreuve | **Cœur** | Dossier numérique et entraînement à l'oral. |
| S19 | Épreuve blanche E6 | **Cœur** | Épreuve blanche E6. |

## Les éléments de l'annexe II.E restent atteignables

D'après le tableau de la ressource [L'épreuve E6 et la préparation](epreuve-e6.md), la colonne « deuxième année » de chaque élément contient au moins une séance cœur :

| Élément attendu | Séances de 2e année | Reste atteignable |
|---|---|---|
| Plusieurs périmètres de sécurité | S10, S14 | Oui |
| Service sous contrat de service | S14 | Oui |
| Analyseur de trames | S13 | Oui, par la 1re année (S03) et S10 pour `tcpdump` (voir S13 plus bas) |
| Gestion des configurations | S08 | Oui |
| Administration à distance sécurisée | S10 | Oui |
| Supervision avec alertes | S11 | Oui |
| Accès sécurisé à un service | S10, S14 | Oui |
| Continuité de service | S05, S12 | Oui |
| Tolérance de panne | S12 | Oui |
| Répartition de charge | S12 | Oui |
| Au moins une solution opérationnelle | S07, S08, S09, S10 | Oui |

## Les compétences restent couvertes

Compétences travaillées **par les séances cœur** (la séance de révision S01 n'est pas comptée) :

| Compétence | Séances cœur | Nombre |
|---|---|---|
| B2.1 | S02, S05, S06, S10, S14, S15, S16, S17, S18, S19 | 10 |
| B2.2 | S06, S07, S08, S09, S10, S12, S14, S16, S17, S18, S19 | 11 |
| B2.3 | S05, S08, S09, S11, S12, S14, S16, S17, S18, S19 | 10 |
| B3.4 | S05, S10, S12, S14 | 4 |

## Si l'on saute un complément

- **S03 – Coût de possession, éthique et environnement.** S05 utilise le cas du Cabinet Delorme déjà présenté en S02 : fournir aux étudiants les chiffres de coût qui servent à justifier la stratégie de sauvegarde (S05, TP), ou faire la partie « coût » de S03 en une demi-heure à l'intérieur de S05. Le coût sur plusieurs années et l'impact environnemental sont des savoirs du bloc : les traiter au moins par un exposé court.
- **S04 – Qualité de service : mesurer et prioriser.** S04 réutilise le mini-laboratoire de S01 : sauter S04 évite simplement d'y revenir. La notion de qualité de service reste un savoir du bloc ; la traiter au minimum par le cours (une heure).
- **S13 – Dépannage et gestion d'incidents.** Dans S14, remplacer la brique « dépannage » par une fiche d'incident rédigée à partir de la méthode du cours de S13 (à lire seul). L'analyseur de trames reste couvert par S10 et par la 1re année.

## Pour aller plus loin si le temps manque encore

Les compléments ne libèrent que 12 h. Pour aller plus loin, il faut alléger **à l'intérieur** des séances cœur (par exemple, ne faire que les parties essentielles d'un TP) ou regrouper des séances. La séance **S14** (synthèse) est la plus délicate à toucher : elle relie les briques et prépare l'épreuve E6.

## Utilisation

- Si **toutes** les séances sont faites, rien ne change.
- Si le temps manque, **retirer d'abord** les compléments, en appliquant la consigne ci-dessus.
- Les prérequis écrits dans chaque fiche ont été relus pour que ce classement ne casse aucune dépendance entre séances cœur.
