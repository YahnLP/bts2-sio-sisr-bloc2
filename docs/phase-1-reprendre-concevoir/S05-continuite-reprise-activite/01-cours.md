# Cours – Continuité et reprise d'activité

*BTS SIO SISR 2e année – Bloc 2 – S05*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

Un serveur tombe un lundi à 10 h. Les questions qui comptent ne sont pas « avons-nous une sauvegarde ? » mais : **combien de temps** l'entreprise peut-elle s'arrêter, **combien de données** peut-elle perdre, et **qui fait quoi** pour repartir ? Ce sont les questions de la **continuité** et de la **reprise d'activité**.

---

## 1. Continuité, reprise, sauvegarde : trois notions différentes

| Notion | Sigle | Objectif | Exemple |
|---|---|---|---|
| **Plan de continuité d'activité** | PCA | **Maintenir** l'activité (même dégradée) **pendant** l'incident | Deux serveurs en secours automatique ; travail dégradé sur papier |
| **Plan de reprise d'activité** | PRA | **Redémarrer** les services **après** un sinistre | Restaurer les serveurs depuis la sauvegarde sur un matériel de remplacement |
| **Sauvegarde** | | **Conserver** une copie des données pour les récupérer | Copie quotidienne sur un disque réseau |

La sauvegarde est **un moyen** du PRA, pas le plan lui-même : sans procédure, sans responsable et sans test, une sauvegarde ne fait pas une reprise.

### Quels sinistres envisager ?

| Famille | Exemples |
|---|---|
| **Matériel** | Panne de disque, de serveur, d'alimentation |
| **Humain** | Suppression par erreur, mauvaise configuration |
| **Malveillance** | Rançongiciel (chiffrement des données et de leurs sauvegardes accessibles), vol |
| **Physique** | Incendie, dégât des eaux, coupure électrique prolongée |
| **Fournisseur** | Panne de l'hébergeur, de l'opérateur Internet |

---

## 2. Les deux objectifs qui commandent tout : RTO et RPO

| Sigle | Nom | Question | Se mesure en |
|---|---|---|---|
| **RTO** | *Recovery time objective* | Combien de temps le service peut-il être **interrompu** au maximum ? | Durée (heures) |
| **RPO** | *Recovery point objective* | Combien de **données** (exprimées en temps de travail) peut-on **perdre** au maximum ? | Durée (heures) |

<figure class="graphe diagramme"><svg viewBox="0 0 760 210" style="max-width:760px" role="img" aria-label="Frise RPO et RTO : perte de données et interruption de service" xmlns="http://www.w3.org/2000/svg">
<line x1="30" y1="120" x2="730" y2="120" class="dg-line"/>
<polygon points="738,120 726,114 726,126" class="dg-ah"/>
<circle cx="160" cy="120" r="8" class="dg-dark"/>
<text x="160" y="152" text-anchor="middle" class="dg-t">Dernière sauvegarde</text>
<circle cx="400" cy="120" r="8" class="dg-dark"/>
<text x="400" y="152" text-anchor="middle" class="dg-t">Incident</text>
<circle cx="620" cy="120" r="8" class="dg-dark"/>
<text x="620" y="152" text-anchor="middle" class="dg-t">Service rétabli</text>
<rect x="160" y="52" width="240" height="38" rx="8" class="dg-warn"/>
<text x="280" y="76" text-anchor="middle" class="dg-t">Perte de données (≤ RPO)</text>
<rect x="400" y="52" width="220" height="38" rx="8" class="dg-bad"/>
<text x="510" y="76" text-anchor="middle" class="dg-t">Interruption (≤ RTO)</text>
<line x1="160" y1="92" x2="160" y2="112" class="dg-dash"/>
<line x1="400" y1="92" x2="400" y2="112" class="dg-dash"/>
<line x1="620" y1="92" x2="620" y2="112" class="dg-dash"/>
<text x="380" y="196" text-anchor="middle" class="dg-i">Temps</text>
</svg>
<figcaption>Le RPO borne la perte de données, le RTO borne la durée d&#x27;interruption.</figcaption>
</figure>

