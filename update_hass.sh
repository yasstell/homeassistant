#!/bin/bash

# Stop Home Assistant
echo "*********************** Stopping HA **************************"
echo " "
sudo systemctl stop homeassistant

# Become user 'homeassistant'
sudo su -s /bin/bash homeassistant <<'EOF'
# Open virtual environment
cd /home/homeassistant
# Activate the virtualenv
source bin/activate
# Upgrade PIP
echo "*********************** Upgrade PIP **************************"
pip install --upgrade pip
# Upgrade Home Assistant
echo "*********************** Upgrade HA **************************"
python3 -m pip install --upgrade homeassistant
# Deactivate virtualenv
deactivate
exit
EOF

# Start Home Assistant
echo "********************** Starting  HA *************************"
echo " "
sudo systemctl start homeassistant
echo "********************** HA restarted *************************"
