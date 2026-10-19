# Corrigé – S07 : Déploiement automatisé

*Réservé à l'enseignant.*

> [!WARNING]
> Le fichier preseed a été vérifié en **syntaxe** (`debconf-set-selections -c`), mais l'**installation complète n'a pas été exécutée**. Faire un essai avant la séance : les questions de l'installeur varient d'une version de Debian à l'autre, et il peut rester une question à ajouter au fichier.

## Partie A – Choix de méthode

Accepter toute réponse justifiée par le **nombre** de machines, leur **homogénéité** et la **fréquence** de déploiement. Une réponse « tout automatiser » sans calcul de rentabilité est incomplète.

## Partie B

- La vérification `-c` ne contrôle que la **syntaxe**.
- Empreinte : doit commencer par `$6$` (SHA-512).
- Si l'élève met le mot de passe en clair au lieu de l'empreinte : l'installeur échoue ou l'enregistre mal ; reprendre avec `openssl passwd -6`.

## Partie C – Déploiement

| Contrôle | Attendu |
|---|---|
| Journal du serveur web | `GET /preseed.cfg HTTP/1.1" 200` |
| Installation | Aucune question posée jusqu'au redémarrage |
| Durée | Environ 10 à 20 minutes selon le miroir et la connexion |

**Pannes fréquentes.**

- **Fichier introuvable (404)** : le serveur web n'est pas lancé dans le dossier du preseed.
- **L'installeur pose la question du clavier ou du réseau** : la ligne `auto=true priority=critical` est mal saisie, ou le clavier de la console n'est pas AZERTY au moment de saisir l'URL.
- **Pas de réseau** : machine hors du réseau NAT `lab-nat`.
- **Partitionnement qui demande confirmation** : une des lignes `partman/...` manque ou diffère selon la version.
- **Adresse de `DEPLOI`** : la relever après le changement de carte réseau.

## Partie D – Conformité

Tous les contrôles attendus doivent être « conformes ». L'élève qui trouve un écart (par exemple `curl` absent) a l'occasion de corriger `pkgsel/include`.

## Idée à faire dire

L'installation automatisée donne une machine **installée** ; la **configuration** (pare-feu, services, supervision) relève de la gestion des configurations (S08).

## Bilan de compétences

Auto-évaluation ; B2.2 proposée, à valider.
