$systemDrive = $env:SystemDrive

# Base directory containing all Maven projects
$baseDir = "$systemDrive\d\projects\pcc_automation\gitRepo\pccat\source"

#Frontend path
$frontendDir = "$baseDir\frontend\pcc-ui"


#Start Angular App
$ngPath = "$env:APPDATA\npm\ng.cmd"
Start-Process -FilePath $ngPath -ArgumentList "serve" -WorkingDirectory $frontendDir -WindowStyle Minimized

Write-Host "`n✅Angular application is starting...." -ForegroundColor Green
Start-Sleep -Seconds 5
