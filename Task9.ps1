 Set-Location HKLM:\Software\Microsoft #go to the location
  get-ChildItem -Name Wisp | Export-Csv -Path C:\M2T2_DANILAU\aboutHKLM.csv #Greate File *.csv
 