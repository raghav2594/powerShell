$myVariable = 100.3
Write-Host $myVariable.GetType()

$myVariable1 = "$(1+1)"
Write-Host $myVariable1

$myArray = 1,2,3
$myArray
Write-Host $myArray[1]

$services = @('vm1', 'vm2', 'vm3','vm4')
$services[-5]
$services = Get-Service
$services[-1]