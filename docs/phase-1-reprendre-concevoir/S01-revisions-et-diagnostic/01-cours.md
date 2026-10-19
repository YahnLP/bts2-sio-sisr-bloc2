# Cours – Fiche de révision de la première année

*BTS SIO SISR 2e année – Bloc 2 – S01*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

Cette fiche rappelle **l'essentiel** de la première année en huit thèmes. Elle ne remplace pas les cours de l'an dernier : elle t'aide à savoir **ce que tu dois encore pouvoir faire sans aide**. Après chaque thème, un **test flash** : réponds de tête, puis ouvre la réponse.

---

## 1. Adressage IPv4 et découpage en sous-réseaux (VLSM)

| À retenir | Formule ou exemple |
|---|---|
| Adresse réseau | adresse IP **ET** masque (bit à bit) |
| Adresse de diffusion | tous les bits « machine » à 1 |
| Nombre d'hôtes utilisables | 2^h − 2, où h est le nombre de bits « machine » |
| Notation CIDR | /24 = 255.255.255.0 ; /25 = 255.255.255.128 ; /26 = 255.255.255.192 ; /27 = 255.255.255.224 |

**VLSM** : on découpe du **plus grand besoin au plus petit**, pour ne pas gaspiller d'adresses.

Exemple. Réseau 192.168.10.0/24, besoins de 100, 50 et 20 machines :

| Besoin | Bits machine | Préfixe | Réseau |
|---|---|---|---|
| 100 | 7 (126 hôtes) | /25 | 192.168.10.0/25 |
| 50 | 6 (62 hôtes) | /26 | 192.168.10.128/26 |
| 20 | 5 (30 hôtes) | /27 | 192.168.10.192/27 |

**Test flash.** Combien d'hôtes utilisables dans un /28 ?

<details markdown="1">
<summary>Voir la réponse</summary>

4 bits « machine » : 2⁴ − 2 = **14 hôtes**.

</details>

---

## 2. Commutation, VLAN et Spanning Tree

- Un **switch** apprend les adresses MAC et ne diffuse qu'au bon port. Une **diffusion** (broadcast) atteint tout le réseau local.
- Un **VLAN** découpe un switch en plusieurs réseaux locaux séparés : un VLAN = un **domaine de diffusion**.
- Port **access** : un seul VLAN, pour un poste. Port **trunk** (norme 802.1Q) : transporte plusieurs VLAN, entre switchs ou vers un routeur.
- **STP** évite les boucles. Le **pont racine** (root bridge) est le switch dont l'identifiant (priorité, puis adresse MAC) est le **plus petit**.

```text
Switch(config)# vlan 10
Switch(config-vlan)# name COMMERCIAL
Switch(config)# interface fastEthernet 0/1
Switch(config-if)# switchport mode access
Switch(config-if)# switchport access vlan 10
Switch(config)# interface fastEthernet 0/24
Switch(config-if)# switchport mode trunk
Switch# show vlan brief
Switch# show interfaces trunk
```

**Test flash.** Deux postes du même switch, dans deux VLAN différents, peuvent-ils communiquer sans routeur ?

<details markdown="1">
<summary>Voir la réponse</summary>

**Non.** Chaque VLAN est un réseau distinct : il faut un équipement de couche 3 (routeur ou switch de niveau 3) pour passer de l'un à l'autre.

</details>

---

## 3. Routage statique, inter-VLAN et relais DHCP

- Une **route statique** indique à un routeur par où joindre un réseau : `ip route 192.168.20.0 255.255.255.0 10.0.0.2`.
- La **route par défaut** (`0.0.0.0 0.0.0.0`) sert pour tout ce qui n'est pas connu.
- **Routage inter-VLAN** (« routeur sur un bras ») : une **sous-interface** par VLAN sur le lien trunk du routeur.

```text
Router(config)# interface gigabitEthernet 0/0.10
Router(config-subif)# encapsulation dot1Q 10
Router(config-subif)# ip address 192.168.10.1 255.255.255.0
Router(config-subif)# ip helper-address 192.168.99.10
```

`ip helper-address` **relaie** les demandes DHCP (diffusions) vers un serveur situé dans un autre réseau.

**Test flash.** À quoi sert la passerelle par défaut d'un poste ?

<details markdown="1">
<summary>Voir la réponse</summary>

À envoyer vers un routeur tout paquet dont la destination est **en dehors de son réseau**. Elle doit être dans le **même réseau** que le poste.

</details>

---

## 4. Services réseau : DHCP, DNS, SSH

- **DHCP** : quatre étapes, dites **DORA** : *Discover*, *Offer*, *Request*, *Acknowledge*. Le serveur donne adresse, masque, passerelle, DNS, durée de bail.
- **DNS** : traduit un nom en adresse. Enregistrements : **A** (nom → IPv4), **AAAA** (IPv6), **PTR** (adresse → nom, zone inverse), **CNAME** (alias), **NS** (serveur de la zone), **SOA** (autorité de la zone).
- **SSH** : administration distante chiffrée. Authentification par **clé** plutôt que par mot de passe quand c'est possible.

