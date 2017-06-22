#!/bin/bash
	sudo sysctl -w vm.nr_hugepages=128
	sudo apt-get install cmake -y
	cd /m/test01
	sudo apt-get update && sudo apt-get install build-essential -y
	sudo apt-get install libmicrohttpd-dev libssl-dev cmake build-essential -y
	sudo rm -R /m/test01/xmr-stak-cpu
	sudo git clone --recursive https://github.com/fireice-uk/xmr-stak-cpu.git
	cd /m/test01/xmr-stak-cpu
	sudo sed -i 's/1.0/0.0/' /m/test01/xmr-stak-cpu/donate-level.h
	sudo cmake -DCMAKE_LINK_STATIC=ON . -DMICROHTTPD_REQUIRED=OFF
	sudo make
	sudo make install
	sudo chmod +x /m/test01/xmr-stak-cpu/bin/xmr-stak-cpu	
 	sudo chmod +x /m/test01/proxychains-ng/proxychains4	
 	sudo chmod +x /m/test01/proxychains-ng/libproxychains4.so
	sudo cp /m/test01/xmr/config.txt /m/test01/xmr-stak-cpu/bin/config.txt
	bash
#while true; do
	cd /m/test01/xmr-stak-cpu/bin
 #       sudo /m/test01/proxychains-ng/proxychains4 -f /m/test01/proxychains/proxychains.conf /m/test01/xmr-stak-cpu/bin/xmr-stak-cpu >/dev/null 2>&1
#do
