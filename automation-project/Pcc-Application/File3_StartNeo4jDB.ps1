$systemDrive = $env:SystemDrive

#Neo4j Directory
$neo4jDir = "$systemDrive\d\projects\pcc_automation\softwares\neo4j-community-5.11.0\bin"

#Start Neo4j console
Start-Process -FilePath "neo4j" -ArgumentList "console" -WorkingDirectory $neo4jDir -WindowStyle Minimized
Write-Host "`n✅Neo4j Database is starting...." -ForegroundColor Green
Start-Sleep -Seconds 5
