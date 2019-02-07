$m=Get-ChildItem C:\windows -Recurse -Exclude *.tmp | measure -Property Length -sum 
$m.sum/1Gb