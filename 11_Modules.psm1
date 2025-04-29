#PowerShell modules should be stored with .psm1 extension

#Stores one or more functions and scripts as a single unit called modules
#and use it anywhere by importing this module

#Get-Module -ListAvailable to display how many modules are present in the machine

function name()
{
Write-Host "Raghav"
}

function address()
{
Write-Host "Banglore"
}

function jobTitle()
{
Write-Host "Engineer"
}

#Import-Module "D:\Raghav\11_Modules.psm1"
#use above command to import this modules
#after that simple type name or addrees or jobTitle to get the required data
#---------------------------------------------

#Keeping our modules in some module path and just calling the module name rather than
#the path get the data

$env:PSModulePath

<#
$env:PSModulePath
If we execute the above command, we can get the powershell module path like below

C:\Users\ugh4kor\Documents\WindowsPowerShell\Modules;C:\Program Files\WindowsPowerShell\Modules;C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules;C:\Program Files (x86)\
Microsoft SQL Server\160\Tools\PowerShell\Modules\

any one of this path if we keep our modules we can directly call the module
name with Import-Module command

How to keep?
if your file name is 11_Modules.psm1, then create a folder with the same file name
called 11_Modules in any one of the above path and keep 11_Modules.psm1 file inside it.
Then we can execute 'Import-Module 11_Modules' (type 11_ and press tab, it will automatically suggest
remaining file name)

#>

 
