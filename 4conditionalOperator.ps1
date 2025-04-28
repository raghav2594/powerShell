$x = 31

if($x -eq 30)
{
Write-Host 'Value is equals to 30'
}
else
{
Write-Host 'Value is Not equals to 30'
}

# ----

<# simple check using
if elseif else
#>
$services = Get-Service
$service_count = $services.Count

# $service_count =10

if($service_count -eq 340)
{
Write-Host 'Total service count is equals to 340'
}
elseif($service_count -gt 100)
{
Write-Host 'Total service count is greater than 100'
}
else
{
Write-Host 'Total service count is less than 100'
}
