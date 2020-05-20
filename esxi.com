@       IN      SOA     dns1.esxi.com. admin.dns1.esxi.com (
                              3         ; Serial
             604800     ; Refresh
              86400     ; Retry
            2419200     ; Expire
             604800 )   ; Negative Cache TTL

; name servers - NS records
    IN      NS      dns1.esxi.com.

; name servers - A records
nas.esxi.com. IN A 192.168.0.3
nagios-dev.esxi.com. IN A 192.168.0.4
desktop.esxi.com. IN A 192.168.0.7
mediacenter.esxi.com. IN A 192.168.0.8
graylog.esxi.com. IN A 192.168.0.9
storage.esxi.com. IN A 192.168.0.10
gw.esxi.com. IN A 192.168.0.11
ldap.myfuckingldap.com. IN A 192.168.0.12
kali.esxi.com. IN A 192.168.0.13
vcenter.esxi.com. IN A 192.168.0.15
puppet01.esxi.com. IN A 192.168.0.16
plex.esxi.com. IN A 192.168.0.18
puppetdb.esxi.com. IN A 192.168.0.17
;puppet02.esxi.com. IN A 192.168.0.19
canary.esxi.com. IN A 192.168.0.22
nfs-share.esxi.com. IN A 192.168.0.23
ansible.esxi.com. IN A 192.168.0.24
ntp.esxi.com. IN A 192.168.0.25
puppet-dev.esxi.com. IN A 192.168.0.26
puppetdb02.esxi.com. IN A 192.168.0.27
mongodb01.esxi.com. IN A 192.168.0.28
mongodb02.esxi.com. IN A 192.168.0.29
puppet02.esxi.com. IN A 192.168.0.30
dns1.esxi.com.	IN A 192.168.0.38
dns2.esxi.com. IN A 192.168.0.42
esxi3.esxi.com.	IN A 192.168.0.39
zabbix.esxi.com. IN A 192.168.0.31
podman.esxi.com. IN A 192.168.0.45

puppet-server.esxi.com. IN A 192.168.0.50
puppetdb-server.esxi.com. IN A 192.168.0.51

; DEV

storage2.esxi.com IN A 192.168.0.99
