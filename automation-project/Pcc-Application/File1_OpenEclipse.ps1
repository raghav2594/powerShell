$systemDrive = $env:SystemDrive
$eclipseDir = "$systemDrive\d\projects\pcc_automation\softwares\eclipse-java-2023-09-R-win32-x86_64\eclipse"

#Open Eclipse IDE
Start-Process "$eclipseDir\eclipse.exe"
Write-Host "`n✅Eclipse is opening...." -ForegroundColor Green
Start-Sleep -Seconds 30
