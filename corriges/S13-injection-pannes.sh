#!/usr/bin/env bash
# injection-pannes.sh - RÉSERVÉ À L'ENSEIGNANT : injecte ou retire une panne dans le laboratoire S13
# Usage : injection-pannes.sh inject|restore N      (à lancer en root)
#   Pannes côté SRV (serveur web 192.168.10.10) : 1, 2, 3, 4
#   Pannes côté CLI (poste client 192.168.10.20) : 5, 6
# Préalable sur CLI : /etc/hosts contient « 192.168.10.10  srv.lab.local »
set -euo pipefail

WWW="${WWW:-/var/www/html/index.html}"
PORTS="${PORTS:-/etc/apache2/ports.conf}"
HOSTS="${HOSTS:-/etc/hosts}"
IFACE="${IFACE:-enp0s3}"
ACTION="${1:-}"; N="${2:-}"

usage() { sed -n '2,6p' "$0" >&2; exit 1; }
[[ "$ACTION" == inject || "$ACTION" == restore ]] || usage
[[ "$N" =~ ^[1-6]$ ]] || usage

case "$ACTION $N" in
  "inject 1")  systemctl stop apache2 ;;                                   # service arrêté
  "restore 1") systemctl start apache2 ;;
  "inject 2")  nft add table inet panne
               nft add chain inet panne entree '{ type filter hook input priority 0; }'
               nft add rule inet panne entree tcp dport 80 drop ;;          # pare-feu : paquets jetés
  "restore 2") nft delete table inet panne ;;
  "inject 3")  chmod 000 "$WWW" ;;                                          # droits : 403
  "restore 3") chmod 644 "$WWW" ;;
  "inject 4")  sed -i 's/^Listen 80$/Listen 8080/' "$PORTS"; systemctl restart apache2 ;;   # mauvais port
  "restore 4") sed -i 's/^Listen 8080$/Listen 80/' "$PORTS"; systemctl restart apache2 ;;
  "inject 5")  sed -i 's/^192\.168\.10\.10\([[:space:]]\+srv\.lab\.local\)/192.168.10.99\1/' "$HOSTS" ;;  # nom périmé
  "restore 5") sed -i 's/^192\.168\.10\.99\([[:space:]]\+srv\.lab\.local\)/192.168.10.10\1/' "$HOSTS" ;;
  "inject 6")  ip addr flush dev "$IFACE"; ip addr add 192.168.11.20/24 dev "$IFACE" ;;     # mauvais sous-réseau
  "restore 6") ip addr flush dev "$IFACE"; ip addr add 192.168.10.20/24 dev "$IFACE" ;;
esac
echo "Panne $N : $ACTION effectué."
