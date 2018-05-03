#!/usr/bin/env bash

## VARIABLES
THIS_DIR=$(cd "$(dirname "$0")"; pwd)
TDCLI='https://valtman.name/files/telegram-cli-1222'

## Print Colorful
# Print text in red
prtred() {
  printf '\e[1;31m%s\n\e[0;39;49m' "$@"
}
# Print text in green
prtgrn() {
  printf '\e[1;32m%s\n\e[0;39;49m' "$@"
}
# Print text in brown
prtbrown() {
  printf '\e[1;33m%s\n\e[0;39;49m' "$@"
}

# install Bot

      prtgrn "
 >> Fetching $TDCLI
"
      wget "$TDCLI" -O TG
      chmod +x TG
      prtgrn "
 ➡[ @llx8xll ] 
"
      sudo apt-get -y update && sudo apt-get -y upgrade 
      prtgrn "
 ➡[ @llx8xll ] 
"
      sudo apt-get --force-yes install git wget screen tmux libconfig9 libevent-dev libjansson4 libstdc++6 lua-socket lua5.2 liblua5.2 make unzip redis-server lua-sec libnotify-dev software-properties-common g++
      sudo apt-get -y update && sudo apt-get -y upgrade
      sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test && sudo apt-get update && sudo apt-get install -y gcc-4.9 g++-4.9 && sudo update-alternatives —install /usr/bin/gcc gcc /usr/bin/gcc-4.9 60 —slave /usr/bin/g++ g++ /usr/bin/g++-4.9
      sudo apt-get install lua-lgi -y
      wget http://luarocks.org/releases/luarocks-2.2.2.tar.gz
      tar zxpf luarocks-2.2.2.tar.gz
      cd luarocks-2.2.2
      ./configure; sudo make bootstrap
      sudo luarocks install luasocket
      sudo luarocks install luasec
      sudo luarocks install serpent
      sudo luarocks install redis-lua
      sudo luarocks install lua-term
      sudo luarocks install serpent
      sudo luarocks install dkjson
      sudo luarocks install lanes
      sudo luarocks install Lua-cURL
	  sudo luarocks install lua-cjson
	  sudo luarocks install fakeredis
	  sudo luarocks install ltn12
      cd ..
	  rm -fr luarocks-2.2.2.tar.gz
	  rm -fr luarocks-2.2.2
	  lua ./bot.lua

	  
	  
	  
	  
	  
    


