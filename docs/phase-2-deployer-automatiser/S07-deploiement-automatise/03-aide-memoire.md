# Aide-mémoire – Déploiement automatisé

*BTS SIO SISR 2e année – Bloc 2 – S07*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

## Méthodes

| Méthode | À retenir |
|---|---|
| Clonage d'image | Rapide ; image à refaire |
| Installation automatisée | Reproductible ; fichier de réponses |
| PXE | Démarrage réseau (DHCP + TFTP) |
| cloud-init | Configuration au premier démarrage |

Fichiers de réponses : `preseed` (Debian), `kickstart` (Red Hat), `autounattend.xml` (Windows).

## Format d'une ligne preseed

```text
d-i <question> <type> <valeur>
```

## Commandes utiles

```bash
openssl passwd -6 'motdepasse'               # empreinte pour passwd/user-password-crypted
debconf-set-selections -c preseed.cfg        # vérifier la syntaxe
python3 -m http.server 8000                  # servir le dossier courant
```

Ligne à ajouter au démarrage de l'installateur :

```text
auto=true priority=critical url=http://ADRESSE:8000/preseed.cfg
```

## Réseau VirtualBox du TP

```bash
VBoxManage natnetwork add --netname lab-nat --network 10.0.2.0/24 --enable --dhcp on
VBoxManage modifyvm VM --nic1 natnetwork --nat-network1 lab-nat
```

## Réflexes

- Tester sur une **VM jetable** : le partitionnement efface le disque.
- Pas de mot de passe en clair dans un fichier versionné.
- **Vérifier** la machine déployée, puis **documenter**.
- Si l'installateur pose une question : la réponse manque au preseed.
