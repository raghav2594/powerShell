#this command helps to find what are all the services there
Get-Service

#Get-Member command helps to show all the columns
Get-Service | Get-Member

#Select-Object command to display only needed columns
Get-Service | Select-Object Name,Status, ServiceName

#Where-Object command with specific logic to display needed dat
Get-Service | Select-Object Name,Status, ServiceName | Where-Object {$_.Name -eq 'MSSQLSERVER'}

<#Better to execute below services in Run As Administrator mode#>

#Stop-Service stops the applicaiton
Get-Service | Select-Object Name,Status, ServiceName | Where-Object {$_.Name -eq 'MSSQLSERVER'} | Stop-Service

#Start-Service Starts the applicaiton
Get-Service | Select-Object Name,Status, ServiceName | Where-Object {$_.Name -eq 'MSSQLSERVER'} | Start-Service

