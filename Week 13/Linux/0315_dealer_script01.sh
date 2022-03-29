#1 /bin/bash/

cat 0315_Dealer_schedule | awk '{print $1 $2,$5,$6}'  > March15_dealer_schedule.txt #> 0315_dealer_schedule_clean.txt
grep -l Billy March15_dealer_schedule.txt >> Dealers_working_during_losses
grep $1 March15_dealer_schedule.txt >> Dealers_working_during_losses

