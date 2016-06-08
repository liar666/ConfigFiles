## From:
##  https://www.youtube.com/watch?v=tafqhSUfKnY
##  https://drive.google.com/folderview?id=0B9oZd81xqtTOckJOT25uTzVfT3c&usp=sharing
## Login/Pass : LIAR/LIAR666

# CPU
VBoxManage modifyvm "OSX10.11" --cpuidset 00000001 000306a9 04100800 7fbae3ff bfebfbff

# Computer Identification
VBoxManage setextradata "OSX10.11" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "MacBookPro11,3"
VBoxManage setextradata "OSX10.11" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "OSX10.11" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "OSX10.11" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "OSX10.11" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1

# Graphics
VBoxManage setextradata 'OS X' VBoxInternal2/EfiGopMode 4

# Network
VBoxManage bandwidthctl "OSX10.11" add Limit --type network --limit 20m
VBoxManage modifyvm "OSX10.11" --nicbandwidthgroup1 Limit
