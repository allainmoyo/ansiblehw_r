#!/bin/sh

# read -p "Create log files? (y) > " addlog

# install nginx
if [[ $1 == 'y' ]] || [[ $1 == 'yes' ]]
then
  echo "Logs will be crated in ./logs directory"
  mkdir -p logs
  echo "01: Install nginx"
  ansible-playbook -i hosts nginx.yaml --tags "install_nginx" > logs/01install_nginx.log
  echo "02: Start Nginx service"
  ansible-playbook -i hosts nginx.yaml --tags "start_nginx" > logs/02start_nginx.log
#  echo "03: Add Nginx service as autorun"
#  ansible-playbook -i hosts nginx.yaml --tags "enable_nginx" > logs/03enable_nginx.log
#  echo "04: Disable Nginx service"
#  ansible-playbook -i hosts nginx.yaml --tags "disable_nginx" > logs/04disable_nginx.log
  echo "05: Stop Nginx service"
  ansible-playbook -i hosts nginx.yaml --tags "stop_nginx" > logs/05stop_nginx.log
  echo "06: Uninstall Nginx"
  ansible-playbook -i hosts nginx.yaml --tags "uninstall_nginx" > logs/06uninstall_nginx.log
  echo "07: Install Zip, Unzip, Gzip, Nano apps"
  ansible-playbook -i hosts tools.yaml --tags "install_tools" > logs/07install_tools.log
  echo "08: Uninstall Unzip, Nano apps"
  ansible-playbook -i hosts tools.yaml --tags "uninstall_tools" > logs/08uninstall_tools.log

else
  echo "No logs will be created." 

# Install Nginx  
  echo "stage01: Install Nginx"
  ansible-playbook -i hosts nginx.yaml --tags "install_nginx"

# Start nginx service
  echo "stage02: Start Nginx service"
  ansible-playbook -i hosts nginx.yaml --tags "start_nginx"

# enable nginx startup service
#  echo "stage03: Add Nginx service as autorun"
#  ansible-playbook -i hosts nginx.yaml --tags "enable_nginx"

# disabe nginx startup service
#  echo "stage04: Disable Nginx service"
#  ansible-playbook -i hosts nginx.yaml --tags "disable_nginx"

# stop nginx service
#  echo "stage05: Stop Nginx service"
#  ansible-playbook -i hosts nginx.yaml --tags "stop_nginx"

#uninstall nginx
#  echo "stage06: Uninstall Nginx"
#  ansible-playbook -i hosts nginx.yaml --tags "uninstall_nginx"

# --------------------------------------------------------------------------
# install tools
#  echo "stage07: Install zip, unzip, gzip, nano"
#  ansible-playbook -i hosts tools.yaml --tags "install_tools"

#uninstall tools
#  echo "stage08: Uninstall unzip, nano"
#  ansible-playbook -i hosts tools.yaml --tags "uninstall_tools"
fi
