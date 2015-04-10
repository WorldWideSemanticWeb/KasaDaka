#!/bin/sh
# Derived from http://offbytwo.com/2008/05/09/show-ip-address-of-vm-as-console-pre-login-message.html
if [ "$METHOD" = loopback ]; then
    exit 0
fi

# Only run from ifup.
if [ "$MODE" != start ]; then
    exit 0
fi

cp /etc/issue-default /etc/issue
ip=$(ip -f inet -o addr show enp0s20u2u4 | awk '{ print $4 }' | cut -d/ -f 1)
sed -i -e 's/__IP__/$ip/g' /etc/issue
echo "$ip" >> /etc/issue

