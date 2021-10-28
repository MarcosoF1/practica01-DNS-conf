;
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