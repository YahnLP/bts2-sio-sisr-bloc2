# Cours – Virtualisation : hyperviseurs, instantanés, réseau virtuel

*BTS SIO SISR 2e année – Bloc 2 – S06*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

Un serveur physique utilise rarement plus de 20 ou 30 % de ses capacités. La **virtualisation** permet de faire tourner plusieurs « machines » isolées sur un même matériel. C'est l'outil de base de toute infrastructure moderne, et des laboratoires de tes réalisations E6.

---

## 1. Principe et vocabulaire

| Terme | Sens |
|---|---|
| **Hôte** | La machine physique (ou le système) qui fait tourner les machines virtuelles |
| **Invité** | Une machine virtuelle (VM) et son système |
| **Hyperviseur** | Le logiciel qui partage CPU, mémoire, disque et réseau entre les VM |
| **Disque virtuel** | Un fichier (VDI, VMDK, VHDX, qcow2…) qui joue le rôle du disque de la VM |

### Deux familles d'hyperviseurs

| | Type 1 (« bare-metal ») | Type 2 (« hébergé ») |
|---|---|---|
| **Installé** | Directement sur le matériel | Comme une application sur un système existant |
| **Exemples** | Proxmox VE (KVM), VMware ESXi, Hyper-V, Xen | VirtualBox, VMware Workstation |
| **Usage** | Production, serveurs | Poste de travail, laboratoire, tests |
| **Performances** | Meilleures | Un système intermédiaire de plus |

> [!NOTE]
> La frontière n'est pas toujours nette : KVM est intégré au noyau Linux et Hyper-V s'installe comme un rôle de Windows, mais tous deux fonctionnent en pratique comme des hyperviseurs de type 1. En TP, tu utilises **VirtualBox** (type 2) : les notions sont les mêmes qu'en production.

### Virtualisation et conteneurs

Une **VM** embarque un système complet (son propre noyau). Un **conteneur** (Docker, LXC) partage le noyau de l'hôte : plus léger, mais moins isolé. Les deux se complètent ; ce cours traite surtout des VM, avec un premier contact avec les conteneurs ci-dessous.

