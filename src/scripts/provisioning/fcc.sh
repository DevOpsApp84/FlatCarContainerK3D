cat <<EOF | tee /etc/motd
.- k3d lab ---.
|  Singleton  |
'-------------'
EOF

echo "Set Time Zone"
timedatectl set-timezone Europe/Warsaw