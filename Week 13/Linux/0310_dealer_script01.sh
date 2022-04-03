#! /bin/bash/

cat 0310_Dealer_schedule | awk '{print $1 $2,$5,$6}' > March03_dealer_schedule.txt #> 0310_dealer_schedule_clean.txt
grep -l Billy March03_dealer_schedule.txt >> Dealers_working_during_losses
grep $1 March03_dealer_schedule.txt >> Dealers_working_during_losses

