#Out-File helps to write output directly to a text file

<#Syntax 
  Out-File [-FilePath] <String>
           [-Append]
           [-Force]

-FilePath specify the path to store the data to the file
-Append helps to append the new data to the existing data
-Force overRide the readonly file also
#>

'PowerShell is a very good scripting tool' | Out-File c:/Raghav/test.txt -Append
#Invoke-Item helps to open the respective file
Invoke-Item c:/Raghav/test.txt




