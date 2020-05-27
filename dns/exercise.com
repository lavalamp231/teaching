@       IN      SOA     dns3-class.exercise.com. admin.dns3-class.exercise.com (
                              3         ; Serial
             604800     ; Refresh
              86400     ; Retry
            2419200     ; Expire
             604800 )   ; Negative Cache TTL

; name servers - NS records
    IN      NS      dns3-class.exercise.com.

; name servers - A records
dns3-class.exercise.com. IN A 192.168.0.160
nas.esxi.com. IN A 192.168.0.3
