// gcc powershell.c -o powershell
#include <stdlib.h>
int main(){
  system("start \"MoShuYing\" /D \"c:\\\" \"C:\\Program Files\\PowerShell\\7\\pwsh.exe\"");
  return 0;
}