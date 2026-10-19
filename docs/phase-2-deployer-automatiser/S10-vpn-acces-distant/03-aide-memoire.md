# Aide-mémoire – VPN et WireGuard

*BTS SIO SISR 2e année – Bloc 2 – S10*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

## Deux usages

| Site à site | Nomade |
|---|---|
| Entre passerelles ; transparent | Client sur le poste ; l'utilisateur se connecte |

Un VPN apporte **confidentialité, intégrité, authentification** : il protège le **trajet**, pas les extrémités.

## Plan d'adressage

Réseaux des sites **distincts** · réseau du tunnel `/30` (2 adresses) · port UDP du VPN ouvert.

## WireGuard

```bash
umask 077
wg genkey | sudo tee /etc/wireguard/prive.key | wg pubkey | sudo tee /etc/wireguard/public.key
sudo wg-quick up wg0                 # monter
sudo wg-quick down wg0               # couper
sudo systemctl enable wg-quick@wg0   # au démarrage
sudo wg show                         # pairs, latest handshake
```

```ini
[Interface]
Address = 10.99.0.1/30
ListenPort = 51820
PrivateKey = <clé privée locale>

[Peer]
PublicKey = <clé publique du pair>
Endpoint = <adresse publique>:51820
AllowedIPs = <adresse du pair dans le tunnel>/32, <réseau distant>
```

`AllowedIPs` = routage **et** filtrage.

## Routage et pare-feu

```bash
sudo sysctl -w net.ipv4.ip_forward=1
sudo tcpdump -n -i <wan> -c 6          # paquets UDP illisibles
sudo tcpdump -n -i wg0 -c 6            # paquets en clair, avant chiffrement
```

## Réflexes

- Clé privée : droits `600`, jamais dans Git ni envoyée par mail.
- Réseaux des sites **sans chevauchement**.
- Filtrer **ce qui traverse** le tunnel.
- Superviser le tunnel (dernière poignée de main).
- Un portable perdu : **révoquer** sa clé côté passerelle.
