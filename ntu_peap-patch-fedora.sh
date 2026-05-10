#!/bin/bash
set -e

# adfs.ntu.edu.tw speaks TLS 1.0/1.1 only — a protocol deprecated in 2021.
# Fedora's DEFAULT crypto policy rightly blocks it. We carve out a narrow
# exception instead of downgrading the entire system to LEGACY.
echo 'min_tls_version = TLS1.0' | sudo tee /etc/crypto-policies/policies/modules/NTU-TLS10.pmod > /dev/null
sudo update-crypto-policies --set DEFAULT:NTU-TLS10
