#!/bin/bash -e
echo "Installing locales-all and setting default to en_GB.UTF-8"

on_chroot << 'EOF'
apt-get update
apt-get install -y locales-all
# Set the default system locale
update-locale LANG=en_GB.UTF-8 LC_ALL=en_GB.UTF-8
# Ensure /etc/default/locale is consistent
cat > /etc/default/locale << LOCALECONF
LANG=en_GB.UTF-8
LC_ALL=en_GB.UTF-8
LOCALECONF
EOF

