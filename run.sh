modprobe msr
~/perf/disable_boost.py
#./disable_cstates.sh
~/perf/disable_ht.sh
#./max_freq.py
killall irqbalance
sleep 10
if lspci | grep "Ethernet controller: Intel"
then
	~/perf/set_irq_affinity_ixgbe.sh -x all enp4s0f1
else
        echo "Intel NIC not found"
fi
#./set_irq_affinity_ixgbe.sh -x all enp4s0f1
#sleep 1
#modprobe msr
#wrmsr -a 0x1a0 0x4000850081
#wrmsr -a 0x199 0xC00

