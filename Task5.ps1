$var=$null   #set 0
$sum=$null   #set 0 

$var=Get-Variable | where {$_.Value -is [int]} #take values [int] of variables 

foreach ($i in $var.value) {$sum+=$i} #get amount
Write-Output "sum= $sum" #output to screen