@echo off
echo myAHK will be installed on your computer

git --version | findstr "git version" >nul 2>nul
if "%errorlevel%" == "0" (
  echo git Already exists
) else (
  echo git installing...
  choco install git
)

c: && cd /
if exist C:\tools (
  echo c:\tools Already exists
  if exist C:\tools\myAHK (
    echo myAHK Already exists
    exit
    main.ahk
  )
) else (
  mkdir "tools"
  echo clone repertory
  git clone https://github.com/moshuying/myAHK.git
)

echo install... autohotkey
choco install jivkok.autohotkey

echo running myAHK
cd C:/tools/myAHK
main.ahk

echo enjoy it. Thank you for choosing us. by: moshuying
pause