- Le **RPO** détermine la **fréquence** des sauvegardes : un RPO de 24 h impose au moins une sauvegarde par jour ; un RPO de 1 h impose une sauvegarde ou une réplication toutes les heures.
- Le **RTO** détermine la **méthode** : restaurer depuis une sauvegarde prend des heures ; basculer sur un second serveur prend des minutes.
- Plus les objectifs sont **serrés**, plus la solution est **chère** : c'est un arbitrage avec le client (voir S02 et S03).

**Test flash.** Une sauvegarde est faite chaque nuit à 2 h. Une panne détruit le serveur à 16 h. Quelle quantité de travail est perdue au maximum ?

<details markdown="1">
<summary>Voir la réponse</summary>

Tout le travail de la journée jusqu'à 16 h, soit **14 heures** de travail (de 2 h à 16 h), et jusqu'à **24 heures** si la panne survient juste avant la sauvegarde suivante. Le **RPO réel** est donc de 24 h : ce qui est inacceptable si le RPO exigé est de 4 h.

</details>

### L'analyse d'impact (BIA)

On l'établit **avec le client**, service par service :

| Service | Criticité | RTO | RPO | Dépendances |
|---|---|---|---|---|
| Messagerie | Haute | 4 h | 1 h | Réseau, annuaire, DNS |
| Logiciel de comptabilité | Haute | 4 h | 4 h | Base de données, serveur de fichiers |
| Partage de fichiers | Moyenne | 8 h | 24 h | Annuaire |
| Intranet | Basse | 48 h | 24 h | Serveur web |

(Exemple : à établir **avec le client**, pas à deviner.)

---

## 3. Les stratégies de sauvegarde

### Les trois types

| Type | Ce qui est copié | Espace | Rapidité de sauvegarde | Restauration |
|---|---|---|---|---|
| **Complète** | **Tout** | Élevé | Lente | **Simple** : une seule copie |
| **Différentielle** | Les modifications depuis la **dernière complète** | Croissant | Moyenne | Complète **+ dernière différentielle** |
| **Incrémentale** | Les modifications depuis la **dernière sauvegarde** (de tout type) | **Faible** | Rapide | Complète **+ toutes les incrémentales** dans l'ordre |

La **chaîne de restauration** est le point faible de l'incrémentale : si **un seul maillon** est perdu ou corrompu, la suite est inutilisable.

### Les supports

| Support | Avantages | Limites |
|---|---|---|
| **Disque externe, NAS** | Rapide, peu cher | Souvent sur le même site, exposé au rançongiciel s'il reste connecté |
| **Bande magnétique** | Capacité, stockage hors ligne, durable | Lecteur spécifique, restauration plus lente |
| **Stockage en ligne (cloud)** | Hors site, évolutif | Coût récurrent, débit nécessaire, localisation des données |
| **Support amovible** | Hors ligne, transportable | Dépend d'une rotation manuelle |

### La règle 3-2-1

**3** copies des données, sur **2** types de supports, dont **1** hors site. Une variante courante ajoute **1** copie **hors ligne ou non modifiable** (à l'abri d'un rançongiciel) et **0** erreur après **vérification**.

### Autres points d'attention

- **Rétention** : combien de temps conserve-t-on chaque sauvegarde ? (un mois, un an) Elle dépend des **obligations légales de conservation** et du besoin de revenir en arrière.
- **Chiffrement** : une sauvegarde contient **toutes** les données : on la protège (chiffrement, accès restreint).
- **Réplication** : copier en continu les données sur un second serveur **n'est pas une sauvegarde** : une suppression ou un chiffrement par un rançongiciel est **répliqué aussitôt**.
- **Site de secours** : *froid* (local vide à équiper), *tiède* (matériel prêt, à configurer), *chaud* (infrastructure en fonctionnement, bascule rapide). Plus c'est chaud, plus le RTO est court et le coût élevé.

