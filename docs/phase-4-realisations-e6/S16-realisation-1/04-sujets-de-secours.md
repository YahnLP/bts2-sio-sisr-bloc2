# Sujets de secours pour une réalisation

*BTS SIO SISR 2e année – Bloc 2 – S16*

À utiliser si tu n'as pas de projet issu de ton entreprise. Les deux sujets sont **fictifs**, **complémentaires** et couvrent à eux deux la plupart des compétences du bloc 2 : tu peux prendre l'un en R1 et l'autre en R2 (S17). Les adresses et les noms sont des **suggestions** à adapter.

> [!NOTE]
> Un sujet de secours reste **ta** réalisation : le cahier des charges est donné, mais **les choix, la mise en œuvre, les tests et la documentation** sont les tiens.

---

## Sujet A – Un site de rendez-vous disponible, supervisé et sauvegardé

### Contexte

Le Cabinet Delorme (12 personnes) souhaite un site de prise de rendez-vous accessible aux clients. Une indisponibilité de quelques minutes est tolérable, pas de quelques heures. Les données des clients sont personnelles.

### Exigences

| # | Exigence | Critère de recette |
|---|---|---|
| A1 | Le site reste accessible quand un serveur web tombe | Arrêt d'un serveur : interruption mesurée < 10 s |
| A2 | Le répartiteur n'est pas un point unique de défaillance | Arrêt du répartiteur maître : bascule de l'adresse virtuelle |
| A3 | Les données (base) sont sauvegardées, la perte maximale est de 4 h | Sauvegarde planifiée ; dernière sauvegarde < 4 h |
| A4 | La restauration complète est possible en moins de 4 h | Restauration chronométrée, intégrité vérifiée |
| A5 | Toute indisponibilité est détectée et notifiée | Alerte reçue < 5 min après arrêt du service |
| A6 | Les journaux sont centralisés | Message d'un serveur visible sur le serveur de journaux |
| A7 | Les accès d'administration sont sécurisés | SSH par clé, droits limités |

### Briques (séances)

Machines virtuelles (S06) · HAProxy et keepalived (S12) · MariaDB + sauvegarde `tar`/`mysqldump` (S05) · script planifié (S09) · Zabbix et rsyslog (S11).

### Compétences couvertes (indicatif)

B2.1.1 · B2.1.4 · B2.1.6 · B2.2.1 · B2.2.2 · B2.2.5 · B2.3.3 · B2.3.4 · B2.3.5, et selon ta documentation B2.2.4.

### Éléments d'annexe II.E concernés

Continuité de service · tolérance de panne · répartition de charge · supervision avec alertes · sauvegarde · SGBD · deux serveurs ou plus.

### Pour aller plus loin

Ajouter un second serveur de base de données en réplication, ou un accès par certificat (HTTPS).

---

## Sujet B – Relier une agence et déployer ses postes de façon automatisée

### Contexte

Le Cabinet Delorme ouvre une agence de 6 personnes. L'agence doit accéder aux fichiers du siège de façon **sécurisée**. Les serveurs de l'agence doivent pouvoir être **reconstruits rapidement** et rester **identiques** entre eux.

### Exigences

| # | Exigence | Critère de recette |
|---|---|---|
| B1 | Le trafic entre le siège et l'agence est chiffré | Capture : illisible sur le WAN, en clair sur le tunnel |
| B2 | Un serveur de l'agence peut être déployé sans intervention | Installation par fichier de réponses, durée mesurée |
| B3 | La configuration des serveurs est décrite en code | Playbook appliqué, deuxième exécution sans changement |
| B4 | La dérive de configuration est détectée | Modification manuelle repérée par `--check --diff` |
| B5 | Une sauvegarde automatique du serveur de l'agence est réalisée | Script planifié, journal, rotation |
| B6 | L'état du tunnel est supervisé | Alerte à la coupure du tunnel |
| B7 | Les clés sont protégées et renouvelables | Droits `600`, procédure de renouvellement documentée |

### Briques (séances)

Clonage et réseaux virtuels (S06) · preseed (S07) · Git et Ansible (S08) · scripts et cron (S09) · WireGuard (S10) · Zabbix (S11).

### Compétences couvertes (indicatif)

B2.1.2 · B2.1.5 · B2.2.1 · B2.2.6 · B2.2.4 · B2.3.1 · B2.3.2 · B2.3.3, et selon ta démarche B2.1.3.

### Éléments d'annexe II.E concernés

Connexion sécurisée entre deux sites · déploiement · scripts d'automatisation · gestion des configurations · administration à distance sécurisée · chiffrement · analyse de trames.

### Pour aller plus loin

Ajouter un accès nomade, ou un filtrage `nftables` entre les deux sites.

---

> [!WARNING]
> Ces deux sujets, pris ensemble, ne couvrent **pas** tout l'annexe II.E (par exemple : service d'authentification, accès pour un terminal mobile, détection d'intrusion, qualité de service). Complète-les en S17 avec la matrice de couverture.
