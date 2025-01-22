# Raspberry Pi 3v+ environment


## Development phase

We want to make the raspberry pi as manageable as possible. This means support for SSH (must), internet access and Wi-Fi access point (optional).

### Raspberry pi setup

User:<added later>
Password:<added later>

### SSH 

Should be preinstalled:

#### Test

```console
ssh <configured user>@<ip> "who"
```

### Ethernet

keep automatic dhcp

### WiFi access point

Debian might already configure wlan0 (or similar) interface. It can be removed:

```console
$ sudo nmcli con show
$ sudo nmcli con del wlan0
```

#### DHCP server

```console
$ sudo apt install dnsmasq
$ cat /etc/network/interfaces.d/wlan0 
auto wlan0
iface wlan0 inet static
   address 192.168.52.1
   network 192.168.52.0
   netmask 255.255.255.0
   broadcast 192.168.52.255
   gateway 192.168.52.1
$ cat /etc/dnsmasq.conf
interface=wlan0
dhcp-range=192.168.52.50,192.168.52.99,12h
dhcp-option=wlan0,1,255.255.255.0
dhcp-option=wlan0,3,192.168.52.2

domain=raspi.local
dhcp-authoritative
$ sudo systemctl start dnsmasq
```

#### Accesspoint
Based on https://gist.github.com/Cdaprod/c3eb1a65246625349c4ceed6e4e4135b

```console
$ cat /etc/hostapd/hostapd.conf
country_code=FI
interface=wlan0
driver=nl80211
hw_mode=g
ssid=raspi
wmm_enabled=0
macaddr_acl=0
channel=9
auth_algs=1
wpa=2
wpa_passphrase=Vahvasalasana:D
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP 
rsn_pairwise=CCMP
$ sudo systemctl unmask hostapd
$ sudo systemctl enable hostapd
$ sudo systemctl start hostapd
$ sudo systemctl start dnsmasq
```

Allow forwarding
```Console
$ cat /etc/sysctl.conf
...
net.ipv4.ip_forward=1
...
```

