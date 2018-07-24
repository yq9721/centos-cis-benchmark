#!/bin/sh

# 3.6.5 Ensure firewall rules exist for all open ports (Scored)

# tcp
for port in $(netstat -lnt |grep ^tcp | grep LISTEN | awk {'print $4'} | cut -d":" -f2); do
        echo open tcp port $port

        iptables -L INPUT -v -n | grep "ACCEPT\s*tcp.*:$port" || exit $?

# remediation
#       iptables -A INPUT -p tcp --dport $port -m state --state NEW -j ACCEPT

done

# udp
for port in $(netstat -lnt |grep ^udp | grep LISTEN | awk {'print $4'} | cut -d":" -f2); do
        echo open udp port $port

        iptables -L INPUT -v -n | grep "ACCEPT\s*udp.*:$port" || exit $?


# remediation
#       iptables -A INPUT -p udp --dport $port -m state --state NEW -j ACCEPT

done
