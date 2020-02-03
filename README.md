# hypercx-nfv

## Generating PKI

```
mkdir -p /etc/openvpn/pki
/etc/openvpn/easy_rsa/easyrsa --pki-dir=/etc/openvpn/pki --batch init-pki
dd if=/dev/urandom of=/etc/openvpn/pki/.rnd bs=256 count=1
/etc/openvpn/easy_rsa/easyrsa --pki-dir=/etc/openvpn/pki --batch build-ca nopass
/etc/openvpn/easy_rsa/easyrsa --pki-dir=/etc/openvpn/pki --batch gen-req HyperCX nopass
/etc/openvpn/easy_rsa/easyrsa --pki-dir=/etc/openvpn/pki --batch sign-req server HyperCX

#Create pki dir .tar.gz
tar -pcvzf pki.tar.gz /etc/openvpn/pki

openssl dhparam -out /etc/openvpn/dh2048.pem 2048
openvpn --genkey --secret /etc/openvpn/ta.key
```


