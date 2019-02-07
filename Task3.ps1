Set-Location C:\ #перешли на диск C:

New-Item -ItemType Directory -Name M2T2_DANILAU #создали папку

New-PSDrive -Name M2T2_DANILAU –PSProvider FileSystem -Root "C:\M2T2_DANILAU" #создали диск

get-psdrive #проверили
