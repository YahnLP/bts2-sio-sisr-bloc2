# Aide-mémoire – Qualité de service

*BTS SIO SISR 2e année – Bloc 2 – S04*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

## Les quatre grandeurs

| Grandeur | Outil | À retenir |
|---|---|---|
| Débit | `iperf3 -c hôte -t 15` | Mbit/s |
| Latence | `ping -c 20 hôte` | RTT moyen |
| Gigue | `ping` (champ `mdev`), `iperf3 -u` | Variation du délai |
| Perte | `ping`, `iperf3 -u` | Pourcentage |

Voix : délai ≤ 150 ms, gigue < 30 ms, perte < 1 % (source : [Cisco Press](https://www.ciscopress.com/articles/article.asp?p=357102)).

## Marquages

| | CoS | DSCP |
|---|---|---|
| Où | Étiquette 802.1Q | En-tête IP |
| Taille | 3 bits (0 à 7) | 6 bits (0 à 63) |
| Voix | 5 (usuel) | 46 (EF) |
| Défaut | 0 | 0 (best effort) |

Option `ping -Q 0xb8` : DSCP 46 (0xb8 = 184 = 46 × 4).

## Mécanismes

| Besoin | Mécanisme |
|---|---|
| Identifier un flux | Classification |
| Signaler sa priorité | Marquage |
| Passer en premier | Priorité stricte, LLQ |
| Partager équitablement | Files pondérées (WFQ, CBWFQ, HTB) |
| Limiter en jetant | Policing |
| Limiter en lissant | Shaping |
| Éviter la saturation | RED, WRED |

## Linux : `tc` (sortie d'interface)

```bash
sudo tc qdisc add dev $IF root handle 1: htb default 20
sudo tc class add dev $IF parent 1: classid 1:1 htb rate 10mbit
sudo tc class add dev $IF parent 1:1 classid 1:10 htb rate 2mbit ceil 10mbit prio 0
sudo tc class add dev $IF parent 1:1 classid 1:20 htb rate 8mbit ceil 10mbit prio 1
sudo tc filter add dev $IF protocol ip parent 1:0 prio 1 u32 match ip protocol 1 0xff flowid 1:10
tc -s class show dev $IF          # compteurs
sudo tc qdisc del dev $IF root    # tout retirer
```

## Cisco (MQC)

```text
class-map match-any VOIX
 match dscp ef
policy-map QOS-WAN
 class VOIX
  priority 128
 class class-default
  fair-queue
interface serial 0/0/0
 service-policy output QOS-WAN
```

## Réflexes

- La QoS **répartit**, elle ne crée pas de bande passante.
- Elle n'agit que **s'il y a congestion**.
- On la configure à la **sortie du goulot**.
- **Mesurer avant, mesurer après.**
