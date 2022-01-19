# [ahk 键盘增强 ✨✨✨](https://github.com/moshuying/myAHK)

myahk 旨在增强 windows 下的键盘功能 😎

## 2022/01/19 更新

启用并完善了连点器，这个东西有时候突然想到会用一下，有时候又会忘掉。同时按`ctrl`+`win`+`a`之后，再按下任意键（包括鼠标左键）就能自动连点，再次按下右`shift`键取消连点。

## 2021/12/21 更新

最近发现使用这些脚本的时候偶尔会出现与其他全局快捷键冲突的问题，但目前暂时没有想到好的解决方法，或者？做一下主流软件适配？欢迎大家提 issue 聊聊想法

## 2021/09/26 更新

最近又从 MAC 换到 Windows 了，重新安装的过程中发现之前的方法并不是很轻松，所以我将代码打包成立可执行文件，直接运行该文件即可，不需要进行额外的操作。

[下载地址](https://github.com/moshuying/myAHK/releases)

**首先感谢 ahk 的大神们,这个工具能极大地增加生产力**

ahk 的一个键盘增强脚本,仅在`winwods`下可用,长期更新 [仓库链接](https://github.com/moshuying/myAHK)

## 2021/02/08 更新

准备加入 mac 版本啦，在使用了一段时间后发现没有 myAhk 实在是效率低下，常常因为键位问题打断代码思路，所以把这个东西也做一个 mac 版本

### 2020/06/30 更新

使用了小半年之后发现了一些问题，所以更新了一下

- [x] 移除了连点器
- [x] 移除了打开指定文件夹，在开始界面中显然更好用
- [x] 已关闭默认打开键鼠(开机了之后会忘记关闭蒙蔽半天)
- [ ] 预计的新特性，按键显示，此功能可以方便做教程

## 安装

windows 执行以下步骤,💻 复制粘贴到命令行中执行

未安装 git 和 ahk 的用户可以在联网状态下使用一行命令安装

```sh
Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));choco install git autohotkey.install -y;git clone https://gitee.com/moshuying/myAHK.git;cd myAHK;.\easyWork.ahk;New-Item -ItemType SymbolicLink -Path "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" -Name ".\easyWork.ahk.lnk" -Value ".\easyWork.ahk"
```

有 ahk 和 git 的用户可以自行按步骤安装
[ahk 下载地址](https://www.autohotkey.com/download/ahk-install.exe)

```sh
git clone https://gitee.com/moshuying/myAHK.git;
cd myAHK;
./easyWork.ahk;
New-Item -ItemType SymbolicLink -Path "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" -Name ".\easyWork.ahk.lnk" -Value ".\easyWork.ahk"
```

## 功能概要

**由于用`caps + a`替换了`capslock`功能,所以下表中的 caps 均指向 capslock 按键**

| 简述                                                           | 热键                                                           | 详解                                                                                                                               |
| :------------------------------------------------------------- | :------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| 获取路径                                                       | win + ctrl + c                                                 | 在文件浏览器下选中文件后直接复制路径                                                                                               |
| delete                                                         | caps + o                                                       | 向后删除,不能作为实体 delete 键来用,仅仅能向后删除                                                                                 |
| backspace                                                      | caps + p                                                       | 向前删除,就是退格键                                                                                                                |
| appkey 🍥                                                      | caps + g                                                       | 就是鼠标右键啦,替代 shift + f10 的一个方案                                                                                         |
| home                                                           | caps + h                                                       | home 键,移动到行首                                                                                                                 |
| end                                                            | caps + n                                                       | end 键,移动到行末(这个结合 shift + caps + h 可以飞速选中一行,选中后 caps + i 向上多选,caps + j 下下多选)                           |
| 上下左右 👏                                                    | caps + ijkl                                                    | 超级好用上下左右,我想你也不喜欢每次移动光标时都把手挪动一大截吧,尤其是写代码灵感来的瞬间                                           |
| 切换大小写                                                     | caps + a                                                       | 将 capslock 键改成了 caps,用这个组合键来切换大小写                                                                                 |
| 鼠标滚轮增加音量(有鼠标侧键才可以使用,XButon2 是靠前的侧键) 🥩 | XButton2 + 向鼠标前方滚动                                      |                                                                                                                                    |
| 鼠标滚轮减少音量                                               | XButton2 + 向鼠标后方滚动                                      |                                                                                                                                    |
| 键盘增加音量                                                   | caps + pgup                                                    |                                                                                                                                    |
| 键盘减少音量                                                   | caps + pgdn                                                    |                                                                                                                                    |
| 打开计算器                                                     | caps + c                                                       |                                                                                                                                    |
| 滚动当前鼠标下窗口的滚动条(向下滚动) 🍧                        | caps + [                                                       | 滚动当前鼠标指向窗口的滚动条                                                                                                       |
| 滚动当前鼠标下窗口的滚动条(向上滚动)                           | caps + ]                                                       | 滚动当前鼠标指向窗口的滚动条                                                                                                       |
| 桌面切换(下一个)                                               | win + ctrl + tab                                               | 两个项目同时忙起来的时候换虚拟桌面用的                                                                                             |
| 桌面切换(上一个)                                               | win + ctrl + shift + tab                                       |                                                                                                                                    |
| 模拟鼠标(开) 默认关闭 🌭                                       | caps + d                                                       | 开启后按 d 对应左键,f 右键,ijkl 移动鼠标                                                                                           |
| 模拟鼠标(关)                                                   | caps + f                                                       |                                                                                                                                    |
| 括号补全(开) 默认关闭                                          | caps + 9                                                       | 在一些代码编辑器内已经默认开启了代码补全,某些输入法也给了括号补全,这个自动补全仅作为备用默认关闭,第一次按组合键打开,再按组合键关闭 |
| 括号补全(关)                                                   | caps + 9                                                       |                                                                                                                                    |
| `                                                              | caps + 1                                                       | 68 键的键盘打反引号和波浪号稍微费事一点                                                                                            |
| ~                                                              | caps + 2                                                       |                                                                                                                                    |
| =                                                              | caps + ;                                                       |                                                                                                                                    |
| +                                                              | caps + '                                                       |                                                                                                                                    |
| 自动循环按键                                                   | 按下 ctrl + win + a 后随意按键(功能键暂不支持)                 | 自动循环按 ctrl + win + a 后的按键                                                                                                 |
| 获取路径                                                       | 按下 ctrl + win + c 后获取路径                                 |
| 填充常用文本                                                   | 输入 email 即可填入默认文本 修改代码最后一行改为自己常用的即可 |

长期更新,觉得有用麻烦点个 star 吧
