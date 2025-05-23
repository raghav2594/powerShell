$startTime = Get-Date
$systemDrive = $env:SystemDrive

# Set JAVA_HOME and update PATH
$env:JAVA_HOME = "$systemDrive\d\projects\pcc_automation\softwares\java-17-openjdk-17.0.8.0.7-1.win.x86_64"
$env:Path = "$env:JAVA_HOME\bin;$env:Path"

# Set Maven settings.xml path
$env:MAVEN_CONF_PATH = "$systemDrive\d\projects\pcc_automation\softwares\apache-maven-3.8.5-bin\apache-maven-3.8.5\conf\settings.xml"

# Base directory containing all Maven projects
$baseDir = "$systemDrive\d\projects\pcc_automation\gitRepo\pccat\source\backend"

# Define projects in build order
$projectsInOrder = @(
    "pcc-at-dto",
    "pcc-at-neo4j",
    "pcc-at-util",
    "pcc-at-exception",
	"pccat.eurekaserver",
    "pccat.oneq",
    "pcc-at-web",
    "pcc-assessment-evaluator-steering",
    "rmt-exporter",
    "rmt-importer",
    "rmt-evaluator" 
)

# Loop through and build each
foreach ($projectName in $projectsInOrder) {
    $projectPath = Join-Path $baseDir $projectName
    Write-Host "`n--- Building: $projectPath ---" -ForegroundColor Cyan
    Set-Location $projectPath

    # Run Maven command
    mvn clean install -s $env:MAVEN_CONF_PATH -DskipTests

    # Check if Maven build failed
    if ($LASTEXITCODE -ne 0) {
        Write-Host "`n❌ Build failed in project: $projectName. Stopping..." -ForegroundColor Red
        Read-Host "Error Occured in $projectName project!! Press Enter to exit"
        exit $LASTEXITCODE

    }
}

$endTime = Get-Date
# Duration
$duration = $endTime - $startTime
Write-Host "⏱️ Total duration: $($duration.ToString())"
Write-Host "`n✅ All projects built successfully in order." -ForegroundColor Green
#Read-Host "Press Enter to exit" 