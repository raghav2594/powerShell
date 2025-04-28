#Reads all the content inside the errorLog file
Get-Content -path "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\getcontent\errorLog.txt"

#Reads all the content of .txt file which is present inside the getcontent folder
Get-Content -path "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\getcontent\*" -Include '*.txt'

#Read first 2 lines of the content from
Get-Content -path "Documents\Raghav doc\1 Study_Materials\PowerShell\getcontent\errorLog.txt" -First 2

#Read last 2 lines of the content from
Get-Content -path "Documents\Raghav doc\1 Study_Materials\PowerShell\getcontent\errorLog.txt" -Tail 2

#Read the line which is having failure word
Get-Content -path "Documents\Raghav doc\1 Study_Materials\PowerShell\getcontent\errorLog.txt" | Where-Object {$_ -like "*fail*"}
Get-Content -path "Documents\Raghav doc\1 Study_Materials\PowerShell\getcontent\errorLog.txt" | Where-Object {$_ -match "fail"}
