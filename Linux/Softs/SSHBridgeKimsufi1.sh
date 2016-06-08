ip=$(ifconfig wlan0 | grep "inet addr" | cut -d':' -f 2 | cut -d ' ' -f 1)
ssh -N gmuller@176.31.102.54 -L ${ip}:8080:176.31.102.54:3128
