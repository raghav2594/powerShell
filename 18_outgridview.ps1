#The Out-GridView cmdlet sends the output from the command to a grid view window where the output is displayed in an interactive table


Get-ChildItem C:\Raghav | Out-GridView
#After execution it opens with GUI window where it will show all the data
#That window is helpful to filter the data efficiently
Get-Process | Out-GridView

#Fetch the necessary data from Get-Process and Sort-Object Decending based on PeasWorkingSet
Get-Process |Select-Object -Property Name, WorkingSet, PeakWorkingSet |Sort-Object -Property PeakWorkingSet -Descending| Out-GridView

Get-ChildItem -Path $PSHOME -Recurse | Out-GridView

