# Cours – Coût de possession, éthique et environnement

*BTS SIO SISR 2e année – Bloc 2 – S03*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

Le prix d'achat n'est **qu'une partie** de ce que coûte une solution. Pour conseiller un client, l'administrateur compare des solutions sur **toute leur vie** et pose aussi des questions qui ne sont pas financières : durée de vie, consommation, dépendance au fournisseur, protection des données.

---

## 1. Le coût de possession (TCO)

Le **coût total de possession** (en anglais *total cost of ownership*, TCO) est la somme de **tous les coûts** d'une solution sur sa durée d'utilisation.

| Famille de coûts | Exemples | Nature |
|---|---|---|
| **Acquisition** | Matériel, licences, logiciels, câblage | Ponctuelle |
| **Mise en service** | Installation, configuration, migration des données, tests | Ponctuelle |
| **Formation** | Formation des administrateurs et des utilisateurs | Ponctuelle (puis renouvelée) |
| **Exploitation** | Électricité, refroidissement, hébergement, abonnement, ligne Internet | Récurrente |
| **Maintenance et support** | Contrat de maintenance, pièces, temps d'administration | Récurrente |
| **Sauvegarde et sécurité** | Logiciel, stockage, supervision, mises à jour | Récurrente |
| **Risques** | Coût d'une indisponibilité, d'une perte de données | Éventuelle |
| **Fin de vie** | Reprise, effacement sécurisé des données, recyclage | Ponctuelle |

**TCO sur n ans = coûts ponctuels + (coûts récurrents annuels × n)**

> [!NOTE]
> **Les coûts cachés.** Ce sont souvent le **temps d'administration**, la **formation** et la **migration** qui font la différence, pas le prix des licences. Une solution « gratuite » (logiciel libre) coûte du temps de compétence.

### Calculer la consommation électrique

| Grandeur | Formule | Exemple |
|---|---|---|
| Énergie annuelle | puissance (kW) × heures de fonctionnement | 0,25 kW × 8 760 h = **2 190 kWh** par an |
| Coût annuel | énergie × prix du kWh | 2 190 × 0,20 € = **438 €** par an |

(Un an = 8 760 heures. Le prix du kWh est une **hypothèse** : prends le tarif réel du client.)

**Test flash.** Un serveur de 300 W fonctionne en continu. Quelle énergie consomme-t-il sur un an ?

<details markdown="1">
<summary>Voir la réponse</summary>

0,3 kW × 8 760 h = **2 628 kWh** par an.

</details>

### Le coût d'une indisponibilité

Ce coût est souvent **plus élevé** que le matériel. Estimation simple :

**Coût = nombre de personnes bloquées × coût horaire × durée de la panne**

Exemple : 12 personnes × 40 € de l'heure × 4 heures = **1 920 €**, sans compter les retards et la perte de confiance. C'est ce qui justifie l'investissement dans la sauvegarde et la redondance (séances S05 et S12).

---

## 2. Comparer des modèles de solution

| Modèle | Principe | Avantages | Points de vigilance |
|---|---|---|---|
| **Achat sur site** | Le client possède et héberge le matériel | Maîtrise totale, pas d'abonnement | Investissement initial, compétences, remplacement |
| **Location, crédit-bail** | Le matériel est loué | Lisse la dépense | Coût total souvent plus élevé, durée d'engagement |
| **Service hébergé (cloud)** | Abonnement à un service géré par un prestataire | Pas de matériel, évolutif, géré | Coût récurrent, **dépendance** au fournisseur, dépendance à la ligne Internet, localisation des données |
| **Logiciel libre** | Pas de licence, code ouvert | Pas de frais de licence, pas de verrouillage | Temps d'administration et de formation, support à organiser |
| **Logiciel propriétaire** | Licences payantes | Support éditeur, compétences répandues | Coût des licences, dépendance à l'éditeur |

### Méthode de comparaison

