$systemDrive = $env:SystemDrive

# Set JAVA_HOME and update PATH
$env:JAVA_HOME = "$systemDrive\d\projects\pcc_automation\softwares\java-17-openjdk-17.0.8.0.7-1.win.x86_64"
$env:Path = "$env:JAVA_HOME\bin;$env:Path"

# Set Maven settings.xml path
$env:MAVEN_CONF_PATH = "$systemDrive\d\projects\pcc_automation\softwares\apache-maven-3.8.5-bin\apache-maven-3.8.5\conf\settings.xml"

# Base directory containing all Maven projects
$baseDir = "$systemDrive\d\projects\pcc_automation\gitRepo\pccat\source"

#backend path
$backendDir = "$baseDir\backend"


# Start Maven Spring Boot apps
$projectsInOrder = @(
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
    $projectPath = Join-Path "$baseDir\backend" $projectName
    Write-Host "`n--- Starting: $projectPath ---" -ForegroundColor Cyan
    Set-Location $projectPath

    # Run Maven command in the background
    $process = Start-Process -FilePath "mvn" -ArgumentList "-s $env:MAVEN_CONF_PATH spring-boot:run" -PassThru -WindowStyle Minimized

    Write-Host "Server started for project: $projectName. Waiting for 10 seconds..." -ForegroundColor Yellow

    # Wait for 10 seconds (you can adjust this to a longer or shorter time)
    Start-Sleep -Seconds 10

    # Check if the server started successfully (basic check)
    if ($process.HasExited) {
        Write-Host "`n❌ Failed to start: $projectName. Stopping..." -ForegroundColor Red
        Read-Host "Error occurred in $projectName project! Press Enter to exit."
        exit $process.ExitCode
    } else {
        Write-Host "`n✅ Server running for project: $projectName." -ForegroundColor Green
    }

    # Optional: Sleep before starting the next project (adjust as needed)
    Start-Sleep -Seconds 30
}

Write-Host "All services are started..."
