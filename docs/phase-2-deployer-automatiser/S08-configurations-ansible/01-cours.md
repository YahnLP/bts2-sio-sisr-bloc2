# Cours – Gestion des configurations et automatisation

*BTS SIO SISR 2e année – Bloc 2 – S08*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

Trois serveurs installés par le même preseed (S07) **divergent** dès le premier jour : un correctif ici, un paquet là, un fichier modifié « en urgence ». La **gestion des configurations** décrit l'état voulu dans des fichiers, applique cet état automatiquement et permet de **détecter** les écarts.

---

## 1. Pourquoi versionner : Git

| Besoin | Réponse de Git |
|---|---|
| Savoir **qui** a changé **quoi**, **quand**, **pourquoi** | `git log`, message de *commit* |
| **Revenir** à une version qui marchait | `git revert`, `git checkout` |
| Comparer deux versions | `git diff` |
| Travailler à plusieurs sans s'écraser | Branches, fusions |

Un dépôt Git contient du **texte** : fichiers de configuration, scripts, playbooks. On y met aussi la **documentation**. On n'y met **jamais** de mot de passe, de clé privée ou de secret en clair.

Les gestes de base :

```bash
git init                      # créer le dépôt
git add fichier               # préparer
git commit -m "message clair" # enregistrer une version
git log --oneline             # historique
git diff                      # voir les modifications non enregistrées
```

Un bon message de commit dit **pourquoi** : « Interdire la connexion SSH de root (exigence audit) ».

---

## 2. Ansible : décrire l'état voulu

Ansible est un outil de **gestion de configuration** « sans agent » : la machine de gestion (**contrôleur**) se connecte aux serveurs (**cibles**) par **SSH** et exécute des **modules**. Rien à installer sur les cibles, hors Python et SSH.

| Élément | Rôle |
|---|---|
| **Inventaire** | La liste des machines, regroupées (`[web]`, `[bdd]`) |
| **Module** | Une action déclarative : `apt`, `template`, `service`, `user`, `lineinfile`… |
| **Tâche** | L'appel d'un module avec ses paramètres |
| **Playbook** | Un fichier YAML qui associe des tâches à un groupe de machines |
| **Handler** | Une tâche déclenchée **seulement si** une autre a changé quelque chose (recharger un service) |
| **Modèle** (*template*) | Un fichier Jinja2 où des variables sont remplacées par machine |
| **Variable** | Une valeur réutilisable (`paquets`, `inventory_hostname`) |

### Déclaratif et idempotent

On ne dit pas « installe Apache » (action), on dit « Apache **est présent** » (état). Appliquer deux fois le même playbook donne le même résultat : c'est l'**idempotence**. La deuxième exécution n'affiche aucun changement (`changed=0`) si la machine est déjà conforme.

```text
PLAY RECAP
web1 : ok=5  changed=3  ...     ← 1re exécution : on a corrigé 3 choses
web1 : ok=5  changed=0  ...     ← 2e exécution : déjà conforme
```

### Le YAML en trois règles

1. L'**indentation** (deux espaces, jamais de tabulation) définit la structure.
2. `- ` introduit un élément de liste.
3. `clé: valeur` définit une propriété.

---

## 3. Détecter la dérive

La **dérive de configuration** est l'écart entre l'état voulu et l'état réel. Ansible la révèle sans rien modifier :

```bash
ansible-playbook site.yml --check --diff
```

`--check` simule, `--diff` montre les lignes qui changeraient. Un serveur modifié à la main apparaît alors avec des `changed`.

> [!WARNING]
> **Corriger à la main sur un serveur, c'est créer une dérive.** La bonne pratique : modifier le **playbook**, le **versionner**, l'**appliquer**. Le dépôt Git reste la **source de vérité**.

## 4. Limites et précautions

- Un playbook mal écrit applique l'erreur **partout et vite** : tester sur une machine de test, puis `--check`, puis production.
- L'accès SSH par **clé**, des droits `sudo` limités, et des **secrets chiffrés** (Ansible Vault) plutôt qu'en clair.
- Ansible n'est pas le seul outil (Puppet, Salt, Chef, Terraform pour l'infrastructure) : les principes sont les mêmes.

## Ce que tu dois retenir de la séance

- **Git** versionne la configuration : qui, quoi, quand, pourquoi, et retour arrière.
- **Ansible** : inventaire + playbook de tâches ; **déclaratif** et **idempotent**.
- `--check --diff` révèle la **dérive** ; le dépôt est la **source de vérité**.
