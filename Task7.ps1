Get-Process | select name, vm | 
foreach {
         if ($_.vm/1Mb -gt  100 ) 
            {
            write-host ($_.name, ($_.vm/1Mb)) -Separator "-" -ForegroundColor red #Вывод на экран тоже в Mb
            }
            else {
                 write-host -f green $_.name - ($_.vm/1Mb)  #Вывод на экран в Mb
                 }
      
        
        }