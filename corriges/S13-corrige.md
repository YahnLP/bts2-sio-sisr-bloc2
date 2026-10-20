# Corrigé – S13 : Dépannage et incidents

*Réservé à l'enseignant. Le script d'injection `corriges/S13-injection-pannes.sh` est **réservé à l'enseignant** (hors site publié). Les pannes reposant sur des fichiers (3, 5) et les ​erreurs d'usage ont été essayées en local ; les pannes 1, 2, 4, 6 (Apache, `nft`, `ip`) ne l'ont pas été : à essayer une fois avant la séance.*

## Mode d'emploi

```bash
sudo ./S13-injection-pannes.sh inject 3     # injecter
sudo ./S13-injection-pannes.sh restore 3    # retirer
```

Pannes 1 à 4 sur **SRV**, pannes 5 et 6 sur **CLI** (travailler par la console de la machine virtuelle pour la panne 6, qui coupe le réseau). `/etc/hosts` de CLI doit contenir `192.168.10.10  srv.lab.local` avant la séance.

## Tableau des pannes

| # | Panne | Symptôme sur CLI | Test qui tranche | Correction |
|---|---|---|---|---|
| 1 | ​Apache arrêté | `Connection refused` | `systemctl is-active apache2` ; `ss -tlnp` sans :80 | `systemctl start apache2` |
| 2 | Pare-feu jette le port 80 | Délai dépassé ; le ping répond | `nft list ruleset` ; `tcpdump` côté SRV : `SYN` sans réponse | `nft delete table inet panne` |
| 3 | Droits `000` sur `index.html` | `403 Forbidden` | `ls -l` ; journal d'erreurs Apache | `chmod 644` |
| 4 | Apache écoute sur 8080 | `Connection refused` sur le port 80 ; fonctionne sur 8080 | `ss -tlnp` montre `:8080` ; `ports.conf` | `Listen 80` + redémarrage |
| 5 | Entrée `/etc/hosts` périmée (192.168.10.99) | Délai dépassé sur le nom ; l'IP de SRV ​répond | `getent hosts srv.lab.local` → .99 | Corriger `/etc/hosts` |
| 6 | Adresse de CLI dans 192.168.11.0/24 | `Network is unreachable` ou aucune réponse | `ip -br a`, `ip route` | Remettre 192.168.10.20/24 |

**Remarques de correction.**

- Les pannes 1 et 4 donnent le **même message** : seul `ss -tlnp` (ou `systemctl`) les distingue. À faire expliquer.
- Les pannes 2 et 5 donnent toutes deux un **délai dépassé** : le `ping` de l'adresse et `getent hosts` les séparent.
- Barème indicatif d'un journal : symptôme exact (1) ; ce qui ​marche encore (1) ; hypothèses **avant** les tests (2) ; tests ciblés, un à la fois (2) ; cause prouvée (2) ; vérification (1) ; fiche d'incident avec prévention (1).
- Pénaliser « j'ai tout redémarré » sans cause identifiée.

## Partie A

Voir les éléments de réponse du TP.

## Bilan de compétences

Auto-évaluation ; B2.3 proposée, à valider.
