# Corrigé – S06 : Virtualisation

*Réservé à l'enseignant. Les éléments de réponse sont dans le TP ; ce document ajoute les attendus et les pièges. Les commandes `VBoxManage` n'ont pas été exécutées pendant la rédaction (VirtualBox absent du poste de conception) : à tester une fois avant la séance.*

## Valeurs attendues

| Étape | Attendu |
|---|---|
| A2 | `VBoxManage list vms` : RTR, VM-A, VM-B |
| B | `ping` de la passerelle : 0 % de perte ; `traceroute` de VM-A vers 192.168.20.10 : 2 sauts (192.168.10.1 puis 192.168.20.10) |
| C | Après `restore`, le fichier supprimé est revenu ; ce qui a été créé après l'instantané a disparu |
| D | Mémoire demandée 18 Go ; disponible 28 Go ; marge 10 Go ; 8 vCPU sur 8 cœurs |

## Pannes fréquentes

- **Ping de VM-B impossible** : `ip_forward` non activé sur RTR, ou passerelle absente sur VM-A/VM-B.
- **Noms d'interface différents** (`enp0s3`, `enp0s8`, `ens…`) : relever avec `ip -br a`.
- **Deux clones avec la même MAC** : cloner avec l'option par défaut (nouvelles MAC) ou régénérer.
- **`/etc/machine-id` vide** : normal, systemd le recrée au démarrage.
- **Clés SSH absentes après clonage** : `sudo dpkg-reconfigure openssh-server`.
- **`--mode machine`** : si l'option n'est pas reconnue, utiliser l'assistant graphique de clonage.
- **Instantané à chaud** : peut être long ; préférer VM éteinte en cas de doute.

## Idées à faire dire

- Instantané ≠ sauvegarde ; clone lié = dépendance.
- L'hôte est un point unique de défaillance : sauvegarde (S05), haute disponibilité (S12).
- Le réseau interne est isolé : une carte NAT temporaire sert aux mises à jour.

## Bilan de compétences

Auto-évaluation ; B2.1 et B2.2 proposées, à valider.
