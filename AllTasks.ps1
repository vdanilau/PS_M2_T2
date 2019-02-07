#1.	Просмотреть содержимое ветви реeстра HKCU
Get-ChildItem -Path HKCU:\


#2.	Создать, переименовать, удалить каталог на локальном диске
New-Item -Path D:\Danilau  -ItemType Directory -Name DANILAU #создали каталог на D:
ls D:
Rename-Item -Path D:\Danilau -NewName 'NewDANILAU'# переименловали объект
Dir D:
Remove-Item -Path D:\NewDANILAU #удалили объект
Get-ChildItem D:


#3.	Создать папку C:\M2T2_ФАМИЛИЯ. Создать диск ассоциированный с папкой C:\M2T2_ФАМИЛИЯ.
Set-Location C:\ #перешли на диск C:
New-Item -ItemType Directory -Name M2T2_DANILAU #создали папку
New-PSDrive -Name M2T2_DANILAU –PSProvider FileSystem -Root "C:\M2T2_DANILAU" #создали диск
get-psdrive #проверили


#4.	Сохранить в текстовый файл на созданном диске список запущенных(!) служб. 
Get-Service | where status -like running | Out-File M2T2_DANILAU:\SERVICES.TXT #создали файл
dir M2T2_DANILAU: # проверили создание
Get-Content -Path M2T2_DANILAU:\SERVICES.TXT #вывели содержимое в консоль


#5.	Просуммировать все числовые значения переменных текущего сеанса.
$var=$null   #set 0
$sum=$null   #set 0 
$var=Get-Variable | where {$_.Value -is [int]} #take values [int] of variables 
foreach ($i in $var.value) {$sum+=$i} #get amount
Write-Output "sum= $sum" #output to screen


#6.	Вывести список из 6 процессов занимающих дольше всего процессор.
Get-Process | sort TotalProcessorTime | select -last 6


#7.	Вывести список названий и занятую виртуальную память (в Mb) каждого процесса,
# разделённые знаком тире, при этом если процесс занимает более 100Mb – 
#выводить информацию красным цветом, иначе зелёным.
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


#8.	Подсчитать размер занимаемый файлами в папке C:\windows (и во всех подпапках) 
#за исключением файлов *.tmp
$m=Get-ChildItem C:\windows -Recurse -Exclude *.tmp | measure -Property Length -sum 
$m.sum/1Gb


#9.	Сохранить в CSV-файле информацию о записях одной ветви реестра 
#HKLM:\SOFTWARE\Microsoft.
 Set-Location HKLM:\Software\Microsoft #go to the location
  get-ChildItem -Name Wisp | Export-Csv -Path C:\M2T2_DANILAU\aboutHKLM.csv #Greate File *.csv
 

#10.	Сохранить в XML -файле историческую информацию о командах 
#выполнявшихся в текущем сеансе работы PS.
Get-History | Export-Clixml -path C:\M2T2_DANILAU\History.xml


#11.	Загрузить данные из полученного в п.10 xml-файла и вывести в 
#виде списка информацию о каждой записи, в виде 5 любых (выбранных Вами) свойств.
Import-Clixml C:\M2T2_DANILAU\HISTORY.xml | fl -Property CommandLine ,id,StartExecutionTime, `
  EndExecutionTime,ExecutionStatus


#12.	Удалить созданный диск и папку С:\M2T2_ФАМИЛИЯ
Remove-PSDrive -Name M2T2_DANILAU

