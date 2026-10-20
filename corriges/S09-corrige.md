# Corrigé – S09 : Scripts d'exploitation

*Réservé à l'enseignant. `sauvegarde.sh` et `rapport.sh` ont été exécutés pendant la rédaction : cas nominal, erreurs d'usage, ​rotation d'une archive datée, échec simulé de `tar` (archive incomplète supprimée, code 2), seuils du rapport. La planification (cron, `journalctl`) et la partie PowerShell n'ont pas été testées : à essayer avant la séance.*

## Partie A – Lecture

Voir les ​éléments de réponse du TP. Insister sur : `trap … EXIT` s'exécute **toujours** ; `$?` y est testé en premier ; le code `2` n'apparaît que si une commande a échoué.

## Partie B – Valeurs attendues

| Test | Code | Constat |
|---|---|---|
| Nominal | 0 | Archive créée, journal avec `DEBUT`, `OK`, `ROTATION` |
| Sans argument | 1 | Message d'usage |
| Dossier inexistant | 1 | « n'est pas un dossier » |
| Vieille archive (10 jours) | 0 | ​Archive datée supprimée (« 1 archive(s) supprimée(s) ») |
| `tar` en échec | 2 | Aucune archive incomplète ; ligne `ECHEC (code 3)` |

**Piège.** Tester la partie « permissions refusées » avec `chmod 000` ne fonctionne **pas** si l'élève travaille en `root` (root ignore les droits) : utiliser le faux `tar` du TP.

## Partie C – Rapport

- Avec le seuil de disque à 1 %, tous les systèmes de fichiers sont en alerte : code 1.
- Avec les seuils par défaut sur une VM ​saine : code 0.
- Attendre une partie mémoire équivalente à la solution ; accepter `free -m` ou `/proc/meminfo` si le calcul est juste.

## Partie D – Planification

**Pannes fréquentes.**

- Chemin relatif dans la crontab : « command not found » dans la sortie.
- Droits d'exécution manquants (`chmod +x`).
- Fin de ligne ​Windows (CRLF) si le script a été écrit sur Windows : `bad interpreter`.
- Le service `cron` absent d'une installation minimale : `sudo apt -y install cron`.
- Journal système : selon la configuration, utiliser `journalctl -u cron` ou `/var/log/syslog` s'il existe.

Rappeler de **retirer** les ​lignes de la crontab à la fin.

## Partie E – PowerShell

- `$LASTEXITCODE` après `powershell -File … -Seuil 1` : 1 ; sans seuil bas sur un disque sain : 0.
- Accepter toute planification valide (`schtasks`, `Register-ScheduledTask`).
- La stratégie d'exécution peut bloquer les scripts non ​signés : `powershell -ExecutionPolicy Bypass -File …` pour le TP, à discuter.

## Bilan de compétences

Auto-évaluation ; B2.2 et B2.3 proposées, à valider.
