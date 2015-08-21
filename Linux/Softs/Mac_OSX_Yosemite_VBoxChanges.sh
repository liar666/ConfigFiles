## From: 
##  https://www.youtube.com/watch?v=tafqhSUfKnY
##  https://drive.google.com/folderview?id=0B9oZd81xqtTOckJOT25uTzVfT3c&usp=sharing

VBoxManage modifyvm "OS X" --cpuidset 00000001 000306a9 04100800 7fbae3ff bfebfbff
VBoxManage setextradata "OS X" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "MacBookPro11,3"
VBoxManage setextradata "OS X" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "OS X" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "OS X" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "OS X" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