| | **Machine virtuelle** | **Conteneur** |
|---|---|---|
| Noyau | Propre à chaque VM | **Partagé** avec l'hôte |
| Démarrage | Dizaines de secondes | Moins d'une seconde à quelques secondes |
| Poids | Gigaoctets (système complet) | Mégaoctets (application et dépendances) |
| Isolation | **Forte** (frontière de l'hyperviseur) | Plus faible (même noyau) |
| Usage typique | Un serveur complet, un système différent de l'hôte | Une application, déployée à l'identique partout |

Une **image** est le modèle en lecture seule ; un **conteneur** est une instance qui s'exécute ; un **registre** stocke les images. Les données utiles se placent dans un **volume**, car le conteneur est jetable.

> [!NOTE]
> **Premier contact (20 minutes, facultatif).** Sur une VM Debian : `sudo apt install docker.io`, puis `sudo docker run --rm hello-world` (vérifie l'installation), `sudo docker run -d --name web -p 8080:80 nginx` (serveur Web accessible sur le port 8080 de la VM), `sudo docker ps` (liste), `sudo docker logs web` (journaux), puis `sudo docker stop web && sudo docker rm web` (nettoyage). **Non testé dans cette version** ; à valider avant la séance. Les noms de paquets et d'images peuvent varier.

> [!WARNING]
> **Un conteneur n'est pas un bac à sable.** Il partage le noyau de l'hôte : une faille du noyau ou un conteneur lancé avec trop de privilèges peut compromettre l'hôte. Les droits d'accès à Docker équivalent à des droits administrateur sur la machine.

**Je vérifie.** Tu dois héberger sur le même serveur un ancien logiciel qui exige un autre système d'exploitation que l'hôte et une petite application Web. Que choisis-tu pour chacun ?

<details markdown="1">
<summary>Éléments de réponse</summary>

Une **VM** pour l'ancien logiciel (autre système, isolation forte) et un **conteneur** pour l'application Web (léger, déploiement reproductible, même noyau).

</details>

---

## 2. Dimensionner : les ressources sont partagées

| Ressource | Règle de base |
|---|---|
| **Processeur** | Les cœurs virtuels (vCPU) peuvent être **sur-alloués** (plus de vCPU que de cœurs physiques), avec prudence |
| **Mémoire** | À dimensionner **sans excès** : la somme des mémoires des VM doit rester sous la mémoire de l'hôte, en laissant de la marge à l'hôte |
| **Disque** | Allocation **dynamique** (le fichier grossit) ou **fixe** ; attention à la saturation du disque de l'hôte |
| **Réseau** | Les VM partagent les cartes physiques de l'hôte |

**Test flash.** Un hôte a 16 Go de mémoire. Il doit en garder 4 pour lui. Combien de VM de 2 Go peut-il faire tourner sans manquer de mémoire ?

<details markdown="1">
<summary>Voir la réponse</summary>

(16 − 4) ÷ 2 = **6 VM**. Au-delà, l'hôte utilise le disque comme mémoire (*swap*) et tout ralentit fortement.

</details>

**Points de vigilance.** L'hôte devient un **point unique de défaillance** : s'il tombe, toutes ses VM tombent (voir la haute disponibilité en S12). Une **sauvegarde** des VM reste nécessaire (S05).

---

## 3. Les instantanés, les clones et les modèles

| Outil | Ce que c'est | Usage |
|---|---|---|
| **Instantané** (*snapshot*) | L'état d'une VM à un instant, pour y **revenir** | Avant une mise à jour risquée |
| **Clone complet** | Copie indépendante d'une VM | Dupliquer une machine |
| **Clone lié** | Copie qui dépend du disque de la VM d'origine | Gain de place, mais dépendance |
| **Modèle** (*template*) | VM de référence, préparée pour être clonée | Déployer vite (voir S07) |

> [!WARNING]
> **Un instantané n'est pas une sauvegarde.** Il dépend du même disque, grossit avec le temps et ralentit la VM s'il est conservé longtemps. On le garde **peu de temps**, on le supprime une fois la modification validée.

**Préparer un modèle.** Avant de cloner : mettre le système à jour, supprimer ce qui est propre à la machine (clés SSH de l'hôte, identifiant de machine `/etc/machine-id`, journaux), puis l'éteindre. Sans cela, tous les clones auraient la **même identité**.

---

## 4. Le réseau virtuel

| Mode (VirtualBox) | La VM peut joindre… | Les autres peuvent joindre la VM… | Usage |
|---|---|---|---|
| **NAT** | Internet et le réseau de l'hôte | Non (sauf redirections de ports) | Accès Internet pour les mises à jour |
| **Réseau NAT** | Internet et les autres VM du même réseau NAT | Entre VM du même réseau | Petit laboratoire avec Internet |
| **Réseau interne** | Seulement les VM du même réseau interne | Idem | Laboratoire isolé |
| **Accès par pont** | Le réseau physique, comme une machine à part entière | Oui | Service réellement accessible |
| **Réseau privé hôte** | L'hôte et les VM du même réseau | L'hôte | Administrer les VM depuis l'hôte |

Un **commutateur virtuel** relie les cartes virtuelles entre elles (le « pont » de Linux, `vmbr0` sous Proxmox, le *vSwitch* de Hyper-V). Pour relier **deux sous-réseaux**, on utilise une **VM routeur** à deux cartes : sa fonction de routage est activée (`net.ipv4.ip_forward=1`) et ses clients l'ont pour passerelle.

<figure class="graphe diagramme">
<svg viewBox="0.00 0.00 298.79 520.25" style="max-width:399px" role="img" aria-label="Schéma" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g class="graph" transform="scale(1 1) rotate(0) translate(10.8 509.45)">
<g class="node n&#45;rect">
<path fill="none" stroke="black" stroke-width="1.8" d="M201.59,-498.65C201.59,-498.65 75.59,-498.65 75.59,-498.65 69.59,-498.65 63.59,-492.65 63.59,-486.65 63.59,-486.65 63.59,-456.65 63.59,-456.65 63.59,-450.65 69.59,-444.65 75.59,-444.65 75.59,-444.65 201.59,-444.65 201.59,-444.65 207.59,-444.65 213.59,-450.65 213.59,-456.65 213.59,-456.65 213.59,-486.65 213.59,-486.65 213.59,-492.65 207.59,-498.65 201.59,-498.65"/>
<text text-anchor="start" x="119.09" y="-476.65" font-family="Helvetica,sans-Serif" font-size="15.00">VM A</text>
<text text-anchor="start" x="82.59" y="-459.65" font-family="Helvetica,sans-Serif" font-size="15.00">192.168.10.10</text>
</g>
<g class="node n&#45;ellipse">
<ellipse fill="none" stroke="black" stroke-width="1.8" cx="138.59" cy="-360.49" rx="137.77" ry="26.33"/>
<text text-anchor="start" x="63.09" y="-356.99" font-family="Helvetica,sans-Serif" font-size="15.00">réseau interne lab&#45;a</text>
</g>
<g class="edge">
<path fill="none" stroke="black" stroke-width="1.8" d="M138.59,-444.5C138.59,-426.97 138.59,-404 138.59,-386.67"/>
</g>
<g class="node n&#45;rect">
<path fill="none" stroke="black" stroke-width="1.8" d="M254.09,-276.33C254.09,-276.33 23.09,-276.33 23.09,-276.33 17.09,-276.33 11.09,-270.33 11.09,-264.33 11.09,-264.33 11.09,-234.33 11.09,-234.33 11.09,-228.33 17.09,-222.33 23.09,-222.33 23.09,-222.33 254.09,-222.33 254.09,-222.33 260.09,-222.33 266.09,-228.33 266.09,-234.33 266.09,-234.33 266.09,-264.33 266.09,-264.33 266.09,-270.33 260.09,-276.33 254.09,-276.33"/>
<text text-anchor="start" x="96.59" y="-254.33" font-family="Helvetica,sans-Serif" font-size="15.00">VM routeur</text>
<text text-anchor="start" x="30.09" y="-237.33" font-family="Helvetica,sans-Serif" font-size="15.00">192.168.10.1 / 192.168.20.1</text>
</g>
<g class="edge">
<path fill="none" stroke="black" stroke-width="1.8" d="M138.59,-334.17C138.59,-316.91 138.59,-294.11 138.59,-276.65"/>
</g>
<g class="node n&#45;ellipse">
<ellipse fill="none" stroke="black" stroke-width="1.8" cx="138.59" cy="-138.16" rx="138.69" ry="26.33"/>
<text text-anchor="start" x="62.59" y="-134.66" font-family="Helvetica,sans-Serif" font-size="15.00">réseau interne lab&#45;b</text>
</g>
<g class="edge">
<path fill="none" stroke="black" stroke-width="1.8" d="M138.59,-222.18C138.59,-204.64 138.59,-181.68 138.59,-164.35"/>
</g>
<g class="node n&#45;rect">
<path fill="none" stroke="black" stroke-width="1.8" d="M201.59,-54C201.59,-54 75.59,-54 75.59,-54 69.59,-54 63.59,-48 63.59,-42 63.59,-42 63.59,-12 63.59,-12 63.59,-6 69.59,0 75.59,0 75.59,0 201.59,0 201.59,0 207.59,0 213.59,-6 213.59,-12 213.59,-12 213.59,-42 213.59,-42 213.59,-48 207.59,-54 201.59,-54"/>
<text text-anchor="start" x="119.09" y="-32" font-family="Helvetica,sans-Serif" font-size="15.00">VM B</text>
<text text-anchor="start" x="82.59" y="-15" font-family="Helvetica,sans-Serif" font-size="15.00">192.168.20.10</text>
</g>
<g class="edge">
<path fill="none" stroke="black" stroke-width="1.8" d="M138.59,-111.84C138.59,-94.59 138.59,-71.79 138.59,-54.32"/>
</g>
</g>
</svg>
</figure>

## Ce que tu dois retenir de la séance

- L'**hyperviseur** partage les ressources ; **type 1** pour la production, **type 2** pour le poste et le laboratoire.
- On **dimensionne** et on garde une marge pour l'hôte ; l'hôte est un **point unique de défaillance**.
- **Instantané ≠ sauvegarde** ; on prépare un **modèle** avant de cloner.
- Le **réseau interne** isole un laboratoire ; une **VM routeur** relie deux sous-réseaux.
