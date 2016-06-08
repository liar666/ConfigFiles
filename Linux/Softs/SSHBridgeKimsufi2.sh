#ip=$(ifconfig wlan0 | grep "inet addr" | cut -d':' -f 2 | cut -d ' ' -f 1)
#ssh -N gmuller@91.121.89.202 -L ${ip}:8080:91.121.89.202:3128
ssh -N gmuller@91.121.89.202 -L *:8080:91.121.89.202:3128
