# Corrigé – S08 : Git et Ansible

*Réservé à l'enseignant. Le playbook a été vérifié par `ansible-playbook --syntax-check`, et le comportement idempotent des tâches `template` et `lineinfile` a été testé en ​local (première exécution : 2 changements ; deuxième : 0 ; remise en conformité après modification manuelle). Les tâches `apt` et `service` n'ont pas été exécutées sur des cibles Debian : à essayer une fois avant la séance.*

## Valeurs attendues

| Étape | Attendu |
|---|---|
| A | `git log --oneline` : au moins trois lignes dont « Revert … » ; le fichier ne contient plus la ligne fautive |
| B | `ansible web -m ping` : `"ping": "pong"` pour web1 et web2 |
| C1 | `changed` > 0 sur ​chaque machine ; `curl` affiche `Serveur web1` / `Serveur web2` |
| C2 | `changed=0` sur chaque machine |
| D | `--check --diff` : `changed` seulement sur web2 (page d'accueil, ligne `PermitRootLogin`) ; après application : `changed` > 0 puis `changed=0` |

## Pannes fréquentes

- **`UNREACHABLE`** : clé SSH non copiée (`ssh-copy-id`), mauvaise adresse, VM éteinte.
- **`Missing sudo password`** : oubli de `-K` (ou de `become`).
- **Erreur YAML** : tabulation à la place d'espaces ; `--syntax-check` la signale.
- **`apt` échoue** : cibles sans ​accès Internet (carte NAT temporaire, voir S06).
- **Dérive SSH non corrigée** : la tâche `lineinfile` utilise `regexp` pour **remplacer** la ligne `PermitRootLogin` quelle que soit sa valeur ; sans `regexp`, la ligne `no` serait ajoutée **après** la ligne `yes`, et SSH retiendrait la première (`yes`). C'est un bon point de discussion.
- **Relance de SSH coupe la session** : `reloaded` ne coupe pas les connexions existantes.

## Idées à faire dire

- Idempotence : ​décrire un **état**, pas une action.
- Le dépôt Git est la **source de vérité** ; corriger à la main crée de la dérive.
- Pas de secret en clair dans le dépôt.

## Bilan de compétences

Auto-évaluation ; B2.2 et B2.3 proposées, à valider.
