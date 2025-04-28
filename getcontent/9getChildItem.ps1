#displays items inside the folder
<# 
Mode d---- means directory 
     a---- means files
#>
Get-ChildItem -Path C:\Raghav

#displays only selected columns
Get-ChildItem -Path C:\Raghav | select Name,mode

#displays all items in the nested folder as well
Get-ChildItem -Path C:\Raghav -Recurse

#displays items only with .xlsm extension files
Get-ChildItem -Path C:\Raghav -Recurse -Include '*.xlsm'

#Even it displays registry path as well
Get-ChildItem -Path HKLM:\HARDWARE

#Displays all the columns availble using Get-ChildItem
Get-ChildItem | Get-Member
