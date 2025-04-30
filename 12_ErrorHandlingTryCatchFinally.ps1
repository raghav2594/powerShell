#-------------------------------------
try
{
# Intensionally mistake in Write-Host command to go to catch
Write-Hst 'This is the example of try catch finally'
}
catch
{
Write-Host 'This is Catch Block'
}
finally
{
Write-Host 'This is finally Block. This will be executed irrespective of whatever executed above'
}
#-------------------------------------

<#
Error Handlin in Powershell

Terminating Error:
Error that will stops a function or operation. Above example is for terminating error
because of mistake in powershell command
Ex: Write-Hst (Wrong command)

Non-Terminating Error:
Error allows Powershell to continue. File not be there or path not be there. It happens with content.
It cannot be caught in try..catch..finally

#>

#-------------------------------------
#Terminating Error:
try
{
# Intensionally mistake in Get-ChildItem command to go to catch
Get-ChildIte C:\Raghav
}
catch
{
Write-Host 'This is Catch Block'
}
#-------------------------------------
#Non Terminating Error
try
{
# Passing the wrong path which is not present. 
#In this Scenario Powershell throws the error not going to catch block

#Get-ChildItem C:\Raghav1

#To resolve the above path issue. we can tell powershell to stop this non terminating error and
#pass it to catch block

Get-ChildItem C:\Raghav1 -ErrorAction Stop


}
catch
{
Write-Host 'This is Catch Block of non terminating error'
#get the exception related information use below
$_.Exception               # Cannot find path 'C:\Raghav1' because it does not exist.
$_.Exception.message       # Cannot find path 'C:\Raghav1' because it does not exist.
$_.Exception.itemName      # C:\Raghav1

}
