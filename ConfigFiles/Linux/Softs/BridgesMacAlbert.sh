# MacLocal    = portable Albert
# Verspertine = verspertine.xtec.polytechnique.fr
# Server      = 129.104.100.45

# Generate local keys (ONLY if NO keys are already present!)
# @MacLocal:     ssh-keygen -t rsa
# @Server:       ssh-keygen -t rsa
# @Verspertine:  ssh-keygen -t rsa

# Exchange public keys
# @MacLocal -> Verspertine:  ssh-copy-id ameige@verspertine.xtec.polytechnique.fr
# [Optional: @Verspertine -> MacLocal: ssh-copy-id albert@IPMacLocal]
# @Verspertine -> Server:    ssh-copy-id albert@129.104.100.45 
# [Optional: @Server -> Verspertine:   ssh-copy-id ameige@verspertine.xtec.polytechnique.fr
# Alternative to ssh-copy-id: @X:/Users/albert/.ssh/id_ra.pub >> @Y:~/.ssh/authorized_keys 

# Redirect local DayLite ports to Verspertine
# @MacLocal:
ssh -N -f -L 6180:localhost:6180 -p 22 ameige@verspertine.xtec.polytechnique.fr
ssh -N -f -L 6181:localhost:6181 -p 22 ameige@verspertine.xtec.polytechnique.fr
ssh -N -f -L 6182:localhost:6182 -p 22 ameige@verspertine.xtec.polytechnique.fr
ssh -N -f -L 6183:localhost:6183 -p 22 ameige@verspertine.xtec.polytechnique.fr
ssh -N -f -L 6185:localhost:6185 -p 22 ameige@verspertine.xtec.polytechnique.fr
ssh -N -f -L 6188:localhost:6188 -p 22 ameige@verspertine.xtec.polytechnique.fr

# Redirect Verspertine DayLite ports to Server
# @Verspertine
ssh -N -f -L 6180:localhost:6180 -p 22 albert@129.104.100.45
ssh -N -f -L 6181:localhost:6181 -p 22 albert@129.104.100.45
ssh -N -f -L 6182:localhost:6182 -p 22 albert@129.104.100.45
ssh -N -f -L 6183:localhost:6183 -p 22 albert@129.104.100.45
ssh -N -f -L 6185:localhost:6185 -p 22 albert@129.104.100.45
ssh -N -f -L 6188:localhost:6188 -p 22 albert@129.104.100.45

# Configure DayLite client to point to this server: 
server=localhost