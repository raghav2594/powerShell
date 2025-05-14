$servers = Get-Content "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\serverList.txt"

foreach($server in $servers)
{
Write-Host 'This script is going to get executed in ' $server 'Server'
}

Get-WmiObject -Class win32_operatingsystem | Select-Object PSComputerName,LastBootUpTime

Get-WmiObject -Class win32_operatingsystem | Select-Object @{'Name' = 'ServerName'; 'Expression' = {$_.PSComputerName }},
                                                           @{'Name' = 'LastBootUpTime'; 'Expression' = {$_.converttodatetime($_.LastBootUpTime)}}
cls
foreach($server in $servers)
{
Get-WmiObject -Class win32_operatingsystem | Select-Object @{'Name' = 'ServerName'; 'Expression' = {$_.PSComputerName }},
                                                           @{'Name' = 'LastBootUpTime'; 'Expression' = {$_.converttodatetime($_.LastBootUpTime)}} | Out-File C:\Raghav\testfile.txt -Append
}