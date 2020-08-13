#!/bin/bash
echo ""
echo ""
echo "Checking your linux release:"
echo ""
cat /etc/os-release
echo ""
echo ""
echo "BOOTSTRAP:"
echo "----------------------------------------"
echo "update ssh config"
sudo su -
sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
systemctl restart sshd
yum update -y
yum install vim -y
yum install lshw nmap telnet vsftpd -y
usermod -p papAq5PwY/QQM root
cp /tmp/hosts_to_copy /etc/
