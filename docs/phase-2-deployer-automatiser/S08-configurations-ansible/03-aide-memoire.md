# Aide-mémoire – Git et Ansible

*BTS SIO SISR 2e année – Bloc 2 – S08*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

## Git

```bash
git init                          # créer un dépôt
git add fichier ; git commit -m "pourquoi"
git commit -am "pourquoi"         # fichiers déjà suivis
git status ; git diff ; git log --oneline
git revert --no-edit HEAD         # annuler le dernier commit (nouveau commit)
```

Jamais de mot de passe ni de clé privée dans le dépôt (l'historique les garde).

## Ansible

| Élément | Rôle |
|---|---|
| Inventaire | Machines et groupes (`[web]`) |
| Playbook | Tâches (YAML) pour un groupe |
| Module | Action déclarative (`apt`, `template`, `service`, `lineinfile`, `user`, `copy`) |
| Handler | Tâche déclenchée par `notify` si un changement a eu lieu |
| Template | Fichier Jinja2 avec variables |

```bash
ansible web -m ping
ansible web -m command -a "uptime"
ansible-playbook site.yml --syntax-check
ansible-playbook site.yml --check --diff -K   # simulation + différences
ansible-playbook site.yml -K                  # application (-K : mot de passe sudo)
ansible-inventory --list
```

## Lire un récapitulatif

```text
web1 : ok=5 changed=3 unreachable=0 failed=0
```

`changed=0` à la 2e exécution = **idempotence**. `unreachable` : problème SSH. `failed` : tâche en erreur.

## YAML

Indentation de **2 espaces** (pas de tabulation) · `- ` pour une liste · `clé: valeur`.

## Réflexes

- Ne pas corriger à la main : **modifier, versionner, appliquer**.
- Tester : `--syntax-check`, `--check --diff`, machine de test, production.
- Secrets : Ansible Vault, jamais en clair.
