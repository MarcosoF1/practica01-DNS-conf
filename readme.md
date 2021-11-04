# Configuracion Zonas

## para crear una zona lo primero la añaderemos al archivo named.conf.local asi:

- zone "genius.com" {
-    type master;
-    file "/etc/bind/db.genius.com";
- };

## Despues para crear los registros haremos un archivo llamado db.genius.com con:

; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	genius.com. root.genius.com. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	ns.genius.com.
@	IN	A	182.22.2.2
@	IN	AAAA	::1
NS  IN  A   182.22.2.2

## Ahora echa la zona para comprobas que funciona utilizaremos el comando dig:

root@60d7fd7d5b61:/# dig genius.com

; <<>> DiG 9.16.1-Ubuntu <<>> genius.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 9240
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
; COOKIE: 1291f9d05a8cc43901000000618414089b45a5c4d734bb68 (good)
;; QUESTION SECTION:
;genius.com.                    IN      A

;; ANSWER SECTION:
genius.com.             604800  IN      A       182.22.2.2

;; Query time: 0 msec
;; SERVER: 10.1.0.254#53(10.1.0.254)
;; WHEN: Thu Nov 04 18:10:32 CET 2021
;; MSG SIZE  rcvd: 83

## Y como podemos ver dig nos devuelve la ip puesta en el archivo de la zona.

