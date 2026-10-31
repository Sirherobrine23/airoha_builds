#!/bin/bash
# 

OPENWRT_DIR=${1:-../openwrt}
CURRENT_DIR="$(pwd)"

for config in *.config
do
  soc=${config%.config}
  (
    cd "${OPENWRT_DIR}"

    echo "Sync ${soc}"
    echo
    
    cat "${CURRENT_DIR}/${config}" > .config
    make defconfig && diff -u .config.old .config
    cat .config > "${CURRENT_DIR}/${config}"
  )
done