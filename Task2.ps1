New-Item -Path D:\Danilau  -ItemType Directory -Name DANILAU #создали каталог на D:
ls D:

Rename-Item -Path D:\Danilau -NewName 'NewDANILAU'# переименловали объект
Dir D:

Remove-Item -Path D:\NewDANILAU #удалили объект
Get-ChildItem D: