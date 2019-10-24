./disable_boost.py
#./disable_cstates.sh
./disable_ht.sh
#./max_freq.py
killall irqbalance
sleep 10
if lspci | grep "Ethernet controller: Intel"
then
	./set_irq_affinity_ixgbe.sh -x all enp4s0f1
else
        echo "Intel NIC not found"
fi
