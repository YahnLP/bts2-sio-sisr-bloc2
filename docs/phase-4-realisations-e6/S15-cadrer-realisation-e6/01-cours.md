# Cours – Comprendre l'épreuve E6 et choisir ses réalisations

*BTS SIO SISR 2e année – Bloc 2 – S15*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

Tout au long de l'année, tu as construit des briques. L'épreuve **E6** ne te demande pas de les réciter : elle te demande de **montrer ce que tu sais faire sur une infrastructure que tu maîtrises**, en réponse à un besoin que tu découvres le jour de l'épreuve. Cette séance fixe les règles du jeu et t'aide à choisir **deux réalisations** qui te permettront de le faire.

> [!NOTE]
> Les textes officiels (arrêté du 8 juillet 2024, circulaire nationale et annexes) font foi. La page [Épreuve E6](../../ressources/epreuve-e6.md) en résume les points utiles.

---

## 1. Ce que la commission attend de toi

### Le déroulement (proposition d'organisation, annexe VII-4)

| Phase | Durée | Ce que tu fais |
|---|---|---|
| **Analyse de l'expression des besoins** | 30 min, sur table | Tu lis le besoin remis par la commission, tu consultes tes ressources, tu prépares tes questions |
| **Entretien 1 – explicitation** | 20 min | Tu **reformules** le besoin, tu annonces ce que tu vas faire, tu poses tes questions |
| **Réalisation** | 60 min | Tu **réalises** les objectifs sur **ta** réalisation, dans ton environnement |
| **Entretien 2 – recette** | 20 min | Tu **montres** que ça fonctionne, tu **justifies** tes choix, tu présentes la **documentation** |

L'expression des besoins est un **nouveau besoin**, circonscrit pour tenir en 60 minutes, qui prolonge **une** de tes deux réalisations (la commission choisit laquelle). Exemples : ajouter un second serveur derrière le répartiteur, étendre le tunnel à une troisième agence, ajouter une alerte et son test, restaurer une sauvegarde dans un délai donné.

**Conséquence directe :** une réalisation ne se montre pas, elle se **modifie sous contrôle**. Elle doit donc être :

