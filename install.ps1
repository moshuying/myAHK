# 安装choco
Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));

# 安装依赖
choco install git autohotkey.install -y;

# 下载代码
git clone https://gitee.com/moshuying/myAHK.git;
cd myAHK;
.\easyWork.ahk;

# 添加默认启动
New-Item -ItemType SymbolicLink -Path "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" -Name ".\easyWork.ahk.lnk" -Value ".\easyWork.ahk"

# 按步骤执行，点开看的你知道可以怎样操作
Set-ExecutionPolicy Bypass -Scope Process -Force;
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));
choco install git autohotkey.install -y;
git clone https://gitee.com/moshuying/myAHK.git;
cd myAHK;
.\easyWork.ahk;
New-Item -ItemType SymbolicLink -Path "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" -Name ".\easyWork.ahk.lnk" -Value ".\easyWork.ahk"