---

## 4. Documenter et tester le plan

Un plan de reprise utilisable contient :

| Élément | Contenu |
|---|---|
| **Périmètre et objectifs** | Services, RTO, RPO |
| **Rôles** | Qui décide, qui exécute, qui prévient les utilisateurs |
| **Contacts** | Fournisseurs, support, direction (accessibles **hors** du système en panne) |
| **Procédures pas à pas** | Où est la sauvegarde, comment la restaurer, vérification |
| **Ordre de redémarrage** | Dans l'ordre des **dépendances** : réseau, annuaire et DNS, base de données, puis services applicatifs |
| **Communication** | Ce qu'on dit aux utilisateurs et à la direction |

> [!WARNING]
> **Une sauvegarde non testée n'est pas une sauvegarde.** On teste (1) la **restauration d'un fichier**, (2) la **restauration complète** d'un serveur avec **mesure du temps réel** (comparé au RTO), (3) à intervalles réguliers, un **exercice de reprise**. Le plan est **mis à jour** après chaque changement d'infrastructure.

La norme **ISO 22301** (systèmes de management de la continuité d'activité) formalise cette démarche dans les organisations qui s'y engagent.

## 5. Le mode dégradé

Entre « tout fonctionne » et « tout est arrêté » existe un état intermédiaire : le **mode dégradé**. Le service **continue à être rendu avec des fonctions réduites, une capacité plus faible ou des moyens de remplacement**, le temps de la réparation. Le référentiel demande que ces solutions de fonctionnement soient **décrites** à la conception et **vérifiées périodiquement** en exploitation.

| Service | Panne | Mode dégradé possible |
|---|---|---|
| Messagerie | Serveur principal arrêté | Webmail de secours en lecture seule, envoi différé |
| Serveur de fichiers | Disque en panne | Accès en lecture à la dernière copie, écriture suspendue |
| Application métier | Base de données indisponible | Saisie sur formulaire papier, ressaisie après reprise |
| Accès Internet | Lien principal coupé | Lien de secours (4G) réservé aux services essentiels |

### Cinq questions pour décrire un mode dégradé

1. **Quelles fonctions** sont maintenues, lesquelles sont suspendues ?
2. **Quelle capacité** reste disponible (nombre d'utilisateurs, débit) ?
3. **Qui décide** de basculer, et **à partir de quel signal** ?
4. **Quelle durée maximale** est acceptable dans cet état ?
5. **Comment revient-on** au mode nominal, sans perdre ni dupliquer de données ?

**Exemple chiffré.** Un lien principal de 800 Mbit/s est remplacé par un lien de secours de 500 Mbit/s : la capacité restante est 500 / 800 = **62,5 %**. Si le trafic habituel est de 600 Mbit/s, le lien de secours est **saturé** : il faut décider quels flux sont priorisés (S12).

> [!WARNING]
> Un mode dégradé **non vérifié** est une hypothèse. On le **teste périodiquement** (coupure volontaire planifiée, bascule vers le secours) et on consigne le résultat : durée de bascule, fonctions réellement maintenues, écarts avec le plan.

## Ce que tu dois retenir de la séance

- **PCA** : continuer pendant l'incident ; **PRA** : repartir après ; **sauvegarde** : un moyen.
- **RTO** (durée d'arrêt maximale) et **RPO** (perte de données maximale) **dimensionnent** la solution.
- Types : **complète**, **différentielle**, **incrémentale** ; règle **3-2-1** ; **réplication ≠ sauvegarde**.
- **Documenter** le plan et **tester** la restauration avec **mesure du temps**.
- **Mode dégradé** : service réduit mais rendu ; décrit (fonctions, capacité, décision, durée, retour) et **vérifié périodiquement**.