- **accessible** (identifiants, accès, machines démarrables) ;
- **comprise** (tu sais dire pourquoi chaque élément est là) ;
- **documentée** (schéma, adressage, configurations) ;
- **reversible** (instantanés, configurations versionnées pour revenir à l'état de départ).

### Ce qui est évalué

La commission renseigne une grille qui reprend les compétences du bloc 2 et des critères transversaux.

| Niveau | Sens (grille nationale) |
|---|---|
| **Non évalué** | Compétence non évaluée dans la situation retenue |
| **Non maîtrisé** | N'identifie pas les besoins, ne répond pas, ne traite pas les erreurs, ne communique pas |
| **Maîtrise partielle** | Identifie partiellement, solutions peu adaptées, ne structure pas sa démarche, identifie les erreurs sans les résoudre, communique sans argumenter |
| **Bonne maîtrise** | Atteint les objectifs, démarche rigoureuse, **identifie et résout** les erreurs, communique clairement |
| **Excellente maîtrise** | Analyse de façon pertinente, propose des améliorations, démarche agile, **documente** les erreurs résolues, argumente de façon étayée |

Les cinq axes transversaux : **comprendre le besoin**, **proposer une solution**, **démarche et technologies**, **traitement des erreurs**, **communication** (écrit et oral).

### Les pénalités

| Situation | Pénalité |
|---|---|
| Une réalisation absente | 10 points |
| Deux réalisations absentes | 20 points |
| Environnement non conforme à l'annexe II.E | Jusqu'à 15 points |

Une **simulation seule** ne suffit pas : « une solution d'infrastructure réduite à une simulation par un logiciel ne peut être acceptée ».

---

## 2. Les 17 compétences à couvrir à deux

Les **deux réalisations réunies** doivent couvrir l'ensemble des compétences du bloc 2. La grille les détaille en 17 compétences (liste complète dans le [référentiel](../../ressources/referentiel.md)) :

| Famille | Compétences |
|---|---|
| **Concevoir** (6) | Analyser un besoin et son contexte juridique · Étudier l'impact d'une évolution · Élaborer un dossier de choix et des spécifications · Choisir les éléments de qualité et de disponibilité · Maquetter et prototyper · Déterminer et préparer les tests |
| **Installer, tester, déployer** (6) | Installer et configurer des éléments d'infrastructure · … pour la continuité · … pour la qualité de service · Rédiger la documentation technique et utilisateur · Tester l'intégration et l'acceptation · Déployer |
| **Exploiter, dépanner, superviser** (5) | Administrer sur site et à distance · Automatiser des tâches d'administration · Gérer indicateurs et fichiers d'activité · Identifier, qualifier, évaluer et réagir face à un incident · Évaluer, maintenir et améliorer la qualité d'un service |

> [!WARNING]
> Une compétence **non couverte** par aucune des deux réalisations ne pourra pas être évaluée : la commission le signale dans l'appréciation. C'est pourquoi on construit une **matrice de couverture** (S17).

---

## 3. L'environnement technologique conforme (annexe II.E)

L'attestation (annexe VII-7) liste ce que l'environnement doit comporter.

**Commun aux deux options :**

| Élément | Exemple dans notre formation |
|---|---|
| Un service d'authentification | Annuaire Active Directory, LDAP |
| Un SGBD | MariaDB, PostgreSQL |
| Un accès sécurisé à Internet | Pare-feu, proxy |
| Un environnement de travail collaboratif | Partage de fichiers, messagerie, outil de tickets |
| Deux serveurs, virtualisés ou non, sur des systèmes différents, dont **un logiciel libre** | Debian et Windows Server |
| Une solution de sauvegarde | S05, S09 |
| Des ressources à accès sécurisé et soumis à habilitation | Droits, groupes |
| Deux types de terminaux dont **un mobile** | Poste client et smartphone ou tablette |

**Outils de sécurité :** gestion des incidents · détection et prévention des intrusions · chiffrement · analyse de trafic.

**Propre à l'option SISR :**

| Élément | Où l'as-tu travaillé ? |
|---|---|
| Un réseau à **plusieurs périmètres de sécurité** | Année 1 (DMZ), S10, S14 |
| Un service rendu **sous contrat de service** (sécurité, haute disponibilité) | S14 |
| Un **logiciel d'analyse de trames** | Wireshark, `tcpdump` (S10, S13) |
| Un **logiciel de gestion des configurations** | Ansible (S08) |
| Une **administration à distance sécurisée** | SSH, VPN (S10) |
| Une **supervision** de la qualité, de la sécurité et de la disponibilité, avec **remontées d'alertes** | Zabbix (S11) |
| Un **accès sécurisé** à un service (intranet ou extranet) | S10, S14 |
| Une solution de **continuité** de service | S05, S12 |
| Une solution de **tolérance de panne** | S12 |
| Une solution de **répartition de charge** | S12 |

Et **au moins une** solution opérationnelle parmi : **connexion sécurisée entre deux sites** (S10) · **déploiement** (S07) · **procédures automatisées par script** (S09) · **détection d'intrusion** (bloc 3).

Il s'agit de l'environnement de la **formation** et de l'**organisation** : l'ensemble n'a pas à tenir dans une seule réalisation, mais ton ou tes environnements doivent permettre de le montrer.

---

## 4. Choisir ses deux réalisations

| Critère | Question à te poser |
|---|---|
| **Réelle** | S'appuie-t-elle sur des machines réelles (virtuelles ou physiques) ou une situation d'entreprise ? |
| **Conforme** | Rattache-t-elle des éléments de l'annexe II.E ? |
| **Complémentaire** | Couvre-t-elle des compétences que l'autre ne couvre pas ? |
| **Maîtrisée** | Peux-tu l'expliquer, la modifier en 60 minutes, la dépanner ? |
| **Accessible** | Peux-tu y accéder le jour J ? Les accès sont-ils dans la fiche ? |
| **Documentée** | Existe-t-il un schéma, un adressage, des configurations, des tests ? |

### Réalisation d'entreprise ou de formation ?

| | Entreprise (alternance) | Formation (laboratoire) |
|---|---|---|
| **Avantages** | Contexte réel, besoin authentique | Maîtrise totale, reproductible, sans contrainte de confidentialité |
| **Risques** | Données confidentielles, accès non transmissibles, accord du tuteur nécessaire | Moins de contexte réel |
| **À prévoir** | **Accord écrit** du tuteur, **anonymisation**, **maquette** reproductible en laboratoire | Un besoin fictif **crédible** et réaliste |

Une bonne stratégie : **partir d'un besoin réel** de l'entreprise et en monter une **maquette** réelle (machines virtuelles) que tu peux modifier librement. Les accès à l'entreprise n'ont pas à être donnés au jury.

---

## 5. Cadrer une réalisation

Une réalisation cadrée tient en une page :

| Rubrique | Contenu |
|---|---|
| **Besoin** | Qui, pour quoi faire, avec quelles contraintes (disponibilité, sécurité, budget, droit) |
| **Périmètre** | Ce qui est dans la réalisation, ce qui n'y est pas |
| **Solution visée** | Architecture, technologies, justification des choix |
| **Compétences visées** | Lesquelles des 17 |
| **Éléments d'annexe II.E** | Lesquels sont couverts |
| **Mode dégradé et reprise** | Que devient le service si un élément tombe ? Procédure de reprise décrite, vérifiée (voir S05, S12) |
| **Livrables et preuves** | Schéma, adressage, configurations, plan de tests, captures datées, documentation |
| **Planning** | Étapes, durées, jalons (S16, S17) |
| **Risques** | Ce qui peut empêcher d'aboutir, plan B |

## Ce que tu dois retenir de la séance

- L'épreuve : **30 min d'analyse, 20 min d'explicitation, 60 min de réalisation, 20 min de recette** ; tu **modifies** ta réalisation sur un nouveau besoin.
- **Deux réalisations réelles**, dans un environnement **conforme à l'annexe II.E**, qui **couvrent à deux les 17 compétences**.
- Une réalisation **accessible, documentée, comprise, réversible**.
- On **cadre** avant de construire.
