# Aide-mémoire – Virtualisation

*BTS SIO SISR 2e année – Bloc 2 – S06*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

## Vocabulaire

| Terme | Sens |
|---|---|
| Hôte / invité | Machine physique / machine virtuelle |
| Type 1 | Installé sur le matériel (Proxmox, ESXi, Hyper-V) |
| Type 2 | Installé comme une application (VirtualBox) |
| Instantané | Retour en arrière temporaire, **pas** une sauvegarde |
| Clone complet / lié | Copie indépendante / copie dépendante du disque d'origine |

## Réseaux VirtualBox

| Mode | Usage |
|---|---|
| NAT | Internet pour une VM isolée |
| Réseau interne (`intnet`) | Laboratoire isolé |
| Pont | VM visible sur le réseau physique |
| Privé hôte | Administration depuis l'hôte |

## `VBoxManage`

```bash
VBoxManage list vms
VBoxManage clonevm modele --name VM-A --register --mode machine
VBoxManage modifyvm VM-A --nic1 intnet --intnet1 lab-a
VBoxManage startvm VM-A --type headless
VBoxManage controlvm VM-A poweroff
VBoxManage snapshot VM-A take "nom" --description "texte"
VBoxManage snapshot VM-A restore "nom"
VBoxManage snapshot VM-A delete "nom"
VBoxManage showvminfo VM-A
```

## Routage entre deux sous-réseaux

```bash
sudo sysctl -w net.ipv4.ip_forward=1                          # immédiat
echo 'net.ipv4.ip_forward=1' | sudo tee /etc/sysctl.d/99-routage.conf   # durable
```

Les clients ont la VM routeur pour **passerelle**.

## Avant de cloner

Mettre à jour · supprimer les clés `ssh_host_*` · vider `/etc/machine-id` · éteindre. Sur chaque clone : `sudo dpkg-reconfigure openssh-server`.

## Réflexes

- Garder une **marge** de mémoire pour l'hôte.
- L'hôte est un **point unique de défaillance** : sauvegarder les VM.
- Supprimer les instantanés une fois la modification validée.
