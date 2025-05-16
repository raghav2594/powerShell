#Export-Csv
<#
Converts objects into a series of comma-separated value (CSV) strings and save the strings to a file

syntax

     Export-Csv 
      [[-Path] <String>]
      [-Force]
      [-NoClobber]
      [-Append]
      [[-Delimeter] <Char>]
      [-IncludeTypeInformation]
      [-NoTypeInformation]

-Path : Where the csv files will be stored
-Force : Helps to overwrite the readOnly as well
-NoClobber : This tell that not to override the file if exist
-Delimeter : separate the values based on Delimeter (',', ':', ';', etc.,)
-IncludeTypeInformation: This parameter will be displayed in the first line and show the information about that object
-NoTypeInformation: It will not show any object information in the first line
-Append: Appending the existing data with new data
#>

#Fetch all the services and save it to csv file
Get-Service | Export-Csv -Path C:\Raghav\services.csv -Delimiter ';'
Invoke-Item -Path C:\Raghav\services.csv

#Fetch only necessary column and save it to csv file
Get-Service |Select-Object Name, DisplayName, Status |Export-Csv -Path C:\Raghav\services.csv -Delimiter ';'
Invoke-Item -Path C:\Raghav\services.csv

#Fetch only necessary column without Type Information and save it to csv file
Get-Service |Select-Object Name, DisplayName, Status |Export-Csv -Path C:\Raghav\services.csv -Delimiter ';' -NoTypeInformation
Invoke-Item -Path C:\Raghav\services.csv

#If file exist not override
Get-Service |Select-Object Name, DisplayName, Status |Export-Csv -Path C:\Raghav\services.csv -Delimiter ';' -NoTypeInformation -NoClobber
Invoke-Item -Path C:\Raghav\services.csv

#Append with existing data
Get-Service |Select-Object Name, DisplayName, Status |Export-Csv -Path C:\Raghav\services.csv -Delimiter ';' -NoTypeInformation -Append
Invoke-Item -Path C:\Raghav\services.csv

#Append with existing data and also use force
<#this command doesn't have status column, if we execute the above script, it will throw the error
Use -Force to append the whatever the data which we got and store it here#>
Get-Service |Select-Object Name, DisplayName |Export-Csv -Path C:\Raghav\services.csv -Delimiter ';' -NoTypeInformation -Append -Force
Invoke-Item -Path C:\Raghav\services.csv


