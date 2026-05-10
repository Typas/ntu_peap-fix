#!/bin/bash
set -e

. /etc/os-release

if echo "$ID $ID_LIKE" | grep -qw "fedora"; then
    CA_CERT=/etc/ssl/certs/b7db1890.0
elif echo "$ID $ID_LIKE" | grep -qw "arch"; then
    CA_CERT=/etc/ssl/certs/TWCA_Root_Certification_Authority.pem
else
    echo "Unknown distro: $ID. Set CA_CERT manually." >&2
fi

if [ -n "$CA_CERT" ]; then
    nmcli connection modify ntu_peap \
        802-1x.ca-cert "$CA_CERT" \
fi

nmcli connection modify ntu_peap \
    802-1x.phase1-peapver 0 \
    802-1x.domain-suffix-match adfs.ntu.edu.tw

sudo systemctl restart NetworkManager
