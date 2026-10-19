# Cours – Conduire une réalisation et en garder la preuve

*BTS SIO SISR 2e année – Bloc 2 – S16*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

Une réalisation réussie mais **sans trace** vaut peu à l'épreuve : la commission juge ce qu'elle peut **voir, vérifier et refaire**. Cette séance donne une méthode pour mener ta première réalisation du cahier des charges jusqu'à la fiche, en fabriquant les preuves **au fur et à mesure**.

---

## 1. Le cycle d'une réalisation

| Étape | Question | Livrable |
|---|---|---|
| **1. Analyser** | Quel besoin ? Quelles contraintes (juridiques, disponibilité, sécurité, budget) ? | Cahier des charges reformulé, risques |
| **2. Concevoir** | Quelles solutions ? Laquelle choisir et pourquoi ? | Dossier de choix, schéma, plan d'adressage |
| **3. Préparer les tests** | Comment saura-t-on que ça marche ? | Plan de recette (scénarios, attendus) |
| **4. Maquetter** | Cela tient-il en petit ? | Maquette en machines virtuelles |
| **5. Installer et configurer** | Comment construire, dans quel ordre ? | Configurations versionnées, procédure |
| **6. Tester et recetter** | Les scénarios passent-ils ? | Rapport de tests, preuves |
| **7. Documenter** | Quelqu'un d'autre peut-il l'exploiter ? | Documentation technique et utilisateur |
| **8. Exploiter** | Que se passe-t-il quand ça tombe ? | Supervision, procédures, rapport d'incident |

La conception et les tests sont **avant** l'installation : c'est ce que la grille d'évaluation attend (« déterminer et préparer les tests », « maquetter et prototyper »).

---

## 2. Le dossier de choix

Pour chaque choix structurant (hyperviseur, VPN, répartiteur, supervision), compare **au moins deux options** :

| Critère | Option A | Option B |
|---|---|---|
| Réponse au besoin (disponibilité, sécurité) | | |
| Coût (achat, licence, temps d'administration) | | |
| Délai de mise en œuvre | | |
| Compétences nécessaires | | |
| Maintenabilité, support | | |
| Éthique et environnement (énergie, durée de vie du matériel, souveraineté) | | |
| Risques | | |

La conclusion **argumente** (voir S03) et **assume** les limites de la solution retenue, y compris les **limites de responsabilité** du prestataire (voir S02).

---

## 3. La preuve

Une preuve est **horodatée, lisible et rattachée à une exigence**.

| Type de preuve | Exemples |
|---|---|
| **Captures** | Écran avec date et heure visibles, adresse de la machine dans le prompt |
| **Sorties de commande** | `ip -br a`, `systemctl status`, `wg show`, `haproxy -c`, copiées dans un fichier texte |
| **Fichiers de configuration** | Versionnés dans Git avec un message qui dit **pourquoi** |
| **Journaux** | Extraits datés montrant l'événement (panne, alerte, bascule) |
| **Mesures** | Temps de restauration, interruption, latence, débit |
| **Rapport de tests** | Scénario → attendu → obtenu → verdict |

> [!TIP]
> Prends la preuve **juste après** l'action : `echo "$(date) - $(hostname)"` dans la capture, ou une commande `date` avant la sortie. Tu gagnes des heures par rapport à une reconstitution.

### Le journal de bord

Une ligne par action significative :

| Date, heure | Action | Résultat | Fichier de preuve |
|---|---|---|---|
| 14:05 | Installation de HAProxy sur LB1 | OK, `haproxy -c` valide | `preuves/lb1-haproxy-check.txt` |
| 14:40 | Test d'arrêt de web1 | 0 requête perdue | `preuves/test-arret-web1.log` |

Il sert à **rédiger la fiche**, à **expliquer ta démarche** à l'entretien et, le jour J, à **reprendre le fil** en 60 minutes.

---

## 4. Les documents attendus

La commission peut te demander quatre natures de documents (annexe VII-3) :

| Document | Public | Contenu |
|---|---|---|
| **Documentation technique** | Un autre administrateur | Architecture, adressage, configurations, procédures d'installation et de restauration, supervision |
| **Documentation utilisateur** | L'utilisateur final | Comment utiliser le service, à qui s'adresser |
| **Rapport de tests** | Le client, la commission | Plan, résultats, verdicts, preuves |
| **Rapport d'incident** | Le responsable | Symptôme, cause, correction, prévention (voir S13) |

Une réalisation bien documentée permet à quelqu'un d'**exploiter** et de **reconstruire** le service sans toi.

---

## 5. La réalisation doit pouvoir être modifiée en 60 minutes

Le jour de l'épreuve, tu devras faire évoluer ta réalisation. Prépare donc un **kit de reprise** :

- un **instantané** de chaque machine à l'état « nominal » (pour revenir en arrière après un essai) ;
- un **dépôt Git** avec les configurations (pour retrouver ce qui a été fait) ;
- un **fichier d'accès** (adresses, comptes de laboratoire, ordre de démarrage des machines) ;
- une **liste de commandes utiles** (aide-mémoire personnel) ;
- le **schéma** et le **plan d'adressage** sous les yeux.

Vérifie qu'une personne qui n'a jamais vu ta maquette peut la démarrer et se repérer en **dix minutes**.

---

## 6. Rédiger la fiche descriptive

La fiche (annexe VII-1-A) a un **recto** (identification, compétences, conditions, ressources, accès aux productions) et un **verso** (descriptif de la réalisation).

| Section du descriptif | Contenu |
|---|---|
| **1. Contexte et besoin** | Qui, pourquoi, contraintes |
| **2. Solution et choix** | Architecture, options comparées, justification |
| **3. Mise en œuvre** | Étapes, configuration, difficultés et résolutions |
| **4. Tests et résultats** | Plan, résultats, preuves |
| **5. Exploitation** | Supervision, sauvegarde, procédures |
| **6. Bilan** | Ce qui marche, limites, améliorations possibles |

Une bonne fiche tient en **une à deux pages**, renvoie à la documentation complète par des **liens**, et rend la réalisation **compréhensible en cinq minutes**.

## Ce que tu dois retenir de la séance

- Cycle : **analyser, concevoir, préparer les tests, maquetter, installer, recetter, documenter, exploiter**.
- Un **dossier de choix** compare des options et argumente.
- Une **preuve** est horodatée, lisible et rattachée à une exigence ; tiens un **journal de bord**.
- Prépare un **kit de reprise** : la réalisation doit pouvoir évoluer en 60 minutes.
- La fiche tient en une ou deux pages et **renvoie** à la documentation.
