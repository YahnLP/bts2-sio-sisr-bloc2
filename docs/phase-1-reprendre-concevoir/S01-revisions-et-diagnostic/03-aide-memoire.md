# Aide-mémoire – Commandes et valeurs à connaître

*BTS SIO SISR 2e année – Bloc 2 – S01*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

## Adressage

| Préfixe | Masque | Hôtes utilisables |
|---|---|---|
| /24 | 255.255.255.0 | 254 |
| /25 | 255.255.255.128 | 126 |
| /26 | 255.255.255.192 | 62 |
| /27 | 255.255.255.224 | 30 |
| /28 | 255.255.255.240 | 14 |
| /29 | 255.255.255.248 | 6 |
| /30 | 255.255.255.252 | 2 |

Hôtes utilisables = 2^h − 2. Réseau = IP **ET** masque.

## Cisco

| Besoin | Commande |
|---|---|
| Créer un VLAN | `vlan 10` puis `name NOM` |
| Port d'accès | `switchport mode access` puis `switchport access vlan 10` |
| Port trunk | `switchport mode trunk` |
| Voir les VLAN | `show vlan brief` |
| Voir les trunks | `show interfaces trunk` |
| Route statique | `ip route RÉSEAU MASQUE PASSERELLE` |
| Sous-interface inter-VLAN | `interface g0/0.10` puis `encapsulation dot1Q 10` |
| Relais DHCP | `ip helper-address ADRESSE` |
| Voir les routes | `show ip route` |

## Linux

| Besoin | Commande |
|---|---|
| Adresses | `ip -br a` |
| Routes | `ip route` |
| Ports en écoute | `ss -tlnp` |
| État d'un service | `systemctl status nom` |
| Journal d'un service | `journalctl -u nom` |
| Droits | `chmod 640 fichier` |
| Capture | `sudo tcpdump -n -i interface port 80` |
| Clé SSH | `ssh-keygen -t ed25519` puis `ssh-copy-id utilisateur@hôte` |
| Archive | `tar czf archive.tar.gz dossier` ; contrôle : `tar tzf archive.tar.gz` |

Table cron : `minute heure jour-du-mois mois jour-de-la-semaine`.

## Ports usuels

| Service | Port |
|---|---|
| DNS | 53 |
| DHCP | 67 / 68 |
| HTTP / HTTPS | 80 / 443 |
| SSH / SFTP | 22 |
| FTP | 21 |
| RDP | 3389 |

## À retenir

- **DORA** : Discover, Offer, Request, Acknowledge.
- **LSDOU** : ordre d'application des GPO.
- **AGDLP** : comptes → groupes globaux → groupes de domaine local → permissions.
- **3-2-1** : 3 copies, 2 supports, 1 hors site.
- **Vérifier** : un service qui tourne n'est pas forcément un service qui répond.
