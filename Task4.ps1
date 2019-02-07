Get-Service | where status -like running | Out-File M2T2_DANILAU:\SERVICES.TXT #создали файл

dir M2T2_DANILAU: # проверили создание

Get-Content -Path M2T2_DANILAU:\SERVICES.TXT #вывели содержимое в консоль

