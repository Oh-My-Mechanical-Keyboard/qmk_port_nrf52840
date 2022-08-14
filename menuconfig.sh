#!/bin/zsh zsh

if [ ! ${openocd_path} ]; then 
    echo "command: initialize"
    get_openocd && \
    source '/opt/nordic/ncs/v2.0.0/zephyr/zephyr-env.sh' && \
fi

west build --build-dir $(find . -name build) $(dirname $(find . -name build)) -t menuconfig -- -DNCS_TOOLCHAIN_VERSION:STRING="NONE" -DBOARD_ROOT:STRING="$(pwd)" -DCONF_FILE:STRING="prj.conf" && \