for($i = 0; $i -le 10; $i++)
{
$i
}

for(($i = 0),($j = 0); $i -le 10; $i++,$j++)
{
"$i" + ',' + "$j"
}

$serverList = Get-Content "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\serverList.txt"

$serverList

for($i = 0; $i -lt $serverList.Count; $i++){
'contents from serverList file is : ' + $serverList[$i]
}