$a = 10
$b = 20
$c = $a + $b

Write-Host "Sum of $a and $b is " $c
#------------------------------------------
#Parameterised function
function sum()
{
param($a, $b)  #Parameter
$c = $a + $b
Write-Host "Sum of $a and $b is " $c 
}

#Calling sum function
sum 33 22
sum -b 20 -a 10
#------------------------------------------
#Non-Parameterised function
function myprocess()
{
Get-Process
}
myprocess
#------------------------------------------


