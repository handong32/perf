#./disable_boost.py
#./disable_cstates.sh
./disable_ht.sh
#./max_freq.py
killall irqbalance
sleep 10
./set_irq_affinity_ixgbe.sh -x all enp4s0f1
