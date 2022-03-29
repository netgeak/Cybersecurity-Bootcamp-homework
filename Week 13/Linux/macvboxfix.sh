#!
?
mkdir /etc/vbox/
touch /etc/vbox/networks.conf
echo " * 0.0.0.0/0 ::/0" > /etc/vbox/networks.conf
chmod 777 /etc/vbox/networks.conf
# This fixes the network issue for virtualbox on Mac. This creates the directory, the file, then adds the config that allows all subnets to be accepted then makes the file 
# world accessible. Created for the first capture the flag.