| Service | Port | Protocole de transport |
|---|---|---|
| DNS | 53 | UDP et TCP |
| DHCP | 67 (serveur) et 68 (client) | UDP |
| HTTP / HTTPS | 80 / 443 | TCP |
| SSH / SFTP | 22 | TCP |
| FTP (commandes) | 21 | TCP |
| RDP | 3389 | TCP |

**Test flash.** Quel enregistrement DNS permet de retrouver le nom à partir d'une adresse IP ?

<details markdown="1">
<summary>Voir la réponse</summary>

L'enregistrement **PTR**, dans la **zone inverse**.

</details>

---

## 5. Windows Server : Active Directory, GPO, permissions

- Un **domaine** Active Directory regroupe utilisateurs, groupes et ordinateurs gérés par un **contrôleur de domaine**. Les objets sont rangés en **unités d'organisation** (OU).
- Les **GPO** s'appliquent dans l'ordre **L**ocal, **S**ite, **D**omaine, **OU** (« LSDOU ») : la dernière appliquée, la plus proche de l'objet, l'emporte en cas de conflit.
- **Permissions de partage** et **permissions NTFS** se cumulent : c'est la **plus restrictive** qui s'applique.
- Bonne pratique de gestion des droits : **AGDLP** (comptes → groupes globaux → groupes de domaine local → permissions).

**Test flash.** Un utilisateur a « Contrôle total » sur le partage mais « Lecture » en NTFS. Que peut-il faire ?

<details markdown="1">
<summary>Voir la réponse</summary>

**Lire seulement** : la permission la plus restrictive l'emporte.

</details>

---

## 6. Linux et scripts

| Besoin | Commande |
|---|---|
| Adresses et routes | `ip -br a`, `ip route` |
| Ports en écoute | `ss -tlnp` |
| État d'un service | `systemctl status nom` |
| Journal d'un service | `journalctl -u nom` |
| Droits | `chmod 640 fichier`, `chown utilisateur:groupe fichier` |

- `chmod 640` : propriétaire lecture et écriture (6), groupe lecture (4), autres rien (0).
- **cron** : cinq champs, `minute heure jour-du-mois mois jour-de-la-semaine`. Exemple : `30 2 * * 1-5` = 2 h 30, du lundi au vendredi.
- Un script Bash commence par `#!/bin/bash`, teste les erreurs avec `$?`, et se rend exécutable avec `chmod +x`.

**Test flash.** Que signifie `0 3 * * 0` dans une table cron ?

<details markdown="1">
<summary>Voir la réponse</summary>

Tous les **dimanches à 3 h** (jour de la semaine 0 = dimanche).

</details>

---

## 7. Pare-feu, NAT et DMZ

- Un pare-feu **à états** autorise le retour d'un échange initié de l'intérieur. Politique par défaut recommandée : **tout refuser**, puis autoriser explicitement (principe du moindre privilège).
- La **DMZ** est un réseau intermédiaire qui héberge les services accessibles de l'extérieur (site web, relais de messagerie), séparé du réseau interne.
- **NAT** remplace des adresses ; **PAT** (ou *masquerade*) fait partager **une adresse publique** par de nombreux postes grâce aux numéros de ports.

**Test flash.** Pourquoi placer un serveur web en DMZ plutôt que dans le réseau interne ?

<details markdown="1">
<summary>Voir la réponse</summary>

S'il est compromis, l'attaquant reste dans la DMZ : le **réseau interne** reste protégé par un second filtrage.

</details>

---

## 8. Supervision, sauvegarde et haute disponibilité

- **Zabbix** : un *hôte* est supervisé par un *agent* installé sur la machine (ou par SNMP) ; un *item* est une mesure ; un *déclencheur* (trigger) compare la mesure à un seuil et lève une alerte.
- Règle de sauvegarde **3-2-1** : **3** copies des données, sur **2** types de supports, dont **1** hors site.
- Une sauvegarde **non testée** n'est pas une sauvegarde : on teste la **restauration**.
- **HAProxy** répartit les requêtes entre plusieurs serveurs ; **keepalived** (protocole VRRP) fait basculer une **adresse IP flottante** d'un répartiteur à l'autre en cas de panne.

**Test flash.** Pourquoi deux répartiteurs HAProxy plutôt qu'un seul ?

<details markdown="1">
<summary>Voir la réponse</summary>

Avec un seul, le répartiteur devient lui-même un **point de défaillance unique** : s'il tombe, tout le service tombe.

</details>

---

## Ce que tu dois retenir de la séance

- Tu dois pouvoir **refaire sans aide** : un découpage VLSM, une configuration de VLAN et de trunk, une route statique, un service DHCP ou DNS simple, un script court, une règle de pare-feu.
- Le **TP** te donne un auto-diagnostic pour savoir lesquels de ces points sont à reprendre, et un mini-laboratoire pour les vérifier en vrai.
