# Cours – Qualité de service : mesurer et prioriser

*BTS SIO SISR 2e année – Bloc 2 – S04*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

Un lien d'accès Internet est partagé : sauvegardes, téléchargements, visioconférences, téléphonie. Quand tout passe en même temps, **tout ralentit, y compris ce qui est urgent**. La **qualité de service** (QoS, de l'anglais *quality of service*) est l'ensemble des méthodes qui permettent de **garantir un traitement adapté** aux flux importants.

---

## 1. Les quatre grandeurs à connaître

| Grandeur | Définition | Unité | Outil de mesure |
|---|---|---|---|
| **Débit** (bande passante) | Quantité de données transmise par seconde | bit/s (Mbit/s) | `iperf3` |
| **Latence** (délai) | Temps mis par un paquet pour aller d'un point à l'autre. Le `ping` donne le **temps aller-retour** (RTT) | ms | `ping` |
| **Gigue** (*jitter*) | **Variation** de la latence d'un paquet à l'autre | ms | `ping` (écart-type), `iperf3` en UDP |
| **Perte de paquets** | Part des paquets qui n'arrivent pas | % | `ping`, `iperf3` en UDP |

**Test flash.** Un lien de 100 Mbit/s est « rapide », mais ta visioconférence saccade. Quelle grandeur suspectes-tu en premier ?

<details markdown="1">
<summary>Voir la réponse</summary>

La **gigue** (et la perte de paquets) : un débit élevé ne garantit pas un délai **régulier**. La voix et la vidéo supportent mal les variations.

</details>

### D'où vient la latence ?

| Cause | Explication |
|---|---|
| **Propagation** | Le signal met du temps à parcourir la distance |
| **Transmission** | Plus un paquet est gros et le lien lent, plus il met de temps à être émis |
| **Traitement** | Chaque équipement lit l'en-tête et décide |
| **Attente en file** | Quand un lien est **saturé**, les paquets **attendent leur tour** dans une file : c'est la **première cause** de latence et de gigue en congestion |

---

## 2. Chaque flux a ses besoins

| Flux | Sensible au délai | Sensible à la gigue | Sensible à la perte | Besoin en débit |
|---|---|---|---|---|
| **Voix sur IP** | Très | Très | Oui | Faible, constant |
| **Visioconférence** | Très | Oui | Oui | Moyen à élevé |
| **Application métier interactive** (accès distant, base de données) | Oui | Peu | Oui | Faible à moyen |
| **Navigation web** | Moyen | Non | Peu | Moyen |
| **Transfert de fichiers, sauvegarde** | Non | Non | Récupérable (retransmission) | Élevé |

Ordres de grandeur usuels pour la **voix** : délai de bout en bout de **150 ms** au plus (recommandation UIT-T G.114), gigue moyenne inférieure à **30 ms** et perte inférieure à **1 %** (recommandations de conception Cisco). Source : [Cisco Press, « QoS Design Overview »](https://www.ciscopress.com/articles/article.asp?p=357102).

> [!NOTE]
> **La QoS ne crée pas de bande passante.** Elle **répartit** une ressource limitée : elle n'a d'effet que **lorsqu'il y a congestion**. Sur un lien peu chargé, tout passe sans attente.

---

## 3. Les mécanismes de la QoS

### 3.1 Classer et marquer

On **identifie** les flux (par adresse, port, protocole) et on les **marque**, pour que chaque équipement sache leur priorité sans refaire l'analyse.

| Marquage | Où | Taille | Remarque |
|---|---|---|---|
| **CoS** (norme 802.1p) | Étiquette **802.1Q** de la trame Ethernet | 3 bits (valeurs 0 à 7) | Existe seulement sur un lien trunk |
| **DSCP** | En-tête **IP** (champ DS) | 6 bits (valeurs 0 à 63) | Suit le paquet de bout en bout dans l'IP |

Valeurs DSCP usuelles : **0** (*best effort*, par défaut), **46** (**EF**, *expedited forwarding*, pour la voix), classes **AF** (*assured forwarding*) pour des flux garantis.

La limite de confiance (*trust boundary*) : on **marque au plus près de la source** et on **ne fait confiance** qu'aux marquages posés par des équipements que l'on maîtrise. Un poste d'utilisateur ne doit pas pouvoir se déclarer « prioritaire ».

### 3.2 Mettre en file et ordonnancer

| Méthode | Principe | Usage |
|---|---|---|
| **FIFO** | Premier arrivé, premier servi | Comportement par défaut |
| **Priorité stricte** | La file prioritaire est toujours servie d'abord | Voix ; risque de **famine** des autres flux |
| **Files pondérées** (WFQ, CBWFQ, HTB) | Chaque classe reçoit une **part garantie** et peut utiliser le reste | Répartition équitable |
| **LLQ** (*low latency queuing*) | Une file **prioritaire plafonnée** + des files pondérées | Voix + données |

### 3.3 Limiter le débit

| Méthode | Principe |
|---|---|
| **Policing** | Dépasser le débit autorisé → les paquets en excès sont **jetés** ou re-marqués |
| **Shaping** | Dépasser le débit autorisé → les paquets en excès sont **mis en attente** et lissés |

### 3.4 Éviter la congestion

Des mécanismes comme **RED/WRED** jettent quelques paquets **avant** la saturation complète, pour inciter les connexions TCP à ralentir.

---

## 4. Où appliquer la QoS ?

- **Au goulot d'étranglement** : le lien le plus lent, en général l'accès Internet ou le lien entre deux sites. C'est la **sortie** de cet équipement qui doit être configurée.
- **De bout en bout** : chaque équipement du chemin doit **respecter** les marquages. Sur l'Internet public, les marquages ne sont en général **pas garantis** ; la QoS s'applique donc surtout **sur des liens maîtrisés** (réseau local, liaison dédiée entre sites).

## 5. Exemple de configuration sur un routeur Cisco

On réserve 128 kbit/s à la voix (marquée DSCP EF), le reste étant partagé équitablement :

```text
Router(config)# class-map match-any VOIX
Router(config-cmap)# match dscp ef
Router(config)# policy-map QOS-WAN
Router(config-pmap)# class VOIX
Router(config-pmap-c)# priority 128
Router(config-pmap)# class class-default
Router(config-pmap-c)# fair-queue
Router(config)# interface serial 0/0/0
Router(config-if)# service-policy output QOS-WAN
Router# show policy-map interface serial 0/0/0
```

Les trois temps de cette syntaxe (*Modular QoS CLI*) : **class-map** (qui ?), **policy-map** (quoi faire ?), **service-policy** (où ?).

## 6. Sous Linux : `tc`

La commande `tc` (*traffic control*) configure les files d'attente d'une interface, **en sortie** :

| Élément | Rôle |
|---|---|
| **qdisc** | La discipline de file d'attente d'une interface (ex. `htb`) |
| **class** | Une classe de trafic avec son débit garanti (`rate`) et maximal (`ceil`) |
| **filter** | La règle qui oriente un paquet vers une classe |

Le TP de la séance utilise `tc` avec `htb` pour **créer un goulot** puis **prioriser** un flux.

## Ce que tu dois retenir de la séance

- Quatre grandeurs : **débit, latence, gigue, perte**. Les flux n'ont pas les mêmes besoins.
- La QoS **répartit**, elle ne crée pas de bande passante ; elle agit **en cas de congestion**.
- **Classer et marquer** (CoS, DSCP), puis **ordonnancer** (priorité, files pondérées), à la **sortie du goulot**.
- **Mesurer avant** (référence), **configurer**, **mesurer après** : sans mesure, pas de preuve.
