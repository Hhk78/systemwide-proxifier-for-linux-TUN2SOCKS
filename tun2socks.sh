#!/bin/bash

# 5 saniyelik geri sayım
for i in {5..1}; do
    echo "Tun2socksu README.md dosyasında yazdığı gibi derleyip PATH değişkeninin olduğu herhangi bir dizinin (örnek: /bin)  içine badvpn-tun2socks olarak kopyalayıp çalıştırma yetkileri verin. Geri sayım: $i"
    sleep 1
done

# Kullanıcıdan gerekli bilgileri al
read -p "Proxy server IP adresini girin (v2ray veya shadowsocks gibi programlarda 127.0.0.1 yerine shadowsocksun bağlandığı sunucunun public IP adresini girin) : " proxy_server_ip
read -p "İnternet çıkış arayüz adını girin (örneğin eth0): " internet_interface
read -p "Proxy sunucu ip adresini ve portunu girin (eğer 127.0.01 kullanan v2ray gibi bir program var ise 127.0.0.1:port olarak girebilirsiniz): " real_proxy
sudo ip route | grep '^default' | cut -d ' ' -f 2-

read -p "İnternete bağlı olduğunuz arayüzün varsayılan ağ geçidi: " varsayilan_interface
# Komutları çalıştır
sudo badvpn-tun2socks --netif-ipaddr 10.0.0.1 --netif-netmask 255.255.255.0 --socks-server-addr $real_proxy --tundev tun0 --loglevel 1 &

# Proxy bağlantısı için tun2socks'tan IP'yi hariç tut
sudo ip route add $proxy_server_ip/32 via $varsayilan_interface dev $internet_interface

# IP adresi atama
sudo ip addr add 10.0.0.1/24 dev tun0
sudo ip link set dev tun0 up

# Default gateway'i (tun2socks) oluştur
sudo ip route del default 2> /dev/null
sudo ip route add default dev tun0 2> /dev/null
echo "İşlem tamamlandı."
