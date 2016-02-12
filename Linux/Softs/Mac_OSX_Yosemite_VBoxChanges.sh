## From:
##  https://www.youtube.com/watch?v=tafqhSUfKnY
##  https://drive.google.com/folderview?id=0B9oZd81xqtTOckJOT25uTzVfT3c&usp=sharing
## Login:Yosemite Retail / Pass:Ngay2011

VBoxManage modifyvm "OS X" --cpuidset 00000001 000306a9 04100800 7fbae3ff bfebfbff
VBoxManage setextradata "OS X" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "MacBookPro11,3"
VBoxManage setextradata "OS X" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "OS X" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "OS X" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "OS X" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1

## To control Graphics Output Protocol, use the following VBoxManage command: VBoxManage setextradata "VM name" VBoxInternal2/EfiGopMode N Where N can be one of 0,1,2,3,4,5 referring to the 640x480, 800x600, 1024x768, 1280x1024, 1440x900, 1920x1200 screen resolution respectively. For example, to set my OS X guest's resolution to 1920x1200 I ran
# VBoxManage setextradata 'OS X' VBoxInternal2/EfiGopMode 5
VBoxManage setextradata 'OS X' VBoxInternal2/EfiGopMode 2
VBoxManage bandwidthctl "OS X" add Limit --type network --limit 20m
VBoxManage modifyvm "OS X" --nicbandwidthgroup1 Limit
