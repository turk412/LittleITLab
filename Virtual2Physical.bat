@echo off
setlocal enabledelayedexpansion

REM Prompt the user for the VM name
set /p "vmName=Enter VM Name: "

REM Prompt the user for the manufacturer
set /p "manufacturer=Enter Desired Device Manufacturer: "

REM Prompt the user for the model
set /p "model=Enter Desired Device Model: "

REM Define the VBoxManage commands dynamically
call :ExecuteVBoxManage "!vmName!" "!manufacturer!" "!model!"
goto :EOF

:ExecuteVBoxManage
set randomSerial=!random!
set randomSKU=!random!
set randomBIOSVersion=!random!
set randomBoardVersion=!random!
set randomBoardSerial=!random!
set randomAssetTag=!random!

"c:\Program Files\Oracle\VirtualBox\vboxmanage.exe" setextradata %1 "VBoxInternal/Devices/pcbios/0/Config/DmiSystemVendor" %2
"c:\Program Files\Oracle\VirtualBox\vboxmanage.exe" setextradata %1 "VBoxInternal/Devices/pcbios/0/Config/DmiSystemProduct" %3
"c:\Program Files/Oracle/VirtualBox/vboxmanage.exe" setextradata %1 "VBoxInternal/Devices/pcbios/0/Config/DmiSystemVersion" "<empty>"
"c:\Program Files/Oracle/VirtualBox/vboxmanage.exe" setextradata %1 "VBoxInternal/Devices/pcbios/0/Config/DmiSystemSerial" "string:!randomSerial!"
"c:\Program Files/Oracle/VirtualBox/vboxmanage.exe" setextradata %1 "VBoxInternal/Devices/pcbios/0/Config/DmiSystemSKU" "string:!randomSKU!"
"c:\Program Files/Oracle/VirtualBox/vboxmanage.exe" setextradata %1 "VBoxInternal/Devices/pcbios/0/Config/DmiSystemFamily" "<empty>"
"c:\Program Files/Oracle/VirtualBox/vboxmanage.exe" setextradata %1 "VBoxInternal/Devices/pcbios/0/Config/DmiSystemUuid" "d18cce0e-44f9-4a74-808c-ff8ff99889d1"

"c:\Program Files/Oracle/VirtualBox/vboxmanage.exe" setextradata %1 "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSVendor" %2
"c:\Program Files/Oracle/VirtualBox/vboxmanage.exe" setextradata %1 "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSVersion" "string:!randomBIOSVersion!"
"c:\Program Files/Oracle/VirtualBox/vboxmanage.exe" setextradata %1 "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSReleaseDate" "%%SYSdate%%"

"c:\Program Files/Oracle/VirtualBox/vboxmanage.exe" setextradata %1 "VBoxInternal/Devices/pcbios/0/Config/DmiBoardVendor" %2
"c:\Program Files/Oracle/VirtualBox/vboxmanage.exe" setextradata %1 "VBoxInternal/Devices/pcbios/0/Config/DmiBoardProduct" %3
"c:\Program Files/Oracle/VirtualBox/vboxmanage.exe" setextradata %1 "VBoxInternal/Devices/pcbios/0/Config/DmiBoardVersion" "string:!randomBoardVersion!"
"c:\Program Files/Oracle/VirtualBox/vboxmanage.exe" setextradata %1 "VBoxInternal/Devices/pcbios/0/Config/DmiBoardSerial" "string:!randomBoardSerial!"
"c:\Program Files/Oracle/VirtualBox/vboxmanage.exe" setextradata %1 "VBoxInternal/Devices/pcbios/0/Config/DmiBoardAssetTag" "string:!randomAssetTag!"
"c:\Program Files/Oracle/VirtualBox/vboxmanage.exe" setextradata %1 "VBoxInternal/Devices/pcbios/0/Config/DmiBoardLocInChass" "<empty>"
"c:\Program Files/Oracle/VirtualBox/vboxmanage.exe" setextradata %1 "VBoxInternal/Devices/pcbios/0/Config/DmiBoardBoardType" "10"

goto :EOF
