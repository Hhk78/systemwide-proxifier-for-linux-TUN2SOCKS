# Feragatnâme
Bu badvpn programının tun2socks eklentisini kullanarak sistem geneli bir proxy bağlantısı yapmaya yarayan yardımcı bir betiktir. Kullanılan herhangi bir yazılım bana ait değildir sadece yardım etmeye yarayan bir betiktir

# Badvpn yazılımı resmi deposu (herkese açık olarak arşivlendi)
https://github.com/ambrop72/badvpn
Hehangi bir şekilde kaldırılırsa diye kendi hesabıma forkladım. Oradan da kullanabilirsiniz.

# Derleme
Sisteminize gereken derleme bağımlılıklarını kurun (örnek make, cmake ve gcc gibi)

Sonra depoyu klonlayın;
```bash
git clone https://github.com/ambrop72/badvpn
```

Sonrasında ise şu komutları çalıştırın;
```bash
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=.
make -j4
```

Bu komutlardan sonra badvpn deposunu kolnaldığınız badvpn dizinin içindeki build/ klasösürünün içindeki tun2socks/badvpn-tun2socks çalıştırılabilir dosyasını /bin klasörüne kopyalayın.

# Kullanım

```bash
sudo sh tun2socks.sh
```

Komutu ile kullanabilirsiniz.
