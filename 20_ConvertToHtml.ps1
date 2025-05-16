#ConvertTo-Html
<#
Converts .net objects into HTML that can be displayed in the web browser

    ConvertTo-Html
      [[-Body] <String>]
      [[-Head] <String>]
      [[-Title] <String>]
      [-As <String>]
      [-PostContent <String>]
      [-PreContent <String>]
      [-FragMent <String>]


-Body : Data will be added in body of the section in Html file
-Head : Data will be added in head of the section in Html file
-Title : Data will be added in title tag in Html file
-As : It forms the data as either table or list
-PreContent - it displays the content before the data starts
-PostContent - it displays the content after the data ends
-Fragment - it forms the data in table format. If we omit -Head -Body -Title only use -Fragment, it forms data in table form
#>

#show all the services in html
#Get-Service |Select-Object Name, DisplayName, Status |ConvertTo-Html -As List | Out-File C:\Raghav\htmlOut.html
Get-Service |Select-Object Name, DisplayName, Status |ConvertTo-Html -As Table | Out-File C:\Raghav\htmlOut.html
Invoke-Item -Path C:\Raghav\htmlOut.html

#Add PreContent and PostContent
Get-Service |Select-Object Name, DisplayName, Status |ConvertTo-Html -As Table -PreContent "<h2>Report Generated at $(Get-Date)</h2>" -PostContent "<h2>Thank You</h2>" | Out-File C:\Raghav\htmlOut.html
Invoke-Item -Path C:\Raghav\htmlOut.html

#Get service and os level information and show it in HTML
$systemInfo = Get-WmiObject -Class Win32_OperatingSystem |Select-Object PSComputerName, Status, Name | ConvertTo-Html -As Table -PreContent "<h2>Operating System Information</h2>" | Out-String
$serviceInfor = Get-Service |Select-Object Name, DisplayName, Status |ConvertTo-Html -As Table -PreContent "<h2>Service Informaiton</h2>"| Out-String
ConvertTo-Html -Title 'System Level Information' -PreContent $systemInfo, $serviceInfor -Body "Gathering OS and service details" | Out-File C:\Raghav\htmlOut.html
Invoke-Item -Path C:\Raghav\htmlOut.html

#Add css for tables
$header = @"
<style>
  table {
    border-collapse: collapse;
    width: 100%;
  }

  td {
    border: 1px solid black;
    padding: 8px;
  }

  tr {
    border: 1px solid black;
    padding: 8px;
  }
</style>
"@

$systemInfo = Get-WmiObject -Class Win32_OperatingSystem |Select-Object PSComputerName, Status, Name | ConvertTo-Html -As Table -PreContent "<h2>Operating System Information</h2>" | Out-String
$serviceInfor = Get-Service |Select-Object Name, DisplayName, Status |ConvertTo-Html -As Table -PreContent "<h2>Service Informaiton</h2>"| Out-String
ConvertTo-Html -Title 'System Level Information' -Head $header -PreContent $systemInfo, $serviceInfor -Body "Gathering OS and service details" | Out-File C:\Raghav\htmlOut.html
Invoke-Item -Path C:\Raghav\htmlOut.html

