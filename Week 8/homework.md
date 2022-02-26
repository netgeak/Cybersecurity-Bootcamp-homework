
Phase 1
•	Commands: `fping -s 167.172.144.11 11.199.141.91 15.199.95.91 15.199.94.91 11.199.158.91`

•	Results: 
o	5 targets
o	       1 alive
o	       4 unreachable
o	       0 unknown addresses
o	
o	       4 timeouts (waiting for response)
o	      17 ICMP Echos sent
o	       1 ICMP Echo Replies received
o	       0 other ICMP received

•	Summary: 
o	I ran fping against the five Hollywood servers, 167.172.144.11 was the only address with ping replies. The process of port scanning happens on the network layer. This could be resolved by implementing network scanning and logging procedures, patching the network firewall, disabling icmp pinging, and by using additional proxy/vpn layers, as this particular address hosts the company's application servers.
Phase 2
•	Commands: sudo nmap -sS 167.172.144.11
•	Results: 
o	PORT STATE SERVICE
o	22/tcp  open  ssh
o	25/tcp  open  smtp
o	110/tcp open  pop3
o	119/tcp open  nntp
o	143/tcp open  imap
o	465/tcp open  smtps
o	563/tcp open  snews
o	587/tcp open  submission
o	993/tcp open  imaps
o	995/tcp open  pop3s

•	Summary: Scanning the open IP from Phase 1, we can see that an ssh port is open, as well as a number of remote access service ports. Nmap takes advantage of a number of osi layers, but predominantly uses the transport layer for scanning TCP, UDP, and SCTP protocols for open ports. The best way for Rock Star Corp to protect against malicious attacks, while leaving these ports open, would be to increase firewall provisioning, with additional ruling for these ports.
Phase 3
•	Commands: 
o	sudo ssh jimi@167.172.144.11
o	cat /etc/hosts
o	nslookup 98.137.246.8
•	Results: 
o	etc/hosts : 98.137.246.8 rollingstone.com
o	nslookup : 
	Name:    unknown.yahoo.com
	Address:  98.137.246.8

•	Summary: It's easy to assume from these findings that a malicious actor hacked this server and modified the /etc/hosts file to point traffic to another domain. This can be confirmed using nslookup to confirm the ip address present in the /etc/hosts file does in fact point to an unexpected domain. This redirection is an example of an actor taking advantage of the Network layer.
Phase 4
•	Commands : 
o	Cd /etc
o	cat /etc/packetcaptureinfo.txt
•	Results : 
o	Packet capture: Captured Packets are here:
https://drive.google.com/file/d/1ic-CFFGrbruloYrWaw3PvT71elTkh3eF/view?usp=sharing 

•	Summary : 192.168.47.200 points to two different mac addresses, presumably the result of a malicious actor redirecting network traffic and/or backdooring into Rock Star Corp's server, set in the server's /etc/hosts config. The hacker made a post request to Gottheblues.com, offering up sensitive information - an open ssh port with user creds in exchange for one million dollars. Rock Star Corp should start actively monitoring their network traffic, they should also patch their firewall to disallow unauthorized traffic on port 22 and check for any network modifications (/etc/hosts in this case). The OSI layer the hacker took advantage of is the network layer.
