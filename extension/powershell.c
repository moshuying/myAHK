// window 10 default powershell.exe in C:\Windows\System32\WindowsPowerShell\v1.0
// gcc powershell.c -o powershell.exe
#include <stdlib.h>
int main(){
  system("start \"PowerShell 7 (x64)\" /D \"c:\\\" \"C:\\Program Files\\PowerShell\\7\\pwsh.exe\"");
  return 0;
}