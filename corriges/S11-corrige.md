# Corrigé – S11 : Supervision avancée

*Réservé à l'enseignant. Les configurations rsyslog (serveur et client) ont été validées (`rsyslogd -N1`) et la ​centralisation a été essayée en local (message envoyé en TCP, fichier créé dans un dossier par machine et par programme). **Non testé** : la partie Zabbix (items, déclencheurs, `UserParameter`, notification), faute de serveur Zabbix. Les expressions sont écrites pour la syntaxe de ​Zabbix 6.0 et 7.0 : à vérifier sur la version installée.*

## Partie A

Accepter tout indicateur proche du **service rendu**, avec deux niveaux de seuil et un nombre de mesures. Refuser « processeur > 90 % » comme unique critère d'astreinte.

## Partie B

| Étape | Attendu |
|---|---|
| Serveur | `ss -tln` montre `:514` ; `rsyslogd -N1` sans ​erreur |
| Client | Message `OK`/`ECHEC test depuis web1` visible sur SUP dans `/var/log/centralise/web1/sauvegarde.log` |

**Pannes fréquentes.**

- `rsyslog` non installé sur Debian (journald seul).
- Port 514 filtré par un pare-feu.
- **Horloges** décalées : messages datés de façon ​incohérente ; vérifier NTP.
- Fichier de configuration du serveur : la condition `$fromhost-ip != '127.0.0.1'` exclut les messages locaux de SUP (voulu).
- Droits du dossier `/var/log/centralise` : par défaut ​rsyslog tourne en tant que `root` sur Debian.

## Partie C – Zabbix (à contrôler à la première utilisation)

- Délai de détection avec `#3` et 30 s : 60 à 90 s.
- Si l'item « contrôle simple » ne renvoie rien : vérifier le serveur Zabbix (processus `zabbix_server`), l'adresse, le port.
- `UserParameter` : l'utilisateur `zabbix` doit pouvoir exécuter `/usr/local/bin/rapport.sh` ; ​redémarrer l'agent après modification du fichier ; tester avec `zabbix_agentd -t rapport.code` (ou `zabbix_agent2 -t`).
- Notification : sans média configuré, aucune action ne s'exécute ; prévoir un média de laboratoire (ou capturer la ligne dans « Rapports »).

## Partie E – Cause racine

**Disque saturé.** L'alerte de 02:04 (et l'échec de sauvegarde de 02:03) n'a pas été traitée. Corrections immédiate et durable : voir le TP. Attendre aussi la ​remarque : **personne n'était destinataire** de l'alerte de nuit.

## Bilan de compétences

Auto-évaluation ; B2.3 proposée, à valider.
