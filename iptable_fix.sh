#! /bin/sh

sed -i 's/IPTABLES_SAVE_ON_STOP="no"/IPTABLES_SAVE_ON_STOP="yes"/' /etc/sysconfig/iptables-config
sed -i 's/IPTABLES_SAVE_ON_RESTART="no"/IPTABLES_SAVE_ON_RESTART="yes"/' /etc/sysconfig/iptables-config
/sbin/iptables -I INPUT 5 -m state --state new -m tcp -p tcp --dport 4505 -j ACCEPT
/sbin/iptables -I INPUT 6 -m state --state new -m tcp -p tcp --dport 4506 -j ACCEPT

/sbin/service iptables restart
