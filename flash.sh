#!/bin/zsh zsh

if [ ! ${openocd_path} ]; then 
    echo "command: initialize"
    get_openocd && \
fi

erase=''
recover=''
arg=($@)
for var in $arg
do
  if [ $var = "erase" ]; then
    erase='-c "nrf5 mass_erase"'
    echo "command: mass_erase"
  elif [ $var = "recover" ]; then
    recover='-c "nrf52_recover"'
    echo "command: recover"
  fi
done

openocd_ -f ${openocd_path}/tcl/interface/cmsis-dap.cfg -f ${openocd_path}/tcl/target/nrf52.cfg -c "adapter speed 4000" -c init ${recover} -c "reset init" -c halt ${erase} -c "program $(find . -name zephyr.hex) verify reset exit"
# openocd_ -f ${openocd_path}/tcl/interface/jlink.cfg -c "transport select swd" -f ${openocd_path}/tcl/target/nrf52.cfg -c "adapter speed 4000" -c init ${recover} -c "reset init" -c halt ${erase} -c "program $(find . -name zephyr.hex) verify reset exit"
