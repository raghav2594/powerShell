# Equality Operator (-eq, -nq, -gt, -ge, -lt, -le)

$x = 20
$y = 11

if($x -ne $y){Write-Host "$x is not equals to $y"}

# Matching Operator (-like, -notlike, -match, -notmatch)
# This operators is useful for string values

$os = 'Windows'
# $os = 'Linux'
if($os -like '*Win*'){'Operating System Version is Windows'}
if($os -notlike '*Win*'){'Operating System Version may be Linux or MacOS'}
<# For -like and -notlike commands we can use wildard(*) to compare the values#>

if($os -match 'Win'){'Operating System Version is Windows'}
if($os -notmatch 'Win'){'Operating System Version may be Linux or MacOS'}
<# For -match and -notmatch commands we should not use wildard(*) to compare the values#>

# Containment Operator(-contains, -notcontains, -in, -notin)

$fruitBasket = @('Apple', 'Orange', 'Bananna')
if($fruitBasket -contains 'Apple'){Write-Host 'Fruit Basket contains Apple'}
if($fruitBasket -notcontains 'Apple'){Write-Host 'Fruit Basket not contains Apple'}

if('Bananna' -in $fruitBasket){Write-Host 'Fruit Basket contains Bananna'}
if('Cherry' -notin $fruitBasket){Write-Host 'Fruit Basket not contains Cherry'}
 
# Replacement Operator(-replace)
#-replace replaces the values from the string

$string = 'Glass is full, glass is half'
$string -replace 'glass', 'cup'

# Type Comparasion Operator (-is, -isnot)
# Returns true if both the objects are same of if both the objects are not the same
$os ='Windows'
if($os -is [String]) {'$os is of variable type of String'}
if($os -isnot [DateTime]) {'$os is not of a date time datatype'}