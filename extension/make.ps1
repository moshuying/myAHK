gcc -E .\powershell.c -o .\powershell.i
gcc -c .\powershell.i -o .\powershell.o
windres .\powershell.rc .\powershell.o
gcc .\powershell.c .\powershell.o -o .\powershell.exe

Remove-Item -Path .\powershell.i
Remove-Item -Path .\powershell.o