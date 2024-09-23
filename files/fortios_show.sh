#!/usr/bin/bash

# Approach used due to difficulty in getting the fortinet.fortios ansible collection working.
# Something is broken on the API outputs 
# REF : documentation/issues.md issue #3

# SSH into fortigate device, extract configs and save them to a file

# Externalizing the variables.
# Variables will be input variables from Ansible playbook

CMD=show
FORTI_USER=$1
FORTI_PASSWORD=$2
FORTI_IP=$3
OUTPUT_FILE=$4


# SSH into the FortiGate and retrieve the running configuration
sshpass -p "$FORTI_PASSWORD" ssh -o StrictHostKeyChecking=no "$FORTI_USER@$FORTI_IP" "$CMD" > "$OUTPUT_FILE"