1. **Fixer** la durée d'étude (par exemple cinq ans) et le **périmètre** (mêmes fonctions pour toutes les solutions) ;
2. **Lister** les coûts par famille pour chaque solution ;
3. **Poser les hypothèses** (prix, volumes, temps d'administration) et les **écrire** ;
4. **Calculer** le TCO de chaque solution ;
5. Faire une **analyse de sensibilité** : que se passe-t-il si une hypothèse change (+25 % de l'abonnement, un temps d'administration différent) ?
6. **Conclure** en tenant compte des critères **non financiers**.

> [!WARNING]
> Un TCO n'est **pas une vérité** : c'est le résultat d'**hypothèses**. Un bon technicien les affiche et montre **ce qui ferait changer la conclusion**.

---

## 3. Contraintes éthiques et environnementales

Le référentiel attend que l'administrateur prenne en compte, dans le choix d'une solution, des **contraintes éthiques et environnementales**.

### L'impact environnemental du numérique

Selon l'[étude ADEME-Arcep](https://www.arcep.fr/uploads/tx_gspublication/dossier-presse-Etude-Ademe-Arcep-lot3_mars2023.pdf) (chiffres de 2020, publiés en 2023) :

- **79 %** de l'empreinte carbone du numérique en France provient des **équipements** (terminaux, mais aussi serveurs et équipements réseau d'extrémité) ; les centres de données en représentent environ 16 % et les réseaux environ 5 % ;
- les équipements émettent **surtout lors de leur fabrication** (environ 80 % de leur impact), l'usage comptant pour environ 20 %.

**Conséquence pratique :** le geste le plus efficace est souvent **d'allonger la durée de vie** des équipements et d'éviter d'en acheter plus que nécessaire.

| Levier | Ce que l'administrateur peut faire |
|---|---|
| **Allonger la durée de vie** | Choisir du matériel réparable et évolutif (mémoire, disques), maintenir à jour pour éviter l'obsolescence logicielle |
| **Réemployer** | Envisager du matériel **reconditionné** pour des usages adaptés |
| **Dimensionner juste** | Ne pas surdimensionner « au cas où » ; prévoir l'évolutivité |
| **Mutualiser** | **Virtualiser** plusieurs serveurs sur une machine (séance S06) |
| **Réduire la consommation** | Matériel économe, mise en veille des postes, extinction des équipements inutiles |
| **Fin de vie** | Effacer les données de façon sécurisée, confier le matériel à une filière de **recyclage** |

La loi n° 2021-1485 du 15 novembre 2021 **visant à réduire l'empreinte environnementale du numérique** en France fixe des objectifs de sobriété ; consulte son texte pour le détail des obligations.

### Les questions éthiques

| Question | Pourquoi elle se pose |
|---|---|
| **Où sont les données ?** | Un hébergeur situé hors de l'Union européenne ou soumis à une législation étrangère pose un problème de **protection des données personnelles** |
| **Peut-on en sortir ?** | Le **verrouillage** sur un fournisseur coûte cher à la sortie : prévoir la **réversibilité** (récupération des données dans un format ouvert) |
| **Qui est responsable ?** | Un service géré par un tiers ne dispense pas le client de ses obligations |
| **Qui peut l'utiliser ?** | **Accessibilité** pour les personnes en situation de handicap |
| **D'où vient le matériel ?** | Les conditions d'extraction et de fabrication des équipements posent des questions sociales et environnementales |

---

## 4. Argumenter un choix

Un conseil d'administrateur ne dit pas « je choisis X ». Il dit : **« Je recommande X, parce que… ; la solution Y est moins chère mais… ; ce qui ferait changer ma recommandation, c'est… »**.

Structure d'une argumentation :

1. **Critères** retenus (coût, fiabilité, impact, sécurité, compétences disponibles) ;
2. **Comparaison** chiffrée et qualitative ;
3. **Recommandation** ;
4. **Limites** et conditions de remise en cause.

## Ce que tu dois retenir de la séance

- **TCO = ponctuel + récurrent × durée.** Le temps d'administration, la formation et la migration comptent.
- Un TCO repose sur des **hypothèses** : on les écrit et on teste leur **sensibilité**.
- Le **coût d'une panne** peut dépasser celui du matériel.
- **Fabriquer** pèse lourd dans l'impact d'un équipement : **durée de vie** et **sobriété** d'abord.
- Penser **réversibilité** et **localisation des données** avant de s'engager.
