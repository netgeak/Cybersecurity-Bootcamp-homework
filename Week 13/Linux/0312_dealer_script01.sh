#1 /bin/bash/

cat 0312_Dealer_schedule | awk '{print $1 $2,$5,$6}' > March12_dealer_schedule.txt # > 0312_dealer_schedule_clean.txt
grep -l Billy March12_dealer_schedule.txt >> Dealers_working_during_losses
grep $1 March12_dealer_schedule.txt  >> Dealers_working_during_losses

