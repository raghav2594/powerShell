$startTime = Get-Date
$systemDrive = $env:SystemDrive


$logFile = "$systemDrive\Users\ugh4kor\taskscheduler\Pcc-Application\log\execution_log_$(Get-Date -Format 'yyyyMMdd').txt"
Start-Transcript -Path $logFile

#Set pcc directory
$pccDir = "$systemDrive\Users\ugh4kor\taskscheduler\Pcc-Application"

#Start eclipse
& "$systemDrive\Users\ugh4kor\taskscheduler\Pcc-Application\File1_OpenEclipse.ps1"

#Build All Projects
& "$systemDrive\Users\ugh4kor\taskscheduler\Pcc-Application\File2_buildAllProjects-dev.ps1"

#Start Neo4j DB
& "$systemDrive\Users\ugh4kor\taskscheduler\Pcc-Application\File3_StartNeo4jDB.ps1"

#Start Angular
& "$systemDrive\Users\ugh4kor\taskscheduler\Pcc-Application\File4_StartAngularApp.ps1"

#Start all projects
& "$systemDrive\Users\ugh4kor\taskscheduler\Pcc-Application\File5_StartAllProjects.ps1"

$endTime = Get-Date
# Duration
$duration = $endTime - $startTime
Write-Host "⏱️ Total duration: $($duration.ToString())"

Stop-Transcript
