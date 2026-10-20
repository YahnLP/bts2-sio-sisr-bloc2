# Corrigé – S04 : Qualité de service

*Réservé à l'enseignant.*

> [!WARNING]
> Les commandes `tc` du TP n'ont **pas été exécutées** lors de la rédaction (outil absent du ​poste de conception). Les ordres de grandeur ci-dessous sont des attendus théoriques : **tester le TP une fois** avant la première séance et ajuster.

## Valeurs attendues (ordres de grandeur)

| Étape | Attendu |
|---|---|
| A – référence | Débit proche de celui du lien virtuel (plusieurs centaines de Mbit/s) ; RTT d'une fraction de ​milliseconde ; perte 0 % |
| B – goulot 10 Mbit/s | Débit ≈ 9 à 10 Mbit/s ; RTT et écart-type nettement plus élevés qu'en A |
| C – priorisation | RTT du `ping` proche de la référence ; compteurs : presque tous les octets en classe 1:20 |
| D – marquage | `tcpdump` affiche `tos 0xb8` ; 0xb8 = 184 = 46 × 4 → DSCP EF |
| E – Cisco | `class-map match-any` sur `dscp ef`, `policy-map` avec `priority` (file à priorité stricte) et `fair-queue` par défaut, `service-policy output` sur l'interface de sortie |

## Pannes fréquentes

- **Nom d'interface** : `$IF` mal renseigné (`ip -br a`).
- **Aucun ​effet du goulot** : l'offload de segmentation (TSO/GSO) de la carte virtuelle fausse la mise en forme ; essayer `sudo ethtool -K $IF tso off gso off gro off`.
- **`RTNETLINK answers: File exists`** : une configuration précédente subsiste ; `sudo tc qdisc del dev $IF root` puis recommencer.
- **Mauvais sens de la mesure** : la priorisation `tc` agit sur la **sortie** de l'interface où elle est posée ; mesurer dans le sens SRV → CLI.
- **`iperf3` refusé** : serveur non lancé sur CLI (`iperf3 -s`).

## Idées à faire dire

- La QoS **répartit** la bande passante, elle n'en crée pas.
- Elle n'agit qu'en cas de **congestion**.
- On marque à la **frontière de ​confiance**.
- Voix : délai ≤ 150 ms, gigue < 30 ms, perte ≤ 1 % (source citée dans le cours).

## Bilan de compétences

Auto-évaluation ; B2.1 et B2.3 proposées, à valider.
