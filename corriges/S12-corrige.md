# Corrigé – S12 : Haute disponibilité et répartition de charge

*Réservé à l'enseignant. Validé en local : syntaxe HAProxy (`haproxy -c`) ; **tourniquet entre deux serveurs, retrait automatique d'un serveur arrêté (état DOWN dans les statistiques) et retour après redémarrage** ; syntaxe keepalived (`keepalived -t`, hors nom d'interface propre à la machine d'essai). **Non testé** : la bascule VRRP réelle entre deux VM et les temps d'interruption mesurés (nécessitent les VM).*

## Partie A – Calculs

| Question | Réponse |
|---|---|
| 1 | 43,2 minutes par mois |
| 2 | 0,999 × 0,9999 × 0,9995 ≈ 0,9984 (99,84 %) : objectif non atteint |
| 3 | 0,999999 × 0,9999 × 0,9995 ≈ 0,9994 (99,94 %) : objectif atteint |
| 4 | Cas 2 : répartiteur unique ; cas 3 : le commutateur |

## Partie B – HAProxy

- Suite attendue : `web1 web2 web1 web2 …`
- Après arrêt d'Apache sur web1 : environ 4 à 6 s avant `DOWN` (`inter 2s`, `fall 2`) ; pendant ce délai quelques requêtes peuvent échouer.
- Retour : `UP` après deux sondes réussies.

## Partie C – keepalived

**Pannes fréquentes.**

- **Nom d'interface** faux : `WARNING - interface … doesn't exist`.
- **VIP présente sur les deux machines** : `virtual_router_id` ou `auth_pass` différents, ou paquets VRRP (protocole 112) bloqués entre LB1 et LB2.
- **Le script de vérification ne s'exécute pas** : `enable_script_security` impose un chemin absolu sans caractère modifiable par un tiers ; vérifier `systemctl is-active --quiet haproxy`.
- **HAProxy ne démarre pas** sur le secours : conflit de port, configuration non copiée.
- Si le réseau virtuel filtre le multicast (certains modes de pont), activer le mode promiscuité « Autoriser tout » sur la carte virtuelle.

## Partie D – Mesures (ordres de grandeur à confirmer en salle)

| # | Attendu |
|---|---|
| 1 | 0 à 1 ligne `ECHEC` |
| 2 | Quelques secondes (2 échecs de script à 2 s + bascule) |
| 3 | Environ 3 secondes de silence VRRP, plus la prise de la VIP |

Au retour de LB1 (priorité plus élevée) : il **reprend** la VIP (préemption par défaut) ; une courte coupure supplémentaire est normale. À discuter : `nopreempt`.

## Partie E

SPOF restants : hôte, commutateur, stockage, alimentation, administrateur unique. La HA ne protège ni d'une suppression ni d'une corruption : sauvegarde (S05).

## Bilan de compétences

Auto-évaluation ; B2.2, B2.3 et B3.4 proposées, à valider.
