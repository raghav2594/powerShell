#Securing your credentials in powershell

#ConvertFrom-SecureString
#ConvertTo-SecureString

#This command shows the system information

Get-WmiObject  -class Win32_operatingsystem 

Get-ChildItem "C:\Users\Public\Metrics"

#Popup will open to enter username and password
Get-Credential

$credential = Get-Credential
Write-Host $credential

#We have to store this credentials with encrypted and use it later on
#For that encrypted credentials stored in files
Get-Credential ugh4kor | Out-File "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\password.txt"
<#

UserName                     Password
--------                     --------
ugh4kor  System.Security.SecureString

now the passwords are stored in the form of secureString.
But we have not stored in the form of properString which mean encrypted string.
#>

#To store the password as encrypted string 
(Get-Credential).Password | ConvertFrom-SecureString | Out-File "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\password.txt"

<#
01000000d08c9ddf0115d1118c7a00c04fc297eb01000000fee92fbf5777204eb0396c4b84ef49640000000002000000000003660000c0000000100000006d3
b0a968e0c080155ab4f1bc6f7c13c0000000004800000a000000010000000a3761c3a05b96232bfb205485f8df35d100000001a113232d5f022a94e4c30eee3
68655814000000ca757d8cc04575afa694ba02a614cfe664b3f9e3

ConvertFrom-SecureString helps to store the data in encrypted script form
#>

#To get the password as secureString form
$password = Get-Content "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\password.txt" | ConvertTo-SecureString
#To store credentials as object
$credential = New-Object System.Management.Automation.PSCredential("ugh4kor" , $password)
#This object can be used as parameter of any credentials releated cmdlet


#To tighten the password even more we can use 256 aes encryption as well

$key = New-Object Byte[] 32
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($key)
$key | Out-File "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\aes.key"

#we can use this key to encrypt the security evenmore
(Get-Credential).Password | ConvertFrom-SecureString -key (Get-Content "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\aes.key")| Set-Content "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\password.txt"
$password = Get-Content "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\password.txt" | ConvertTo-SecureString -key  (Get-Content "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\aes.key")
$credential = New-Object System.Management.Automation.PSCredential("ugh4kor" , $password)

<#
password.txt

76492d1116743f0423413b16050a5345MgB8AGwAeQBYAGMAdQBFADYATABBAHoAMgBjAGIASQB1AG8AVQBGAGIAWQB1AGcAPQA9AHwAZQ
AyADMAMgA4AGIAOQAzAGIANQBkADUAMQBhAGMAMQBhADkAYgA3AGEANAA5ADMAYwAzADQAMQBhADAAMQAwAGEAYQA1AGUANQBhADAAMQA3
ADMAYQA2ADYAZAAzADgAYQA4ADQAOQAzADEAZgBlAGUAYgBjAGQAZgAxADEAOQA=

#>