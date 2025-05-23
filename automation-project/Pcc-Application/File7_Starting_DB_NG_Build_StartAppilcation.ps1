$startTime = Get-Date
$systemDrive = $env:SystemDrive

#Set pcc directory
$pccDir = "$systemDrive\Users\ugh4kor\taskscheduler\Pcc-Application"

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


