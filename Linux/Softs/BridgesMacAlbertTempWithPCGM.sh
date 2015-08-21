# Don't forget to activate GatewayPorts yes in kimsuffi:/etc/ssh/sshd_config
/usr/bin/ssh \
    -R 'presans.com:6180:volta.xtec.polytechnique.fr:6180' \
    -R 'presans.com:6181:volta.xtec.polytechnique.fr:6180' \
    -R 'presans.com:6182:volta.xtec.polytechnique.fr:6180' \
    -R 'presans.com:6183:volta.xtec.polytechnique.fr:6180' \
    -R 'presans.com:6185:volta.xtec.polytechnique.fr:6180' \
    -R 'presans.com:6188:volta.xtec.polytechnique.fr:6180' \
    -p 22 gmuller@presans.com
