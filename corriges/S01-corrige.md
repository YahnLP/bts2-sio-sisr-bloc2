# Corrigé – S01 : Reprendre la main (révisions et auto-diagnostic)

*Réservé à l'enseignant. Les éléments de réponse de l'auto-diagnostic sont dans le TP (blocs « Éléments de réponse ») ; ce document ajoute les attendus et les pièges.*

## Partie A – Auto-diagnostic

Barème : 1 point par bonne réponse, 3 par thème, **sans note** ; l'objectif est le plan de révision.

| Question | Piège fréquent |
|---|---|
| 1 | Oublier que le masque `/20` « coupe » le troisième octet : 45 en binaire `00101101`, masque `11110000` → 32. Réseau `172.16.32.0`, diffusion `172.16.47.255` (vérifié par calcul). |
| 3 | Répondre `/27` (30 hôtes) : 60 machines exigent 6 bits « machine », donc `/26`. |
| 6 | Confondre priorité et adresse MAC : on compare **d'abord la priorité**, la MAC départage. |
| 8 et 9 | Confondre `ip helper-address` (relais DHCP) et la passerelle. |
| 14 | Additionner les permissions au lieu de retenir la plus restrictive entre partage et NTFS. |
| 17 | Lire `1-5` comme « le 1er au 5 du mois » : c'est le champ **jour de la semaine**. |
| 21 | Dire que le PAT « traduit les ports » sans dire qu'il permet de **partager une adresse**. |

## Partie B – Attendus du mini-laboratoire

| Étape | Résultat attendu |
|---|---|
| B2 | `ip -br a` : `192.168.50.10/24` sur SRV, `192.168.50.20/24` sur CLI ; `ping -c 3` : 0 % de perte |
| B3 | `curl -I` : première ligne `HTTP/1.1 200 OK` ; `ss -tlnp` montre `apache2` sur `*:80` |
| B4 | Connexion SSH sans mot de passe de compte (la clé peut demander sa propre phrase secrète si elle en a une) |
| B5 | Trois premières lignes de `tcpdump` : `[S]`, `[S.]`, `[.]` |
| C1 | `tar tzf` liste `var/www/html/index.html` |

**Pannes fréquentes.**

- Nom d'interface différent de `enp0s3` : relever `ip -br a` avant d'écrire le fichier.
- Carte restée en NAT : l'adresse `192.168.50.x` n'est pas appliquée sur la bonne carte.
- `ssh-copy-id` refusé : le compte `utilisateur` n'existe pas sur SRV, ou le service SSH n'est pas installé (étape B1).
- Paquets non installés car le réseau interne est déjà actif : repasser temporairement en NAT.

## Partie C – Plan de révision

Un bon plan nomme **un thème précis** (pas « les réseaux »), une **action** (« refaire le TP S06 de l'an dernier »), un **lieu** et une **échéance**. Repérer les étudiants dont le score est inférieur à 2 sur trois thèmes ou plus : prévoir un point individuel.

## Bilan de compétences

Les trois compétences B2.1 à B2.3 sont toutes en révision : l'enjeu est que l'étudiant **se positionne honnêtement**, pas qu'il atteigne un niveau donné dès S01.
