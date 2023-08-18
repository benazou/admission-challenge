#!/bin/bash
echo -e "Host server2\n    HostName 192.168.60.11\n    User vagrant\n    StrictHostKeyChecking no" > ~/.ssh/config
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa
sudo apt install sshpass
sshpass -p 'vagrant' ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@server2