# Cours – Déploiement automatisé de postes et de serveurs

*BTS SIO SISR 2e année – Bloc 2 – S07*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

Installer une machine à la main prend une heure et produit une configuration légèrement différente à chaque fois. Pour vingt postes ou dix serveurs, on **automatise** : le résultat est **identique**, **rapide** et **documenté**.

---

## 1. Les méthodes de déploiement

| Méthode | Principe | Points forts | Limites |
|---|---|---|---|
| **Clonage d'image** | On prépare une machine « modèle », on copie son disque | Très rapide | Image à refaire à chaque mise à jour ; dépendance au matériel |
| **Installation automatisée** | Un **fichier de réponses** répond à toutes les questions de l'installeur | Reproductible, léger, versionnable | Installation plus longue qu'un clonage |
| **Démarrage réseau (PXE)** | La machine démarre par le réseau et charge l'installeur depuis un serveur | Aucun support physique à manipuler | Infrastructure à mettre en place (DHCP, TFTP) |
| **Provisionnement cloud** | Un outil (cloud-init) configure la VM au premier démarrage | Adapté aux VM et au cloud | Suppose des images prévues pour cela |

Elles se combinent : un démarrage **PXE** lance une installation **automatisée** qui termine par une configuration (voir S08).

### Les outils selon le système

| | Linux | Windows |
|---|---|---|
| **Fichier de réponses** | `preseed` (Debian, Ubuntu), `kickstart` (Red Hat) | `autounattend.xml` |
| **Déploiement réseau** | PXE avec DHCP et TFTP | WDS, MDT (outils Microsoft), parfois remplacés par des solutions plus récentes |
| **Configuration après installation** | Ansible, scripts | Stratégies de groupe, scripts PowerShell |

---

## 2. L'installation automatisée Debian : le preseed

Un fichier **preseed** contient, ligne par ligne, les réponses de l'installateur :

<figure class="graphe diagramme"><svg viewBox="0 0 760 200" style="max-width:760px" role="img" aria-label="Anatomie d&#x27;une ligne de preseed Debian" xmlns="http://www.w3.org/2000/svg">
<rect x="60" y="24" width="60" height="36" rx="6" class="dg-warn"/>
<text x="90.0" y="47.0" text-anchor="middle" class="dg-t">d-i</text>
<rect x="134" y="24" width="200" height="36" rx="6" class="dg-ok"/>
<text x="234.0" y="47.0" text-anchor="middle" class="dg-t">debian-installer/locale</text>
<rect x="348" y="24" width="70" height="36" rx="6" class="dg-box"/>
<text x="383.0" y="47.0" text-anchor="middle" class="dg-t">string</text>
<rect x="432" y="24" width="120" height="36" rx="6" class="dg-soft"/>
<text x="492.0" y="47.0" text-anchor="middle" class="dg-t">fr_FR.UTF-8</text>
<line x1="90.0" y1="60" x2="90.0" y2="86" class="dg-dash"/>
<text x="90.0" y="100" text-anchor="middle" class="dg-t">Propriétaire</text>
<text x="90.0" y="118" text-anchor="middle" class="dg-i">d-i = debian-installer</text>
<line x1="234.0" y1="60" x2="234.0" y2="120" class="dg-dash"/>
<text x="234.0" y="134" text-anchor="middle" class="dg-t">La question</text>
<text x="234.0" y="152" text-anchor="middle" class="dg-i">identifie le réglage</text>
<line x1="383.0" y1="60" x2="383.0" y2="86" class="dg-dash"/>
<text x="383.0" y="100" text-anchor="middle" class="dg-t">Le type</text>
<text x="383.0" y="118" text-anchor="middle" class="dg-i">string, boolean, select, password...</text>
<line x1="492.0" y1="60" x2="492.0" y2="120" class="dg-dash"/>
<text x="492.0" y="134" text-anchor="middle" class="dg-t">La valeur</text>
<text x="492.0" y="152" text-anchor="middle" class="dg-i">la réponse donnée</text>
</svg>
<figcaption>Une ligne : propriétaire, question, type, valeur.</figcaption>
</figure>

Il couvre : la langue et le clavier, le réseau, le miroir de paquets, les comptes, le fuseau horaire, le **partitionnement**, les paquets, le chargeur de démarrage, et une commande finale (`late_command`).

> [!WARNING]
> **Le partitionnement automatique efface le disque sans demander.** Un preseed mal ciblé peut détruire les données d'une machine déjà en service. On teste d'abord sur une **VM jetable**, et on documente le disque visé.

### Les mots de passe

On ne met **pas** de mot de passe en clair dans un fichier versionné : on y met son **empreinte** (*hash*) produite par `openssl passwd -6`. En production, le compte déployé doit de toute façon être modifié ou remplacé après installation (clé SSH, gestionnaire de secrets). Dans ce cours, les mots de passe de laboratoire sont volontairement simples.

### Servir le fichier

L'installateur le récupère par le réseau (`url=http://…/preseed.cfg`) : un simple serveur web suffit. Le fichier est ainsi **centralisé** et peut être **versionné** (voir S08).

---

## 3. Principes de bon déploiement

| Principe | Pourquoi |
|---|---|
| **Reproductible** | Deux déploiements donnent le même résultat |
| **Idempotent quand c'est possible** | Relancer ne casse rien (voir S08) |
| **Testé sur une VM jetable** | Aucune erreur sur une machine en service |
| **Documenté** | Quelqu'un d'autre peut refaire sans toi |
| **Versionné** | On sait ce qui a changé, quand et pourquoi |
| **Avec vérification** | Un test confirme que la machine est conforme (service actif, version, droits) |

**Test flash.** Pourquoi faut-il tester un preseed sur une machine virtuelle neuve plutôt que sur un poste existant ?

<details markdown="1">
<summary>Voir la réponse</summary>

Parce que le partitionnement automatique **efface le disque** sans demander confirmation. Une VM neuve permet de recommencer sans perte, et de mesurer la durée réelle du déploiement.

</details>

## Ce que tu dois retenir de la séance

- Quatre méthodes : **clonage**, **installation automatisée**, **PXE**, **provisionnement cloud** ; elles se combinent.
- Le **preseed** répond aux questions de l'installateur ; il est servi par HTTP.
- Le partitionnement automatique **efface** : on teste sur une VM jetable.
- Un bon déploiement est **reproductible, testé, documenté, versionné**.
