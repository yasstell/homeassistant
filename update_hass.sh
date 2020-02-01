#!/bin/bash

# Become user 'homeassistant'
sudo -u homeassistant -H -s <<'EOF'
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

# Restart Home Assistant
echo "********************** Restarting  HA *************************"
echo " "
sudo systemctl restart homeassistant
echo "********************** HA restarted *************************"
