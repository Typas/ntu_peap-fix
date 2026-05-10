# `ntu_peap` Fix
This is the workaround for the modern system.
The root cause is due to the legacy server only supports TLS 1.0.
Use `ntu_peap-patch-fedora.sh` to downgrade the minimum TLS version requirement in Fedora.
Use `ntu_peap-nmcli-fix.sh` to fix the Network Manager configuration.
