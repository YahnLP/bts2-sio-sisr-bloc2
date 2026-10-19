# Corrigé – S10 : VPN site à site

*Réservé à l'enseignant.*

> [!WARNING]
> Les commandes WireGuard (`wg`, `wg-quick`) et les captures **n'ont pas été exécutées** pendant la rédaction (pas de noyau ni de réseau virtuel disponibles). Monter le laboratoire une fois avant la séance.

## Partie A

| Élément | Valeur |
|---|---|
| GW-A / GW-B dans le tunnel | 10.99.0.1 / 10.99.0.2 |
| Adresses utilisables dans un `/30` | 2 |
| Port UDP | 51820 |

Agence C en `192.168.10.0/24` : chevauchement avec A, à renuméroter (ex. 192.168.30.0/24).

## Partie B

Point de contrôle : le ping WAN fonctionne, le ping vers 192.168.20.1 échoue (aucune route).

## Partie C

- `wg show` : pair, `latest handshake` (seulement après un premier échange de paquets).
- `ip route` : route `192.168.20.0/24 dev wg0` sur GW-A.
- **Fichier de configuration** : droits 600 ; clé privée de **sa** machine, clé publique du **pair**.

## Partie D

| Test | Attendu |
|---|---|
| Ping de 192.168.20.1 depuis PC-A | Réponse, TTL réduit de 1 par saut routé |
| `traceroute` | Premier saut 192.168.10.1 (GW-A), puis réponse de 192.168.20.1 (le tunnel est opaque aux sauts intermédiaires) |
| Capture WAN | Paquets UDP 203.0.113.1 ↔ 203.0.113.2, port 51820, contenu illisible |
| Capture `wg0` | ICMP en clair 192.168.10.100 → 192.168.20.1 |

## Pannes fréquentes

- **Aucune poignée de main** : pare-feu qui bloque l'UDP 51820, `Endpoint` faux, clés inversées ou mal recopiées (un espace ou une ligne en trop).
- **Ping GW-A ↔ GW-B dans le tunnel OK, mais PC-A ne passe pas** : `ip_forward` absent sur GW-A, ou passerelle de PC-A mal configurée.
- **Réponses qui ne reviennent pas** : `AllowedIPs` de GW-B n'inclut pas 192.168.10.0/24.
- **`RTNETLINK answers: Operation not supported`** : module WireGuard indisponible dans le noyau de la VM ; installer `wireguard` (et rebooter si le noyau a été mis à jour).
- **Interface WAN mal nommée** dans `tcpdump` : `ip -br a`.
- **Erreur « Permission denied » sur la clé** : utiliser `sudo` ou `umask 077` au bon moment.

## Idées à faire dire

- Un VPN protège le trajet, pas les extrémités.
- La clé privée ne circule jamais ; en cas de perte d'un portable, on révoque sa clé publique côté passerelle.
- Le routage entre sites est un problème d'**adressage** avant d'être un problème de VPN.

## Bilan de compétences

Auto-évaluation ; B2.1, B2.2 et B3.4 proposées, à valider.
