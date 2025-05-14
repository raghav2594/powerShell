#Import-csv command used to read the data from csv files in the form of tables

Import-Csv "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\file-handling\serverList_CSV.csv"

$servers = Import-Csv "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\file-handling\serverList_CSV.csv"

Write-Host $servers
foreach($server in $servers)
{
 $serverName = $server.ServerName
 $IP = $server.IP

 Write-Host $serverName $ip
}